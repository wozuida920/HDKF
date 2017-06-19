package avicit.csmp.basicData.csmpbdaircraftinfo.controller;

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

import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdaircraftinfo.service.CsmpBdAircraftinfoService;
import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
import avicit.csmp.basicData.csmpbdaricarftmodel.service.CsmpBdAricarftmodelService;
import avicit.csmp.basicData.csmpbdcompanyinfo.dao.CsmpBdCompanyinfoDao;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.service.CsmpBdCompanyinfoService;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.dto.HdkfBdAircraftModelTDTO;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.service.HdkfBdAircraftModelTService;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
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
@RequestMapping("csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController")
public class CsmpBdAircraftinfoController implements LoaderConstant {
	private static final Logger logger = LoggerFactory.getLogger(CsmpBdAircraftinfoController.class);

	@Autowired
	private CsmpBdAircraftinfoService service;
	
	@Autowired
	private CsmpBdCompanyinfoDao dao;
	@Autowired
	private CsmpBdCompanyinfoService companInfoService;
	
	@Autowired
	private CsmpBdAricarftmodelService modelService;
	
	@Autowired
	private HdkfBdAircraftModelTService hdkfBdAircraftModelTService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdAircraftinfoInfo")
	public ModelAndView toCsmpBdAircraftinfo(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/");
	/*	mav.addObject("operateStatus", sysLookupLoader
				.getLookUpListByTypeByAppId("CSMP_BD_OPERATIONSTATUS",
						SessionHelper.getApplicationId()));*/
		mav.addObject("type", sysLookupLoader.getLookUpListByTypeByAppId("CSMP_OM_AIRCRATF_STATUS",SessionHelper.getApplicationId() ));
		mav.addObject("isBusinessPeriod", sysLookupLoader
				.getLookUpListByTypeByAppId("CSMP_BD_ISPERIOD",
						SessionHelper.getApplicationId()));
		return mav;
	}

