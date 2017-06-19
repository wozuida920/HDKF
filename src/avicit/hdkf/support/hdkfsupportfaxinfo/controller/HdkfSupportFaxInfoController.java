package avicit.hdkf.support.hdkfsupportfaxinfo.controller;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportFaxInfoController
 * @description: 定义传真 流程表单控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController")
public class HdkfSupportFaxInfoController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportFaxInfoController.class);

	@Autowired
	private HdkfSupportFaxInfoService service;

	private static final String TEL = "(86-0791)";

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportFaxInfoInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/operation/");
		return mav;
	}

	@RequestMapping(value = "HdkfSupportFaxInfoInfo1")
	public ModelAndView toDemoBusinessFlow1(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String requestId = request.getParameter("requestId");
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoManage1");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/operation/");
		mav.addObject("requestId", requestId);
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfSupportFaxInfosByPage1")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportFaxInfoByPage1(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportFaxInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportFaxInfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String requestId = ServletRequestUtils.getStringParameter(request,
				"requestId", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportFaxInfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportFaxInfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportFaxInfoDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		param = new HdkfSupportFaxInfoDTO();
		param.setRequestId(requestId);
		// param.setRequestId(requestId);
		queryReqBean.setSearchParams(param);
		// try {
		result = service.searchHdkfSupportFaxInfoByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportFaxInfoDTO dto : result.getResult()) {

			dto.setFromUserAlias(sysUserLoader.getSysUserNameById(dto
					.getFromUser()));

		}
		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}

	@RequestMapping(value = "/operation/getHdkfSupportFaxInfosByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportFaxInfoByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportFaxInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportFaxInfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportFaxInfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportFaxInfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportFaxInfoDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		// try {
		result = service.searchHdkfSupportFaxInfoByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportFaxInfoDTO dto : result.getResult()) {

			dto.setFromUserAlias(sysUserLoader.getSysUserNameById(dto
					.getFromUser()));

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
			HdkfSupportFaxInfoDTO dto = service
					.queryHdkfSupportFaxInfoByPrimaryKey(id);

			dto.setFromUserAlias(sysUserLoader.getSysUserNameById(dto
					.getFromUser()));

			request.setAttribute("hdkfSupportFaxInfoDTO", dto);
			request.setAttribute("id", id);
		} else {
			mav.addObject("id", ComUtil.getId());
		}
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaxinfo/"
				+ "HdkfSupportFaxInfo" + type);
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
			HdkfSupportFaxInfoDTO hdkfSupportFaxInfo = JsonHelper.getInstance()
					.readValue(datas, dateFormat,
							new TypeReference<HdkfSupportFaxInfoDTO>() {
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
			hdkfSupportFaxInfo
					.setFromTel(TEL + hdkfSupportFaxInfo.getFromTel());
			hdkfSupportFaxInfo
					.setFromFax(TEL + hdkfSupportFaxInfo.getFromFax());
			BeanProcess bp = service.insertHdkfSupportFaxInfoAndStartProcess(
					hdkfSupportFaxInfo, parameter);

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
	public ModelAndView toSaveHdkfSupportFaxInfoDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			HdkfSupportFaxInfoDTO hdkfSupportFaxInfoDTO = JsonHelper
					.getInstance().readValue(jsonData,
							new TypeReference<HdkfSupportFaxInfoDTO>() {
							});
			if (hdkfSupportFaxInfoDTO.getFromTel() != null) {
				hdkfSupportFaxInfoDTO.setFromTel(TEL
						+ hdkfSupportFaxInfoDTO.getFromTel());
			}
			if (hdkfSupportFaxInfoDTO.getFromFax() != null) {
				hdkfSupportFaxInfoDTO.setFromFax(TEL
						+ hdkfSupportFaxInfoDTO.getFromFax());
			}
			if ("".equals(hdkfSupportFaxInfoDTO.getId())) {// 新增
				service.insertHdkfSupportFaxInfo(hdkfSupportFaxInfoDTO);
			} else {// 修改
				service.updateHdkfSupportFaxInfoSensitive(hdkfSupportFaxInfoDTO);
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
	@RequestMapping(value = "/operation/delete", method = RequestMethod.POST)
	public ModelAndView toDeleteHdkfSupportFaxInfoDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportFaxInfoByIds(ids);
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
		HdkfSupportFaxInfoDTO dto = service
				.queryHdkfSupportFaxInfoByPrimaryKey(id);

		if (dto.getFromUser() != null && !dto.getFromUser().equals("")) {
			dto.setFromUserAlias(sysUserLoader.getSysUserNameById(dto
					.getFromUser()));
		}
		if (dto.getFromTel() != null && dto.getFromTel().startsWith(TEL)) {
			dto.setFromTel(dto.getFromTel().substring(TEL.length()));
		}

		if (dto.getFromFax() != null && dto.getFromFax().startsWith(TEL)) {
			dto.setFromFax(dto.getFromFax().substring(TEL.length()));
		}

		mav.addObject("flag", OpResult.success);
		mav.addObject("hdkfSupportFaxInfo", dto);
		return mav;
	}

	@RequestMapping(value = "HdkfSupportDealByKfSelect")
	public ModelAndView toHdkfSupportDealByKfSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaxinfo/HdkfSupportDealByKfManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/");

		return mav;
	}

	@RequestMapping(value = "/operation/downloadPdf")
	public String downloadPdf(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, ModelMap modelMap) {
		try {
			HdkfSupportFaxInfoDTO dto = service
					.queryHdkfSupportFaxInfoByPrimaryKey(id);
			modelMap.addAttribute("dto", dto);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			modelMap.addAttribute("error", ex.getMessage());
			modelMap.addAttribute("flag", OpResult.failure);

		}
		return "faxInfoView";// exqualityTemtView
	}
}
