package avicit.hdkf.support.hdkfoapublicsheet.controller;

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
import avicit.platform6.api.sysuser.SysDeptAPI;
import avicit.platform6.api.sysuser.SysUserAPI;
import avicit.platform6.api.sysuser.dto.SysUser;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.bpm.web.service.BpmOperateService;
import avicit.platform6.bpmclient.bpm.service.BpmDisplayService;
import avicit.platform6.bpmclient.dto.sys.TrackVo;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.spring.SpringFactory;
import avicit.hdkf.support.hdkfoapublicsheet.dto.HdkfOaPublicsheetDTO;
import avicit.hdkf.support.hdkfoapublicsheet.service.HdkfOaPublicsheetService;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupporttriptask.dto.HdkfSupportTripTaskDTO;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfOaPublicsheetController
 * @description: 定义公用笺信息表 流程表单控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController")
public class HdkfOaPublicsheetController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfOaPublicsheetController.class);

	@Autowired
	private HdkfOaPublicsheetService service;

	@Autowired
	private SysUserAPI userApi;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfOaPublicsheetInfo1")
	public ModelAndView toDemoBusinessFlow1(HttpServletRequest request,
			HttpServletResponse reponse) {
		String  requestId = request.getParameter("requestId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetManage1");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/");
		mav.addObject("requestId", requestId);
		return mav;
	}
	@RequestMapping(value = "/operation/getHdkfOaPublicsheetsByPage1")
	@ResponseBody
	public Map<String, Object> togetHdkfOaPublicsheetByPage1(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfOaPublicsheetDTO> queryReqBean = new QueryReqBean<HdkfOaPublicsheetDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String requestId = ServletRequestUtils.getStringParameter(request, "requestId", "");
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfOaPublicsheetDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfOaPublicsheetDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfOaPublicsheetDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		param = new HdkfOaPublicsheetDTO();
		param.setAttribute01(requestId);
		queryReqBean.setSearchParams(param);
		// try {
		result = service.searchHdkfOaPublicsheetByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfOaPublicsheetDTO dto : result.getResult()) {

			dto.setSendDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getSendDep(),
					SessionHelper.getCurrentLanguageCode(request)));

			dto.setReceiveDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getReceiveDep(),
					SessionHelper.getCurrentLanguageCode(request)));

		}
		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	@RequestMapping(value = "HdkfOaPublicsheetInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/");
		return mav;
	}


	@RequestMapping(value = "/operation/getHdkfOaPublicsheetsByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfOaPublicsheetByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfOaPublicsheetDTO> queryReqBean = new QueryReqBean<HdkfOaPublicsheetDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfOaPublicsheetDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfOaPublicsheetDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfOaPublicsheetDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		// try {
		result = service.searchHdkfOaPublicsheetByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfOaPublicsheetDTO dto : result.getResult()) {

			dto.setSendDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getSendDep(),
					SessionHelper.getCurrentLanguageCode(request)));

			dto.setReceiveDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getReceiveDep(),
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
			HdkfOaPublicsheetDTO dto = service
					.queryHdkfOaPublicsheetByPrimaryKey(id);
			dto.setSendDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getSendDep(),
					SessionHelper.getCurrentLanguageCode(request)));
			dto.setReceiveDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getReceiveDep(),
					SessionHelper.getCurrentLanguageCode(request)));
			request.setAttribute("hdkfOaPublicsheetDTO", dto);
			request.setAttribute("id", id);
			// request.setAttribute(arg0, arg1)

			String receiveDep1 = dto.getReceiveDep();
			SysDeptAPI api = SpringFactory.getBean(SysDeptAPI.class);
			String Dept = api.getSysDeptNamesBySysDeptIds(receiveDep1, ",",
					"zh_CN");
			mav.addObject("Dept", Dept);

		} else {
			mav.addObject("id", ComUtil.getId());

		}
		mav.setViewName("avicit/hdkf/support/hdkfoapublicsheet/"
				+ "HdkfOaPublicsheet" + type);
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
			HdkfOaPublicsheetDTO hdkfOaPublicsheet = JsonHelper.getInstance()
					.readValue(datas, dateFormat,
							new TypeReference<HdkfOaPublicsheetDTO>() {
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

			BeanProcess bp = service.insertHdkfOaPublicsheetAndStartProcess(
					hdkfOaPublicsheet, parameter);

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
	public ModelAndView toSaveHdkfOaPublicsheetDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		// String userId = (String) request.getSession().getAttribute("userId");
		// String userName = userApi.getSysUserNameById(userId);
		String returnId = "";
		try {
			HdkfOaPublicsheetDTO hdkfOaPublicsheetDTO = JsonHelper
					.getInstance().readValue(jsonData,
							new TypeReference<HdkfOaPublicsheetDTO>() {
							});
			

			if ("".equals(hdkfOaPublicsheetDTO.getId())) {// 新增
				returnId = service
						.insertHdkfOaPublicsheet(hdkfOaPublicsheetDTO);
			} else if (service.findDtoById(hdkfOaPublicsheetDTO.getId()) == null) {
				returnId = service
						.insertHdkfOaPublicsheet(hdkfOaPublicsheetDTO);
			}

			else {// 修改
				returnId = hdkfOaPublicsheetDTO.getId();
				service.updateHdkfOaPublicsheetSensitive(hdkfOaPublicsheetDTO);
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
	public ModelAndView toDeleteHdkfOaPublicsheetDTO(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfOaPublicsheetByIds(ids);
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
		HdkfOaPublicsheetDTO dto = service
				.queryHdkfOaPublicsheetByPrimaryKey(id);
		dto.setSendDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
				dto.getSendDep(), SessionHelper.getCurrentLanguageCode(request)));
		dto.setReceiveDepAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
				dto.getReceiveDep(),
				SessionHelper.getCurrentLanguageCode(request)));
		String receiveDep1 = dto.getReceiveDep();
		SysDeptAPI api = SpringFactory.getBean(SysDeptAPI.class);
		String dept = "";
		if (receiveDep1 != null)
			dept = api.getSysDeptNamesBySysDeptIds(receiveDep1, ",", "zh_CN");
		mav.addObject("flag", OpResult.success);
		mav.addObject("hdkfOaPublicsheet", dto);
		mav.addObject("Dept", dept);
		return mav;
	}

	@RequestMapping(value = "/operation/downloadPdf")
	public String downloadPdf(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, ModelMap modelMap) {
		try {
			HdkfOaPublicsheetDTO dto = service
					.queryHdkfOaPublicsheetByPrimaryKey(id);
			modelMap.addAttribute("dto", dto);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			modelMap.addAttribute("error", ex.getMessage());
			modelMap.addAttribute("flag", OpResult.failure);

		}
		return "hdkfoapublicsheet";
	}
	
	
	
	/**
	 * 跳转到批架次管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfBdAircraftinfoInfo")
	public ModelAndView toCsmpBdCompanyinfo(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("avicit/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetSelectManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/");
		//request.setAttribute("fid",fid);
                  //platform/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/
		return mav;
	}
	/**
	 * 跳转到产品管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应HdkfBdSparepartInfoSelect
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportRequestInfoSelect")
	public ModelAndView toCsmpBdSparepartSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetSelect1Manage");
		request.setAttribute("url",
				"platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/");
		       //"platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/
		return mav;
	}
	
	
	
}
