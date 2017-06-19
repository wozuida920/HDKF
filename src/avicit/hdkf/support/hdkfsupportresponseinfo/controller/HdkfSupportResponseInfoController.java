package avicit.hdkf.support.hdkfsupportresponseinfo.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

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

import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.hdkf.support.hdkfsupportfaxinfo.dto.HdkfSupportFaxInfoDTO;
import avicit.hdkf.support.hdkfsupportfaxinfo.service.HdkfSupportFaxInfoService;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;
import avicit.hdkf.support.hdkfsupportresponseinfo.dto.HdkfSupportResponseInfoDTO;
import avicit.hdkf.support.hdkfsupportresponseinfo.service.HdkfSupportResponseInfoService;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportResponseInfoController
 * @description: 定义HDKF_SUPPORT_RESPONSE_INFO 流程表单控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController")
public class HdkfSupportResponseInfoController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportResponseInfoController.class);

	@Autowired
	private HdkfSupportResponseInfoService service;
	@Autowired
	private HdkfSupportOutfieldCardService hdkfSupportOutfieldCardService;
	@Autowired
	private HdkfSupportFaxInfoService hdkfSupportFaxInfoService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportResponseInfoInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfSupportResponseInfosByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportResponseInfoByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportResponseInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportResponseInfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportResponseInfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportResponseInfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportResponseInfoDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		// try {
		result = service.searchHdkfSupportResponseInfoByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportResponseInfoDTO dto : result.getResult()) {

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
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			HdkfSupportResponseInfoDTO dto = service
					.queryHdkfSupportResponseInfoByPrimaryKey(id);

			request.setAttribute("hdkfSupportResponseInfoDTO", dto);
			request.setAttribute("id", id);
		} else {
			mav.addObject("id", ComUtil.getId());
		}
		mav.setViewName("avicit/hdkf/support/hdkfsupportresponseinfo/"
				+ "HdkfSupportResponseInfo" + type);
		return mav;
	}

	/**
	 * 新增并启动流程
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/operation/saveAndStartProcess", method = RequestMethod.POST)
	public ModelAndView saveAndStartProcess(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String processDefId = ServletRequestUtils.getStringParameter(request,
				"processDefId", "");
		String formCode = ServletRequestUtils.getStringParameter(request,
				"formCode", "");
		String jsonString = ServletRequestUtils.getStringParameter(request,
				"jsonString", "");
		String datas = ServletRequestUtils.getStringParameter(request, "datas",
				"");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfSupportResponseInfoDTO hdkfSupportResponseInfo = JsonHelper
					.getInstance().readValue(datas, dateFormat,
							new TypeReference<HdkfSupportResponseInfoDTO>() {
							});
			String userId = (String) request.getSession()
					.getAttribute("userId");
			String deptId = (String) request.getSession()
					.getAttribute("deptId");
			// ///////////////启动流程所需要的参数///////////////////
			Map<String, Object> parameter = new HashMap<String, Object>();
			parameter.put("processDefId", processDefId);
			parameter.put("formCode", formCode);
			parameter.put("jsonString", jsonString);
			parameter.put("userId", userId);
			parameter.put("deptId", deptId);

			BeanProcess bp = service
					.insertHdkfSupportResponseInfoAndStartProcess(
							hdkfSupportResponseInfo, parameter);

			mav.addObject("flag", OpResult.success);
			mav.addObject("bp", bp);
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("flag", OpResult.failure);
			mav.addObject("msg", e.getMessage());
		}
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
	public ModelAndView toSaveHdkfSupportResponseInfoDTO(
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String returnId = "";
		try {
			HdkfSupportResponseInfoDTO hdkfSupportResponseInfoDTO = JsonHelper
					.getInstance().readValue(jsonData,
							new TypeReference<HdkfSupportResponseInfoDTO>() {
							});
			if ("".equals(hdkfSupportResponseInfoDTO.getId())) {// 新增
				returnId = service
						.insertHdkfSupportResponseInfo(hdkfSupportResponseInfoDTO);
			} else if (service.findById(hdkfSupportResponseInfoDTO.getId()) == null) {
				returnId = service
						.insertHdkfSupportResponseInfo(hdkfSupportResponseInfoDTO);
			} else {// 修改
				service.updateHdkfSupportResponseInfoSensitive(hdkfSupportResponseInfoDTO);
				returnId = hdkfSupportResponseInfoDTO.getId();
			}
			mav.addObject("id", returnId);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;

	}

	/**
	 * 按照id批量删除数据
	 * 
	 * @param ids
	 *            id数组
	 * @return
	 */
	@RequestMapping(value = "/operation/delete", method = RequestMethod.POST)
	public ModelAndView toDeleteHdkfSupportResponseInfoDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportResponseInfoByIds(ids);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}

	/**
	 * 转向detail页面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toDetailJsp")
	public ModelAndView toDetailJsp(HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		HdkfSupportResponseInfoDTO dto = service
				.queryHdkfSupportResponseInfoByPrimaryKey(id);
		dto.setRespUserId(SessionHelper.getLoginSysUserId(request));
		dto.setRespUserName(SessionHelper.getLoginSysUser(request).getName());
		
		{
			QueryReqBean<HdkfSupportFaxInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportFaxInfoDTO>();
			HdkfSupportFaxInfoDTO searchParams = new HdkfSupportFaxInfoDTO();
			searchParams.setRequestId(dto.getRequestId());
			// searchParams.setBusinessstate_("结束");
			searchParams.setBpmState("ended");
			queryReqBean.setSearchParams(searchParams);
			// List<HdkfSupportOutfieldCardDTO> result =
			// hdkfSupportOutfieldCardService
			// .searchHdkfSupportOutfieldCard(queryReqBean);
			QueryRespBean<HdkfSupportFaxInfoDTO> result = hdkfSupportFaxInfoService
					.searchHdkfSupportFaxInfoByPage(queryReqBean, "");
			avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportFaxInfoDTO> page = result
					.getResult();

			if (page.size() > 0) {
				mav.addObject("faxList", page.getResult());
				//mav.addObject("outCardFlag", true);
			}
		}
		
		
		
		mav.addObject("flag", OpResult.success);
		mav.addObject("hdkfSupportResponseInfo", dto);
		return mav;
	}

	@RequestMapping(value = "HdkfSupportDealByKfSelect")
	public ModelAndView toHdkfSupportDealByKfSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportresponseinfo/HdkfSupportDealByKfManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/");

		return mav;
	}

	@RequestMapping("/getResponseInfoDTOByrequestId")
	public ModelAndView getResponseInfoDTOByrequestId(HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String requestId = request.getParameter("requestId");

		QueryReqBean<HdkfSupportResponseInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportResponseInfoDTO>();
		HdkfSupportResponseInfoDTO searchParams = new HdkfSupportResponseInfoDTO();
		searchParams.setRequestId(requestId);
		queryReqBean.setSearchParams(searchParams);

		QueryRespBean<HdkfSupportResponseInfoDTO> result = service
				.searchHdkfSupportResponseInfoByPage(queryReqBean, "");

		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportResponseInfoDTO> page = result
				.getResult();
		if (page.size() > 0) {
			HdkfSupportResponseInfoDTO dto = page.get(0);
			mav.addObject("flag", OpResult.success);
			mav.addObject("hdkfSupportResponseInfo", dto);
		} else {
			mav.addObject("flag", OpResult.failure);
		}
		return mav;
	}

	@RequestMapping("/getOutFieldCardDtoStatusByrequestId")
	public ModelAndView getOutFieldCardDtoStatusByrequestId(
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String requestId = request.getParameter("requestId");

		QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean = new QueryReqBean<HdkfSupportOutfieldCardDTO>();
		HdkfSupportOutfieldCardDTO searchParams = new HdkfSupportOutfieldCardDTO();
		searchParams.setRequestId(requestId);
		queryReqBean.setSearchParams(searchParams);

		QueryRespBean<HdkfSupportOutfieldCardDTO> result = hdkfSupportOutfieldCardService
				.searchHdkfSupportOutfieldCardByPage(queryReqBean, "");

		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportOutfieldCardDTO> page = result
				.getResult();

		if (page.size() > 0) {
//			HdkfSupportOutfieldCardDTO dto = page.get(0);
//			String businessstate = dto.getBusinessstate_();
//			if (businessstate != null && businessstate.equals("结束")) {
//				mav.addObject("flag", OpResult.success);
//				mav.addObject("cardDto", dto);
//			} else {
//				mav.addObject("flag", OpResult.failure);
//			}
			int i=0;
			for(;i<page.size();i++){
				HdkfSupportOutfieldCardDTO dto = page.get(i);
				String businessstate = dto.getBusinessstate_();
				if (businessstate != null &&! businessstate.equals("结束")) {
					mav.addObject("flag", OpResult.failure);
				//	mav.addObject("cardDto", dto);
					break;
				}
			}
			if(i==page.size())			
				mav.addObject("flag", OpResult.success);
			
			
		} else {
			mav.addObject("flag", OpResult.success);
		}
		return mav;
	}
	@RequestMapping("/getFaxDtoStatusByrequestId")
	public ModelAndView getFaxDtoStatusByrequestId(
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String requestId = request.getParameter("requestId");

		QueryReqBean<HdkfSupportFaxInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportFaxInfoDTO>();
		HdkfSupportFaxInfoDTO searchParams = new HdkfSupportFaxInfoDTO();
		searchParams.setRequestId(requestId);
		queryReqBean.setSearchParams(searchParams);

		QueryRespBean<HdkfSupportFaxInfoDTO> result = hdkfSupportFaxInfoService
				.searchHdkfSupportFaxInfoByPage(queryReqBean, "");

		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportFaxInfoDTO> page = result
				.getResult();

		if (page.size() > 0) {

			int i=0;
			for(;i<page.size();i++){
				HdkfSupportFaxInfoDTO dto = page.get(i);
				String businessstate = dto.getBusinessstate_();
				if (businessstate != null &&! businessstate.equals("结束")) {
					mav.addObject("flag", OpResult.failure);
				//	mav.addObject("cardDto", dto);
					break;
				}
			}
			if(i==page.size())			
				mav.addObject("flag", OpResult.success);
			
			
		} else {
			mav.addObject("flag", OpResult.success);
		}
		return mav;
	}
}
