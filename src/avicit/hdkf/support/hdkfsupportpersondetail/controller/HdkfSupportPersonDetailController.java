package avicit.hdkf.support.hdkfsupportpersondetail.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syslookup.SysLookupAPI;
import avicit.platform6.api.syslookup.impl.SysLookupAPImpl;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.web.AvicitResponseBody;

import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.service.HdkfSupportBorrowPersonInfService;
import avicit.hdkf.support.hdkfsupportpersondetail.dto.HdkfSupportPersonDetailDTO;
import avicit.hdkf.support.hdkfsupportpersondetail.service.HdkfSupportPersonDetailService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportPersonDetailController
 * @description: 定义 HDKF_SUPPORT_PERSON_DETAIL 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController")
public class HdkfSupportPersonDetailController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportPersonDetailController.class);

	@Autowired
	private HdkfSupportPersonDetailService service;
	
	@Autowired
	private HdkfSupportBorrowPersonInfService borrowPersonInfService;
	
	
	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportPersonDetailInfo2")
	public ModelAndView toHdkfSupportPersonDetail2(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailManage2");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/operation/");
		return mav;
	}

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportPersonDetailInfo1")
	public ModelAndView toHdkfSupportPersonDetail1(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String borrowInfoId = request.getParameter("formId");
		mav.setViewName("avicit/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailManage1");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/operation/");
		HdkfSupportBorrowPersonInfDTO borrowPersonInfDTO = null;
		try {
			borrowPersonInfDTO = borrowPersonInfService.queryHdkfSupportBorrowPersonInfByPrimaryKey(borrowInfoId);
		} catch (Exception e) {
			
		}
		request.setAttribute("borrowPersonInfDTO", borrowPersonInfDTO);
		return mav;
	}
	
	
	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportPersonDetailInfo")
	public ModelAndView toHdkfSupportPersonDetail(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String borrowInfoId = request.getParameter("formId");
		mav.setViewName("avicit/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/operation/");
		HdkfSupportBorrowPersonInfDTO borrowPersonInfDTO = null;
		try {
			borrowPersonInfDTO = borrowPersonInfService.queryHdkfSupportBorrowPersonInfByPrimaryKey(borrowInfoId);
		} catch (Exception e) {
			
		}
		request.setAttribute("borrowPersonInfDTO", borrowPersonInfDTO);
		return mav;
	}

