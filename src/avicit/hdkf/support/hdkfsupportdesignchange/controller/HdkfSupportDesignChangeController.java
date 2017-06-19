package avicit.hdkf.support.hdkfsupportdesignchange.controller;

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

import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.api.syspermissionresource.permissionanalysis.core.support.LoaderConstant;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.PageParameter;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;

import avicit.hdkf.support.hdkfsupportdesignchange.dto.HdkfSupportDesignChangeDTO;
import avicit.hdkf.support.hdkfsupportdesignchange.service.HdkfSupportDesignChangeService;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;

import com.fasterxml.jackson.core.type.TypeReference;

/**
 * @classname: HdkfSupportDesignChangeController
 * @description: 定义 HDKF_SUPPORT_DESIGN_CHANGE 控制层
 * @author: AVICIT DEV
 */
@Controller
@Scope("prototype")
@RequestMapping("hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController")
public class HdkfSupportDesignChangeController implements LoaderConstant {
	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportDesignChangeController.class);

	@Autowired
	private HdkfSupportDesignChangeService service;
	
	@Autowired
	private HdkfSupportOutfieldCardService hdkfSupportOutfieldCardService;

	/**
	 * 跳转到管理页面
	 * 
	 * @param request
	 *            请求
	 * @param reponse
	 *            响应
	 * @return
	 */
	@RequestMapping(value = "HdkfSupportDesignChangeInfo")
	public ModelAndView toHdkfSupportDesignChange(HttpServletRequest request,
			HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		String outCardId = request.getParameter("outCardId");
				
		mav.setViewName("avicit/hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeManage");
		request.setAttribute(
				"url",
				"platform/hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController/operation/");
		mav.addObject("outCardId", outCardId);
		return mav;
	}

	@RequestMapping(value = "/operation/getHdkfSupportDesignChangesByPage/{outCardId}")
	@ResponseBody
	public Map<String, Object> togetHdkfSupportDesignChangeByPage(
			PageParameter pageParameter, HttpServletRequest request,@PathVariable String outCardId) {
		QueryReqBean<HdkfSupportDesignChangeDTO> queryReqBean = new QueryReqBean<HdkfSupportDesignChangeDTO>();
		queryReqBean.setPageParameter(pageParameter);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String json = ServletRequestUtils.getStringParameter(request, "param",
				"");
		String sfnConditions = ServletRequestUtils.getStringParameter(request,
				"sdfConditons", "");// 自定义查询条件
		HdkfSupportDesignChangeDTO param = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QueryRespBean<HdkfSupportDesignChangeDTO> result = null;
		if (json != null && !"".equals(json)) {
			param = JsonHelper.getInstance().readValue(json, dateFormat,
					new TypeReference<HdkfSupportDesignChangeDTO>() {
					});
			
		}else{
			param = new HdkfSupportDesignChangeDTO();
		}
		param.setAttribute01(outCardId);
		queryReqBean.setSearchParams(param);
		try {
			result = service.searchHdkfSupportDesignChangeByPage(queryReqBean,
					sfnConditions);

		} catch (Exception ex) {
			logger.debug(ex.getMessage());
			ex.printStackTrace();
			return map;
		}

		for (HdkfSupportDesignChangeDTO dto : result.getResult()) {

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
		if (!"Add".equals(type)) {// 编辑窗口或者详细页窗口
			// 主表数据
			// LogBase logBase = LogBaseFactory.getLogBase(request);
			HdkfSupportDesignChangeDTO dto = service
					.queryHdkfSupportDesignChangeByPrimaryKey(id);

			request.setAttribute("hdkfSupportDesignChangeDTO", dto);
		}
		else{
				String arr[]=	id.split(",");
				String infoCardNo= arr[0];
				String designFlag= arr[1];
				String outCardId =arr[2];
				String afterChangeFlag="Y";
				if(designFlag.equals("Y"))
					afterChangeFlag="N";
				mav.addObject("infoCardNo",infoCardNo);
				mav.addObject("designFlag", designFlag);
				mav.addObject("afterChangeFlag",afterChangeFlag);
				mav.addObject("outCardId", outCardId);
		}
		
		
		
		mav.setViewName("avicit/hdkf/support/hdkfsupportdesignchange/"
				+ "HdkfSupportDesignChange" + type);
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
	public ModelAndView toSaveHdkfSupportDesignChangeDTO(
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String jsonData = ServletRequestUtils.getStringParameter(request,
				"data", "");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			HdkfSupportDesignChangeDTO hdkfSupportDesignChangeDTO = JsonHelper
					.getInstance().readValue(jsonData, dateFormat,
							new TypeReference<HdkfSupportDesignChangeDTO>() {
							});
			
			String  outCardId = hdkfSupportDesignChangeDTO.getAttribute01();
			HdkfSupportOutfieldCardDTO dto = hdkfSupportOutfieldCardService.queryHdkfSupportOutfieldCardByPrimaryKey(outCardId);
			dto.setAttribute01(hdkfSupportDesignChangeDTO.getAfterFlag());
			dto.setAttribute11(dto.getAttribute11()+1);
			hdkfSupportOutfieldCardService.updateHdkfSupportOutfieldCardSensitive(dto);
			
			if ("".equals(hdkfSupportDesignChangeDTO.getId())) {// 新增
				service.insertHdkfSupportDesignChange(hdkfSupportDesignChangeDTO);
			} else {// 修改
				service.updateHdkfSupportDesignChangeSensitive(hdkfSupportDesignChangeDTO);
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
	public ModelAndView toDeleteHdkfSupportDesignChangeDTO(
			@RequestBody String[] ids, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			// LogBase logBase = LogBaseFactory.getLogBase( request);
			service.deleteHdkfSupportDesignChangeByIds(ids);
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
