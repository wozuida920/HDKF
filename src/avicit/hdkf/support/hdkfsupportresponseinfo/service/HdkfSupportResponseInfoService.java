package avicit.hdkf.support.hdkfsupportresponseinfo.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.fasterxml.jackson.core.type.TypeReference;

import avicit.platform6.bpm.api.ProcessEngine;
import avicit.platform6.bpmclient.bpm.service.BpmOperateService;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.commons.utils.JsonUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.hdkf.support.hdkfsupportdealbykf.dto.HdkfSupportDealByKfDTO;
import avicit.hdkf.support.hdkfsupportresponseinfo.dto.HdkfSupportResponseInfoDTO;
import avicit.hdkf.support.hdkfsupportresponseinfo.dao.HdkfSupportResponseInfoDao;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname: HdkfSupportResponseInfoService
 * @description: 定义HDKF_SUPPORT_RESPONSE_INFO实现类
 * @author: AVICIT DEV
 */
@Service
public class HdkfSupportResponseInfoService implements Serializable {

	private static final Logger logger = LoggerFactory
			.getLogger(HdkfSupportResponseInfoService.class);

	@Autowired
	private BpmOperateService bpmOperateService;

	private static final long serialVersionUID = 1L;

	// @Autowired
	// private SysLogUtil sysLogUtil;

	@Autowired
	private HdkfSupportResponseInfoDao dao;

	// 修改流程变量api
	@Autowired
	private ProcessEngine processEngine;

