package avicit.hdkf.esnotice.hdkfesreporttrack.controller;

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

import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.bpm.pvm.internal.svc.BpmTools;
import avicit.platform6.commons.utils.DateUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import avicit.hdkf.esnotice.hdkfesnoticeinfo.dto.HdkfEsNoticeinfoDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfo.service.HdkfEsNoticeinfoService;
import avicit.hdkf.esnotice.hdkfesreporttrack.dto.HdkfEsReportTrackDTO;
import avicit.hdkf.esnotice.hdkfesreporttrack.service.HdkfEsReportTrackService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfEsReportTrackController
 * @description: 定义 上报跟踪表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController")
public class HdkfEsReportTrackController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfEsReportTrackController.class);

	@Autowired
	private HdkfEsReportTrackService service;
	@Autowired
	private HdkfEsNoticeinfoService serviceTrack;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfEsReportTrackInfo")
	public ModelAndView toHdkfEsReportTrack(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesreporttrack/HdkfEsNoticeinfoTrackManage");
		request.setAttribute(
				"url",
				"platform/hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/operation/");
		return mav;
	}

	/**
	 * 跳转到管理页面（调转上报页面）
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfEsReportTrackInfoRecord")
	public ModelAndView toHdkfEsReportTrackadd(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackRecord");
		String parambulletinNo = ServletRequestUtils.getStringParameter(
				request, "parambulletinNo", "");
		String paramId = ServletRequestUtils.getStringParameter(request,
				"paramId", "");
		mav.addObject("parambulletinNo", parambulletinNo);
		mav.addObject("paramId", paramId);
		request.setAttribute(
				"url",
				"platform/hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/operation/");
		return mav;
	}

	/**
	 * 跳转到管理页面(通报上报跟踪页面)(填写功能)
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfEsNoticeinfoInfoTrack")
	public ModelAndView toHdkfEsNoticeinfoTack(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();// platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/
		mav.setViewName("avicit/hdkf/esnotice/hdkfesreporttrack/HdkfEsNoticeinfoTrackManage");
		request.setAttribute("HdkfEsNoticeinfoUrl",
				"platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/");
		request.setAttribute("HdkfEsNoticeinfoInsertUrl",
				"platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfEsReportTracksByPage/{paramId}")
	@ResponseBody
	public Map<String, Object> togetHdkfEsReportTrackByPage(
			PageParameter pageParameter, HttpServletRequest request,
			@PathVariable String paramId) {
		QueryReqBean<HdkfEsReportTrackDTO> queryReqBean = new QueryReqBean<HdkfEsReportTrackDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfEsReportTrackDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfEsReportTrackDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfEsReportTrackDTO>() {
					});
			
		}else {
			param = new HdkfEsReportTrackDTO();
		}
		param.setTechinalBulletinId(paramId);
		queryReqBean.setSearchParams(param);
		try {
			result = service.searchHdkfEsReportTrackByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfEsReportTrackDTO dto : result.getResult()) {

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
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
			result = serviceTrack.searchHdkfEsNoticeinfoByPage(queryReqBean,
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
/*
	@RequestMapping(value = "/operation/{type}/{id}")
	public ModelAndView toOpertionPage(@PathVariable String type,
			@PathVariable String id, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		if (!"null".equals(id)) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
			HdkfEsReportTrackDTO dto = service
					.queryHdkfEsReportTrackByPrimaryKey(id);

			request.setAttribute("hdkfEsReportTrackDTO", dto);
		}
		mav.setViewName("avicit/hdkf/esnotice/hdkfesreporttrack/"
				+ "HdkfEsReportTrack" + type);
		return mav;
	}*/
	
	

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
			@PathVariable String id,HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HdkfEsNoticeinfoDTO dtotrack=serviceTrack.queryHdkfEsNoticeinfoByPrimaryKey(id);
		//上报通号
		String bulletinNo=dtotrack.getBulletinNo();
		String trackDate = DateUtil.getCurDateStr("yyyy-MM-dd");
		String people = SessionHelper.getLoginSysUser(request).getName();
		
		if (!"null".equals(id) && ("Edit".equals(type) || "Detail".equals(type))) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
		
			HdkfEsReportTrackDTO dto = service
					.queryHdkfEsReportTrackByPrimaryKey(id);
			dto.setBulletinNo(bulletinNo);
			request.setAttribute("hdkfEsReportTrackDTO", dto);
		}else{
			mav.addObject("trackDate", trackDate);
			mav.addObject("people", people);
			mav.addObject("bulletinNo",bulletinNo);
			mav.addObject("bulletinId",id);
		}
		mav.setViewName("avicit/hdkf/esnotice/hdkfesreporttrack/"
				+ "HdkfEsReportTrack" + type);
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
	public ModelAndView toSaveHdkfEsReportTrackDTO(HttpServletRequest request) {
		System.out.println(" HdkfEsReportTrackController save ........");
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfEsReportTrackDTO hdkfEsReportTrackDTO = JsonHelper
					.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<HdkfEsReportTrackDTO>() {
							});
			if ("".equals(hdkfEsReportTrackDTO.getId())) {// 新增
				service.insertHdkfEsReportTrack(hdkfEsReportTrackDTO);
			} else {// 修改
				service.updateHdkfEsReportTrackSensitive(hdkfEsReportTrackDTO);
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
	public ModelAndView toDeleteHdkfEsReportTrackDTO(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfEsReportTrackByIds(ids);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}

}
