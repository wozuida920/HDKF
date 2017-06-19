package avicit.hdkf.support.hdkfsupporttriptask.controller;

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
import avicit.platform6.api.sysuser.SysUserAPI;

import avicit.platform6.api.sysuser.dto.SysUser;

import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.spring.SpringFactory;

import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.service.HdkfSupportBorrowPersonInfService;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
import avicit.hdkf.support.hdkfsupportprocessview.service.HdkfSupportProcessViewService;
import avicit.hdkf.support.hdkfsupportresponseinfo.dto.HdkfSupportResponseInfoDTO;
import avicit.hdkf.support.hdkfsupporttaskarchive.dto.HdkfSupportTaskArchiveDTO;
import avicit.hdkf.support.hdkfsupporttaskarchive.service.HdkfSupportTaskArchiveService;
import avicit.hdkf.support.hdkfsupporttriptask.dto.HdkfSupportTripTaskDTO;
import avicit.hdkf.support.hdkfsupporttriptask.service.HdkfSupportTripTaskService;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportTripTaskController
 * @description: 定义HDKF_SUPPORT_TRIP_TASK 流程表单控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController")
public class HdkfSupportTripTaskController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportTripTaskController.class);

	@Autowired
	private HdkfSupportTripTaskService service;
    private HdkfSupportTaskArchiveService servicetask;
	@Autowired
	private HdkfSupportBorrowPersonInfService hdkfSupportBorrowPersonInfService;
	@Autowired
	private HdkfSupportProcessViewService hdkfSupportProcessViewService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportTripTaskInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfSupportTripTasksByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportTripTaskByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportTripTaskDTO> queryReqBean = new QueryReqBean<HdkfSupportTripTaskDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportTripTaskDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportTripTaskDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportTripTaskDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		// try {
		result = service.searchHdkfSupportTripTaskByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportTripTaskDTO dto : result.getResult()) {

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
			HdkfSupportTripTaskDTO dto = service
					.queryHdkfSupportTripTaskByPrimaryKey(id);

			request.setAttribute("hdkfSupportTripTaskDTO", dto);
			request.setAttribute("id", id);
		} else {
			mav.addObject("id", ComUtil.getId());
		}
		mav.setViewName("avicit/hdkf/support/hdkfsupporttriptask/"
				+ "HdkfSupportTripTask" + type);
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
			HdkfSupportTripTaskDTO hdkfSupportTripTask = JsonHelper
					.getInstance().readValue(datas, dateFormat,
							new TypeReference<HdkfSupportTripTaskDTO>() {
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

			BeanProcess bp = service.insertHdkfSupportTripTaskAndStartProcess(
					hdkfSupportTripTask, parameter);

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
	public ModelAndView toSaveHdkfSupportTripTaskDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String returnId = "";
		try {
			HdkfSupportTripTaskDTO hdkfSupportTripTaskDTO = JsonHelper
					.getInstance().readValue(jsonData,
							new TypeReference<HdkfSupportTripTaskDTO>() {
							});
			if ("".equals(hdkfSupportTripTaskDTO.getId())) {// 新增
				returnId = service
						.insertHdkfSupportTripTask(hdkfSupportTripTaskDTO);
			} else if (service.findDtoById(hdkfSupportTripTaskDTO.getId()) == null) {
				returnId = service
						.insertHdkfSupportTripTask(hdkfSupportTripTaskDTO);
			}

			else {// 修改

				returnId = hdkfSupportTripTaskDTO.getId();
				service.updateHdkfSupportTripTaskSensitive(hdkfSupportTripTaskDTO);
				hdkfSupportTripTaskDTO = service.findDtoById(returnId);
				if (hdkfSupportTripTaskDTO.getAttribute01() == null) {
					String isBorrowSomeone = hdkfSupportTripTaskDTO
							.getIsBorrowSomeone();
					if (isBorrowSomeone.equals("Y")) {
						String id = hdkfSupportTripTaskDTO.getId();
						String writeManId = hdkfSupportTripTaskDTO
								.getWriteManId();
						String writeManName = hdkfSupportTripTaskDTO
								.getWriteManName();
						String taskNo = hdkfSupportTripTaskDTO.getTaskNo();

						Map<String, Object> parameter = new HashMap<String, Object>();

						parameter.put("processDefId",
								"8a58c6db56b64ba50156b652c2570084-1");// 需要更换
						parameter.put("formCode", "hdkfSupportBorrowPersonInf");
						parameter.put("userId", writeManId);
						SysUserAPI userApi = SpringFactory
								.getBean(SysUserAPI.class);
						SysUser sysUser1 = userApi.getSysUserById(writeManId);
						String deptId = sysUser1.getDeptId();
						parameter.put("deptId", deptId);

						HdkfSupportBorrowPersonInfDTO dto = new HdkfSupportBorrowPersonInfDTO();
						dto.setTaskId(id);
						dto.setTaskNo(taskNo);
						dto.setLinkManKf(writeManName);

						// HdkfSupportBorrowPersonInfService
						// hdkfSupportBorrowPersonInfService1 =
						// SpringFactory.getBean(HdkfSupportBorrowPersonInfService.class);
						try {
							BeanProcess bp = hdkfSupportBorrowPersonInfService
									.insertHdkfSupportBorrowPersonInfAndStartProcess(
											dto, parameter);
							/*
							 * 同时修改 process_view的字段
							 */
							HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService.findDtoByTaskId(id);
							hdkfSupportProcessViewDTO.setBorrowInfoId(bp
									.getFormId());

							hdkfSupportProcessViewDTO.setCurStatus("51");
							hdkfSupportProcessViewDTO.setCurBpmstate("借人单拟稿");
							hdkfSupportProcessViewDTO.setCurUser(writeManId);
							hdkfSupportProcessViewService
									.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}

					}
					hdkfSupportTripTaskDTO.setAttribute01("已经启动借人单流程");
					service.updateHdkfSupportTripTaskSensitive(hdkfSupportTripTaskDTO);

				}

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
	public ModelAndView toDeleteHdkfSupportTripTaskDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportTripTaskByIds(ids);
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
		HdkfSupportTripTaskDTO dto = service
				.queryHdkfSupportTripTaskByPrimaryKey(id);

		mav.addObject("flag", OpResult.success);
		mav.addObject("hdkfSupportTripTask", dto);
		return mav;
	}

	@RequestMapping(value = "HdkfSupportDealByKfSelect")
	public ModelAndView toHdkfSupportDealByKfSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportDealByKfManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/");

		return mav;
	}

	@RequestMapping("/getTripTaskDTOByrequestId")
	public ModelAndView getTripTaskDTOByrequestId(HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String requestId = request.getParameter("requestId");

		QueryReqBean<HdkfSupportTripTaskDTO> queryReqBean = new QueryReqBean<HdkfSupportTripTaskDTO>();
		HdkfSupportTripTaskDTO searchParams = new HdkfSupportTripTaskDTO();
		searchParams.setRequestId(requestId);
		queryReqBean.setSearchParams(searchParams);

		QueryRespBean<HdkfSupportTripTaskDTO> result = service
				.searchHdkfSupportTripTaskByPage(queryReqBean, "");

		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportTripTaskDTO> page = result
				.getResult();
		if (page.size() > 0) {
			HdkfSupportTripTaskDTO dto = page.get(0);
			mav.addObject("flag", OpResult.success);
			mav.addObject("hdkfSupportTripTask", dto);
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
			
			HdkfSupportTripTaskDTO dto = service
					.queryHdkfSupportTripTaskByPrimaryKey(id);			
			modelMap.addAttribute("dto", dto);
			
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			modelMap.addAttribute("error", ex.getMessage());
			modelMap.addAttribute("flag", OpResult.failure);

		}

		return "tripTaskView";// exqualityTemtView
	}

	@RequestMapping("/getBorrowPersonDtoStatusByTaskId")
	public ModelAndView getBorrowPersonDtoStatusByTaskId(
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String tripTaskId = request.getParameter("tripTaskId");

		QueryReqBean<HdkfSupportBorrowPersonInfDTO> queryReqBean = new QueryReqBean<HdkfSupportBorrowPersonInfDTO>();
		HdkfSupportBorrowPersonInfDTO searchParams = new HdkfSupportBorrowPersonInfDTO();
		searchParams.setTaskId(tripTaskId);
		queryReqBean.setSearchParams(searchParams);

		QueryRespBean<HdkfSupportBorrowPersonInfDTO> result = hdkfSupportBorrowPersonInfService
				.searchHdkfSupportBorrowPersonInfByPage(queryReqBean, "");

		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportBorrowPersonInfDTO> page = result
				.getResult();

		if (page.size() > 0) {
			HdkfSupportBorrowPersonInfDTO dto = page.get(0);
			String businessstate = dto.getBusinessstate_();
			if (businessstate != null && businessstate.equals("结束")) {
				mav.addObject("flag", OpResult.success);
				mav.addObject("borrowDto", dto);
			} else {
				mav.addObject("flag", OpResult.failure);
			}
		} else {
			mav.addObject("flag", OpResult.failure);
		}
		return mav;
	}

}