//	@RequestMapping(value = "/operation/getHdkfSupportPersonDetailsByPage")
//	@ResponseBody
//	public Map<String, Object> togetHdkfSupportPersonDetailByPage(
//			PageParameter pageParameter, HttpServletRequest request) throws Exception{
//		
//		QueryReqBean<HdkfSupportPersonDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportPersonDetailDTO>();
//		queryReqBean.setPageParameter(pageParameter);
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		//String borrowInfoId = request.getParameter("borrowInfoId");
//		
//		String json = ServletRequestUtils.getStringParameter(request, "param","");
//		
//		String sfnConditions = ServletRequestUtils.getStringParameter(request,"sdfConditons", "");// 自定义查询条件
//		HdkfSupportPersonDetailDTO param = null;
//		QueryRespBean<HdkfSupportPersonDetailDTO> result = null;
//		if (json != null && !"".equals(json)) {
//			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//			param = JsonHelper.getInstance().readValue(json, dateFormat,new TypeReference<HdkfSupportPersonDetailDTO>() {});
//			//param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
//			queryReqBean.setSearchParams(param);
//		}
///*		try {
//			if(param == null && borrowInfoId != null){
//				param = new HdkfSupportPersonDetailDTO();
//			}
//			if(borrowInfoId != null){
//				param.setBorrowInfoId(borrowInfoId);
//				queryReqBean.setSearchParams(param);
//			}*/
//			result = service.searchHdkfSupportPersonDetailByPage(queryReqBean,sfnConditions);
///*		} catch (Exception ex) {
//			logger.debug(ex.getMessage());
//			ex.printStackTrace();
//			return map;
//		}*/
//		for (HdkfSupportPersonDetailDTO dto : result.getResult()) {
//
//		}
//
//		map.put("total", result.getPageParameter().getTotalCount());
//		map.put("rows", result.getResult());
//		logger.debug("成功获取HdkfSupportPersonDetail分页数据");
//		return map;
//	}
	@RequestMapping(value = "/operation/getHdkfSupportPersonDetailsByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportPersonDetailByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfSupportPersonDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportPersonDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String borrowInfoId = request.getParameter("borrowInfoId");
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		  try {
				json = URLDecoder.decode(json, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportPersonDetailDTO param = null;
		QueryRespBean<HdkfSupportPersonDetailDTO> result = null;
		if (json != null && !"".equals(json)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportPersonDetailDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		try {
			if(param == null && borrowInfoId != null){
				param = new HdkfSupportPersonDetailDTO();
			}
			if(borrowInfoId != null){
				param.setBorrowInfoId(borrowInfoId);
				queryReqBean.setSearchParams(param);
			}
			result = service.searchHdkfSupportPersonDetailByPage(queryReqBean,
					sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}
		for (HdkfSupportPersonDetailDTO dto : result.getResult()) {

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取HdkfSupportPersonDetail分页数据");
		return map;
	}
	
	@RequestMapping(value = "/operation/getPersonDetailCountByParentId")
	@ResponseBody
	public Map<String, Object> togetPersonDetailCountByParentId(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfSupportPersonDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportPersonDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String borrowInfoId = ServletRequestUtils.getStringParameter(request, "borrowInfoId","");
		String borrowNumber = ServletRequestUtils.getStringParameter(request, "borrowNumber","");
		String json = ServletRequestUtils.getStringParameter(request, "param","");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportPersonDetailDTO param = null;
		QueryRespBean<HdkfSupportPersonDetailDTO> result = null;
		if (json != null && !"".equals(json)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportPersonDetailDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		try {
			if(param == null && borrowInfoId != null){
				param = new HdkfSupportPersonDetailDTO();
			}
			if(borrowInfoId != null){
				param.setBorrowInfoId(borrowInfoId);
				queryReqBean.setSearchParams(param);
			}
			result = service.searchHdkfSupportPersonDetailByPage(queryReqBean,
					sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}
		long totalCount = result.getPageParameter().getTotalCount();
		if(totalCount < Long.parseLong(borrowNumber)){
			map.put("flag", false);
		}else{
			map.put("flag", true);
		}
		
		logger.debug("成功获取HdkfSupportPersonDetail分页数据");
		return map;
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
	@ResponseBody
	public AvicitResponseBody saveOrUpdateHdkfSupportPersonDetail(
			HttpServletRequest request) {
		String datas = ServletRequestUtils.getStringParameter(request, "datas",
				"");
		if (datas == "") {
			return new AvicitResponseBody(OpResult.success);
		}
		try {
			List<HdkfSupportPersonDetailDTO> list = JsonHelper
					.getInstance()
					.readValue(
							datas,
							new TypeReference<List<HdkfSupportPersonDetailDTO>>() {
							});
			service.insertOrUpdateHdkfSupportPersonDetail(list);
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			return new AvicitResponseBody(OpResult.failure, ex.getMessage());
		}
	}

	/**
	 * 按照id批量删除数据
	 * 
	 * @param ids
	 *            id数组
	 * @return
	 */
	@RequestMapping(value = "/operation/delete", method = RequestMethod.POST)
	@ResponseBody
	public AvicitResponseBody deleteHdkfSupportPersonDetail(
			HttpServletRequest request) {
		String ids = ServletRequestUtils.getStringParameter(request, "ids", "");
		try {
			service.deleteHdkfSupportPersonDetailByIds(ids.split(","));
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			return new AvicitResponseBody(OpResult.failure, e.getMessage());
		}
	}
	
	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportBorrowPersonInfSelect")
	public ModelAndView toHdkfSupportBorrowPersonInfSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportpersondetail/HdkfSupportBorrowPersonInfManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/operation/");
		return mav;
	}
}
