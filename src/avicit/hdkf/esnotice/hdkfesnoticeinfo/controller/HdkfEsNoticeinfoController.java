package avicit.hdkf.esnotice.hdkfesnoticeinfo.controller;
import avicit.platform6.core.mybatis.pagehelper.Page;
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
import avicit.platform6.bpm.pvm.internal.svc.BpmTools;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.domain.BeanProcess;

import ch.qos.logback.core.pattern.color.MagentaCompositeConverter;

import com.fasterxml.jackson.core.type.TypeReference;

import avicit.hdkf.esnotice.hdkfesnoticeinfo.dto.HdkfEsNoticeinfoDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfo.service.HdkfEsNoticeinfoService;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dto.HdkfEsNoticeinfoEffectiveDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.service.HdkfEsNoticeinfoEffectiveService;

/**
 * @classname: HdkfEsNoticeinfoController
 * @description: 定义 技术通报详细信息表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController")
public class HdkfEsNoticeinfoController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfEsNoticeinfoController.class);

	@Autowired
	private HdkfEsNoticeinfoService service;
	
	@Autowired
	private HdkfEsNoticeinfoEffectiveService hdkfEsNoticeinfoEffectiveService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */

	@RequestMapping(value = "/operation/getHdkfEsNoticeinfosTrackByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfEsNoticeinfoTrackByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		// String bpmType = ServletRequestUtils.getStringParameter(request,
		// "bpmType", "");
		// String bpmState = ServletRequestUtils.getStringParameter(request,
		// "bpmState", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");
		HdkfEsNoticeinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfEsNoticeinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfEsNoticeinfoDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		if (queryReqBean.getSearchParams() == null) {
			queryReqBean.setSearchParams(new HdkfEsNoticeinfoDTO());
		}

		String userId = (String) request.getSession().getAttribute("userId");
		queryReqBean.getSearchParams().setCurrUserId(userId);
		queryReqBean.getSearchParams().setBpmState("ended");
		try {
			result = service.searchHdkfEsNoticeinfoImplementByPage(
					queryReqBean, sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfEsNoticeinfoDTO dto : result.getResult()) {
			dto.setBusinessstate_(BpmTools.processStateCode2StateName(dto
					.getBusinessstate_()));
		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	@RequestMapping(value = "HdkfEsNoticeinfoInfoImplement1")
	public ModelAndView toHdkfEsNoticeinfoImplement1(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String batchNo= request.getParameter("batchNo");
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoImplementManage1");
		request.setAttribute("url",
				"platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/");
		mav.addObject("batchNo", batchNo);
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfEsNoticeinfosImplementByPage1")
	@ResponseBody
	public Map<String, Object> togetHdkfEsNoticeinfoImplementByPage1(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String batchNo = ServletRequestUtils.getStringParameter(request, "batchNo",
				"");
		QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> result1 = null;
		Page<HdkfEsNoticeinfoDTO> rows = new Page<HdkfEsNoticeinfoDTO>();
		QueryReqBean<HdkfEsNoticeinfoEffectiveDTO> queryReqBean1 = new QueryReqBean<HdkfEsNoticeinfoEffectiveDTO>();
		HdkfEsNoticeinfoEffectiveDTO searchParams1 = new HdkfEsNoticeinfoEffectiveDTO();
		searchParams1.setBatchNo(batchNo);
		queryReqBean1.setSearchParams(searchParams1);
		QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> queryRespBean1;
		try {
			queryRespBean1 = hdkfEsNoticeinfoEffectiveService.
					searchHdkfEsNoticeinfoEffective1ByPage(queryReqBean1, "");
			result1 = queryRespBean1;
			
			for(HdkfEsNoticeinfoEffectiveDTO o:queryRespBean1.getResult()){
				String bulletinId = o.getBulletinId();
				HdkfEsNoticeinfoDTO  dto = service.queryHdkfEsNoticeinfoByPrimaryKey(bulletinId);
				
				dto.setIsDone(o.getDoFlag());
				dto.setEffectDate(o.getDoTime());
				service.setCountNo(dto);
				
				rows.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
//		HdkfEsNoticeinfoDTO param = null;
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		QueryRespBean<HdkfEsNoticeinfoDTO> result = null;
//		
//		if (queryReqBean.getSearchParams() == null) {
//			queryReqBean.setSearchParams(new HdkfEsNoticeinfoDTO());
//		}
//
//		String userId = (String) request.getSession().getAttribute("userId");
//		queryReqBean.getSearchParams().setCurrUserId(userId);
//		queryReqBean.getSearchParams().setBpmState("ended");
//		try {
//			result = service.searchHdkfEsNoticeinfoImplementByPage(
//					queryReqBean, sfnConditions);
//		} catch (Exception ex) {
//			logger.debug(ex.getMessage());
//			ex.printStackTrace();
//			return map;
//		}

		for (HdkfEsNoticeinfoDTO dto : rows) {
			dto.setBusinessstate_(BpmTools.processStateCode2StateName(dto
					.getBusinessstate_()));
		}

		map.put("total", result1.getPageParameter().getTotalCount());
		map.put("rows", rows);
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	@RequestMapping(value = "HdkfEsNoticeinfoInfoWhole")
	public ModelAndView toHdkfEsNoticeinfoWhole(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoWholeManage");
		request.setAttribute("url",
				"platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfEsNoticeinfoWholeByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfEsNoticeinfoWholeByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");
		HdkfEsNoticeinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfEsNoticeinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfEsNoticeinfoDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		if (queryReqBean.getSearchParams() == null) {
			queryReqBean.setSearchParams(new HdkfEsNoticeinfoDTO());
		}

	//	String userId = (String) request.getSession().getAttribute("userId");
		//queryReqBean.getSearchParams().setCurrUserId(userId);
	//	queryReqBean.getSearchParams().setBpmState("ended");
		try {
			result = service.searchHdkfEsNoticeinfoWholeByPage(
					queryReqBean, sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfEsNoticeinfoDTO dto : result.getResult()) {
			dto.setBusinessstate_(BpmTools.processStateCode2StateName(dto
					.getBusinessstate_()));
		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}


	@RequestMapping(value = "HdkfEsNoticeinfoInfoImplement")
	public ModelAndView toHdkfEsNoticeinfoImplement(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoImplementManage");
		request.setAttribute("url",
				"platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfEsNoticeinfosImplementByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfEsNoticeinfoImplementByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		// String bpmType = ServletRequestUtils.getStringParameter(request,
		// "bpmType", "");
		// String bpmState = ServletRequestUtils.getStringParameter(request,
		// "bpmState", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");
		HdkfEsNoticeinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfEsNoticeinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfEsNoticeinfoDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		if (queryReqBean.getSearchParams() == null) {
			queryReqBean.setSearchParams(new HdkfEsNoticeinfoDTO());
		}

		String userId = (String) request.getSession().getAttribute("userId");
		queryReqBean.getSearchParams().setCurrUserId(userId);
		queryReqBean.getSearchParams().setBpmState("ended");
		try {
			result = service.searchHdkfEsNoticeinfoImplementByPage(
					queryReqBean, sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfEsNoticeinfoDTO dto : result.getResult()) {
			dto.setBusinessstate_(BpmTools.processStateCode2StateName(dto
					.getBusinessstate_()));
		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}

	@RequestMapping(value = "HdkfEsNoticeinfoInfo")
	public ModelAndView toHdkfEsNoticeinfo(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoManage");
		request.setAttribute("url",
				"platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfEsNoticeinfosByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfEsNoticeinfoByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String bpmType = ServletRequestUtils.getStringParameter(request,
				"bpmType", "");
		String bpmState = ServletRequestUtils.getStringParameter(request,
				"bpmState", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");
		HdkfEsNoticeinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfEsNoticeinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfEsNoticeinfoDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		if (queryReqBean.getSearchParams() == null) {
			queryReqBean.setSearchParams(new HdkfEsNoticeinfoDTO());
		}
		if (bpmType == null || bpmType.equals("")) {
			queryReqBean.getSearchParams().setBpmType(null);
		} else {
			queryReqBean.getSearchParams().setBpmType(bpmType);
		}
		if (bpmState == null || bpmState.equals("")) {
			queryReqBean.getSearchParams().setBpmState(null);
		} else {
			queryReqBean.getSearchParams().setBpmState(bpmState);
		}
		String userId = (String) request.getSession().getAttribute("userId");
		queryReqBean.getSearchParams().setCurrUserId(userId);
		try {
			result = service.searchHdkfEsNoticeinfoByPage(queryReqBean,
					sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfEsNoticeinfoDTO dto : result.getResult()) {
			dto.setBusinessstate_(BpmTools.processStateCode2StateName(dto
					.getBusinessstate_()));
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
			HdkfEsNoticeinfoDTO dto = service
					.queryHdkfEsNoticeinfoByPrimaryKey(id);
			request.setAttribute("hdkfEsNoticeinfoDTO", dto);
		}
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfo/"
				+ "HdkfEsNoticeinfo" + type);
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
	public ModelAndView toSaveHdkfEsNoticeinfoDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String returnId = "";

		try {
			HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO = JsonHelper.getInstance()
					.readValue(jsonData, dateFormat,
							new TypeReference<HdkfEsNoticeinfoDTO>() {
							});

			String bulletinNo = hdkfEsNoticeinfoDTO.getBulletinNo();

			if ("".equals(hdkfEsNoticeinfoDTO.getId())) {// 新增

				HdkfEsNoticeinfoDTO o = service
						.queryHdkfEsNoticeinfoByBullitenNo(bulletinNo);
				if (o != null
						&& !o.getTitle().equals(hdkfEsNoticeinfoDTO.getTitle())) {
					mav.addObject("error", "通报编号重复，请核查！");
					mav.addObject("flag", OpResult.failure);
				} else {
					returnId = service
							.insertHdkfEsNoticeinfo(hdkfEsNoticeinfoDTO);

				}
			} else {// 修改

				HdkfEsNoticeinfoDTO o = service
						.queryHdkfEsNoticeinfoByBullitenNo(bulletinNo);
				if (o != null
						&& !o.getId().equals(hdkfEsNoticeinfoDTO.getId())) {
					mav.addObject("error", "通报编号重复，请核查！");
					mav.addObject("flag", OpResult.failure);
				} else {
					returnId = hdkfEsNoticeinfoDTO.getId();
					service.updateHdkfEsNoticeinfoSensitive(hdkfEsNoticeinfoDTO);
				}
			}
			if (!returnId.equals("")) {
				mav.addObject("flag", OpResult.success);
				mav.addObject("id", returnId);
			}

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
	public ModelAndView toDeleteHdkfEsNoticeinfoDTO(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfEsNoticeinfoByIds(ids);
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
	 * 新增并启动流程
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/operation/saveAndStartProcess")
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
			HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO = JsonHelper.getInstance()
					.readValue(datas, dateFormat,
							new TypeReference<HdkfEsNoticeinfoDTO>() {
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

			BeanProcess bp = service.insertHdkfEsNoticeinfoStartProcess(
					hdkfEsNoticeinfoDTO, parameter);

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
	 * 转向detail页面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/operation/toDetailJsp")
	public ModelAndView toDetailJsp(HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		HdkfEsNoticeinfoDTO dto = service.queryHdkfEsNoticeinfoByPrimaryKey(id);
		mav.addObject("flag", OpResult.success);
		mav.addObject("datas", dto);
		return mav;
	}

	/*
	 * 功能： 插入填写的上报文号，请再不要删除了
	 */

	// 填写上报上报文号

	@RequestMapping(value = "/operation/TrackReport/InsertReport/{id}", method = RequestMethod.POST)
	public ModelAndView toHdkfEsNoticeinfoReport(@PathVariable String id,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("flag", OpResult.success);

		try {
			HdkfEsNoticeinfoDTO dtoList = service
					.queryHdkfEsNoticeinfoTrackReportByPrimaryId(id);
			if (dtoList.getReportNo() == null) {
				mav.addObject("flag", OpResult.success);
			} else {
				mav.addObject("flag", OpResult.failure);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			mav.addObject("error", e.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}

		return mav;
	}

	// 填写上报批复文号

	@RequestMapping(value = "/operation/TrackAnswer/InsertAnswer/{id}", method = RequestMethod.POST)
	public ModelAndView toHdkfEsNoticeinfoAnswer(@PathVariable String id,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("flag", OpResult.success);

		try {
			HdkfEsNoticeinfoDTO dtoList = service
					.queryHdkfEsNoticeinfoTrackReportByPrimaryId(id);
			if (dtoList.getReplyNo() == null) {
				mav.addObject("flag", OpResult.success);
			} else {
				mav.addObject("flag", OpResult.failure);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			mav.addObject("error", e.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}

		return mav;
	}

	// 填写上报转发文号

	@RequestMapping(value = "/operation/TrackSend/InsertSend/{id}", method = RequestMethod.POST)
	public ModelAndView toHdkfEsNoticeinfoSend(@PathVariable String id,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("flag", OpResult.success);

		try {
			HdkfEsNoticeinfoDTO dtoList = service
					.queryHdkfEsNoticeinfoTrackReportByPrimaryId(id);
			if (dtoList.getForwardNo() == null) {
				mav.addObject("flag", OpResult.success);
			} else {
				mav.addObject("flag", OpResult.failure);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			mav.addObject("error", e.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}

		return mav;
	}

}
