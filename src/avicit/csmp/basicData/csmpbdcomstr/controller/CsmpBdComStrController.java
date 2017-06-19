package avicit.csmp.basicData.csmpbdcomstr.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.service.CsmpBdCompanyinfoService;
import avicit.csmp.basicData.csmpbdcompanystructure.service.CsmpBdCompanystructureService;
import avicit.csmp.basicData.csmpbdcomstr.dao.CsmpBdComStrDao;
import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdComStrDTO;
import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdStrVo;
import avicit.csmp.basicData.csmpbdcomstr.service.CsmpBdComStrService;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: CsmpBdComStrController
 * @description: 定义 单位结构关系表 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/csmpbdcomstr/CsmpBdComStrController")
public class CsmpBdComStrController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdComStrController.class);

	@Autowired
	private CsmpBdComStrService service;
	
	@Autowired
	private CsmpBdCompanyinfoService infoService;//业务表service
	
	@Autowired
	private CsmpBdCompanystructureService treeService;//结构树srvice
	
	@Autowired
	private CsmpBdComStrDao strDao;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 * @param compId 公司ID
	 * @param CompName 公司名称
 	 *            响应
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/CsmpBdComStrInfo")
	public ModelAndView toCsmpBdComStr(
			HttpServletRequest request) throws Exception {
		String compId = ServletRequestUtils.getStringParameter(request, "id", "");
		//String compName = ServletRequestUtils.getStringParameter(request, "name", "");
		CsmpBdCompanyinfoDTO companyinfoDTO =null;		
		companyinfoDTO =this.infoService.queryCsmpBdCompanyinfoByPrimaryKey(compId);
		ModelAndView mav = new ModelAndView();
		// compName = new String(compName.getBytes("ISO-8859-1"),"UTF-8");
		mav.setViewName("avicit/csmp/basicData/csmpbdcomstr/CsmpBdComStrManage");
		request.setAttribute("url", "platform/csmp/basicData/csmpbdcomstr/CsmpBdComStrController/operation/");
		if (!"null".equals(compId)) {
			mav.addObject("compName", companyinfoDTO.getCompanyName());
			mav.addObject("compCode", companyinfoDTO.getCompanyCode());
			mav.addObject("compId", compId);
		}
		return mav;
	}

	@RequestMapping(value = "/operation/getCsmpBdComStrsByPage/{compId}")
	@ResponseBody
	public Map<String, Object> togetCsmpBdComStrByPage(@PathVariable String compId, PageParameter pageParameter, HttpServletRequest request) {
		QueryReqBean<CsmpBdComStrDTO> queryReqBean = new QueryReqBean<CsmpBdComStrDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param", "");
		CsmpBdComStrDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<CsmpBdStrVo> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<CsmpBdComStrDTO>() {
					});
			
		}else {
			param = new CsmpBdComStrDTO();
			param.setComId(compId);
		}
		queryReqBean.setSearchParams(param);
		try {
			result=service.searchCsmpBdComStrByPage(queryReqBean);
			for(CsmpBdStrVo dto : result.getResult()){
				//将目录名称设置入dto的ID中
				//dto.setStrId(treeService.getCsmpBdCompanystructureDTOById(dto.getStrId()).getCatalogName());
				//将业务表的id值设置为名称
				//dto.setComId(infoService.queryCsmpBdCompanyinfoByPrimaryKey(dto.getComId()).getCompanyName());
			}
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
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
			CsmpBdComStrDTO dto = service.queryCsmpBdComStrByPrimaryKey(id);

			request.setAttribute("csmpBdComStrDTO", dto);
		}
		mav.setViewName("avicit/csmp/basicData/csmpbdcomstr/" + "CsmpBdComStr"
				+ type);
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
	public ModelAndView toSaveCsmpBdComStrDTO(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			CsmpBdComStrDTO csmpBdComStrDTO = JsonHelper.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<CsmpBdComStrDTO>() {
							});
			if (csmpBdComStrDTO.getId()==null||"".equals(csmpBdComStrDTO.getId())) {// 新增
				service.insertCsmpBdComStr(csmpBdComStrDTO);
			} else {// 修改
				service.updateCsmpBdComStrSensitive(csmpBdComStrDTO);
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
	public ModelAndView toDeleteCsmpBdComStrDTO(@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			/*for (String id : ids) {
				
				CsmpBdComStrDTO dto = service.queryCsmpBdComStrByPrimaryKey(id);
				String comId =dto.getComId();
				int strs =service.searchStrByComs(comId);
				if (strs==1) {
					dto.setStrId("1");
					service.updateCsmpBdComStrSensitive(dto);
					mav.addObject("flag", "success");
					return mav;
				} else{*/
					//service.deleteCsmpBdComStrById(id);
					/*service.deleteCsmpBdComStrByIds(ids);
					mav.addObject("flag", "success");
					return mav;
				}	
				
			}*/
			service.deleteCsmpBdComStrByIds(ids);
			mav.addObject("flag", "success");
			return mav;
			
		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
	}
	@RequestMapping(value = "/getCustructType/{type}")
	@ResponseBody
	public String getCustructType(@PathVariable String type) {
		String custructType=this.sysLookupLoader.getNameByLooupTypeCodeAndLooupCode("CSMP_BD_COMPANY_TYPE", type);
		return custructType;
	}
}
