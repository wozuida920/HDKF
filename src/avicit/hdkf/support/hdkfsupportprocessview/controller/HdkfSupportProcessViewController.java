package avicit.hdkf.support.hdkfsupportprocessview.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.fasterxml.jackson.core.type.TypeReference;

import avicit.hdkf.esnotice.hdkfesnoticeinfo.dto.HdkfEsNoticeinfoDTO;
import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
import avicit.hdkf.support.hdkfsupportprocessview.service.HdkfSupportProcessViewService;
import avicti.platform6.hdkf.event.BpmClientBean;
import avicti.platform6.hdkf.event.BpmClientDao;



/**
 * @classname: HdkfSupportProcessViewController
 * @description: 定义 HDKF_SUPPORT_PROCESS_VIEW 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController")
public class HdkfSupportProcessViewController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportProcessViewController.class);

	@Autowired
	private HdkfSupportProcessViewService service;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportProcessViewInfo")
	public ModelAndView toHdkfSupportProcessView(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/operation/");
		return mav;
	}
	
	//机型首页显示模块
	/**
	 * 故障统计：跳转到管理页面
	 * @param request
	 * @param reponse
	 * @return
	 */
		
	@RequestMapping(value = "HdkfSupportProcessViewModelDoorInfo")
	public ModelAndView toHdkfSupportProcessViewModelDoorIn(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("avicit/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewModelInfoDoor");
		request.setAttribute("url",
				"platform/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/operation/");
		return mav;
	}
	

	@RequestMapping(value = "/operation/getHdkfSupportProcessViewsByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportProcessViewByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean = new QueryReqBean<HdkfSupportProcessViewDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportProcessViewDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportProcessViewDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportProcessViewDTO>() {
					});
			queryReqBean.setSearchParams(param);
		}
		
	if (queryReqBean.getSearchParams() == null) {
			queryReqBean.setSearchParams(new HdkfSupportProcessViewDTO());
		}
		//获取
	//	String curstatus = (String) request.getSession().getAttribute("curstatus");
		 
		
		
		
		try {
			result = service.searchHdkfSupportProcessViewByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfSupportProcessViewDTO dto : result.getResult()) {

			
			int curStatus= Integer.parseInt(dto.getCurStatus());
			String formId="";
			switch (curStatus) {
			case 1:
				
				break;
            case 2:
				formId = dto.getRequestId();
				break;
            case 3:
            	formId = dto.getDealId();
            	break;
            case 4:
            	formId = dto.getRespId();
            	break;
            case 5:
            	formId = dto.getTaskId();
            	break;
            case 51:
            	formId = dto.getBorrowInfoId();
            	break;
            case 52:
            	formId = dto.getTaskId();
            	break;
            case 53:
            	formId = dto.getCardArchiveId();
            	break;
            case 54:
            	formId = dto.getCardArchiveId();
            	break;
            case 55:
            	formId = dto.getTaskId();
            	break;
            case 6:
            	formId = dto.getTaskArchiveId();
            	break;
            case 7:
            	formId =dto.getCardArchiveId();
            	break;
            
			default:
				break;
			}
			if(curStatus!=1){
			BpmClientDao bpmClientDao = new BpmClientDao();
			BpmClientBean bpmClientBean = bpmClientDao.getBpmClientBeanByFormId(formId);
			dto.setCurBpmstate(bpmClientBean.getCurbpmState());
			dto.setCurUser(bpmClientBean.getCurUser());
			
			
			
			if(curStatus==6||curStatus==7){
				if(dto.getCurBpmstate().equals("结束"))
					dto.setCurStatus("1");
				try {
					service.updateHdkfSupportProcessViewSensitive(dto);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			}
			if(dto.getCurUser()!=null&&!dto.getCurUser().equals(""))
				dto.setCurUserAlias(sysUserLoader.getSysUserNameById(dto
						.getCurUser()));
			else {
				dto.setCurUserAlias("");
			}
		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}

	
	@RequestMapping(value = "/operation/getHdkfModelinfoByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfModelinfoByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean1=new QueryReqBean<HdkfSupportProcessViewDTO>();
		queryReqBean1.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String curStatus = ServletRequestUtils.getStringParameter(request, "curStatus",
				"");
		String requestUnit = ServletRequestUtils.getStringParameter(request, "requestUnit",
				"");
		//1:表示归档
		if(requestUnit==""){
			
			if(curStatus.equals("0")){
				queryReqBean1.setPageParameter(pageParameter);
				String json = ServletRequestUtils.getStringParameter(request, "param",
						"");
				String sfnConditions = ServletRequestUtils.getStringParameter(request,
						"sdfConditons", "");// 自定义查询条件
				HdkfSupportProcessViewDTO param = null;
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				QueryRespBean<HdkfSupportProcessViewDTO> result = null;
				if (json != null && !"".equals(json)) {
					param = JsonHelper.getInstance().readValue(json, dateFormat,
							new TypeReference<HdkfSupportProcessViewDTO>() {
							});
					queryReqBean1.setSearchParams(param);
				}
				
				try {
					result = service.searchHdkfModelinfoDoingByPage(queryReqBean1,
							sfnConditions);
					
					for (HdkfSupportProcessViewDTO dto : result.getResult()){
						
						if(dto.getCurUser()!=null&&!dto.getCurUser().equals(""))
							dto.setCurUserAlias(sysUserLoader.getSysUserNameById(dto
									.getCurUser()));
						else {
							dto.setCurUserAlias("");
						}
					}
								
					
					map.put("total", result.getPageParameter().getTotalCount());
					map.put("rows", result.getResult());

				} catch (Exception ex) {
					logger.debug(ex.getMessage());
					ex.printStackTrace();
					return map;
				}
			}else{		
				QueryRespBean<HdkfSupportProcessViewDTO> result1=null;
				
				HdkfSupportProcessViewDTO searchParams1=new HdkfSupportProcessViewDTO();
				searchParams1.setCurStatus(curStatus);			
				queryReqBean1.setSearchParams(searchParams1);
				QueryRespBean<HdkfSupportProcessViewDTO> queryRespBean1;
				try{
					queryRespBean1=service.searchHdkfSupportProcessViewByPage(queryReqBean1, "");
					result1=queryRespBean1;
					for (HdkfSupportProcessViewDTO dto : result1.getResult()){
						
						if(dto.getCurUser()!=null&&!dto.getCurUser().equals(""))
							dto.setCurUserAlias(sysUserLoader.getSysUserNameById(dto
									.getCurUser()));
						else {
							dto.setCurUserAlias("");
						}
					}
					
					map.put("total", result1.getPageParameter().getTotalCount());
					map.put("rows", result1.getResult());
				} catch (Exception e) {
					// TODO Auto-generated catch block			
					e.printStackTrace();
				}
				
			}

			
			
		}
		else{
			if(curStatus.equals("0")){
				QueryRespBean<HdkfSupportProcessViewDTO> result1=null;
				
				HdkfSupportProcessViewDTO searchParams1=new HdkfSupportProcessViewDTO();
			//	searchParams1.setCurStatus(curStatus);
				searchParams1.setRequestUnit(requestUnit);
				queryReqBean1.setSearchParams(searchParams1);
				QueryRespBean<HdkfSupportProcessViewDTO> queryRespBean1;
				try{
					queryRespBean1=service.searchHdkfModelinfoDoingByPage(queryReqBean1, "");
					/*queryRespBean1=service.searchHdkfSupportProcessViewByPage(queryReqBean1, "");*/
					result1=queryRespBean1;
					
					for (HdkfSupportProcessViewDTO dto : result1.getResult()){
						
						if(dto.getCurUser()!=null&&!dto.getCurUser().equals(""))
							dto.setCurUserAlias(sysUserLoader.getSysUserNameById(dto
									.getCurUser()));
						else {
							dto.setCurUserAlias("");
						}
					}
					map.put("total", result1.getPageParameter().getTotalCount());
					map.put("rows", result1.getResult());
				} catch (Exception e) {
					// TODO Auto-generated catch block			
					e.printStackTrace();
				}
				
			}else{
				QueryRespBean<HdkfSupportProcessViewDTO> result1=null;
				
				HdkfSupportProcessViewDTO searchParams1=new HdkfSupportProcessViewDTO();
				searchParams1.setCurStatus(curStatus);
				searchParams1.setRequestUnit(requestUnit);
				queryReqBean1.setSearchParams(searchParams1);
				QueryRespBean<HdkfSupportProcessViewDTO> queryRespBean1;
				try{
					
					queryRespBean1=service.searchHdkfSupportProcessViewByPage(queryReqBean1, "");
					result1=queryRespBean1;
					for (HdkfSupportProcessViewDTO dto : result1.getResult()){
						
						if(dto.getCurUser()!=null&&!dto.getCurUser().equals(""))
							dto.setCurUserAlias(sysUserLoader.getSysUserNameById(dto
									.getCurUser()));
						else {
							dto.setCurUserAlias("");
						}
					}
					map.put("total", result1.getPageParameter().getTotalCount());
					map.put("rows", result1.getResult());
				} catch (Exception e) {
					// TODO Auto-generated catch block			
					e.printStackTrace();
				}
			}

		}
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
			HdkfSupportProcessViewDTO dto = service
					.queryHdkfSupportProcessViewByPrimaryKey(id);

			dto.setCurUserAlias(sysUserLoader.getSysUserNameById(dto
					.getCurUser()));

			request.setAttribute("hdkfSupportProcessViewDTO", dto);
		}
		mav.setViewName("avicit/hdkf/support/hdkfsupportprocessview/"
				+ "HdkfSupportProcessView" + type);
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
	public ModelAndView toSaveHdkfSupportProcessViewDTO(
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = JsonHelper
					.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<HdkfSupportProcessViewDTO>() {
							});
			if ("".equals(hdkfSupportProcessViewDTO.getId())) {// 新增
				service.insertHdkfSupportProcessView(hdkfSupportProcessViewDTO);
			} else {// 修改
				service.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);
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
	public ModelAndView toDeleteHdkfSupportProcessViewDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportProcessViewByIds(ids);
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
	 * 按机型名称统计查询
	 * @param pageParameter
	 * @param request
	 * @return 返回map格式数据
	 * @throws Exception 
	 */
/*	@RequestMapping(value="/operation/getModelInfoQueryForm")
	@ResponseBody
	public String getModelInfoQueryForm(HttpServletRequest request) throws Exception {
 		JSONArray arr=new JSONArray();
		List<HdkfSupportProcessViewDTO> dtoList = service.seachHdkfModelinfoViewQuery(new HdkfSupportProcessViewDTO());
		arr.addAll(dtoList);
		return arr.toJSONString();
		
	}*/
	
	@RequestMapping(value="/operation/getModelInfoQueryForm",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView toModelInfoQueryForm(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<HdkfSupportProcessViewDTO> dtoList = service.seachHdkfModelinfoViewQuery(new HdkfSupportProcessViewDTO());
		List<HdkfSupportProcessViewDTO> dtoListall = service.seachHdkfModelinfoallViewQuery(new HdkfSupportProcessViewDTO());

		mav.addObject("flag", OpResult.success);
		mav.addObject("datas", dtoList);
		mav.addObject("datasall", dtoListall);
		return mav;
		
	}
	
	
/*	@RequestMapping(value="/operation/getModelInfoQueryForm",method = RequestMethod.POST)
	@ResponseBody
	public List<HdkfSupportProcessViewDTO> toModelInfoQueryForm(HttpServletRequest request) throws Exception {
		List<HdkfSupportProcessViewDTO> dtoList = service.seachHdkfModelinfoViewQuery(new HdkfSupportProcessViewDTO());
		return dtoList;
		
	}
*/
	
	
	/**
	 * 跳转到管理页面（调转上报页面）
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfModelInfodoneallForm")
	public ModelAndView toModelInfodoneallForm(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("avicit/hdkf/support/hdkfsupportprocessview/HdkfModelinfodoneViewManage");
		String curstatus= request.getParameter("curstatus");		
		String requestunit =request.getParameter("requestunit");
		if(requestunit==null){
			requestunit=request.getParameter("requestunit");
		}else{
			try {
				requestunit = new String(request.getParameter("requestunit").getBytes("ISO8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

		}


		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/operation/");
		mav.addObject("curStatus", curstatus);
		mav.addObject("requestUnit", requestunit);
		return mav;
	}
	
	
}
