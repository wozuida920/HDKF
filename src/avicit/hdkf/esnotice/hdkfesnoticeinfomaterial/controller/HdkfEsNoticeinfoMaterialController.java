package avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.web.AvicitResponseBody;

import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dto.HdkfEsNoticeinfoEffectiveDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.dto.HdkfEsNoticeinfoMaterialDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.service.HdkfEsNoticeinfoMaterialService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfEsNoticeinfoMaterialController
 * @description: 定义 技术通报涉及材料表 控制层
 * @author: AVICIT DEV
 */
//hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/HdkfEsNoticeinfoMaterialInfo
@Controller
@Scope("prototype")
@RequestMapping("hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController")
public class HdkfEsNoticeinfoMaterialController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfEsNoticeinfoMaterialController.class);

	@Autowired
	private HdkfEsNoticeinfoMaterialService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfEsNoticeinfoMaterialInfo1")
	public ModelAndView toHdkfEsNoticeinfoMaterial1(HttpServletRequest request,
			HttpServletResponse reponse) {
		String bulletinNo = request.getParameter("bulletinNo");
		String bulletinId = request.getParameter("bulletinId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialManage1");
		request.setAttribute(
				"url",
				"platform/hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/operation/");
		mav.addObject("bulletinId", bulletinId);
		mav.addObject("bulletinNo", bulletinNo);
		return mav;
	}
	@RequestMapping(value = "HdkfEsNoticeinfoMaterialInfo")
	public ModelAndView toHdkfEsNoticeinfoMaterial(HttpServletRequest request,
			HttpServletResponse reponse) {
		String bulletinNo = request.getParameter("bulletinNo");
		String bulletinId = request.getParameter("bulletinId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialManage");
		request.setAttribute(
				"url",
				"platform/hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/operation/");
		mav.addObject("bulletinId", bulletinId);
		mav.addObject("bulletinNo", bulletinNo);
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfEsNoticeinfoMaterialsByPage/{paramId}")
	@ResponseBody
	public Map<String, Object> togetHdkfEsNoticeinfoMaterialByPage(
			PageParameter pageParameter, HttpServletRequest request,
			@PathVariable String paramId) {
		QueryReqBean<HdkfEsNoticeinfoMaterialDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoMaterialDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfEsNoticeinfoMaterialDTO param = null;
		QueryRespBean<HdkfEsNoticeinfoMaterialDTO> result = null;
		if (json != null && !"".equals(json)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfEsNoticeinfoMaterialDTO>() {
					});
			// queryReqBean.setSearchParams(param);
		} else {
			param = new HdkfEsNoticeinfoMaterialDTO();
		}
		if (paramId != null && !"".equals(paramId)
				&& !"undefined".equals(paramId)) {
			param.setBulletinId(paramId);
		}

		queryReqBean.setSearchParams(param);
		try {
			result = service.searchHdkfEsNoticeinfoMaterialByPage(queryReqBean,
					sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfEsNoticeinfoMaterialDTO dto : result.getResult()) {

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取HdkfEsNoticeinfoMaterial分页数据");
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
	public AvicitResponseBody saveOrUpdateHdkfEsNoticeinfoMaterial(
			HttpServletRequest request) {
		String datas = ServletRequestUtils.getStringParameter(request, "datas",
				"");
		if (datas == "") {
			return new AvicitResponseBody(OpResult.success);
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			List<HdkfEsNoticeinfoMaterialDTO> list = JsonHelper
					.getInstance()
					.readValue(
							datas,
							dateFormat,
							new TypeReference<List<HdkfEsNoticeinfoMaterialDTO>>() {
							});
			service.insertOrUpdateHdkfEsNoticeinfoMaterial(list);
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
	public AvicitResponseBody deleteHdkfEsNoticeinfoMaterial(
			HttpServletRequest request) {
		String ids = ServletRequestUtils.getStringParameter(request, "ids", "");
		try {
			service.deleteHdkfEsNoticeinfoMaterialByIds(ids.split(","));
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			return new AvicitResponseBody(OpResult.failure, e.getMessage());
		}
	}
}
