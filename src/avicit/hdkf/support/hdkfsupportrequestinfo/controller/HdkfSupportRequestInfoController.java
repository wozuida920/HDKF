package avicit.hdkf.support.hdkfsupportrequestinfo.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javassist.runtime.DotClass;

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
import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdaircraftinfo.service.CsmpBdAircraftinfoService;
import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
import avicit.csmp.basicData.csmpbdaricarftmodel.service.CsmpBdAricarftmodelService;
import avicit.csmp.basicData.csmpbdatachapter.dto.CsmpBdAtachapterDTO;
import avicit.csmp.basicData.csmpbdatachapter.service.CsmpBdAtachapterService;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.service.CsmpBdCompanyinfoService;
import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
import avicit.hdkf.support.hdkfsupportprocessview.service.HdkfSupportProcessViewService;
import avicit.hdkf.support.hdkfsupportrequestinfo.dto.HdkfSupportRequestInfoDTO;
import avicit.hdkf.support.hdkfsupportrequestinfo.service.HdkfSupportRequestInfoService;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportRequestInfoController
 * @description: 定义HDKF_SUPPORT_REQUEST_INFO 流程表单控制层
 * @author:   AVICIT DEV 
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController")
public class  HdkfSupportRequestInfoController  implements LoaderConstant{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportRequestInfoController.class);
    
    @Autowired
    private  HdkfSupportRequestInfoService service;
    @Autowired
	private CsmpBdAircraftinfoService service1;
	@Autowired
	private CsmpBdAtachapterService service2;
	@Autowired
	private CsmpBdCompanyinfoService service3;
	@Autowired
	private CsmpBdAricarftmodelService service4;
	@Autowired
	private HdkfSupportProcessViewService hdkfSupportProcessViewService;

    /**
     * 跳转到管理页面
     * @param request 请求
     * @param reponse 响应
     * @return
     */
    @RequestMapping(value="HdkfSupportRequestInfoInfo")
	public ModelAndView toDemoBusinessFlow(HttpServletRequest request,HttpServletResponse reponse){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoManage");
		request.setAttribute("url", "platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/");	
		return mav;
	}
    @RequestMapping(value="/operation/getHdkfSupportRequestInfosByPage1")
  	@ResponseBody
  	public Map<String,Object> togetHdkfSupportRequestInfoByPage1(PageParameter pageParameter,HttpServletRequest request) throws Exception{
  		QueryReqBean<HdkfSupportRequestInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportRequestInfoDTO>();
  		queryReqBean.setPageParameter(pageParameter);
  		HashMap<String,Object> map = new HashMap<String, Object>();
  		String json = ServletRequestUtils.getStringParameter(request, "param", "");
  		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
  		HdkfSupportRequestInfoDTO param = null;
  		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  		QueryRespBean<HdkfSupportRequestInfoDTO> result =null;
  		if(json!= null && !"".equals(json)){
  			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfSupportRequestInfoDTO>(){});
  			//param.put("currUserId", SessionHelper.getLoginSysUserId(request));
  			
  			//if(!SessionHelper.getLoginSysUser(request).getLoginName().contains("admin"))
  			
  			     param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
  			     param.setBpmState("ended");
  			  //   param.setBusinessstate_("结束");
  			   //  param.setRequestNo("J2016003");
  			
  			queryReqBean.setSearchParams(param);
  		}
//  		try {
  			 result = service.searchHdkfSupportRequestInfoByPage(queryReqBean,sfnConditions);
