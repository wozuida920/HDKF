package avicit.hdkf.support.hdkfsupportassigninfo.controller;

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




import avicit.hdkf.support.hdkfsupportassigninfo.dto.HdkfSupportAssignInfoDTO;
import avicit.hdkf.support.hdkfsupportassigninfo.service.HdkfSupportAssignInfoService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportAssignInfoController
 * @description: 定义  HDKF_SUPPORT_ASSIGN_INFO 控制层
 * @author:   AVICIT DEV 
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoController")
public class HdkfSupportAssignInfoController implements LoaderConstant{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportAssignInfoController.class);
    
    @Autowired
    private  HdkfSupportAssignInfoService service;
    /**
     * 跳转到管理页面
     * @param request 请求
     * @param reponse 响应
     * @return
     */
    @RequestMapping(value="HdkfSupportAssignInfoInfo")
	public ModelAndView toHdkfSupportAssignInfo(HttpServletRequest request,HttpServletResponse reponse){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoManage");
		request.setAttribute("url", "platform/hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoController/operation/");
		return mav;
	}
    
    @RequestMapping(value="/operation/getHdkfSupportAssignInfosByPage")
	@ResponseBody
	public Map<String,Object> togetHdkfSupportAssignInfoByPage(PageParameter pageParameter,HttpServletRequest request){
		QueryReqBean<HdkfSupportAssignInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportAssignInfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String,Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
		HdkfSupportAssignInfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportAssignInfoDTO> result =null;
		if(json!= null && !"".equals(json)){
			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfSupportAssignInfoDTO>(){});
			queryReqBean.setSearchParams(param);
		}
		try {
			 result = service.searchHdkfSupportAssignInfoByPage(queryReqBean,sfnConditions);
			 
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;  
		}
		
		for(HdkfSupportAssignInfoDTO dto :result.getResult()){
					  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			  
	    						
	    				    		
		  			}
		
		map.put("total",result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
    
        //打开编辑或者添加页
    /**
     * 根据id选择跳转到新建页还是编辑页
     * @param type 操作类型新建还是编辑
     * @param id 编辑数据的id
     * @param request 请求
     * @return
     * @throws Exception
     */
  	@RequestMapping(value="/operation/{type}/{id}")
  	public ModelAndView toOpertionPage(@PathVariable String type,
  										@PathVariable String id,
  										HttpServletRequest request)throws Exception{
  		ModelAndView mav= new ModelAndView();
  		if(!"null".equals(id)){//编辑窗口或者详细页窗口
  			//主表数据
//  		LogBase logBase = LogBaseFactory.getLogBase(request);
  			HdkfSupportAssignInfoDTO dto = service.queryHdkfSupportAssignInfoByPrimaryKey(id);
  					  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  		    						
	    				    		
		  	  			request.setAttribute("hdkfSupportAssignInfoDTO", dto);
  		}
  		mav.setViewName("avicit/hdkf/support/hdkfsupportassigninfo/"+"HdkfSupportAssignInfo"+type);
  		return mav;
  	}
  	
  	
  	/**
  	 * 保存数据
  	 * @param id 主键id
  	 * @param demoBusinessTripDTO 保存的对象
  	 * @return
  	 */
  	@RequestMapping(value="/operation/save",method=RequestMethod.POST)
	public ModelAndView toSaveHdkfSupportAssignInfoDTO(HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request, "data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfSupportAssignInfoDTO hdkfSupportAssignInfoDTO = JsonHelper.getInstance().readValue(jsonData,dateFormat, new TypeReference<HdkfSupportAssignInfoDTO>(){});
			if("".equals(hdkfSupportAssignInfoDTO.getId())){//新增
				service.insertHdkfSupportAssignInfo(hdkfSupportAssignInfoDTO);
			}else{//修改
				service.updateHdkfSupportAssignInfoSensitive(hdkfSupportAssignInfoDTO);
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
  	 * @param ids id数组
  	 * @return
  	 */
  	@RequestMapping(value="/operation/delete",method=RequestMethod.POST)
	public ModelAndView toDeleteHdkfSupportAssignInfoDTO(@RequestBody String[] ids,HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		try {
//  			LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportAssignInfoByIds(ids);
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
