package avicit.hdkf.support.hdkfsupportdealbykf.service;
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
import avicit.hdkf.support.hdkfsupportdealbykf.dao.HdkfSupportDealByKfDao;
import avicit.hdkf.support.hdkfsupportrequestinfo.dto.HdkfSupportRequestInfoDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportDealByKfService
 * @description: 定义HDKF_SUPPORT_DEAL_BY_KF实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportDealByKfService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportDealByKfService.class);
	
	@Autowired
	private BpmOperateService bpmOperateService;
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfSupportDealByKfDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportDealByKfDTO> searchHdkfSupportDealByKfByPage(QueryReqBean<HdkfSupportDealByKfDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportDealByKfDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfSupportDealByKfDTO> dataList =  dao.searchHdkfSupportDealByKfByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportDealByKfDTO> queryRespBean =new QueryRespBean<HdkfSupportDealByKfDTO>();

			/**
			for(DemoBusinessFlowR3DTO dto : dataList.getResult()){
				Map<String, String> map = bpmOperateService.getActivitynamesByFormid(dto.getId());
				dto.setActivityalias_(map.get("activityalias_"));
				dto.setBusinessstate_(processStateCode2StateName(map.get("businessstate_")));
			}
			*/
			for(HdkfSupportDealByKfDTO dto : dataList.getResult()){
				dto.setBusinessstate_(processStateCode2StateName(dto.getBusinessstate_()));
			}
			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportDealByKfByPaging出错：", e);
			throw e;
		}
	}
	
	/**
	 * 流程的编码转换成名称
	 * @param stateCode
	 * @return
	 */
	private String processStateCode2StateName(String stateCode){
		String stateName = "";
		if(stateCode!=null&&stateCode.equals("active")){
			stateName = "流转中";
		}else if(stateCode!=null&&stateCode.equals("ended")){
			stateName = "结束";
		}else if(stateCode!=null&&stateCode.equals("start")){
			stateName = "草稿";
		}
		return stateName;
	}
	
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfSupportDealByKfDTO> searchHdkfSupportDealByKf(QueryReqBean<HdkfSupportDealByKfDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfSupportDealByKfDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfSupportDealByKfDTO> dataList = dao.searchHdkfSupportDealByKf(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfSupportDealByKf出错：", e);
	    	throw new DaoException("",e);
	    }
    }
	/**
	 * 通过主键查询单条记录
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public HdkfSupportDealByKfDTO queryHdkfSupportDealByKfByPrimaryKey(String id) throws Exception {
		try{
			HdkfSupportDealByKfDTO dto = dao.findHdkfSupportDealByKfById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfSupportDealByKf出错：", e);
	    	throw new DaoException("",e);
	    }
	}

	/**
	 * 新增并启动流程
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertHdkfSupportDealByKf(HdkfSupportDealByKfDTO dto) throws Exception {
		try{
			String id = dto.getId();
			if(dto.getId()==null||dto.getId().equals(""))
			{  id = ComUtil.getId();
			   dto.setId(id);
			}
			
			
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportDealByKf(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfSupportDealByKf出错：", e);
			throw new DaoException("",e);
		}
	}
	/**
	 * 修改对象全部字段
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfSupportDealByKf(HdkfSupportDealByKfDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportDealByKfDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto,old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportDealByKfAll(old);
			if(ret ==0){
				throw new DaoException("数据失效，请从新更新");
			}
			return ret;
		}catch(Exception e){
			logger.error("updateDemoBusinessFlow出错：", e);
			throw new DaoException("",e);
		}

	}
	//修改流程变量api
		@Autowired
		private ProcessEngine processEngine;
	/**
	 * 修改对象部分字段
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfSupportDealByKfSensitive(HdkfSupportDealByKfDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportDealByKfDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportDealByKfSensitive(old);
			

			//更新流程变量
			HdkfSupportDealByKfDTO  nows = findById(dto.getId());
			String executionId = bpmOperateService.getInstanceIdByFormid(dto.getId());
			if(executionId != null && !"".equals(executionId)){
				String jsonStr = JsonHelper.getInstance().writeValueAsString(old);
				Map<String,Object> VariableMap = JsonHelper.getInstance().readValue(jsonStr,new TypeReference<Map<String,Object>>(){});
				
				processEngine.getExecutionService().setVariable(executionId,"isOutfield",nows.getIsOutfield());
				processEngine.getExecutionService().setVariable(executionId,"dealName",nows.getDealName());
				processEngine.getExecutionService().setVariable(executionId,"isFax",nows.getAttribute01());
				//processEngine.getExecutionService().setVariable(executionId,"isOutfield",nows.getIsOutfield());
				//processEngine.getExecutionService().setVariable(executionId,"isOutfield",nows.getIsOutfield());
			}
			
			
			if(ret ==0){
				throw new DaoException("数据失效，请从新更新");
			}
			return ret;
		}catch(Exception e){
			logger.error("updateDemoBusinessFlow出错：", e);
			throw new DaoException("",e);
		}

	}
	
	/**
	 * 按主键单条删除
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportDealByKfById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportDealByKfById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportDealByKf出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportDealByKfByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportDealByKfById(id);
			String flowInstanceId = bpmOperateService.getInstanceIdByFormid(id);
			if(flowInstanceId != null && !"".equals(flowInstanceId)){
				bpmOperateService.deleteProcessInstanceCascade(flowInstanceId);
			}
			result++;
		}
		return result;
	}
		
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfSupportDealByKfDTO findById(String id) throws Exception {
		try{
			HdkfSupportDealByKfDTO dto = dao.findHdkfSupportDealByKfById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportDealByKf出错：", e);
	    		throw e;
	    }
	}
	
		/**
	 * 保存表单并启动流程
	 * @param bean 表单对象
	 * @param parameter 启动流程所需要的参数
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public BeanProcess insertHdkfSupportDealByKfAndStartProcess(HdkfSupportDealByKfDTO bean, Map<String, Object> parameter) throws Exception{
		Assert.notNull(parameter, "启动流程失败，请传递流程启动参数！");
		String processDefId = (String)parameter.get("processDefId");
		String formCode = (String)parameter.get("formCode");
		String jsonString = (String)parameter.get("jsonString");
		String userId = (String)parameter.get("userId");
		String deptId = (String)parameter.get("deptId");
		String processInstanceId = null; //流程实例ID
		String taskUrl = ""; //待办url
		Assert.hasText(processDefId, "启动流程失败，请传递流程启动参数！");
		//业务操作
		String formId = this.insertHdkfSupportDealByKf(bean);
		//
		Map<String, Object> variables = new HashMap<String, Object>();
		//web表单传递过来(除表单对象外)的变量，可以为空
		if(jsonString != null && !jsonString.equals("")){
			Map<String, Object> extVariables = JsonUtil.parseJSON2Map((String)jsonString);
			variables.putAll(extVariables);
		}
		//把表单对象转换成map,传递给流程变量
		Map<String, Object> pojoMap = (Map<String, Object>) PojoUtil.toMap(bean);
		variables.putAll(pojoMap);
		
		processInstanceId = bpmOperateService.startProcessInstanceById(processDefId, formCode, userId, deptId, variables);
		//取待办URL，如果不需要直接打开可以注释以下代码//
		taskUrl = bpmOperateService.getTaskUrl(String.valueOf(processInstanceId), "");
		
		//返回对象
		BeanProcess bp = new BeanProcess();
		bp.setFormId(formId);
		bp.setProcessInstanceId(processInstanceId);
		bp.setTaskUrl(taskUrl);
		return bp;
	}
	public HdkfSupportDealByKfDTO findDtoById(String id) throws Exception {
		try{
			HdkfSupportDealByKfDTO dto = dao.findHdkfSupportDealByKfById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportRequestInfo出错：", e);
	    		throw e;
	    }
	}
}

