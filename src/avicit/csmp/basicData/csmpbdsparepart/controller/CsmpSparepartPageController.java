package avicit.csmp.basicData.csmpbdsparepart.controller;

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

import avicit.csmp.basicData.csmpbdsparepart.dto.CsmpBdSparepartDTO;
import avicit.csmp.basicData.csmpbdsparepart.service.CsmpBdSparepartService;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: CsmpBdSparepartController
 * @description: 定义 备件信息表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdsparepart/CsmpSparepartPageController")
public class CsmpSparepartPageController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdSparepartController.class);

	@Autowired
	private CsmpBdSparepartService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdSparepartInfo")
	public ModelAndView toCsmpBdSparepart(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/csmpbdsparepart/CsmpBdSparepartPager");
		request.setAttribute("url",
				"platform/csmp/basicData/csmpbdsparepart/CsmpSparepartPageController/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getCsmpBdSparepartsByPage")
	@ResponseBody
	public Map<String, Object> togetCsmpBdSparepartByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdSparepartDTO> queryReqBean = new QueryReqBean<CsmpBdSparepartDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		CsmpBdSparepartDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdSparepartDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdSparepartDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		try {
			result = service.searchCsmpBdSparepartByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (CsmpBdSparepartDTO dto : result.getResult()) {

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}

}