	/**
	 * 按条件分页查询
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportResponseInfoDTO> searchHdkfSupportResponseInfoByPage(
			QueryReqBean<HdkfSupportResponseInfoDTO> queryReqBean,
			String sfnConditions) throws Exception {
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportResponseInfoDTO searchParams = queryReqBean
					.getSearchParams();
			SelfDefinedQuery sdc = new SelfDefinedQuery(sfnConditions, "t1");
			Page<HdkfSupportResponseInfoDTO> dataList = dao
					.searchHdkfSupportResponseInfoByPage(searchParams,
							sdc.parseSql());
			QueryRespBean<HdkfSupportResponseInfoDTO> queryRespBean = new QueryRespBean<HdkfSupportResponseInfoDTO>();

			/**
			 * for(DemoBusinessFlowR3DTO dto : dataList.getResult()){
			 * Map<String, String> map =
			 * bpmOperateService.getActivitynamesByFormid(dto.getId());
			 * dto.setActivityalias_(map.get("activityalias_"));
			 * dto.setBusinessstate_
			 * (processStateCode2StateName(map.get("businessstate_"))); }
			 */
			for (HdkfSupportResponseInfoDTO dto : dataList.getResult()) {
				dto.setBusinessstate_(processStateCode2StateName(dto
						.getBusinessstate_()));
			}
			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (DaoException e) {
			logger.error("searchHdkfSupportResponseInfoByPaging出错：", e);
			throw e;
		}
	}

	/**
	 * 流程的编码转换成名称
	 * 
	 * @param stateCode
	 * @return
	 */
	private String processStateCode2StateName(String stateCode) {
		String stateName = "";
		if (stateCode != null && stateCode.equals("active")) {
			stateName = "流转中";
		} else if (stateCode != null && stateCode.equals("ended")) {
			stateName = "结束";
		} else if (stateCode != null && stateCode.equals("start")) {
			stateName = "草稿";
		}
		return stateName;
	}

	/**
	 * 按条件查询，不分页
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfSupportResponseInfoDTO> searchHdkfSupportResponseInfo(
			QueryReqBean<HdkfSupportResponseInfoDTO> queryReqBean)
			throws Exception {
		try {
			HdkfSupportResponseInfoDTO searchParams = queryReqBean
					.getSearchParams();
			List<HdkfSupportResponseInfoDTO> dataList = dao
					.searchHdkfSupportResponseInfo(searchParams);
			return dataList;
		} catch (Exception e) {
			logger.error("searchHdkfSupportResponseInfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 通过主键查询单条记录
	 * 
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public HdkfSupportResponseInfoDTO queryHdkfSupportResponseInfoByPrimaryKey(
			String id) throws Exception {
		try {
			HdkfSupportResponseInfoDTO dto = dao
					.findHdkfSupportResponseInfoById(id);
			// 记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		} catch (Exception e) {
			logger.error("searchHdkfSupportResponseInfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 新增并启动流程
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertHdkfSupportResponseInfo(HdkfSupportResponseInfoDTO dto)
			throws Exception {
		try {
			String id = dto.getId();
			if (id == null || id.equals("")) {
				id = ComUtil.getId();
				dto.setId(id);
			}
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportResponseInfo(dto);
			// 记录日志
			SysLogUtil.log4Insert(dto);
			return dto.getId();
		} catch (Exception e) {
			logger.error("insertHdkfSupportResponseInfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 修改对象全部字段
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfSupportResponseInfo(HdkfSupportResponseInfoDTO dto)
			throws Exception {
		try {
			// 记录日志
			HdkfSupportResponseInfoDTO old = findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto, true);
			int ret = dao.updateHdkfSupportResponseInfoAll(old);
			if (ret == 0) {
				throw new DaoException("数据失效，请从新更新");
			}
			return ret;
		} catch (Exception e) {
			logger.error("updateDemoBusinessFlow出错：", e);
			throw new DaoException("", e);
		}

	}

	/**
	 * 修改对象部分字段
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfSupportResponseInfoSensitive(
			HdkfSupportResponseInfoDTO dto) throws Exception {
		try {
			// 记录日志
			HdkfSupportResponseInfoDTO old = findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto, true);
			int ret = dao.updateHdkfSupportResponseInfoSensitive(old);
			
			//更新流程变量
			HdkfSupportResponseInfoDTO  nows = findById(dto.getId());
			String executionId = bpmOperateService.getInstanceIdByFormid(dto.getId());
			if(executionId != null && !"".equals(executionId)){
				String jsonStr = JsonHelper.getInstance().writeValueAsString(old);
				Map<String, Object> VariableMap = JsonHelper.getInstance().readValue(jsonStr,new TypeReference<Map<String,Object>>(){});
				
				processEngine.getExecutionService().setVariable(executionId,"respNo",nows.getRespNo());
				//processEngine.getExecutionService().setVariable(executionId,"isOutfield",nows.getIsOutfield());
				//processEngine.getExecutionService().setVariable(executionId,"isOutfield",nows.getIsOutfield());
			}
			
			if (ret == 0) {
				throw new DaoException("数据失效，请从新更新");
			}
			return ret;
		} catch (Exception e) {
			logger.error("updateDemoBusinessFlow出错：", e);
			throw new DaoException("", e);
		}

	}

	/**
	 * 按主键单条删除
	 * 
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportResponseInfoById(String id) throws Exception {
		if (StringUtils.isEmpty(id))
			throw new Exception("删除失败！传入的参数主键为null");
		try {
			// 记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportResponseInfoById(id);
		} catch (Exception e) {
			logger.error("deleteHdkfSupportResponseInfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 批量删除数据
	 * 
	 * @param ids
	 *            id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportResponseInfoByIds(String[] ids)
			throws Exception {
		int result = 0;
		for (String id : ids) {
			deleteHdkfSupportResponseInfoById(id);
			String flowInstanceId = bpmOperateService.getInstanceIdByFormid(id);
			if (flowInstanceId != null && !"".equals(flowInstanceId)) {
				bpmOperateService.deleteProcessInstanceCascade(flowInstanceId);
			}
			result++;
		}
		return result;
	}

	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	public HdkfSupportResponseInfoDTO findById(String id) throws Exception {
		try {
			HdkfSupportResponseInfoDTO dto = dao
					.findHdkfSupportResponseInfoById(id);
			return dto;
		} catch (DaoException e) {
			logger.error("findHdkfSupportResponseInfo出错：", e);
			throw e;
		}
	}

	/**
	 * 保存表单并启动流程
	 * 
	 * @param bean
	 *            表单对象
	 * @param parameter
	 *            启动流程所需要的参数
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BeanProcess insertHdkfSupportResponseInfoAndStartProcess(
			HdkfSupportResponseInfoDTO bean, Map<String, Object> parameter)
			throws Exception {
		Assert.notNull(parameter, "启动流程失败，请传递流程启动参数！");
		String processDefId = (String) parameter.get("processDefId");
		String formCode = (String) parameter.get("formCode");
		String jsonString = (String) parameter.get("jsonString");
		String userId = (String) parameter.get("userId");
		String deptId = (String) parameter.get("deptId");
		String processInstanceId = null; // 流程实例ID
		String taskUrl = ""; // 待办url
		Assert.hasText(processDefId, "启动流程失败，请传递流程启动参数！");
		// 业务操作
		String formId = this.insertHdkfSupportResponseInfo(bean);
		//
		Map<String, Object> variables = new HashMap<String, Object>();
		// web表单传递过来(除表单对象外)的变量，可以为空
		if (jsonString != null && !jsonString.equals("")) {
			Map<String, Object> extVariables = JsonUtil
					.parseJSON2Map((String) jsonString);
			variables.putAll(extVariables);
		}
		// 把表单对象转换成map,传递给流程变量
		Map<String, Object> pojoMap = (Map<String, Object>) PojoUtil
				.toMap(bean);
		variables.putAll(pojoMap);

		processInstanceId = bpmOperateService.startProcessInstanceById(
				processDefId, formCode, userId, deptId, variables);
		// 取待办URL，如果不需要直接打开可以注释以下代码//
		taskUrl = bpmOperateService.getTaskUrl(
				String.valueOf(processInstanceId), "");

		// 返回对象
		BeanProcess bp = new BeanProcess();
		bp.setFormId(formId);
		bp.setProcessInstanceId(processInstanceId);
		bp.setTaskUrl(taskUrl);
		return bp;
	}
}
