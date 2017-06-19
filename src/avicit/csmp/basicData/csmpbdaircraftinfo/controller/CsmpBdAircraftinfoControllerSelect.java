package avicit.csmp.basicData.csmpbdaircraftinfo.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdaircraftinfo.service.CsmpBdAircraftinfoService;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: CsmpBdAircraftinfoController
 * @description: 定义 飞机信息表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoControllerSelect")
public class CsmpBdAircraftinfoControllerSelect implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdAircraftinfoControllerSelect.class);

	@Autowired
	private CsmpBdAircraftinfoService csmpBdAircraftinfoService;
	
	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdAircraftinfoInfoSelect")
	public ModelAndView toCsmpBdAircraftinfo(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoManageSelect");
		request.setAttribute("url","platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoControllerSelect/operation/");
		return mav;
	}

	@RequestMapping(value = "/operation/getCsmpBdAircraftinfosSelectByPage")
	@ResponseBody
	public Map<String, Object> togetCsmpBdAircraftinfoByPage(PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean = new QueryReqBean<CsmpBdAircraftinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param","");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,"sdfConditons", "");// 自定义查询条件
		CsmpBdAircraftinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdAircraftinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdAircraftinfoDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		
		try {
			result = csmpBdAircraftinfoService.searchCsmpBdAircraftinfoValidFlagByPage(queryReqBean,sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		/*for (CsmpBdAircraftinfoDTO dto : result.getResult()){

		}*/

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	
}
