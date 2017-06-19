package avicit.hdkf.support.hdkfsupportoutfieldcard.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.platform6.api.syslookup.dto.SysLookupSimpleVo;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.api.sysuser.dto.SysUser;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;

import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportOutfieldCardController
 * @description: 定义HDKF_SUPPORT_OUTFIELD_CARD 流程表单控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController")
public class HdkfSupportOutfieldCardController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportOutfieldCardController.class);

	@Autowired
	private HdkfSupportOutfieldCardService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportOutfieldCardInfoDesign")
	public ModelAndView toDemoBusinessFlowDesign(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardManageDesign");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/");
		return mav;
	}
	@RequestMapping(value = "HdkfSupportOutfieldCardInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/");
		return mav;
	}
	@RequestMapping(value = "HdkfSupportOutfieldCardInfo1")
	public ModelAndView toDemoBusinessFlow1(HttpServletRequest request,
			HttpServletResponse reponse) {
		String  requestId = request.getParameter("requestId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardManage1");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/");
		mav.addObject("requestId", requestId);
		return mav;
	}
	@RequestMapping(value = "/operation/getHdkfSupportOutfieldCardsByPage1")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportOutfieldCardByPage1(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean = new QueryReqBean<HdkfSupportOutfieldCardDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportOutfieldCardDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportOutfieldCardDTO> result = null;
		String requestId = ServletRequestUtils.getStringParameter(request, "requestId", "");
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportOutfieldCardDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		param = new HdkfSupportOutfieldCardDTO();
		param.setRequestId(requestId);
		queryReqBean.setSearchParams(param);
		// try {
		result = service.searchHdkfSupportOutfieldCardByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportOutfieldCardDTO dto : result.getResult()) {
			dto.setKfUserName(sysUserLoader.getSysUserNameById(dto
					.getKfUserId()));
			dto.setDealDepartName(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getDealDepartId(),
					SessionHelper.getCurrentLanguageCode(request)));
		}
		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	@RequestMapping(value = "/operation/getHdkfSupportOutfieldCardsDesignByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportOutfieldCardDesignByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean = new QueryReqBean<HdkfSupportOutfieldCardDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		//String json = ServletRequestUtils.getStringParameter(request, "param",
			//	"");
		//String sfnConditions = ServletRequestUtils.getStringParameter(request,
			//	"sdfConditons", "");// 自定义查询条件
		HdkfSupportOutfieldCardDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportOutfieldCardDTO> result = null;
//		if (json != null && !"".equals(json)) {
//			param = JsonHelper.getInstance().readValue(json, dateFormat,
//					new TypeReference<HdkfSupportOutfieldCardDTO>() {
//					});
//			// param.put("currUserId",
//			// SessionHelper.getLoginSysUserId(request));
//			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
//			
//		}else {}
			param = new HdkfSupportOutfieldCardDTO();
		
		param.setBpmState("ended");
		//param.setAttribute01("Y");
		queryReqBean.setSearchParams(param);
		// try {
		result = service.searchHdkfSupportOutfieldCardByPage(queryReqBean,
				"");
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportOutfieldCardDTO dto : result.getResult()) {
			dto.setKfUserName(sysUserLoader.getSysUserNameById(dto
					.getKfUserId()));
			dto.setDealDepartName(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getDealDepartId(),
					SessionHelper.getCurrentLanguageCode(request)));
		}
		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}

	@RequestMapping(value = "/operation/getHdkfSupportOutfieldCardsByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportOutfieldCardByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean = new QueryReqBean<HdkfSupportOutfieldCardDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportOutfieldCardDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportOutfieldCardDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportOutfieldCardDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		// try {
		result = service.searchHdkfSupportOutfieldCardByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportOutfieldCardDTO dto : result.getResult()) {
			dto.setKfUserName(sysUserLoader.getSysUserNameById(dto
					.getKfUserId()));
			dto.setDealDepartName(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getDealDepartId(),
					SessionHelper.getCurrentLanguageCode(request)));
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
			HdkfSupportOutfieldCardDTO dto = service
					.queryHdkfSupportOutfieldCardByPrimaryKey(id);

			request.setAttribute("hdkfSupportOutfieldCardDTO", dto);
			request.setAttribute("id", id);
		} else {
			mav.addObject("id", ComUtil.getId());
		}
		Collection<SysLookupSimpleVo> requestMethodList = sysLookupLoader
				.getLookUpListByTypeByAppId("SUPPORT_REQUEST_TYPE",
						SessionHelper.getCurrentLanguageCode(request));
		mav.addObject("requestMethodList", requestMethodList);
		mav.setViewName("avicit/hdkf/support/hdkfsupportoutfieldcard/"
				+ "HdkfSupportOutfieldCard" + type);
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
			HdkfSupportOutfieldCardDTO hdkfSupportOutfieldCard = JsonHelper
					.getInstance().readValue(datas, dateFormat,
							new TypeReference<HdkfSupportOutfieldCardDTO>() {
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
					.insertHdkfSupportOutfieldCardAndStartProcess(
							hdkfSupportOutfieldCard, parameter);

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
	public ModelAndView toSaveHdkfSupportOutfieldCardDTO(
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			HdkfSupportOutfieldCardDTO hdkfSupportOutfieldCardDTO = JsonHelper
					.getInstance().readValue(jsonData,
							new TypeReference<HdkfSupportOutfieldCardDTO>() {
							});
			if ("".equals(hdkfSupportOutfieldCardDTO.getId())) {// 新增
				service.insertHdkfSupportOutfieldCard(hdkfSupportOutfieldCardDTO);
			} else {// 修改
				service.updateHdkfSupportOutfieldCardSensitive(hdkfSupportOutfieldCardDTO);
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
	
	/**
	 * 按照id批量删除数据
	 * 
	 * @param ids
	 *            id数组
	 * @return
	 */
	@RequestMapping(value = "/operation/updateDesignNo", method = RequestMethod.POST)
	public ModelAndView updateDesignNo(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			boolean noFlag = service.updateDesignNo(ids);
			if(noFlag)
				 mav.addObject("noFlag",OpResult.success);
			else
				mav.addObject("noFlag",OpResult.failure);
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
	public ModelAndView toDeleteHdkfSupportOutfieldCardDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportOutfieldCardByIds(ids);
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
		HdkfSupportOutfieldCardDTO dto = service
				.queryHdkfSupportOutfieldCardByPrimaryKey(id);
		dto.setKfUserName(sysUserLoader.getSysUserNameById(dto.getKfUserId()));
		String deptName = sysDeptLoader.getSysDeptNameBySysDeptId(
				dto.getDealDepartId(),
				SessionHelper.getCurrentLanguageCode(request));
		dto.setDealDepartName(deptName);
		if (dto.getDealUserId() == null || dto.getDealUserId().equals("")) {
			SysUser user = SessionHelper.getLoginSysUser(request);
			mav.addObject("userId", user.getId());
			mav.addObject("userName", user.getName());
		} else {
			String  dealUserId = dto
					.getDealUserId();
			String dealUserIdArr[] = dealUserId.split(",");
			String dealUserName=sysUserLoader.getSysUserNameById(dealUserIdArr[0]);
			for(int i=1;i<dealUserIdArr.length;i++){
				dealUserName=dealUserName+","+sysUserLoader.getSysUserNameById(dealUserIdArr[i]);
			}
			
			
			dto.setDealUserName(dealUserName);
		}
		Collection<SysLookupSimpleVo> requestMethodList = sysLookupLoader
				.getLookUpListByTypeByAppId("SUPPORT_REQUEST_TYPE",
						SessionHelper.getCurrentLanguageCode(request));
		mav.addObject("requestMethodList", JSONArray.toJSONString(requestMethodList));
		mav.addObject("flag", OpResult.success);
		mav.addObject("hdkfSupportOutfieldCard", dto);
		return mav;
	}

	/**
	 * 跳转到产品管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportRequestInfoSelect")
	public ModelAndView toHdkfSupportRequestSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportRequestInfoManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/");
		return mav;
	}

	@RequestMapping("/getOutfieldCardDTOByrequestId")
	public ModelAndView getOutfieldCardDTOByrequestId(HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String requestId = request.getParameter("requestId");

		QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean = new QueryReqBean<HdkfSupportOutfieldCardDTO>();
		HdkfSupportOutfieldCardDTO searchParams = new HdkfSupportOutfieldCardDTO();
		searchParams.setRequestId(requestId);
		queryReqBean.setSearchParams(searchParams);

		QueryRespBean<HdkfSupportOutfieldCardDTO> result = service
				.searchHdkfSupportOutfieldCardByPage(queryReqBean, "");

		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportOutfieldCardDTO> page = result
				.getResult();
		if (page.size() > 0) {
			HdkfSupportOutfieldCardDTO dto = page.get(0);
			mav.addObject("flag", OpResult.success);
			mav.addObject("hdkfSupportOutfieldCard", dto);
		} else {
			mav.addObject("flag", OpResult.failure);
		}
		return mav;
	}

	@RequestMapping(value = "/operation/downloadPdf")
	public String downloadPdf(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, ModelMap modelMap) {
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			HdkfSupportOutfieldCardDTO dto = service
					.queryHdkfSupportOutfieldCardByPrimaryKey(id);
			modelMap.addAttribute("dto", dto);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			modelMap.addAttribute("error", ex.getMessage());
			modelMap.addAttribute("flag", OpResult.failure);
		}
		return "exqualityTemtView";// exqualityTemtView
	}

}
