package avicit.csmp.basicData.csmpbdaricarftmodel.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.runtime.DotClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syslookup.SysLookupAPI;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.core.type.TypeReference;

import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdaircraftinfo.service.CsmpBdAircraftinfoService;
import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
import avicit.csmp.basicData.csmpbdaricarftmodel.service.CsmpBdAricarftmodelService;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.dto.HdkfBdAircraftModelTDTO;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.service.HdkfBdAircraftModelTService;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: CsmpBdAricarftmodelController
 * @description: 定义 飞机机型管理 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController")
public class CsmpBdAricarftmodelController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdAricarftmodelController.class);

	@Autowired
	private CsmpBdAricarftmodelService service;
	@Autowired
	private  HdkfBdAircraftModelTService hdkfBdAircraftModelTService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdAricarftmodelInfo")
	public ModelAndView toCsmpBdAricarftmodel(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/");
		mav.addObject("type", sysLookupLoader.getLookUpListByTypeByAppId(
				"CSMP_BD_AIRCRAFT_TYPE", SessionHelper.getApplicationId()));
		return mav;
	}
	
	/**
	 * 返回一个机型选择框
	 * @param request
	 * @param reponse
	 * @return
	 */
	@RequestMapping(value = "toShowAricarfmodel")
	public ModelAndView toShowAricarfmodel(HttpServletRequest request,HttpServletResponse reponse){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodel");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/");
		
		mav.addObject("type", sysLookupLoader.getLookUpListByTypeByAppId(
				"CSMP_BD_AIRCRAFT_TYPE", SessionHelper.getApplicationId()));
		return mav;
	}
	

	@RequestMapping(value = "/operation/getCsmpmodelsByPage")
	@ResponseBody
	public Map<String, Object> getCsmpmodelsByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean = new QueryReqBean<CsmpBdAricarftmodelDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		CsmpBdAricarftmodelDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdAricarftmodelDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdAricarftmodelDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		try {
			result = service.searchmodelByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (CsmpBdAricarftmodelDTO dto : result.getResult()) {

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	
	
	
	
	
	
	
	

	
	
	
	

	@RequestMapping(value = "/operation/getCsmpBdAricarftmodelsByPage")
	@ResponseBody
	public Map<String, Object> togetCsmpBdAricarftmodelByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean = new QueryReqBean<CsmpBdAricarftmodelDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		CsmpBdAricarftmodelDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdAricarftmodelDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdAricarftmodelDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		try {
			result = service.searchCsmpBdAricarftmodelByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (CsmpBdAricarftmodelDTO dto : result.getResult()) {

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}

	// 打开编辑或者添加页
	/**
	 * 根据id选择跳转到新建页还是编辑页
	 * 
	 * @param type
	 *            操作类型新建还是编辑
	 * @param id
	 *            编辑数据的id
	 * @param request
	 *            请求
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/operation/{type}/{id}")
	public ModelAndView toOpertionPage(@PathVariable String type,
			@PathVariable String id, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		if (!"null".equals(id)) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
			CsmpBdAricarftmodelDTO dto = service.queryCsmpBdAricarftmodelByPrimaryKey(id);

			request.setAttribute("csmpBdAricarftmodelDTO", dto);
		}
		mav.setViewName("avicit/csmp/basicData/csmpbdaricarftmodel/"
				+ "CsmpBdAricarftmodel" + type);
		return mav;
	}

	/**
	 * 保存数据
	 * 
	 * @param id
	 *            主键id
	 * @param demoBusinessTripDTO
	 *            保存的对象
	 * @return
	 */
	@RequestMapping(value = "/operation/save", method = RequestMethod.POST)
	public ModelAndView toSaveCsmpBdAricarftmodelDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO = JsonHelper
					.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<CsmpBdAricarftmodelDTO>() {
							});
			if ("".equals(csmpBdAricarftmodelDTO.getId())) {// 新增
				String returnId=service.insertCsmpBdAricarftmodel(csmpBdAricarftmodelDTO);
				HdkfBdAircraftModelTDTO dto = new HdkfBdAircraftModelTDTO();
				dto.setAttribute01(returnId);
				dto.setAircraftName(csmpBdAricarftmodelDTO.getModelName());
				dto.setFatherId("1");
				
				hdkfBdAircraftModelTService.insertHdkfBdAircraftModelT(dto);
				
			} else {// 修改
				service.updateCsmpBdAricarftmodelSensitive(csmpBdAricarftmodelDTO);
			}
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;

	}
	
	@Autowired
	private CsmpBdAircraftinfoService csmpBdAircraftinfoService;

	/**
	 * 按照id批量删除数据
	 * 
	 * @param ids
	 *            id数组
	 * @return
	 */
	@RequestMapping(value = "/operation/delete", method = RequestMethod.POST)
	public ModelAndView toDeleteCsmpBdAricarftmodelDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			for(String id : ids ){
		    	List<CsmpBdAircraftinfoDTO> dataList =  csmpBdAircraftinfoService.searchCsmpBdAircraftinfoById(id);
				if(dataList.size()>0){
					mav.addObject("flag","succ");
				}else{
					 mav.addObject("flag", OpResult.success);
					  service.deleteCsmpBdAricarftmodelByIds(ids);
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
	
	@RequestMapping(value = "/toTree", method = RequestMethod.POST)
	public ModelAndView toTree(HttpServletRequest request){
		ModelAndView mav = new ModelAndView ();
		List<TreeNode> tree =	service.contrivTree();
		//String str = JSONArray.toJSONString(tree);
		//mav.addObject(str);
		
		mav.addObject("tree", tree);
		return mav;
	}
	
}
