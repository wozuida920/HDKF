package avicit.csmp.basicData.hdkfbdcoderule.controller;

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
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import avicit.csmp.basicData.hdkfbdcoderule.dto.HdkfBdCodeRuleDTO;
import avicit.csmp.basicData.hdkfbdcoderule.service.HdkfBdCodeRuleService;

/**
 * @classname: HdkfBdCodeRuleController
 * @description: 定义 HDKF_BD_CODE_RULE 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController")
public class HdkfBdCodeRuleController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfBdCodeRuleController.class);

	@Autowired
	private HdkfBdCodeRuleService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfBdCodeRuleInfo")
	public ModelAndView toHdkfBdCodeRule(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleManage");
		request.setAttribute("url",
				"platform/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfBdCodeRulesByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfBdCodeRuleByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfBdCodeRuleDTO> queryReqBean = new QueryReqBean<HdkfBdCodeRuleDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfBdCodeRuleDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfBdCodeRuleDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfBdCodeRuleDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		try {
			result = service.searchHdkfBdCodeRuleByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfBdCodeRuleDTO dto : result.getResult()) {

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
			HdkfBdCodeRuleDTO dto = service.queryHdkfBdCodeRuleByPrimaryKey(id);

			request.setAttribute("hdkfBdCodeRuleDTO", dto);
		}
		mav.setViewName("avicit/csmp/basicData/hdkfbdcoderule/"
				+ "HdkfBdCodeRule" + type);
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
	public ModelAndView toSaveHdkfBdCodeRuleDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfBdCodeRuleDTO hdkfBdCodeRuleDTO = JsonHelper.getInstance()
					.readValue(jsonData, dateFormat,
							new TypeReference<HdkfBdCodeRuleDTO>() {
							});
			if ("".equals(hdkfBdCodeRuleDTO.getId())) {// 新增
				service.insertHdkfBdCodeRule(hdkfBdCodeRuleDTO);
			} else {// 修改
				service.updateHdkfBdCodeRuleSensitive(hdkfBdCodeRuleDTO);
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
	public ModelAndView toDeleteHdkfBdCodeRuleDTO(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfBdCodeRuleByIds(ids);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}


  	//生成编码
	@RequestMapping(value = "/operation/getStringRuleCode", method = RequestMethod.POST)
	public ModelAndView getStringRuleCode(HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String type = ServletRequestUtils.getStringParameter(request,
					"type", "");
			String requestId = ServletRequestUtils.getStringParameter(request,
					"requestId", "");
			String modelId = ServletRequestUtils.getStringParameter(request,
					"modelId", "");
			String ruleCode = service.getAutomicCode(type, modelId, requestId);
			mav.addObject("ruleCode", ruleCode);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;

	}

	@RequestMapping(value = "HdkfBdCodeRuleSelect")
	public ModelAndView toCsmpBdSparepartSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleSelectManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/");
		return mav;
	}

}
