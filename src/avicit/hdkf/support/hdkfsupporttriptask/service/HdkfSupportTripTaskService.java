package avicit.hdkf.support.hdkfsupporttriptask.service;
import java.io.Serializable;
import java.util.ArrayList;
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
import avicit.hdkf.support.hdkfsupportpersondetail.dto.HdkfSupportPersonDetailDTO;
import avicit.hdkf.support.hdkfsupportrequestinfo.dto.HdkfSupportRequestInfoDTO;
import avicit.hdkf.support.hdkfsupporttaskarchive.dao.HdkfSupportTaskArchiveDao;
import avicit.hdkf.support.hdkfsupporttaskarchive.dto.HdkfSupportTaskArchiveDTO;
import avicit.hdkf.support.hdkfsupporttriptask.dto.HdkfSupportTripTaskDTO;
import avicit.hdkf.support.hdkfsupporttriptask.dao.HdkfSupportTripTaskDao;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportTripTaskService
 * @description: 定义HDKF_SUPPORT_TRIP_TASK实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportTripTaskService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportTripTaskService.class);
	
	@Autowired
	private BpmOperateService bpmOperateService;
	@Autowired
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfSupportTripTaskDao dao;
	@Autowired
	private HdkfSupportTaskArchiveDao daotask;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportTripTaskDTO> searchHdkfSupportTripTaskByPage(QueryReqBean<HdkfSupportTripTaskDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportTripTaskDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfSupportTripTaskDTO> dataList =  dao.searchHdkfSupportTripTaskByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportTripTaskDTO> queryRespBean =new QueryRespBean<HdkfSupportTripTaskDTO>();

			/**
			for(DemoBusinessFlowR3DTO dto : dataList.getResult()){
				Map<String, String> map = bpmOperateService.getActivitynamesByFormid(dto.getId());
				dto.setActivityalias_(map.get("activityalias_"));
				dto.setBusinessstate_(processStateCode2StateName(map.get("businessstate_")));
			}
			*/
			for(HdkfSupportTripTaskDTO dto : dataList.getResult()){
				dto.setBusinessstate_(processStateCode2StateName(dto.getBusinessstate_()));
			}
			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportTripTaskByPaging出错：", e);
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
	public List<HdkfSupportTripTaskDTO> searchHdkfSupportTripTask(QueryReqBean<HdkfSupportTripTaskDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfSupportTripTaskDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfSupportTripTaskDTO> dataList = dao.searchHdkfSupportTripTask(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfSupportTripTask出错：", e);
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
	public HdkfSupportTripTaskDTO queryHdkfSupportTripTaskByPrimaryKey(String id) throws Exception {
		try{
			HdkfSupportTripTaskDTO dto = dao.findHdkfSupportTripTaskById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfSupportTripTask出错：", e);
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
	public String insertHdkfSupportTripTask(HdkfSupportTripTaskDTO dto) throws Exception {
		try{
			//String id = ComUtil.getId();
			//dto.setId(id);
			
			String id = dto.getId();
			if(id==null||id.equals(""))
			{  id = ComUtil.getId();
			   dto.setId(id);
			}
			
			
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportTripTask(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfSupportTripTask出错：", e);
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
	public int updateHdkfSupportTripTask(HdkfSupportTripTaskDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportTripTaskDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto,old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportTripTaskAll(old);
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
	public int updateHdkfSupportTripTaskSensitive(HdkfSupportTripTaskDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportTripTaskDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportTripTaskSensitive(old);
			

			//更新流程变量
			HdkfSupportTripTaskDTO  nows = findById(dto.getId());
			String executionId = bpmOperateService.getInstanceIdByFormid(dto.getId());
			if(executionId != null && !"".equals(executionId)){
				String jsonStr = JsonHelper.getInstance().writeValueAsString(old);
				Map<String,Object> VariableMap = JsonHelper.getInstance().readValue(jsonStr,new TypeReference<Map<String,Object>>(){});
				processEngine.getExecutionService().setVariable(executionId,"taskNo",nows.getTaskNo());
				processEngine.getExecutionService().setVariable(executionId,"isBorrowSomeone",nows.getIsBorrowSomeone());
				//System.out.println("isBorrowSomeone------>"+nows.getIsBorrowSomeone());
				processEngine.getExecutionService().setVariable(executionId,"noticeTime",nows.getNoticeTime());
				processEngine.getExecutionService().setVariable(executionId,"tripStartTime",nows.getTripStartTime());
				
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
	public int deleteHdkfSupportTripTaskById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportTripTaskById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportTripTask出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportTripTaskByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportTripTaskById(id);
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
	private HdkfSupportTripTaskDTO findById(String id) throws Exception {
		try{
			HdkfSupportTripTaskDTO dto = dao.findHdkfSupportTripTaskById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportTripTask出错：", e);
	    		throw e;
	    }
	}
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	public HdkfSupportTripTaskDTO findDtoById(String id) throws Exception {
		try{
			HdkfSupportTripTaskDTO dto = dao.findHdkfSupportTripTaskById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportTripTask出错：", e);
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
	public BeanProcess insertHdkfSupportTripTaskAndStartProcess(HdkfSupportTripTaskDTO bean, Map<String, Object> parameter) throws Exception{
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
		String formId = this.insertHdkfSupportTripTask(bean);
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

/*	//获取 相关流程

	public List<String> searchData(String taskNo) throws Exception{
		try{
			HdkfSupportTaskArchiveDTO searchParams = new HdkfSupportTaskArchiveDTO();
			searchParams.setTaskNo(taskNo);
			List<HdkfSupportTaskArchiveDTO> dtotaskList=daotask.searchHdkfSupportTaskArchive(searchParams);
			HdkfSupportTaskArchiveDTO dtotask=new HdkfSupportTaskArchiveDTO();
			dtotask=dtotaskList.get(0);
			String attribute01=dtotask.getAttribute01();
			String attribute02=dtotask.getAttribute02();
			List<String> listattribute=new ArrayList<String>();
			listattribute.add(attribute01);
			listattribute.add(attribute02);
			return listattribute;
		}
		catch (DaoException e) {
			logger.error("findHdkfBdCodeRule出错：", e);
			throw e;
		}
	}*/
	
}

