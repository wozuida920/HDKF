package avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.controller;

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
import avicit.platform6.commons.utils.DateUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.web.AvicitResponseBody;
import avicit.platform6.modules.system.sysfileupload.domain.SysFileUpload;
import avicit.platform6.modules.system.sysfileupload.service.SwfUploadService;

import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dto.HdkfEsNoticeinfoEffectiveDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.service.HdkfEsNoticeinfoEffectiveService;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfEsNoticeinfoEffectiveController
 * @description: 定义  技术通报涉及批架次信息表 控制层
 * @author:   AVICIT DEV 
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController")
public class HdkfEsNoticeinfoEffectiveController implements LoaderConstant{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfEsNoticeinfoEffectiveController.class);
    
    @Autowired
    private  HdkfEsNoticeinfoEffectiveService service;
    

	//附件
	@Autowired
	public SwfUploadService swfUploadService;
    /**
     * 跳转到管理页面
     * @param request 请求
     * @param reponse 响应
     * @return
     */
    @RequestMapping(value="HdkfEsNoticeinfoEffectiveInfo2")
	public ModelAndView toHdkfEsNoticeinfoEffective2(HttpServletRequest request,HttpServletResponse reponse){
    	String  bulletinId = request.getParameter("bulletinId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveManage2");
		request.setAttribute("url", "platform/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/");
		mav.addObject("bulletinId", bulletinId);
		return mav;
	}
    @RequestMapping(value="HdkfEsNoticeinfoEffectiveInfo1")
   	public ModelAndView toHdkfEsNoticeinfoEffective1(HttpServletRequest request,HttpServletResponse reponse){
   		ModelAndView mav = new ModelAndView();
   		String  bulletinNo = request.getParameter("bulletinNo");
   		String  bulletinId = request.getParameter("bulletinId");
   		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveManage1");
   		request.setAttribute("url", "platform/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/");
   		mav.addObject("bulletinId", bulletinId);
   		mav.addObject("bulletinNo", bulletinNo);
   		return mav;
   	}
    @RequestMapping(value="HdkfEsNoticeinfoEffectiveInfo11")
   	public ModelAndView toHdkfEsNoticeinfoEffective11(HttpServletRequest request,HttpServletResponse reponse){
   		ModelAndView mav = new ModelAndView();
   		String  bulletinNo = request.getParameter("bulletinNo");
   		String  bulletinId = request.getParameter("bulletinId");
   		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveManage11");
   		request.setAttribute("url", "platform/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/");
   		mav.addObject("bulletinId", bulletinId);
   		mav.addObject("bulletinNo", bulletinNo);
   		return mav;
   	}
    
    @RequestMapping(value="HdkfEsNoticeinfoEffectiveInfo")
	public ModelAndView toHdkfEsNoticeinfoEffective(HttpServletRequest request,HttpServletResponse reponse){
    	String  bulletinId = request.getParameter("bulletinId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveManage");
		request.setAttribute("url", "platform/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/");
		
		String planTime = DateUtil.getCurDateStr("yyyy-MM-dd");
		String completeDate = DateUtil.getCurDateStr("yyyy-MM-dd");
		String name = SessionHelper.getLoginSysUser(request).getName();	
		
		mav.addObject("planTime", planTime);
		mav.addObject("completeDate", completeDate);
		mav.addObject("name", name);
		mav.addObject("bulletinId", bulletinId);
		return mav;
	}
    
    
    @RequestMapping(value="/operation/getHdkfEsNoticeinfoEffectivesByPage/{paramId}/{type}")
	@ResponseBody
	public Map<String,Object> togetHdkfEsNoticeinfoEffectiveByPage(PageParameter pageParameter,HttpServletRequest request,
			@PathVariable String paramId,@PathVariable String type){
		QueryReqBean<HdkfEsNoticeinfoEffectiveDTO> queryReqBean = new QueryReqBean<HdkfEsNoticeinfoEffectiveDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String,Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
		HdkfEsNoticeinfoEffectiveDTO param = null;
		QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> result =null;
		QueryRespBean<CsmpBdCompanyinfoDTO>	result1 = null;
		if(json!= null && !"".equals(json)){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfEsNoticeinfoEffectiveDTO>(){});
			
		}else{
			param = new HdkfEsNoticeinfoEffectiveDTO();
		}
		if(paramId != null && !"".equals(paramId) && !"undefined".equals(paramId)){
			param.setBulletinId(paramId);
		}
		//			else{