	@RequestMapping(value = "/operation/getCsmpBdAircraftinfosByPage")
	@ResponseBody
	public Map<String, Object> togetCsmpBdAircraftinfoByPage(PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean = new QueryReqBean<CsmpBdAircraftinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
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
			result = service.searchCsmpBdAircraftinfoByPage(queryReqBean,
sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

	/*	for (CsmpBdAircraftinfoDTO dto : result.getResult()){

		}*/

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	@RequestMapping(value = "/operation/getCsmpBdAircraftByPage/{fid}")
	@ResponseBody
	public Map<String, Object> togetCsmpBdAircraftByPage(@PathVariable String fid,PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean = new QueryReqBean<CsmpBdAircraftinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		CsmpBdAircraftinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdAircraftinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdAircraftinfoDTO>() {
					});
		}
		if(param==null){
			param=new CsmpBdAircraftinfoDTO();
		}
		
		
		int maxSplit = 2;
		String[] fids = fid.split(",", maxSplit);
		String companyid=fids[0];
		String modelid=fids[1];
		//System.out.println(companyid+"&&&&&");
/*        request.setAttribute("requestId", ids[0]);
		request.setAttribute("requestUnit", ids[1]);
		request.setAttribute("batchNo", ids[2]);*/
		
		
		if(!"null".equals(modelid)){
		param.setModelId(modelid);
		}
		if(!"null".equals(companyid)){
		param.setCompanyId(companyid);
		}
		queryReqBean.setSearchParams(param);
		
		try {
			result = service.searchCsmpBdAircraftinfoByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (CsmpBdAircraftinfoDTO dto : result.getResult()){

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	
	//机型过滤
	@RequestMapping(value = "/operation/getCsmpBdAircraftModelByPage/{fid}")
	@ResponseBody
	public Map<String, Object> togetCsmpBdAircraftModelByPage(@PathVariable String fid,PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean = new QueryReqBean<CsmpBdAircraftinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		
		CsmpBdAircraftinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdAircraftinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdAircraftinfoDTO>() {
					});
			
		}
		
		if(param==null){
			param=new CsmpBdAircraftinfoDTO();
		}
		if(!"null".equals(fid)){
		param.setCompanyId(fid);
		}
		queryReqBean.setSearchParams(param);
		
		try {
			result = service.searchCsmpBdAircraftModelinfoByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (CsmpBdAircraftinfoDTO dto : result.getResult()){

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
	 *  @param obj 
	 *            接受公司或是机型的id
	 *    @param  modelNum  
	 *                   只有机型才有该属性值(他表示的是飞机的名字)         
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/operation/{type}/{id}/{obj}/{modelNum}")
	public ModelAndView toOpertionPage(@PathVariable String type,@PathVariable String obj,@PathVariable String modelNum,
			@PathVariable String id, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		CsmpBdAircraftinfoDTO dto = new CsmpBdAircraftinfoDTO();
		
		if (!"null".equals(id)) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
			 dto = service.queryCsmpBdAircraftinfoByPrimaryKey(id);
			String modelId= dto.getModelId();//机型的id
			CsmpBdAricarftmodelDTO modelDTO=modelService.queryCsmpBdAricarftmodelByPrimaryKey(modelId);
			 dto.setModelIdAlias(modelDTO.getModelName());
			 mav.addObject("comId", obj);//该地方是传给编辑页面的树的id(目前先不要)
			 dto.setCustumerName(dto.getCompanyId());
//			 CsmpBdAircraftinfoDTO dto1 = new CsmpBdAircraftinfoDTO();
//			 dto1.setCompanyId(dto.getCompanyId());
//			 dto.setCustumerName(dto1.getCompanyId());
			request.setAttribute("csmpBdAircraftinfoDTO", dto);
		}else{//此为新增的数据
		if("undefined".equals(modelNum)){//判断是公司
			dto.setCompanyId(obj);//把对象的树的id绑定到信息表的companyId上面
			CsmpBdCompanyinfoDTO Compdto =  dao.findCsmpBdCompanyinfoById(obj);
			if(Compdto==null){//该出查询出来是树的根节点为1的情况
//			dto.setCustumerName(Compdto.getCompanyName());//custumerName(设置他的名字给)
//			List<CsmpBdCompanyinfoDTO> list	=companInfoService.selectByTreeIdToComparyInfo("customer");
				mav.addObject("Name", " ");
				}else{//该出查询出来是树的节点不为1的情况
//					mav.addObject("comId", Compdto.getId());//还有一个问题就是如何选择将他的对应的id放到放到companyID上面
//					mav.addObject("Name",Compdto.getCompanyName());//此处本来是要讲名字返回
					mav.addObject("modelNum", 0);//将公司信息的id放到companyId中
					mav.addObject("comId", obj);
//					mav.addObject("", attributeValue)
				}
//			mav.addObject("dto", dto);
			
			
		}
		
		if(!"".equals(modelNum) && !"undefined".equals(modelNum)){//判断是机型
			dto.setAttribute01(modelNum);
			dto.setModelId(obj);
			List<CsmpBdCompanyinfoDTO> compList=dao.getTree();
			mav.addObject("dto", dto);
			mav.addObject("compList", compList);
			mav.addObject("comId", obj);
			mav.addObject("modelNum", 1);
		}
		}
		mav.addObject("type", sysLookupLoader.getLookUpListByTypeByAppId("CSMP_OM_AIRCRATF_STATUS",SessionHelper.getApplicationId() ));
		mav.setViewName("avicit/csmp/basicData/csmpbdaircraftinfo/"+ "CsmpBdAircraftinfo" + type);
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
	public ModelAndView toSaveCsmpBdAircraftinfoDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO = JsonHelper
					.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<CsmpBdAircraftinfoDTO>() {
							});
			
			//客户ID转name 并且存入 companyID 中
			String custumeri="";
			CsmpBdCompanyinfoDTO comapnyDto = new CsmpBdCompanyinfoDTO();
			custumeri = csmpBdAircraftinfoDTO.getCustumerName();
			if(!"".equals(custumeri)){
				comapnyDto = companInfoService.queryCsmpBdCompanyinfoByPrimaryKey(custumeri);
				csmpBdAircraftinfoDTO.setCustumerName(comapnyDto.getCompanyName());
				csmpBdAircraftinfoDTO.setCompanyId(comapnyDto.getId());
			}
			
			
			if ("".equals(csmpBdAircraftinfoDTO.getId())) {// 新增startOperateDate
				csmpBdAircraftinfoDTO.setStatisticalDate(csmpBdAircraftinfoDTO.getStartOperateDate());
				String returnId =service.insertCsmpBdAircraftinfo(csmpBdAircraftinfoDTO);
				
				HdkfBdAircraftModelTDTO dto = new HdkfBdAircraftModelTDTO();
				dto.setAttribute01(returnId);
				dto.setAircraftName(csmpBdAircraftinfoDTO.getBatchNo());
				
				
//				QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean = new QueryReqBean<CsmpBdAircraftinfoDTO>();
//				CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO2 = new CsmpBdAircraftinfoDTO();
//				csmpBdAircraftinfoDTO2.setAttribute01(csmpBdAircraftinfoDTO.getModelId());
//				queryReqBean.setSearchParams(csmpBdAircraftinfoDTO2);
				HdkfBdAircraftModelTDTO fatherDto =hdkfBdAircraftModelTService.getHdkfBdAircraftModelTDTOByModelId(csmpBdAircraftinfoDTO.getModelId());
				//CsmpBdAircraftinfoDTO rstDto =respBean.getResult().get(0);
				dto.setFatherId(fatherDto.getId());
				
				hdkfBdAircraftModelTService.insertHdkfBdAircraftModelT(dto);
				
			} else {// 修改
				service.updateCsmpBdAircraftinfoSensitive(csmpBdAircraftinfoDTO);
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
	public ModelAndView toDeleteCsmpBdAircraftinfoDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteCsmpBdAircraftinfoByIds(ids);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}
	
	//获取一个树(下次升级时候再来实现)
		@RequestMapping(value="getAircraTree")
		public ModelAndView conervTree(String data,HttpServletRequest request){
			ModelAndView mav = new ModelAndView();
//			String jsonData = ServletRequestUtils.getStringParameter(request,
//					"node", "");
//			CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO = JsonHelper
//					.getInstance().readValue(jsonData, new TypeReference<CsmpBdAircraftinfoDTO>() {
//							});
//			List<TreeNode> list = service.getAircraTree(data);
//			mav.addObject("tree",list);
			return mav;
		}
		
		
//根据用户来查询说有飞机的故障情况！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！		
		@RequestMapping(value = "AircraftinfoInfo")
		public ModelAndView AircraftinfoInfo(HttpServletRequest request,
				HttpServletResponse reponse) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("avicit/csmp/operateMonitor/csmpomaircraftdynamics/CsmpBdAircraftinfoManage");
			request.setAttribute(
					"url",
					"platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/");
		/*	mav.addObject("operateStatus", sysLookupLoader
					.getLookUpListByTypeByAppId("CSMP_BD_OPERATIONSTATUS",
							SessionHelper.getApplicationId()));*/
			mav.addObject("type", sysLookupLoader.getLookUpListByTypeByAppId("CSMP_OM_AIRCRATF_STATUS",SessionHelper.getApplicationId() ));
			mav.addObject("isBusinessPeriod", sysLookupLoader
					.getLookUpListByTypeByAppId("CSMP_BD_ISPERIOD",
							SessionHelper.getApplicationId()));
			return mav;
		}

		@RequestMapping(value = "/operation/getCsmpBdAircraftinfoAndFM")
		@ResponseBody
		public Map<String, Object> getCsmpBdAircraftinfoAndFM(PageParameter pageParameter, HttpServletRequest request) {
			QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean = new QueryReqBean<CsmpBdAircraftinfoDTO>();
			queryReqBean.setPageParameter(pageParameter);
			HashMap<String, Object> map = new HashMap<String, Object>();
			String json = ServletRequestUtils.getStringParameter(request, "param",
					"");
			String sfnConditions = ServletRequestUtils.getStringParameter(request,
					"sdfConditons", "");// 自定义查询条件
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
				result = service.searchOmByPage(queryReqBean,
						sfnConditions);

			} catch (Exception ex) {
				logger.debug(ex.getMessage());
				ex.printStackTrace();
				return map;
			}
			for (CsmpBdAircraftinfoDTO dto : result.getResult()){
				
				long  time =(dto.getStatisticalDate().getTime()-dto.getStartOperateDate().getTime())/(24*60*60*1000);
				if(time!=0){
				double avgHoures1=dto.getFlightNum()/time;
				java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00");
				dto.setAvgHoures(Double.valueOf(df.format(avgHoures1)));
				}else{
					dto.setAvgHoures(0);
				}
				long day =(dto.getStatisticalDate().getTime()-dto.getStartOperateDate().getTime())/(24*60*60*1000);
				if(day!=0){
				double avgNum1=dto.getTakeoffLandingNum()/day;
				java.text.DecimalFormat   df1   =new   java.text.DecimalFormat("#.00");
				dto.setAvgNum(Double.valueOf(df1.format(avgNum1)));
				}else{
					dto.setAvgNum(0);
				}
			}
			map.put("total", result.getPageParameter().getTotalCount());
			map.put("rows", result.getResult());
			logger.debug("成功获取SysLookupType分页数据");
			return map;
		}
}
