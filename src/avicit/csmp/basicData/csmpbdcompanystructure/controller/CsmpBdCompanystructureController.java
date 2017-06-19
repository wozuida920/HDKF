package avicit.csmp.basicData.csmpbdcompanystructure.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;


import avicit.csmp.basicData.csmpbdcompanystructure.dto.CsmpBdCompanystructureDTO;
import avicit.csmp.basicData.csmpbdcompanystructure.service.CsmpBdCompanystructureService;
import avicit.csmp.basicData.csmpbdcomstr.dao.CsmpBdComStrDao;


import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpResult;

/**
 * @classname: CsmpBdCompanystructureController
 * @description: 定义 单位信息结构表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController")
public class CsmpBdCompanystructureController {
	private static final Logger logger = LoggerFactory.getLogger(CsmpBdCompanystructureController.class);

	@Autowired
	private CsmpBdCompanystructureService service;
	@Autowired
	private CsmpBdComStrDao strDao;
	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdCompanystructureInfo")
	public ModelAndView toCsmpBdCompanystructure(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String url = "platform/csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController";

		mav.setViewName("avicit/csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureManage");
		request.setAttribute("url", url);

		// mav.addObject("type",
		// sysLookupLoader.getLookUpListByTypeByAppId("CSMP_BD_COMPANY_TYPE",
		// SessionHelper.getApplicationId()));
		return mav;
	}

	@RequestMapping(value = "/gettree/{level}")
	@ResponseBody
	public List<TreeNode> getCsmpBdCompanystructureByParentId(@PathVariable(value = "level") int level, @RequestParam(required = false) String id) {
		if (id == null) {
			id = "-1";
		} else {
			level = 1;
		}
		return service.getCsmpBdCompanystructureByPid(id, level);
	}
	@RequestMapping(value = "/getvalidtree/{level}")
	@ResponseBody
	public List<TreeNode> getCsmpBdCompanystructureByCanUseParentId(@PathVariable(value = "level") int level, @RequestParam(required = false) String id) {
		if (id == null) {
			id = "-1";
		} else {
			level = 1;
		}
		return service.getCsmpBdCompanystructureCanUseByPid(id, level);
	}

	/*
	 * id查询一条 树数据
	 */
	@RequestMapping(value = "/getcsmpBdCompanystructureNodeinfo/{id}", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getcsmpBdCompanystructureNodeinfo(@PathVariable(value = "id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		CsmpBdCompanystructureDTO smpBdCompanystructureDTO = service.getCsmpBdCompanystructureDTOById(id);
		mav.addObject("resultData", smpBdCompanystructureDTO);
		return mav;
	}

	@RequestMapping(value = "/search")
	@ResponseBody
	public List<TreeNode> searchCsmpBdCompanystructure(@RequestParam(required = true, value = "search_text") String searchText) {
		List<TreeNode> result = new ArrayList<TreeNode>(1);
		Map<String, TreeNode> mapTree = new HashMap<String, TreeNode>();

		service.searchCsmpBdCompanystructure(searchText, mapTree);

		TreeNode rootNode = mapTree.get("1");
		if (rootNode != null) {
			result.add(mapTree.get("1"));
		}
		return result;
	}
	@RequestMapping(value = "/searchValid")
	@ResponseBody
	public List<TreeNode> searchCsmpBdCompanystructureValid(@RequestParam(required = true, value = "search_text") String searchText) {
		List<TreeNode> result = new ArrayList<TreeNode>(1);
		Map<String, TreeNode> mapTree = new HashMap<String, TreeNode>();

		service.searchCsmpBdCompanystructureValid(searchText, mapTree);

		TreeNode rootNode = mapTree.get("1");
		if (rootNode != null) {
			result.add(mapTree.get("1"));
		}
		return result;
	}

	@RequestMapping(value = "/operation/{type}/{id}")
	public ModelAndView toInsertOrModifyCsmpBdCompanystructure(@PathVariable(value = "type") String type, @PathVariable(value = "id") String id, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String url = "platform/csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController/saveCsmpBdCompanystructure/" + id;
		if ("modify".equals(type)) {
			request.setAttribute("csmpBdCompanystructureDTO", service.getCsmpBdCompanystructureDTOById(id));
		}
		request.setAttribute("url", url);

		request.setAttribute("id", id);
		mav.setViewName("avicit/csmp/basicData/csmpbdcompanystructure/" + "CsmpBdCompanystructure" + type);
		return mav;
	}

	@RequestMapping(value = "/saveCsmpBdCompanystructure/{pid}", method = RequestMethod.POST)
	public ModelAndView toSaveCsmpBdCompanystructure(@PathVariable(value = "pid") String pid, HttpServletRequest request, @RequestBody CsmpBdCompanystructureDTO tree) {
		ModelAndView mav = new ModelAndView();
		TreeNode treeNode = new TreeNode();
		try {
			if ("".equals(tree.getId())) {// 新增
				tree.setPid(pid);
				service.insertCsmpBdCompanystructure(tree);
				mav.addObject("type", "1");
				HashMap<String, Object> attr = new HashMap<String, Object>(1);
				attr.put("count", 0);
				treeNode.setAttributes(attr);
				treeNode.setId(tree.getId());
			} else {
				service.updateCsmpBdCompanystructure(tree);
				mav.addObject("type", "2");
				treeNode.setId(tree.getId());
			}
			mav.addObject("flag", OpResult.success);
			treeNode.set_parentId(pid);
			treeNode.setText(tree.getCatalogName());
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
	public ModelAndView toDeleteCsmpBdCompanystructure(@RequestBody String[] ids,  HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			for (String id : ids) {
			int	Str = strDao.searchDel(id);
				if(Str>0){
					//mav.addObject("flag", "failed");
					//return mav;
				//}else{
					service.deleteCsmpBdCompanystructure(id);
					this.strDao.deleteCsmpBdComStrByStrId(id);
					mav.addObject("flag", OpResult.success);
				}
				else if(Str==0){
					service.deleteCsmpBdCompanystructure(id);
					mav.addObject("flag", OpResult.success);
				}
			}
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}
	
	
	//异步加载单位信息
	@RequestMapping(value="/loadUnitData/{compID}",method=RequestMethod.POST)
	public  ModelAndView loadUnitData(@PathVariable String compID){
		ModelAndView mav = new ModelAndView();
		List<TreeNode> unitList = service.getUnitList(compID);
		String unitJson = JSONArray.toJSONString(unitList);
		mav.addObject("unitJson", unitJson);
		return mav;
		
	}
}