//			param.setBulletinId("");
//		}
		
		
		
		queryReqBean.setSearchParams(param);
		
		try {
			 result = service.searchHdkfEsNoticeinfoEffectiveByPage(queryReqBean,sfnConditions);
			 if("CountBatchNo".equals(type)){
					result = service.searchCsmpEsNoticeinfoEffectiveCountbatchNoByPage(queryReqBean, sfnConditions);
				}else if("CountName".equals(type)){
						result1 = service.searchCsmpEsNoticeinfoEffectiveCountNameByPage(queryReqBean, sfnConditions);
				}
//				else if("CountYesNoName".equals(type)){
//					result = service.searchCsmpEsNoticeinfoEffectiveCountYesNoNameByPage(queryReqBean, sfnConditions);
//				}
//				else if("CountYesNoBatchNo".equals(type)){
//					result = service.searchCsmpEsNoticeinfoEffectiveCountYesNoBatchNoByPage(queryReqBean, sfnConditions);
//				}
				
				else{
					result = service.searchHdkfEsNoticeinfoEffectiveByPage(queryReqBean, sfnConditions);
				}
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;  
		}
		if(!"CountName".equals(type)){
		for(HdkfEsNoticeinfoEffectiveDTO dto :result.getResult()){
					  		    						
			//记录附件数量
			int count = 0;
			List<SysFileUpload> sysFileUpload = swfUploadService.getFileListByFormId(dto.getId());
			if(sysFileUpload != null && !"".equals(sysFileUpload)){
				for(int i = 0;i<sysFileUpload.size();i++){
					count++;
				}
			}
			dto.setCountFile(String.valueOf(count));	    		
		  		    						
	    
	    				    		
		  			}
		
		map.put("total",result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		}
		else{
			map.put("total",result1.getPageParameter().getTotalCount());
			map.put("rows", result1.getResult());
		}
		logger.debug("成功获取HdkfEsNoticeinfoEffective分页数据");
		return map;
	}
    
  	/**
  	 * 重置数据
  	 * @param id 主键id
  	 * @param demoBusinessTripDTO 保存的对象
  	 * @return
  	 */
	@RequestMapping(value="/operation/reset",method=RequestMethod.POST)
	@ResponseBody
	public AvicitResponseBody resetHdkfEsNoticeinfoEffective(HttpServletRequest request){
  		String ids = ServletRequestUtils.getStringParameter(request, "ids", "");
		try {
			service.resetHdkfEsNoticeinfoEffectiveByIds(ids.split(","));
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			return new AvicitResponseBody(OpResult.failure,e.getMessage());
		}
	}
    
       	/**
  	 * 保存数据
  	 * @param id 主键id
  	 * @param demoBusinessTripDTO 保存的对象
  	 * @return
  	 */
  	@RequestMapping(value="/operation/save",method=RequestMethod.POST)
	@ResponseBody
	public AvicitResponseBody saveOrUpdateHdkfEsNoticeinfoEffective(HttpServletRequest request){
		String datas = ServletRequestUtils.getStringParameter(request, "datas", "");
		if(datas == ""){
			return new AvicitResponseBody(OpResult.success);
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			List<HdkfEsNoticeinfoEffectiveDTO> list = JsonHelper.getInstance().readValue(datas,dateFormat, new TypeReference<List<HdkfEsNoticeinfoEffectiveDTO>>(){});
			service.insertOrUpdateHdkfEsNoticeinfoEffective(list);
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
	public AvicitResponseBody deleteHdkfEsNoticeinfoEffective(HttpServletRequest request){
    	String ids = ServletRequestUtils.getStringParameter(request, "ids", "");
		try {
			service.deleteHdkfEsNoticeinfoEffectiveByIds(ids.split(","));
			return new AvicitResponseBody(OpResult.success);
		} catch (Exception e) {
			logger.debug(e.getMessage(), e);
			return new AvicitResponseBody(OpResult.failure,e.getMessage());
		}
	}
	/**
	 * 跳转到批架次详情页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "countBatchNoHref")
	public ModelAndView toOpenCountBatchNoHref(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String paramId = ServletRequestUtils.getStringParameter(request, "paramId","");
		String type = ServletRequestUtils.getStringParameter(request, "type","");
		mav.addObject("paramId", paramId);
		mav.addObject("type", type);
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveManageCountBatchNoHref");
		request.setAttribute("Infourl","platform/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/");
		return mav;
	}
	
	/**
	 * 跳转到用户详情页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "countNameHref")
	public ModelAndView toOpenCountNameHref(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String paramId = ServletRequestUtils.getStringParameter(request, "paramId","");
		String type = ServletRequestUtils.getStringParameter(request, "type","");
		mav.addObject("paramId", paramId);
		mav.addObject("type", type);
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveManageCountNameHref");
		request.setAttribute("Infourl","platform/hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/");
		return mav;
	}
	/**
	 * 根据id选择跳转附件页面
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
	@RequestMapping(value = "/operation/{type}/{id}/{typeId}")
	public ModelAndView toOpertionPage(@PathVariable String type,
			@PathVariable String id,@PathVariable String typeId, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		if (!"null".equals(id) && "FileUpload".equals(type)) {// 编辑窗口或者详细页窗口
			HdkfEsNoticeinfoEffectiveDTO dto = service.queryDtoById(id);
			request.setAttribute("hdkfEsNoticeinfoEffectiveDTO", dto);
		}
		mav.addObject("typeId", typeId);
		mav.setViewName("avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/"+"HdkfEsNoticeinfoEffective" + type);
		return mav;
	}
	
	}
