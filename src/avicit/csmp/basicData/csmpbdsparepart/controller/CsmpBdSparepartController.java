package avicit.csmp.basicData.csmpbdsparepart.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpRequest;
import org.jboss.resteasy.plugins.server.servlet.ServletUtil;
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
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: CsmpBdSparepartController
 * @description: 定义 备件信息表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdsparepart/CsmpBdSparepartController")
public class CsmpBdSparepartController implements LoaderConstant {
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
		mav.setViewName("avicit/csmp/basicData/csmpbdsparepart/CsmpBdSparepartManage");
		request.setAttribute("url",
				"platform/csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/operation/");
		return mav;
	}
	@RequestMapping(value = "CsmpBdSparepartInfoSelect")
	public ModelAndView toCsmpBdSparepartSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/echnicalSupport/csmpetsoutfieldfailure/CsmpBdSparepartManage");
		request.setAttribute("url",
				"platform/csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/operation/");
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
			dto.setCategory(sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("CSMP_BD_GATEGORY", dto.getCategory()));
			dto.setClassifyDept(sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("CSMP_BD_CLASSIFY_DEPT", dto.getClassifyDept()));
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
			CsmpBdSparepartDTO dto = service
					.queryCsmpBdSparepartByPrimaryKey(id);

			request.setAttribute("csmpBdSparepartDTO", dto);
		}
		mav.addObject("type", sysLookupLoader.getLookUpListByTypeByAppId("CSMP_BD_GATEGORY", SessionHelper.getApplicationId()));
		mav.addObject("danwei", sysLookupLoader.getLookUpListByTypeByAppId("CSMP_SPM_UNIT", SessionHelper.getApplicationId()));
		mav.addObject("dept", sysLookupLoader.getLookUpListByTypeByAppId("CSMP_BD_CLASSIFY_DEPT", SessionHelper.getApplicationId()));
		mav.setViewName("avicit/csmp/basicData/csmpbdsparepart/"
				+ "CsmpBdSparepart" + type);
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
	public ModelAndView toSaveCsmpBdSparepartDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			CsmpBdSparepartDTO csmpBdSparepartDTO = JsonHelper.getInstance()
					.readValue(jsonData, dateFormat,
							new TypeReference<CsmpBdSparepartDTO>() {
							});
			if ("".equals(csmpBdSparepartDTO.getId())) {// 新增
				service.insertCsmpBdSparepart(csmpBdSparepartDTO);
			} else {// 修改
				service.updateCsmpBdSparepartSensitive(csmpBdSparepartDTO);
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
	public ModelAndView toDeleteCsmpBdSparepartDTO(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteCsmpBdSparepartByIds(ids);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}
	
	
	/************************************************************************/
	/**
	 * @author 陈超
	 * 用于备件订货的列表查询
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/operation/searchSparepart4ShopCart", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchSparepart4ShopCart(PageParameter pageParameter, HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		QueryReqBean<CsmpBdSparepartDTO> queryReqBean = new QueryReqBean<CsmpBdSparepartDTO>();
		queryReqBean.setPageParameter(pageParameter);
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		json = new String(json.getBytes("ISO-8859-1"),"UTF-8");
		CsmpBdSparepartDTO param = new CsmpBdSparepartDTO();
		param.setDrawingNo(json==null?"":json);
		QueryRespBean<CsmpBdSparepartDTO> result = null;
		/*DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat, new TypeReference<CsmpBdSparepartDTO>() {
			});
		}*/
		queryReqBean.setSearchParams(param);
		try {
			result = service.searchCsmpBdSparepartByPage4shopCart(queryReqBean);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return mav;
		}

		for (CsmpBdSparepartDTO dto : result.getResult()) {
			
		}
		mav.setViewName("avicit/csmp/spareParts/sparepartsmanagement/sparepartslist");
		mav.addObject("total", result.getPageParameter().getTotalCount());
		mav.addObject("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return mav;
	}
	
	/**
	 * 根据ID查询商品的详细信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/operation/searchSparePartById")
	public ModelAndView searchSparePartById(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String param = ServletRequestUtils.getStringParameter(request, "param");
		CsmpBdSparepartDTO dto = null;
		if(param!=null){
			dto = service.queryCsmpBdSparepartByPrimaryKey(param);
			dto.setCycle(dto.getCycle()==null?"需询周期":dto.getCycle());
		}
		String string = JSONArray.toJSONString(dto);
		mav.addObject("dto", string);
		return mav;
	}
	/**
	 * 来后台进行查询是否有相同图号，型号的名字
	 */
	@RequestMapping("checkNameNo")
	@ResponseBody
	public String checkNameByDrawNum(String drawingNo){
	String num= service.checkDrawingNo(drawingNo);
	 Object js=	JSON.parse(num);
	 String str=JSON.toJSONString(js);
	 return str;
	 
	}
}