//  		} catch (Exception ex) {
//  			logger.debug(ex.getMessage());
//  			ex.printStackTrace();
//  			return map;  
//  		}
  			CsmpBdAtachapterDTO ataDTO = null;
  			CsmpBdCompanyinfoDTO comInfoDTO = null;
  			CsmpBdAircraftinfoDTO craftinfoDTO=null;
  			CsmpBdAricarftmodelDTO carftmodelDTO=null;
  		for(HdkfSupportRequestInfoDTO dto :result.getResult()){
  					  		    		                 
//  			craftinfoDTO=service1.queryCsmpBdAircraftinfoByPrimaryKey(dto.getBatchNo());
//  			if(craftinfoDTO!=null){
//  			dto.setBatchNoAlias(craftinfoDTO.getBatchNo());
//  			}
  			carftmodelDTO=service4.queryCsmpBdAricarftmodelByPrimaryKey(dto.getModelId());
  			if(carftmodelDTO!=null){
  			dto.setModelIdAlias(carftmodelDTO.getModelName());
  			}
//  			ataDTO = service2.getCsmpBdAtachapterDTOById(dto.getChaperNo());
//  			if (null != ataDTO) {
//  				dto.setChaperNoAlias(ataDTO.getAtaName() + "_"
//  						+ ataDTO.getNameEn());
//  			}
  			comInfoDTO = service3.queryCsmpBdCompanyinfoByPrimaryKey(dto
  					.getRequestUnit());
  			if (null != comInfoDTO) {
  				dto.setRequestUnitAlias(comInfoDTO.getCompanyName());
  			}
  				//			dto.setInfoTypeAlias(this.sysLookupLoader
  				//					.getNameByLooupTypeCodeAndLooupCode("CSMP_ES_INFO_TYPE",
  				//							dto.getInfoType()));   		    		
  		}

  		map.put("total",result.getPageParameter().getTotalCount());
  		map.put("rows", result.getResult());
  		logger.debug("成功获取SysLookupType分页数据");
  		return map;
  	}
    
    @RequestMapping(value="/operation/getHdkfSupportRequestInfosByPage")
	@ResponseBody
	public Map<String,Object> togetHdkfSupportRequestInfoByPage(PageParameter pageParameter,HttpServletRequest request) throws Exception{
		QueryReqBean<HdkfSupportRequestInfoDTO> queryReqBean = new QueryReqBean<HdkfSupportRequestInfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String,Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		String sfnConditions = ServletRequestUtils.getStringParameter(request, "sdfConditons", "");//自定义查询条件
		HdkfSupportRequestInfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportRequestInfoDTO> result =null;
		if(json!= null && !"".equals(json)){
			param = JsonHelper.getInstance().readValue(json,dateFormat, new TypeReference<HdkfSupportRequestInfoDTO>(){});
			//param.put("currUserId", SessionHelper.getLoginSysUserId(request));
			
			//if(!SessionHelper.getLoginSysUser(request).getLoginName().contains("admin"))
			
			     param.setCurrUserId(SessionHelper.getLoginSysUserId(request));
			  //   param.setBusinessstate_("结束");
			   //  param.setRequestNo("J2016003");
			
			queryReqBean.setSearchParams(param);
		}
//		try {
			 result = service.searchHdkfSupportRequestInfoByPage(queryReqBean,sfnConditions);
//		} catch (Exception ex) {
//			logger.debug(ex.getMessage());
//			ex.printStackTrace();
//			return map;  
//		}
			CsmpBdAtachapterDTO ataDTO = null;
			CsmpBdCompanyinfoDTO comInfoDTO = null;
			CsmpBdAircraftinfoDTO craftinfoDTO=null;
			CsmpBdAricarftmodelDTO carftmodelDTO=null;
		for(HdkfSupportRequestInfoDTO dto :result.getResult()){
					  		    		                 
//			craftinfoDTO=service1.queryCsmpBdAircraftinfoByPrimaryKey(dto.getBatchNo());
//			if(craftinfoDTO!=null){
//			dto.setBatchNoAlias(craftinfoDTO.getBatchNo());
//			}
			carftmodelDTO=service4.queryCsmpBdAricarftmodelByPrimaryKey(dto.getModelId());
			if(carftmodelDTO!=null){
			dto.setModelIdAlias(carftmodelDTO.getModelName());
			}
//			ataDTO = service2.getCsmpBdAtachapterDTOById(dto.getChaperNo());
//			if (null != ataDTO) {
//				dto.setChaperNoAlias(ataDTO.getAtaName() + "_"
//						+ ataDTO.getNameEn());
//			}
			comInfoDTO = service3.queryCsmpBdCompanyinfoByPrimaryKey(dto
					.getRequestUnit());
			if (null != comInfoDTO) {
				dto.setRequestUnitAlias(comInfoDTO.getCompanyName());
			}
				//			dto.setInfoTypeAlias(this.sysLookupLoader
				//					.getNameByLooupTypeCodeAndLooupCode("CSMP_ES_INFO_TYPE",
				//							dto.getInfoType()));   		    		
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
//  		LogBase logBase = LogBaseFactory.getLogBase( request);
  			HdkfSupportRequestInfoDTO dto = service.queryHdkfSupportRequestInfoByPrimaryKey(id);
  			CsmpBdAtachapterDTO ataDTO = null;
			CsmpBdCompanyinfoDTO comInfoDTO = null;
			CsmpBdAircraftinfoDTO craftinfoDTO=null;
			CsmpBdAricarftmodelDTO carftmodelDTO=null;
			craftinfoDTO=service1.queryCsmpBdAircraftinfoByPrimaryKey(dto.getBatchNo());
			if(craftinfoDTO!=null){
			dto.setBatchNoAlias(craftinfoDTO.getBatchNo());
			}
			carftmodelDTO=service4.queryCsmpBdAricarftmodelByPrimaryKey(dto.getModelId());
			if(carftmodelDTO!=null){
			dto.setModelIdAlias(carftmodelDTO.getModelName());
			}
			ataDTO = service2.getCsmpBdAtachapterDTOById(dto.getChaperNo());
			if (null != ataDTO) {
				dto.setChaperNoAlias(ataDTO.getAtaName() + "_"
						+ ataDTO.getNameEn());
			}
			comInfoDTO = service3.queryCsmpBdCompanyinfoByPrimaryKey(dto
					.getRequestUnit());
			if (null != comInfoDTO) {
				dto.setRequestUnitAlias(comInfoDTO.getCompanyName());
			}   		
		  		    						
	    				    		
		  	request.setAttribute("hdkfSupportRequestInfoDTO", dto);
  			request.setAttribute("id", id);
  		}else{
  			mav.addObject("id", ComUtil.getId());
  		}
  		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/"+"HdkfSupportRequestInfo"+type);
  		return mav;
  	}
  	
  	/**
  	 * 新增并启动流程
  	 * @param request
  	 * @return
  	 */
  	@RequestMapping(value="/operation/saveAndStartProcess",method=RequestMethod.POST)
  	public ModelAndView saveAndStartProcess(HttpServletRequest request){
  		ModelAndView mav= new ModelAndView();
  		
		String processDefId = ServletRequestUtils.getStringParameter(request, "processDefId", "");
		String formCode = ServletRequestUtils.getStringParameter(request, "formCode", "");
		String jsonString = ServletRequestUtils.getStringParameter(request, "jsonString", "");
		String datas = ServletRequestUtils.getStringParameter(request, "datas", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfSupportRequestInfoDTO hdkfSupportRequestInfo = JsonHelper.getInstance().readValue(datas,dateFormat, new TypeReference<HdkfSupportRequestInfoDTO>(){});
			String userId = (String)request.getSession().getAttribute("userId");
			String deptId = (String)request.getSession().getAttribute("deptId");
			/////////////////启动流程所需要的参数///////////////////
			Map<String, Object> parameter = new HashMap<String,Object>();
			parameter.put("processDefId", processDefId);
			parameter.put("formCode", formCode);
			parameter.put("jsonString", jsonString);
			parameter.put("userId", userId);
			parameter.put("deptId", deptId);
		
			BeanProcess bp = service.insertHdkfSupportRequestInfoAndStartProcess(hdkfSupportRequestInfo,  parameter);
			/*
			 * 同时修改 process_view的字段
			 */
			
			HdkfSupportProcessViewDTO dto = new HdkfSupportProcessViewDTO();
			dto.setRequestDate(hdkfSupportRequestInfo.getRequestDate());
			dto.setRequestUnit(hdkfSupportRequestInfo.getRequestUnitAlias());
			dto.setModelId(hdkfSupportRequestInfo.getModelIdAlias());
			dto.setBatchNo(hdkfSupportRequestInfo.getBatchNoAlias());
			dto.setRequestId(bp.getFormId());
			dto.setRequestNo(hdkfSupportRequestInfo.getRequestNo());
			
			dto.setCurStatus("2");
			dto.setCurBpmstate("拟稿");
			dto.setCurUser(userId);
			hdkfSupportProcessViewService.insertHdkfSupportProcessView(dto);
			
			mav.addObject("flag",OpResult.success);
			mav.addObject("bp",bp);
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("flag",OpResult.failure);
			mav.addObject("msg",e.getMessage());
		}
  		return mav;
  	}
  	
  	/**
  	 * 保存数据
  	 * @param id 主键id
  	 * @param demoBusinessTripDTO 保存的对象
  	 * @return
  	 */
  	@RequestMapping(value="/operation/save",method=RequestMethod.POST)
	public ModelAndView toSaveHdkfSupportRequestInfoDTO(HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request, "data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String returnId = "";
		try {
			HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = JsonHelper.getInstance().readValue(jsonData, new TypeReference<HdkfSupportRequestInfoDTO>(){});
			if("".equals(hdkfSupportRequestInfoDTO.getId())){//新增
				returnId = service.insertHdkfSupportRequestInfo(hdkfSupportRequestInfoDTO);
			}
			else if(service.findDtoById(hdkfSupportRequestInfoDTO.getId())==null){
				returnId = service.insertHdkfSupportRequestInfo(hdkfSupportRequestInfoDTO);
			}
		    	
			
			else{//修改
				  service.updateHdkfSupportRequestInfoSensitive(hdkfSupportRequestInfoDTO);
				  returnId = hdkfSupportRequestInfoDTO.getId();
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
  	 * @param ids id数组
  	 * @return
  	 */
  	@RequestMapping(value="/operation/delete",method=RequestMethod.POST)
	public ModelAndView toDeleteHdkfSupportRequestInfoDTO(@RequestBody String[] ids,HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		try {
//  			LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportRequestInfoByIds(ids);
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
	 *转向detail页面
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toDetailJsp")
	public ModelAndView toDetailJsp(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		HdkfSupportRequestInfoDTO dto = service.queryHdkfSupportRequestInfoByPrimaryKey(id);
        	  	    					
    			    		
		CsmpBdAtachapterDTO ataDTO = null;
		CsmpBdCompanyinfoDTO comInfoDTO = null;
		CsmpBdAircraftinfoDTO craftinfoDTO=null;
		CsmpBdAricarftmodelDTO carftmodelDTO=null;
		//craftinfoDTO=service1.queryCsmpBdAircraftinfoByPrimaryKey(dto.getBatchNo());
//		if(craftinfoDTO!=null){
//		dto.setBatchNoAlias(craftinfoDTO.getBatchNo());
//		}
		carftmodelDTO=service4.queryCsmpBdAricarftmodelByPrimaryKey(dto.getModelId());
		if(carftmodelDTO!=null){
		dto.setModelIdAlias(carftmodelDTO.getModelName());
		}
//		ataDTO = service2.getCsmpBdAtachapterDTOById(dto.getChaperNo());
//		if (null != ataDTO) {
//			dto.setChaperNoAlias(ataDTO.getAtaName() + "_"
//					+ ataDTO.getNameEn());
//		}
		comInfoDTO = service3.queryCsmpBdCompanyinfoByPrimaryKey(dto
				.getRequestUnit());
		if (null != comInfoDTO) {
			dto.setRequestUnitAlias(comInfoDTO.getCompanyName());
		}   		
	  		    						
	  	    					
    			    		
	  	        
        mav.addObject("flag", OpResult.success);
        mav.addObject("hdkfSupportRequestInfo", dto);
        mav.addObject("requestUnitRr", dto.getRequestUnit());
        mav.addObject("modelid", dto.getModelId());
		return mav;
	}
	@RequestMapping("/queryDto")
	public ModelAndView queryDto(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		HdkfSupportRequestInfoDTO dto = service.queryHdkfSupportRequestInfoByPrimaryKey(id);
        	  	    					
    			    		
		//CsmpBdAtachapterDTO ataDTO = null;
		CsmpBdCompanyinfoDTO comInfoDTO = null;
		//CsmpBdAircraftinfoDTO craftinfoDTO=null;
		CsmpBdAricarftmodelDTO carftmodelDTO=null;
//		craftinfoDTO=service1.queryCsmpBdAircraftinfoByPrimaryKey(dto.getBatchNo());
//		if(craftinfoDTO!=null){
//		dto.setBatchNoAlias(craftinfoDTO.getBatchNo());
//		}
		carftmodelDTO=service4.queryCsmpBdAricarftmodelByPrimaryKey(dto.getModelId());
		if(carftmodelDTO!=null){
		dto.setModelIdAlias(carftmodelDTO.getModelName());
		}
//		ataDTO = service2.getCsmpBdAtachapterDTOById(dto.getChaperNo());
//		if (null != ataDTO) {
//			dto.setChaperNoAlias(ataDTO.getAtaName() + "_"
//					+ ataDTO.getNameEn());
//		}
		comInfoDTO = service3.queryCsmpBdCompanyinfoByPrimaryKey(dto
				.getRequestUnit());
		if (null != comInfoDTO) {
			dto.setRequestUnitAlias(comInfoDTO.getCompanyName());
		}   		
	  		    						
	  	    					
    			    		
	  	        
        mav.addObject("flag", OpResult.success);
        mav.addObject("hdkfSupportRequestInfo", dto);
		return mav;
	}

	/**
	 * 跳转到f管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "/HdkfConpanyInfo")
	public ModelAndView toqueryConpanyInfo(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/HdkfBdCompanyinfoManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/operation/");
		return mav;
	}
	/**
	 * 跳转到批架次多选管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "/HdkfBdAircraftinfoInfos/{fid}")
	public ModelAndView toCsmpBdCompanyinfos(@PathVariable String fid,HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/HdkfBdAircraftinfoManages");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/");
		request.setAttribute("fid",fid);

		return mav;
	}
	//HdkfBdAircraftinfoModleInfos
	/**
	 * 跳转到机型多选管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "/HdkfBdAircraftinfoModelInfos/{fid}")
	public ModelAndView toCsmpBdCompanyModelinfos(@PathVariable String fid,HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String requestunit =request.getParameter("fid");
		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/HdkfBdAircraftModelinfoManages");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/");
		request.setAttribute("fid",fid);
		return mav;
	}
	
	
	/**
	 * 跳转到批架次管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "/HdkfBdAircraftinfoInfo/{fid}")
	public ModelAndView toCsmpBdCompanyinfo(@PathVariable String fid,HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/HdkfBdAircraftinfoManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/");
		request.setAttribute("fid",fid);

		return mav;
	}
	/**
	 * 跳转到产品管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应HdkfBdSparepartInfoSelect
	 * @return
	 */
	@RequestMapping(value = "HdkfBdSparepartInfoSelect")
	public ModelAndView toCsmpBdSparepartSelect(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportrequestinfo/HdkfBdSparepartManage");
		request.setAttribute("url",
				"platform/csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/operation/");
		return mav;
	}
}
