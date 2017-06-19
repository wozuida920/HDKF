package avicit.csmp.basicData.csmpbdatachapter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpResult;

import avicit.csmp.basicData.csmpbdatachapter.dto.CsmpBdAtachapterDTO;
import avicit.csmp.basicData.csmpbdatachapter.service.CsmpBdAtachapterService;

/**
 * @classname: CsmpBdAtachapterController
 * @description: 定义 ATM章节号管理 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController")
public class CsmpBdAtachapterController {
	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdAtachapterController.class);

	@Autowired
	private CsmpBdAtachapterService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdAtachapterInfo")
	public ModelAndView toCsmpBdAtachapter(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String url = "platform/csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController";
		mav.setViewName("avicit/csmp/basicData/csmpbdatachapter/CsmpBdAtachapterManage");
		request.setAttribute("url", url);
		return mav;
	}

	@RequestMapping(value = "/gettree/{level}/{validFlag}")
	@ResponseBody
	public List<TreeNode> getCsmpBdAtachapterByParentId(
			@PathVariable(value = "level") int level,
			@PathVariable(value = "validFlag") String validFlag,
			@RequestParam(required = false) String id) {
		if (id == null) {
			id = "-1";
		} else {
			level = 1;
		}
		/**
		 * null 代表查询所有数据   1 代表查询有效数据   0 代表查询无效
		 */
			if("1".equals(validFlag)){
				validFlag = "1";
			}else if("0".equals(validFlag)){
				validFlag = "0";
			}else{
				validFlag = null;
			}
		return service.getCsmpBdAtachapterByParentClassId(id, level,validFlag);
	}

	@RequestMapping(value = "/search")
	@ResponseBody
	public List<TreeNode> searchCsmpBdAtachapter(
			@RequestParam(required = true, value = "search_text") String searchText) throws Exception {
		List<TreeNode> result = new ArrayList<TreeNode>(1);
		Map<String, TreeNode> mapTree = new HashMap<String, TreeNode>();

		service.searchCsmpBdAtachapter(searchText, mapTree);
		TreeNode rootNode = mapTree.get("1");
		if (rootNode != null) {
			result.add(mapTree.get("1"));
		}
		return result;
	}
	@RequestMapping(value = "/search1")
	@ResponseBody
	public List<CsmpBdAtachapterDTO> searchCsmpBdAtachapterAll() throws Exception {
		List<CsmpBdAtachapterDTO> result = new ArrayList<CsmpBdAtachapterDTO>();
		List<CsmpBdAtachapterDTO> list=service.searchCsmpBdAtachapterinfo();
		return list;
	}

	/*
	 * 张佳华 查询当前节点信息
	 */
	@RequestMapping(value = "/getCsmpBdAtachapterNodeInfo/{id}", method = RequestMethod.POST)
	public ModelAndView getCsmpBdAtachapterNodeInfo(HttpServletRequest request,
			HttpServletResponse response, @PathVariable(value = "id") String id)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		CsmpBdAtachapterDTO csmpBdAtachapterDTO = service.getCsmpBdAtachapterDTOById(id);
		mav.addObject("csmpBdAtachapterDTO", csmpBdAtachapterDTO);
		return mav;
	}

	@RequestMapping(value = "/operation/{type}/{id}")
	public ModelAndView toInsertOrModifyCsmpBdAtachapter(
			@PathVariable(value = "type") String type,
			@PathVariable(value = "id") String id, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String url = "platform/csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController/saveCsmpBdAtachapter/"
				+ id;
		if ("modify".equals(type)) {
			request.setAttribute("csmpBdAtachapterDTO",service.getCsmpBdAtachapterDTOById(id));
		}
		request.setAttribute("url", url);
		request.setAttribute("id", id);
		mav.setViewName("avicit/csmp/basicData/csmpbdatachapter/"
				+ "CsmpBdAtachapter" + type);
		return mav;
	}

	// 保存
	@RequestMapping(value = "/saveCsmpBdAtachapter/{pid}", method = RequestMethod.POST)
	public ModelAndView toSaveCsmpBdAtachapter(
			@PathVariable(value = "pid") String pid,
			HttpServletRequest request, @RequestBody CsmpBdAtachapterDTO tree) {
		ModelAndView mav = new ModelAndView();

		TreeNode treeNode = new TreeNode();
		try {
			if ("".equals(tree.getId())) {// 新增
				tree.setParentClassId(pid);
				if("".equals(tree.getValidFlag())||null==tree.getValidFlag()){
					tree.setValidFlag("1");
				}
				if("".equals(tree.getIsDetailed())||null==tree.getIsDetailed()){
					tree.setIsDetailed("2");
				}
				service.insertCsmpBdAtachapter(tree);
				mav.addObject("type", "1");
				HashMap<String, Object> attr = new HashMap<String, Object>(1);
				attr.put("count", 0);
				treeNode.setAttributes(attr);
				treeNode.setId(tree.getId());
			} else {
				service.updateCsmpBdAtachapter(tree);
				mav.addObject("type", "2");
				treeNode.setId(tree.getId());
			}
			mav.addObject("flag", OpResult.success);
			treeNode.set_parentId(pid);
			treeNode.setText(tree.getAtaName());
			treeNode.setState("open");
			mav.addObject("data", treeNode);
			mav.addObject("pid", pid);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			mav.addObject("error", e.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView toDeleteCsmpBdAtachapter(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			for (String id : ids) {
				service.deleteCsmpBdAtachapter(id);
			}
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		mav.addObject("flag", OpResult.success);
		return mav;
	}
}
