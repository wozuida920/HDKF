package avicit.csmp.basicData.csmpbdcompanyinfo.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
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

import avicit.csmp.basicData.csmpbdaircraftinfo.controller.CsmpBdAircraftinfoController;
import avicit.csmp.basicData.csmpbdaircraftinfo.service.CsmpBdAircraftinfoService;
import avicit.csmp.basicData.csmpbdatachapter.dto.CsmpBdAtachapterDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.service.CsmpBdCompanyinfoService;
import avicit.csmp.basicData.csmpbdcompanystructure.dto.CsmpBdCompanystructureDTO;
import avicit.csmp.basicData.csmpbdcompanystructure.service.CsmpBdCompanystructureService;
import avicit.csmp.basicData.csmpbdcomstr.service.CsmpBdComStrService;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syslookup.dto.SysLookupSimpleVo;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.fasterxml.jackson.core.type.TypeReference;


/**
 * @classname: CsmpBdCompanyinfoController
 * @description: 定义 单位信息表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController")
public class CsmpBdCompanyinfoController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdCompanyinfoController.class);
	@Autowired
	private CsmpBdCompanyinfoService service;	
	@Autowired
	private CsmpBdCompanystructureService structureService;	       
	@Autowired
	private CsmpBdComStrService strService;
	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "CsmpBdCompanyinfoInfo")
	public ModelAndView toCsmpBdCompanyinfo(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("avicit/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoManage");
		request.setAttribute("url","platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/operation/");
		
		return mav;
	}

	@RequestMapping(value = "/operation/getCsmpBdCompanyinfosByPage/{pid}")
	@ResponseBody
	public Map<String, Object> togetCsmpBdCompanyinfoByPage(PageParameter pageParameter, HttpServletRequest request,@PathVariable String pid){
		QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean = new QueryReqBean<CsmpBdCompanyinfoDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param","");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,"sdfConditons", "");// 自定义查询条件
		CsmpBdCompanyinfoDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdCompanyinfoDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat, new TypeReference<CsmpBdCompanyinfoDTO>() {});
		} else {
			param= new CsmpBdCompanyinfoDTO();
			param.setNodeId(pid);
		}
		
		queryReqBean.setSearchParams(param);
		
		try {
			if("1".equals(pid)){
				result = service.searchCsmpBdCompanyinfoParentByPage(queryReqBean);
			}else{
				result = service.searchCsmpBdCompanyinfoByPage(queryReqBean,sfnConditions);
			}
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (CsmpBdCompanyinfoDTO dto : result.getResult()) {

			dto.setContactsAlias(sysUserLoader.getSysUserNameById(dto
					.getContacts()));

			dto.setServiceRepresentativeAlias(sysUserLoader
					.getSysUserNameById(dto.getServiceRepresentative()));

			dto.setLegalPersonAlias(sysUserLoader.getSysUserNameById(dto
					.getLegalPerson()));
			if("CHINA".equals(dto.getCountry())){
	            dto.setCountryAlias(this.sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("CSMP_BD_COMPANYINFO_NATION", dto.getCountry()));
			}
            if("OTHER".equals(dto.getCountry())){
	            dto.setCountryAlias(this.sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("CSMP_BD_OTHER_PROVINCE", dto.getProvince()));
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
		if (!"null".equals(id)) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
			CsmpBdCompanyinfoDTO dto = service.queryCsmpBdCompanyinfoByPrimaryKey(id);
			dto.setContactsAlias(sysUserLoader.getSysUserNameById(dto.getContacts()));
			dto.setServiceRepresentativeAlias(sysUserLoader.getSysUserNameById(dto.getServiceRepresentative()));
			dto.setLegalPersonAlias(sysUserLoader.getSysUserNameById(dto.getLegalPerson()));			
	         request.setAttribute("csmpBdCompanyinfoDTO", dto);					
			mav.addObject("id", id);
		}else {
			id = ComUtil.getId();
			mav.addObject("id", id);
		}
	       mav.setViewName("avicit/csmp/basicData/csmpbdcompanyinfo/"+ "CsmpBdCompanyinfo" + type);
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
	public ModelAndView toSaveCsmpBdCompanyinfoDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,"data", "");
		//定义pid
		String pid = ServletRequestUtils.getStringParameter(request,"pid", "");
		String catalogType = "";
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String returnId = "";	
		CsmpBdCompanystructureDTO companystructureDTO = null;
		try {
			if(null!=pid&&!"".equals(pid)){
				companystructureDTO = structureService.getCsmpBdCompanystructureDTOById(pid);
				catalogType = companystructureDTO.getCatalogType();
			}
			CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO =  JsonHelper.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<CsmpBdCompanyinfoDTO>() {
							});
			///需要改的字段
			//csmpBdCompanyinfoDTO.setNodeId(pid);
			if ("".equals(csmpBdCompanyinfoDTO.getId())) {// 新增				
				returnId = service.insertCsmpBdCompanyinfo(csmpBdCompanyinfoDTO,pid,catalogType);//要在后面加pid
			} else {// 修改
				returnId = csmpBdCompanyinfoDTO.getId();

				service.updateCsmpBdCompanyinfoSensitive(csmpBdCompanyinfoDTO);
			}
			mav.addObject("flag", OpResult.success);
			mav.addObject("id", returnId);

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
	public ModelAndView toDeleteCsmpBdCompanyinfoDTO(@RequestBody String[] ids,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			/*strService.deleteCsmpBdComStrBycomIds(comId);*/
			service.deleteCsmpBdCompanyinfoByIds(ids);
			mav.addObject("flag", OpResult.success);
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		return mav;
	}
	//获取一个树
	@RequestMapping(value="getConervTree")
	public ModelAndView conervTree(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<TreeNode> list = service.getListTree();
		mav.addObject("tree",list);
		return mav;
	}
	/**
	 * 添加国家时使用PLATFORM_NATION的代码值和省份的通用代码CSMP_BD_"+code+"_PROVINCE的code一致
	 * 
	 * @param code
	 * @return
	 */
	@RequestMapping(value = "getProvinceByCountryCodeValue/{code}")
	@ResponseBody
	public Collection<SysLookupSimpleVo> searchByCountryCodeValuerAll(@PathVariable String code) throws Exception {
		Collection<SysLookupSimpleVo> list=null;		
	    list=sysLookupLoader.getLookUpListByTypeByAppId("CSMP_BD_"+code+"_PROVINCE", SessionHelper.getApplicationId());	   
		return list;
	}
	
	//返回一个list列表里面放的是查询的说有的公司
	@RequestMapping(value="getLitCompanyinfo")
	@ResponseBody
	public List<CsmpBdCompanyinfoDTO> getLitCompanyinfo(String id){
		List<CsmpBdCompanyinfoDTO> list	=service.selectByTreeIdToComparyInfo("customer");
		try {
			CsmpBdCompanyinfoDTO Compdto=service.queryCsmpBdCompanyinfoByPrimaryKey(id);
			if(Compdto==null){//则说明是根节点
				return list;
			}else{//其余节点
				for(CsmpBdCompanyinfoDTO t:list){
					String companName =t.getCompanyName();
					if(companName.equals(Compdto.getCompanyName())){
						return list;
					}
				}
				list.add(Compdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	
}
