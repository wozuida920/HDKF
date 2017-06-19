package avicit.hdkf.support.hdkfsupportdevicedetail.controller;

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

import avicit.hdkf.support.hdkfsupportdevicedetail.dto.HdkfSupportDeviceDetailDTO;
import avicit.hdkf.support.hdkfsupportdevicedetail.service.HdkfSupportDeviceDetailService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportDeviceDetailController
 * @description: 定义  HDKF_SUPPORT_DEVICE_DETAIL 控制层
 * @author:   AVICIT DEV 
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController")
public class HdkfSupportDeviceDetailController implements LoaderConstant{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportDeviceDetailController.class);
    
    @Autowired
    private  HdkfSupportDeviceDetailService service;
    /**
     * 跳转到管理页面
     * @param request 请求
     * @param reponse 响应
     * @return
     */
    
    @RequestMapping(value="HdkfSupportDeviceDetailInfo2")
   	public ModelAndView toHdkfSupportDeviceDetail2(HttpServletRequest request,HttpServletResponse reponse){
       	String  taskId = request.getParameter("taskId");
       //	System.out.println("taskId in  HdkfSupportDeviceDetailController HdkfSupportDeviceDetailInfo1--------> "+taskId);
       	String  taskNo = request.getParameter("taskNo");
       	//System.out.println("taskNo in  HdkfSupportDeviceDetailController HdkfSupportDeviceDetailInfo1--------> "+taskNo);
   		ModelAndView mav = new ModelAndView();
   		mav.setViewName("avicit/hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailManage2");
   		request.setAttribute("url", "platform/hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/operation/");
   		mav.addObject("taskId", taskId);
   		mav.addObject("taskNo", taskNo);
   		return mav;
   	}
    
    
    @RequestMapping(value="HdkfSupportDeviceDetailInfo1")
	public ModelAndView toHdkfSupportDeviceDetail1(HttpServletRequest request,HttpServletResponse reponse){
    	String  taskId = request.getParameter("taskId");
    //	System.out.println("taskId in  HdkfSupportDeviceDetailController HdkfSupportDeviceDetailInfo1--------> "+taskId);
    	String  taskNo = request.getParameter("taskNo");
    	//System.out.println("taskNo in  HdkfSupportDeviceDetailController HdkfSupportDeviceDetailInfo1--------> "+taskNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailManage1");
		request.setAttribute("url", "platform/hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/operation/");
		mav.addObject("taskId", taskId);
		mav.addObject("taskNo", taskNo);
		return mav;
	}
    
    @RequestMapping(value="HdkfSupportDeviceDetailInfo")
  	public ModelAndView toHdkfSupportDeviceDetail(HttpServletRequest request,HttpServletResponse reponse){
  		ModelAndView mav = new ModelAndView();
  		mav.setViewName("avicit/hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailManage");
  		request.setAttribute("url", "platform/hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/operation/");
  		return mav;
  	}
    @RequestMapping(value="/operation/getHdkfSupportDeviceDetailsByPage1")
   	@ResponseBody
   	public Map<String,Object> togetHdkfSupportDeviceDetailByPage1(PageParameter pageParameter,HttpServletRequest request){
   		QueryReqBean<HdkfSupportDeviceDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportDeviceDetailDTO>();
   		queryReqBean.setPageParameter(pageParameter);
   		HashMap<String,Object> map = new HashMap<String, Object>();
   		String json = ServletRequestUtils.getStringParameter(request, "param", "");
   		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
   		HdkfSupportDeviceDetailDTO param = null;
   		QueryRespBean<HdkfSupportDeviceDetailDTO> result =null;
   		
   		String taskId = ServletRequestUtils.getStringParameter(request, "taskId", "");
		//System.out.println("taskId--->"+taskId);
   		
   		if(json!= null && !"".equals(json)){
   			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
   			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfSupportDeviceDetailDTO>(){});
   			queryReqBean.setSearchParams(param);
   		}
   		try {
   			param = new HdkfSupportDeviceDetailDTO();
   			param.setTaskId(taskId);
   			queryReqBean.setSearchParams(param);
   			 result = service.searchHdkfSupportDeviceDetailByPage(queryReqBean,sfnConditions);
   		} catch (Exception ex) {
   			logger.debug(ex.getMessage());
   			ex.printStackTrace();
   			return map;  
   		}
   		
   		for(HdkfSupportDeviceDetailDTO dto :result.getResult()){
   					  		    						
   	    				    		
   		  		    						
   	    				    		
   		  
   		  		    						
   	    				    		
   		  			}
   		
   		map.put("total",result.getPageParameter().getTotalCount());
   		map.put("rows", result.getResult());
   		logger.debug("成功获取HdkfSupportDeviceDetail分页数据");
   		return map;
   	}
       
    
    @RequestMapping(value="/operation/getHdkfSupportDeviceDetailsByPage")
	@ResponseBody
	public Map<String,Object> togetHdkfSupportDeviceDetailByPage(PageParameter pageParameter,HttpServletRequest request){
		QueryReqBean<HdkfSupportDeviceDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportDeviceDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String,Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		  try {
			json = URLDecoder.decode(json, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("json--->"+json);
		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
		HdkfSupportDeviceDetailDTO param = null;
		QueryRespBean<HdkfSupportDeviceDetailDTO> result =null;
		if(json!= null && !"".equals(json)){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfSupportDeviceDetailDTO>(){});
			queryReqBean.setSearchParams(param);
		}
		try {
			 result = service.searchHdkfSupportDeviceDetailByPage(queryReqBean,sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;  
		}
		
		for(HdkfSupportDeviceDetailDTO dto :result.getResult()){
					  		    						
	    				    		
		  		    						
	    				    		
		  
		  		    						
	    				    		
		  			}
		
		map.put("total",result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取HdkfSupportDeviceDetail分页数据");
		return map;
	}
    
       	/**
  	 * 保存数据
  	 * @param id 主键id
  	 * @param demoBusinessTripDTO 保存的对象
  	 * @return
  	 */
  	@RequestMapping(value="/operation/save",method=RequestMethod.POST)
	@ResponseBody
	public AvicitResponseBody saveOrUpdateHdkfSupportDeviceDetail(HttpServletRequest request){
		String datas = ServletRequestUtils.getStringParameter(request, "datas", "");
		if(datas == ""){
			return new AvicitResponseBody(OpResult.success);
		}
		try {
			List<HdkfSupportDeviceDetailDTO> list = JsonHelper.getInstance().readValue(datas, new TypeReference<List<HdkfSupportDeviceDetailDTO>>(){});
			service.insertOrUpdateHdkfSupportDeviceDetail(list);
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			return new AvicitResponseBody(OpResult.failure,ex.getMessage());
		}
	}
  	/**
  	 * 按照id批量删除数据
  	 * @param ids id数组
  	 * @return
  	 */
  	@RequestMapping(value="/operation/delete",method=RequestMethod.POST)
	@ResponseBody
	public AvicitResponseBody deleteHdkfSupportDeviceDetail(HttpServletRequest request){
    	String ids = ServletRequestUtils.getStringParameter(request, "ids", "");
		try {
			service.deleteHdkfSupportDeviceDetailByIds(ids.split(","));
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			return new AvicitResponseBody(OpResult.failure,e.getMessage());
		}
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
	@RequestMapping(value = "HdkfSupportTripTaskSelect")
	public ModelAndView toHdkfSupportTripTaskSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportdevicedetail/HdkfSupportTripTaskManage");
		request.setAttribute("url",
				"platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/");
		
		return mav;
	}
	}
