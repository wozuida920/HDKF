package avicit.hdkf.support.hdkfsupportfaultdetail.controller;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicti.platform6.hdkf.utils.StringUtils;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.DateUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.excel.export.ServerExcelExport;
import avicit.platform6.core.excel.export.datasource.TypeReferenceDataSource;

import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;



import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


import avicit.hdkf.support.hdkfsupportfaultdetail.dto.HdkfSupportFaultDetailDTO;
import avicit.hdkf.support.hdkfsupportfaultdetail.service.HdkfSupportFaultDetailService;
import avicit.hdkf.support.hdkfsupportrequestinfo.dto.HdkfSupportRequestInfoDTO;
import avicit.hdkf.support.hdkfsupportrequestinfo.service.HdkfSupportRequestInfoService;


/**
 * @classname: HdkfSupportFaultDetailController
 * @description: 定义 HDKF_SUPPORT_FAULT_DETAIL 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController")
public class HdkfSupportFaultDetailController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportFaultDetailController.class);

	@Autowired
	private HdkfSupportFaultDetailService service;
	@Autowired
	private HdkfSupportRequestInfoService hdkfSupportRequestInfoService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportFaultDetailInfo")
	public ModelAndView toHdkfSupportFaultDetail(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");

		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfSupportFaultDetailsByPage")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportFaultDetailByPage(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportFaultDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportFaultDetailDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportFaultDetailDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportFaultDetailDTO>() {
					});
			
		}else{  param = new HdkfSupportFaultDetailDTO();}
		param.setAttribute02("Y");
		
		queryReqBean.setSearchParams(param);

		try {
			result = service.searchHdkfSupportFaultDetailByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = null;

		for (HdkfSupportFaultDetailDTO dto : result.getResult()) {
			if (dto.getRequestNo() == null) {
				try {
					hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
							.findDtoById(dto.getRequestId());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(hdkfSupportRequestInfoDTO!=null){

				dto.setRequestDate(hdkfSupportRequestInfoDTO.getRequestDate());
				dto.setRequestNo(hdkfSupportRequestInfoDTO.getRequestNo());
				}
			}
/*			//时间问题，不要改
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			if(dto.getRequestDate()!=null){
		           dto.setRequestDates(sdf.format(dto.getRequestDate()));
		         //  dto.setOccurrenceDates(sdf.format(dto.getOccurrenceDate()));
			}
			if(dto.getOccurrenceDate()!=null){
		           //dto.setRequestDates(sdf.format(dto.getRequestDate()));
		           dto.setOccurrenceDates(sdf.format(dto.getOccurrenceDate()));
			}*/

		}

		map.put("total", result.getPageParameter().getTotalCount());
		map.put("rows", result.getResult());
		logger.debug("成功获取SysLookupType分页数据");
		return map;
	}
	@RequestMapping(value = "HdkfSupportFaultDetailInfo2")
	public ModelAndView toHdkfSupportFaultDetail2(HttpServletRequest request,
			HttpServletResponse reponse) {
		String requestId = request.getParameter("requestId");
		//String requestUnit = request.getParameter("requestUnit");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailManage2");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
		mav.addObject("requestId", requestId);
	//	mav.addObject("requestUnit", requestUnit);
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = new HdkfSupportRequestInfoDTO();
		try {
			hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
					.findDtoById(requestId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("hdkfSupportRequestInfoDTO", hdkfSupportRequestInfoDTO);
		return mav;
	}
	@RequestMapping(value = "HdkfSupportFaultDetailInfo3")
	public ModelAndView toHdkfSupportFaultDetail3(HttpServletRequest request,
			HttpServletResponse reponse) {
		String requestId = request.getParameter("requestId");
		//String requestUnit = request.getParameter("requestUnit");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailManage3");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
		mav.addObject("requestId", requestId);
	//	mav.addObject("requestUnit", requestUnit);
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = new HdkfSupportRequestInfoDTO();
		try {
			hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
					.findDtoById(requestId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("hdkfSupportRequestInfoDTO", hdkfSupportRequestInfoDTO);
		return mav;
	}
	@RequestMapping(value = "HdkfSupportFaultDetailInfo4")
	public ModelAndView toHdkfSupportFaultDetail4(HttpServletRequest request,
			HttpServletResponse reponse) {
		String requestId = request.getParameter("requestId");
		//String requestUnit = request.getParameter("requestUnit");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailManage4");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
		mav.addObject("requestId", requestId);
	//	mav.addObject("requestUnit", requestUnit);
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = new HdkfSupportRequestInfoDTO();
		try {
			hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
					.findDtoById(requestId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("hdkfSupportRequestInfoDTO", hdkfSupportRequestInfoDTO);
		return mav;
	}


	@RequestMapping(value = "HdkfSupportFaultDetailInfo1")
	public ModelAndView toHdkfSupportFaultDetail1(HttpServletRequest request,
			HttpServletResponse reponse) {
     	String requestId = request.getParameter("requestId");
		String requestUnit = request.getParameter("requestUnit");
		String batchNo = request.getParameter("batchNo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailManage1");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
		mav.addObject("requestId", requestId);
		mav.addObject("requestUnit", requestUnit);
		mav.addObject("batchNo", batchNo);
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = new HdkfSupportRequestInfoDTO();
		try {
			hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
					.findDtoById(requestId);//requestId
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("hdkfSupportRequestInfoDTO", hdkfSupportRequestInfoDTO);
		return mav;
	}

	
	@RequestMapping(value = "HdkfSupportFaultDetailInfoModel")
	public ModelAndView toHdkfSupportFaultDetailModel(HttpServletRequest request,
			HttpServletResponse reponse) {
     	String requestId = request.getParameter("requestId");
		String requestUnit = request.getParameter("requestUnit");
		String modelId = request.getParameter("modelId");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailManageModel");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
		mav.addObject("requestId", requestId);
		mav.addObject("requestUnit", requestUnit);
		mav.addObject("modelId", modelId);
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = new HdkfSupportRequestInfoDTO();
		try {
			hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
					.findDtoById(requestId);//requestId
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("hdkfSupportRequestInfoDTO", hdkfSupportRequestInfoDTO);
		return mav;
	}
	

	@RequestMapping(value = "/operation/getHdkfSupportFaultDetailsByPage1")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportFaultDetailByPage1(
			PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportFaultDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportFaultDetailDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportFaultDetailDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportFaultDetailDTO>() {
					});

		}
		String requestId = ServletRequestUtils.getStringParameter(request,
				"requestId", "");
		if (param != null) {
			param.setRequestId(requestId);
		} else {
			param = new HdkfSupportFaultDetailDTO();
			param.setRequestId(requestId);
			
		}
		queryReqBean.setSearchParams(param);
		try {
			result = service.searchHdkfSupportFaultDetailByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}
		
		HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO = null;
		for (HdkfSupportFaultDetailDTO dto : result.getResult()) {
			if (dto.getRequestNo() == null) {
				try {
					hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService
							.findDtoById(dto.getRequestId());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(hdkfSupportRequestInfoDTO!=null){

				dto.setRequestDate(hdkfSupportRequestInfoDTO.getRequestDate());
				dto.setRequestNo(hdkfSupportRequestInfoDTO.getRequestNo());
				try {
					service.updateHdkfSupportFaultDetailSensitive(dto);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
			}
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
		if (!type.equals("Add")) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
			HdkfSupportFaultDetailDTO dto = service
					.queryHdkfSupportFaultDetailByPrimaryKey(id);
			
		String faultDesc = StringUtils.htmlToCode(dto.getFaultDesc());
		dto.setFaultDesc(faultDesc);
		String dealSolution = StringUtils.htmlToCode(dto.getDealSolution());
		dto.setDealSolution(dealSolution);
			request.setAttribute("hdkfSupportFaultDetailDTO", dto);
		} else {
			// HdkfSupportRequestInfoDTO hdkfSupportRequestInfoDTO =
			// hdkfSupportRequestInfoService.findDtoById(id);
/*			String[] ids = id.split(",");
			request.setAttribute("requestId", ids[0]);
			request.setAttribute("requestUnit", ids[1]);
			request.setAttribute("batchNo", ids[2]);*/
			int maxSplit = 3;
			String[] ids = id.split(",", maxSplit);
/*	        for (int i = 0; i < ids.length; i++) {
	        	System.out.println(ids[i]);        	
	        }*/
	        request.setAttribute("requestId", ids[0]);
			request.setAttribute("requestUnit", ids[1]);
			request.setAttribute("modelId", ids[2]);
			
			
			
		}
		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/"
				+ "HdkfSupportFaultDetail" + type);
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
	public ModelAndView toSaveHdkfSupportFaultDetailDTO(
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO = JsonHelper
					.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<HdkfSupportFaultDetailDTO>() {
							});

			if ("".equals(hdkfSupportFaultDetailDTO.getId())) {// 新增
				service.insertHdkfSupportFaultDetail(hdkfSupportFaultDetailDTO);
			} else {// 修改
				service.updateHdkfSupportFaultDetailSensitive(hdkfSupportFaultDetailDTO);
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
	public ModelAndView toDeleteHdkfSupportFaultDetailDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportFaultDetailByIds(ids);
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
	 * 跳转到批架次管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "/HdkfBdAircraftinfoInfo/{fid}")
	public ModelAndView toCsmpBdCompanyinfo(@PathVariable String fid,
			HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfBdAircraftinfoManage");
		request.setAttribute(
				"url",
				"platform/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/");
		request.setAttribute("fid", fid);

		return mav;
	}
	
	
	/**
	 * excel客户端导出
	 * 
	 * @param request
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/operation/sysuser/exportClient")
	public String exportClient(PageParameter pageParameter,HttpServletRequest request, ModelMap map) throws Exception {
		// 解析前台参数
		String fileName = ServletRequestUtils.getStringParameter(request,
				"fileName", "导出excel");
		String dataGridheaders = ServletRequestUtils.getStringParameter(
				request, "dataGridFields", "");
		boolean hasRowNum = ServletRequestUtils.getBooleanParameter(request,
				"hasRowNum", true);
		String unContainFields = ServletRequestUtils.getStringParameter(
				request, "unContainFields", "");
		String datas = ServletRequestUtils.getStringParameter(request, "datas",
				"");
	
		String sheetName = ServletRequestUtils.getStringParameter(request,
				"sheetName", "sheet1");
		
		ServerExcelExport serverExp = new ServerExcelExport();
		
		
	//	CilentExcelExport clientExp = new CilentExcelExport();
		serverExp.setFileName(fileName);// 设置导出文件名称
		serverExp.setSheetName(sheetName);// 设置sheet名字
		serverExp.setHasRowNum(hasRowNum);// 是否有行号
		serverExp.setUnexportColumn(unContainFields);// 设置不需要导出的列
		serverExp.setDataGridHeaders(dataGridheaders);// 设置导出的表头，一般为前台传递过来的json格式数据
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		

		
		QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean= new QueryReqBean<HdkfSupportFaultDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);
		Map<String,Object> map1 = null;
		List<HdkfSupportFaultDetailDTO> objlist= new ArrayList();
		if(datas != null && !"".equals(datas)){
			
			/*datas = datas.replaceAll("\\[", "").replaceAll("\\]","");
			HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO = JsonHelper.getInstance().readValue(datas,
				HdkfSupportFaultDetailDTO.class);	
			objlist.add(hdkfSupportFaultDetailDTO);*/
			
		List list =JsonHelper.getInstance().readValue(datas,List.class);	
		
		for(int i=0;list.size()>i;i++){
				map1 = (HashMap)list.get(i);				
				ObjectMapper objMap = new ObjectMapper();
				String objStr = objMap.writeValueAsString(map1);
				/*ByteOutputStream bop = new ByteOutputStream();	
				objMap.writeValue(bop,map1);*/
			//	OutputStreamWriter bop=new OutputStreamWriter(null,"UTF-8");				
				
				HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO = JsonHelper.getInstance().readValue(objStr,
						HdkfSupportFaultDetailDTO.class);	
				objlist.add(hdkfSupportFaultDetailDTO);
				//queryReqBean.setSearchParams(hdkfSupportFaultDetailDTO);
			}
			
			
		}
		/*List<HdkfSupportFaultDetailDTO> list=service.searchHdkfSupportFaultDetail(queryReqBean);	*/

		
		TypeReferenceDataSource<HdkfSupportFaultDetailDTO> suppliers = new TypeReferenceDataSource<HdkfSupportFaultDetailDTO>() {

			@Override
			public Map<String, Object> convert2Map(HdkfSupportFaultDetailDTO obj) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", obj.getId());
				map.put("batchNo", obj.getBatchNo());
				map.put("modelId", obj.getModelId());
				map.put("flightHours", obj.getFlightHours());
				map.put("flightLanding", obj.getFlightLanding());
				/*map.put("requestDate", obj.getRequestDate());
				map.put("occurrenceDate", obj.getOccurrenceDate());*/
				map.put("faultDesc", obj.getFaultDesc());
				map.put("dealSolution", obj.getDealSolution());
				map.put("requestId", obj.getRequestId());
				map.put("requestNo", obj.getRequestNo());
				//通用代码转换
				if(obj.getAttribute01()!=null&&!"".equals(obj.getAttribute01())){
					map.put("attribute01", sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("CSMP_FM_FAULTHAPPENMONMENT", obj.getAttribute01()));
				}
				if(obj.getAttribute02()!=null&&!"".equals(obj.getAttribute02())){
					map.put("attribute02", sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("PLATFORM_YES_NO_FLAG", obj.getAttribute02()));
				}
				
				
				try{
					map.put("requestDate",DateUtil.format(obj.getRequestDate(), "yyyy-MM-dd"));
					map.put("occurrenceDate",DateUtil.format(obj.getOccurrenceDate(), "yyyy-MM-dd"));
				}catch(Exception e){
					e.printStackTrace();
				}
				
				
				return map;
			}

		};
		
		// 添加数据到导出类中
		suppliers.setData(objlist);
		// 设置数据源配置信息
		serverExp.setExportDataSource(suppliers);
		map.addAttribute("export", serverExp);
/*		clientExp.setData(datas);// 设置需要导出的数据，一般为前台传递的数据
		map.addAttribute("export", clientExp);// 必须的代码，属性名字不能修改。
*/		return "excel.down";// 必须的代码，不需要修改
	}
	
	/**
	 * Excel服务端导出
	 * 
	 * @param pageParameter
	 * @param request
	 * @param map
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/operation/sysuser/exportServer")
	public String exportServer(PageParameter pageParameter,
			HttpServletRequest request, ModelMap map) throws Exception {
		// 解析前台参数
		String fileName = ServletRequestUtils.getStringParameter(request,
				"fileName", "导出excel");
		String dataGridheaders = ServletRequestUtils.getStringParameter(
				request, "dataGridFields", "");
		boolean hasRowNum = ServletRequestUtils.getBooleanParameter(request,
				"hasRowNum", true);
		String unContainFields = ServletRequestUtils.getStringParameter(
				request, "unContainFields", "");
		String sheetName = ServletRequestUtils.getStringParameter(request,
				"sheetName", "sheet1");
		String datas = ServletRequestUtils.getStringParameter(request, "datas",
				"");

		ServerExcelExport serverExp = new ServerExcelExport();

		serverExp.setFileName(fileName);// 设置导出文件名称
		serverExp.setSheetName(sheetName);// 设置sheet名字
		serverExp.setHasRowNum(hasRowNum);// 是否有行号
		serverExp.setUnexportColumn(unContainFields);// 设置不需要导出的列
		serverExp.setDataGridHeaders(dataGridheaders);// 设置导出的表头，一般为前台传递过来的json格式数据

		HdkfSupportFaultDetailDTO hdkfsupportfaultdetailDTO = null;
		
		QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportFaultDetailDTO>();
		queryReqBean.setPageParameter(pageParameter);

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		if (datas != null && !"".equals(datas)) {
			hdkfsupportfaultdetailDTO = JsonHelper.getInstance().readValue(datas,
					dateFormat, new TypeReference<HdkfSupportFaultDetailDTO>() {
					});
			queryReqBean.setSearchParams(hdkfsupportfaultdetailDTO);
		}
		List<HdkfSupportFaultDetailDTO> list = service.searchHdkfSupportFaultDetail(queryReqBean);
		TypeReferenceDataSource<HdkfSupportFaultDetailDTO> suppliers = new TypeReferenceDataSource<HdkfSupportFaultDetailDTO>() {

			@Override
			public Map<String, Object> convert2Map(HdkfSupportFaultDetailDTO obj) {
				Map<String, Object> map = new HashMap<String, Object>(1);
				map.put("id", obj.getId());
				map.put("batchNo", obj.getBatchNo());
				map.put("modelId", obj.getModelId());
				map.put("flightHours", obj.getFlightHours());
				map.put("flightLanding", obj.getFlightLanding());
				map.put("requestDate", obj.getRequestDate());
				map.put("occurrenceDate", obj.getOccurrenceDate());
				map.put("faultDesc", obj.getFaultDesc());
				map.put("dealSolution", obj.getDealSolution());
				map.put("requestId", obj.getRequestId());
				map.put("requestNo", obj.getRequestNo());
				return map;
			}

		};
		
		
		
		// 添加数据到导出类中
		suppliers.setData(list);
		// 设置数据源配置信息
		serverExp.setExportDataSource(suppliers);
		map.addAttribute("export", serverExp);
		return "excel.down";

	}*/
	//故障统计机型模块
		/**
		 * 故障统计：跳转到管理页面
		 * @param request
		 * @param reponse
		 * @return
		 */
			
		@RequestMapping(value = "HdkfFmFaultStatisticsFlightModelInfo")
		public ModelAndView toCsmpFmFaultreportFlightModel(HttpServletRequest request,
				HttpServletResponse reponse) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfFmFaultStatisticsFlightModel");
			               //avicit/hdkf/support/hdkfsupportfaultdetail/HdkfFmFaultStatisticsFlightModel
			request.setAttribute("url",
					"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
			return mav;
		}
		//故障统计批架次模块
		/**
		 * 故障统计：跳转到管理页面
		 * @param request
		 * @param reponse
		 * @return
		 */
			
		@RequestMapping(value = "HdkfFmFaultStatisticsBatchNoInfo")
		public ModelAndView toCsmpFmFaultreportBatchNo(HttpServletRequest request,
				HttpServletResponse reponse) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfFmFaultStatisticsBatchNo");
			request.setAttribute("url",
					"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
			return mav;
		}	
		//故障统计客户名称模块
		/**
		 * 故障统计：跳转到管理页面
		 * @param request
		 * @param reponse
		 * @return
		 */
			
		@RequestMapping(value = "HdkfFmFaultStatisticsCustomerInfo")
		public ModelAndView toCsmpFmFaultreportCustomer(HttpServletRequest request,
				HttpServletResponse reponse) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfFmFaultStatisticsCustomer");
			request.setAttribute("url",
					"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
			return mav;
		}
		//故障统计客户名称首页显示模块
		/**
		 * 故障统计：跳转到管理页面
		 * @param request
		 * @param reponse
		 * @return
		 */
			
		@RequestMapping(value = "HdkfFmFaultStatisticsCustomerDoorInfo")
		public ModelAndView toCsmpFmFaultreportCustomerDoor(HttpServletRequest request,
				HttpServletResponse reponse) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("avicit/hdkf/support/hdkfsupportfaultdetail/HdkfFmFaultStatisticsCustomerDoor");
			request.setAttribute("url",
					"platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/");
			return mav;
		}
		
	/**
	 * 按机型统计查询
	 * @param pageParameter
	 * @param request
	 * @return 返回map格式数据
	 * @throws Exception 
	 */
	
 	@RequestMapping(value="/operation/getFlightModelQueryForm")
	public  @ResponseBody String getFlightModelQueryForm(HttpServletRequest request) throws Exception {
 		JSONArray arr=new JSONArray();
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		HdkfSupportFaultDetailDTO dto = new HdkfSupportFaultDetailDTO();
		dto.setBeginDate(DateUtil.parseDate(beginDate));
		dto.setEndDate(DateUtil.parseDate(endDate));
		List<HdkfSupportFaultDetailDTO> dtoList = service.seachCsmpFmFaultreportToFlightModelQuery(dto);
		arr.addAll(dtoList);
		return arr.toJSONString();
		
	}
 	/**
	 * 按批架次统计分页查询
	 * @param pageParameter
	 * @param request
	 * @return 返回map格式数据
	 * @throws Exception 
	 */
	@RequestMapping(value="/operation/getBatchNoQueryForm")
	@ResponseBody
	public Map<String,Object> getProducNameQueryFormByPage(PageParameter pageParameter,HttpServletRequest request) throws Exception {
 			QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportFaultDetailDTO>();
			queryReqBean.setPageParameter(pageParameter);
			HashMap<String,Object> map = new HashMap<String, Object>();
			HdkfSupportFaultDetailDTO param = new HdkfSupportFaultDetailDTO();
			QueryRespBean<HdkfSupportFaultDetailDTO> result =null;
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			if((beginDate != null && !"".equals(beginDate)) || (endDate != null && !"".equals(endDate))){
				param.setBeginDate(DateUtil.parseDate(beginDate));
				param.setEndDate(DateUtil.parseDate(endDate));
				queryReqBean.setSearchParams(param);
			}
			try {
				 result = service.seachBatchNoQueryFormByPage(queryReqBean);
			} catch (Exception ex) {
				logger.debug(ex.getMessage());
				ex.printStackTrace();
				return map;  
			}
			map.put("total",result.getPageParameter().getTotalCount());
			map.put("rows", result.getResult());
			logger.debug("成功获取SysLookupType分页数据");
			return map;
	}
	/**
	 * 按客户名称统计查询
	 * @param pageParameter
	 * @param request
	 * @return 返回map格式数据
	 * @throws Exception 
	 */
	@RequestMapping(value="/operation/getCustomerQueryForm")
	public  @ResponseBody String getCustomerQueryForm(HttpServletRequest request) throws Exception {
 		JSONArray arr=new JSONArray();
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		HdkfSupportFaultDetailDTO dto = new HdkfSupportFaultDetailDTO();
		dto.setBeginDate(DateUtil.parseDate(beginDate));
		dto.setEndDate(DateUtil.parseDate(endDate));
		List<HdkfSupportFaultDetailDTO> dtoList = service.seachCsmpFmFaultreportToCustomerQuery(dto);
		arr.addAll(dtoList);
		return arr.toJSONString();
		
	}
	/**
	 * 按客户名称统计查询_首页
	 * @param pageParameter
	 * @param request
	 * @return 返回map格式数据
	 * @throws Exception 
	 */
	@RequestMapping(value="/operation/getCustomerQueryFormDoor")
	public  @ResponseBody String getCustomerQueryFormDoor(HttpServletRequest request) throws Exception {
 		JSONArray arr=new JSONArray();
		List<HdkfSupportFaultDetailDTO> dtoList = service.seachCsmpFmFaultreportToCustomerQuery(new HdkfSupportFaultDetailDTO());
		arr.addAll(dtoList);
		return arr.toJSONString();
		
	}
	
	
}
