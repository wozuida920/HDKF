package avicit.hdkf.support.hdkfsupportsolutiondetail.controller;

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

import avicit.hdkf.support.hdkfsupportsolutiondetail.dto.HdkfSupportSolutionDetailDTO;
import avicit.hdkf.support.hdkfsupportsolutiondetail.service.HdkfSupportSolutionDetailService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportSolutionDetailController
 * @description: 定义  HDKF_SUPPORT_SOLUTION_DETAIL 控制层
 * @author:   AVICIT DEV 
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailController")
public class HdkfSupportSolutionDetailController implements LoaderConstant{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportSolutionDetailController.class);
    
    @Autowired
    private  HdkfSupportSolutionDetailService service;
    /**
     * 跳转到管理页面
     * @param request 请求
     * @param reponse 响应
     * @return
     */
    @RequestMapping(value="HdkfSupportSolutionDetailInfo1")
	public ModelAndView toHdkfSupportSolutionDetail1(HttpServletRequest request,HttpServletResponse reponse){
    	String  infoCardNo = request.getParameter("infoCardNo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailManage1");
		request.setAttribute("url", "platform/hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailController/operation/");
		mav.addObject("infoCardNo", infoCardNo);
		return mav;
	}
    
    @RequestMapping(value="HdkfSupportSolutionDetailInfo")
	public ModelAndView toHdkfSupportSolutionDetail(HttpServletRequest request,HttpServletResponse reponse){
    	String  infoCardNo = request.getParameter("infoCardNo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailManage");
		request.setAttribute("url", "platform/hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailController/operation/");
		mav.addObject("infoCardNo", infoCardNo);
		return mav;
	}
    
    @RequestMapping(value="/operation/getHdkfSupportSolutionDetailsByPage")
	@ResponseBody
	public Map<String,Object> togetHdkfSupportSolutionDetailByPage(PageParameter pageParameter,HttpServletRequest request){
		QueryReqBean<HdkfSupportSolutionDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportSolutionDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String,Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
		HdkfSupportSolutionDetailDTO param = null;
		QueryRespBean<HdkfSupportSolutionDetailDTO> result =null;
		String infoCardNo = ServletRequestUtils.getStringParameter(request, "infoCardNo", "");
		if(json!= null && !"".equals(json)){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfSupportSolutionDetailDTO>(){});
			
		}else {
			param = new HdkfSupportSolutionDetailDTO();
		}
		try {
			
			param.setInfoCardNo(infoCardNo);
			queryReqBean.setSearchParams(param);
			 result = service.searchHdkfSupportSolutionDetailByPage(queryReqBean,sfnConditions);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;  
		}
		
		for(HdkfSupportSolutionDetailDTO dto :result.getResult()){
					  		    						
	    				    		
			
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  			}
		
		map.put("total",result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取HdkfSupportSolutionDetail分页数据");
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
	public AvicitResponseBody saveOrUpdateHdkfSupportSolutionDetail(HttpServletRequest request){
		String datas = ServletRequestUtils.getStringParameter(request, "datas", "");
		if(datas == ""){
			return new AvicitResponseBody(OpResult.success);
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			List<HdkfSupportSolutionDetailDTO> list = JsonHelper.getInstance().readValue(datas,dateFormat, new TypeReference<List<HdkfSupportSolutionDetailDTO>>(){});
			service.insertOrUpdateHdkfSupportSolutionDetail(list);
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
	public AvicitResponseBody deleteHdkfSupportSolutionDetail(HttpServletRequest request){
    	String ids = ServletRequestUtils.getStringParameter(request, "ids", "");
		try {
			service.deleteHdkfSupportSolutionDetailByIds(ids.split(","));
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			return new AvicitResponseBody(OpResult.failure,e.getMessage());
		}
	}
	}
