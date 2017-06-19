package avicit.hdkf.support.hdkfsupportdealbykf.controller;

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
import avicit.hdkf.support.hdkfsupportdealbykf.dto.HdkfSupportDealByKfDTO;
import avicit.hdkf.support.hdkfsupportdealbykf.service.HdkfSupportDealByKfService;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportDealByKfController
 * @description: 定义HDKF_SUPPORT_DEAL_BY_KF 流程表单控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController")
public class HdkfSupportDealByKfController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportDealByKfController.class);

	@Autowired
	private HdkfSupportDealByKfService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportDealByKfInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfSupportDealByKfsByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportDealByKfByPage(
			PageParameter pageParameter, HttpServletRequest request)
			throws Exception {
		QueryReqBean<HdkfSupportDealByKfDTO> queryReqBean = new QueryReqBean<HdkfSupportDealByKfDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportDealByKfDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportDealByKfDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportDealByKfDTO>() {
					});
			// param.put("currUserId",
			// SessionHelper.getLoginSysUserId(request));
			param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			queryReqBean.setSearchParams(param);
		}
		// try {
		result = service.searchHdkfSupportDealByKfByPage(queryReqBean,
				sfnConditions);
		// } catch (Exception ex) {
		// logger.debug(ex.getMessage());
		// ex.printStackTrace();
		// return map;
		// }
		for (HdkfSupportDealByKfDTO dto : result.getResult()) {

			dto.setDealDepartIdAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
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
			HdkfSupportDealByKfDTO dto = service
					.queryHdkfSupportDealByKfByPrimaryKey(id);

			dto.setDealDepartIdAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
					dto.getDealDepartId(),
					SessionHelper.getCurrentLanguageCode(request)));

			request.setAttribute("hdkfSupportDealByKfDTO", dto);
			request.setAttribute("id", id);
		}else{
  			mav.addObject("id", ComUtil.getId());
  		}
		mav.setViewName("avicit/hdkf/support/hdkfsupportdealbykf/"
				+ "HdkfSupportDealByKf" + type);
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
			HdkfSupportDealByKfDTO hdkfSupportDealByKf = JsonHelper
					.getInstance().readValue(datas, dateFormat,
							new TypeReference<HdkfSupportDealByKfDTO>() {
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

			BeanProcess bp = service.insertHdkfSupportDealByKfAndStartProcess(
					hdkfSupportDealByKf, parameter);

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
	public ModelAndView toSaveHdkfSupportDealByKfDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String returnId = "";
		try {
			HdkfSupportDealByKfDTO hdkfSupportDealByKfDTO = JsonHelper
					.getInstance().readValue(jsonData,
							new TypeReference<HdkfSupportDealByKfDTO>() {
							});
			if ("".equals(hdkfSupportDealByKfDTO.getId())) {// 新增
				returnId = service.insertHdkfSupportDealByKf(hdkfSupportDealByKfDTO);
			}
			else if(service.findDtoById(hdkfSupportDealByKfDTO.getId())==null){
				returnId = service.insertHdkfSupportDealByKf(hdkfSupportDealByKfDTO);
			}
			else {// 修改
				returnId  = hdkfSupportDealByKfDTO.getId();
				service.updateHdkfSupportDealByKfSensitive(hdkfSupportDealByKfDTO);
			}
			mav.addObject("id",returnId);
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
	public ModelAndView toDeleteHdkfSupportDealByKfDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportDealByKfByIds(ids);
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
		HdkfSupportDealByKfDTO dto = service
				.queryHdkfSupportDealByKfByPrimaryKey(id);

		dto.setDealDepartIdAlias(sysDeptLoader.getSysDeptNameBySysDeptId(
				dto.getDealDepartId(),
				SessionHelper.getCurrentLanguageCode(request)));

		mav.addObject("flag", OpResult.success);
		mav.addObject("hdkfSupportDealByKf", dto);
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
		mav.setViewName("avicit/hdkf/support/hdkfsupportdealbykf/HdkfSupportRequestInfoManage");
		request.setAttribute("url",
				"platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/");
		//platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/
		return mav;
	}
}
