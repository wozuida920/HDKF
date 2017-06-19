package avicit.hdkf.esnotice.hdkfesnoticeinfo.service;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.runtime.DotClass;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import avicit.platform6.modules.system.sysfileupload.service.SwfUploadService;
import org.springframework.util.Assert;

import avicit.platform6.bpm.pvm.internal.svc.BpmTools;
import avicit.platform6.bpm.web.service.BpmOperateService;
import avicit.platform6.commons.utils.JsonUtil;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.hdkf.esnotice.hdkfesnoticeinfo.dao.HdkfEsNoticeinfoDao;
import avicit.hdkf.esnotice.hdkfesnoticeinfo.dto.HdkfEsNoticeinfoDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;
/**
 * @classname:  HdkfEsNoticeinfoService
 * @description: 定义 技术通报详细信息表实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfEsNoticeinfoService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfEsNoticeinfoService.class);
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private BpmOperateService bpmOperateService;
	
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfEsNoticeinfoDao dao;

	@Autowired
	private SwfUploadService sysAttachmentAPI;
	public void setCountNo(HdkfEsNoticeinfoDTO dto){
		  String countBatchNo = dao.findCsmpEsNoticeinfoDetailByIdCountBatchNo(dto.getId());
		   if(countBatchNo != null && !"".equals(countBatchNo)){
			   dto.setCountBatchNo(countBatchNo);
		   }else{
			   dto.setCountBatchNo("");
		   }
		  //获取已经执行的批架次总数	
		   String countImplement = dao.findCsmpEsNoticeinfoDetailByIdCountNameYesNo(dto.getId());
		   if(countImplement != null && !"".equals(countImplement)){
			   dto.setCountImplement(countImplement);
		   }else{
			   dto.setCountImplement("");
		   }
	}
	/**
	 * 是否实施分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfEsNoticeinfoDTO> searchHdkfEsNoticeinfoImplementByPage(QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfEsNoticeinfoDTO> dataList =  dao.searchHdkfEsNoticeinfoByPage(searchParams, sdc.parseSql());
			for(HdkfEsNoticeinfoDTO dto:dataList.getResult()){
				//获取批架次的分组总数	
				   String countBatchNo = dao.findCsmpEsNoticeinfoDetailByIdCountBatchNo(dto.getId());
				   if(countBatchNo != null && !"".equals(countBatchNo)){
					   dto.setCountBatchNo(countBatchNo);
				   }else{
					   dto.setCountBatchNo("");
				   }
				  //获取已经执行的批架次总数	
				   String countImplement = dao.findCsmpEsNoticeinfoDetailByIdCountNameYesNo(dto.getId());
				   if(countImplement != null && !"".equals(countImplement)){
					   dto.setCountImplement(countImplement);
				   }else{
					   dto.setCountImplement("");
				   }
				   
				   
			}
			
			
			
			QueryRespBean<HdkfEsNoticeinfoDTO> queryRespBean =new QueryRespBean<HdkfEsNoticeinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfEsNoticeinfoByPaging出错：", e);
			throw e;
		}
	}
	
	/**
	 * 全流程查看查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfEsNoticeinfoDTO> searchHdkfEsNoticeinfoWholeByPage(QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfEsNoticeinfoDTO> dataList =  dao.searchHdkfEsNoticeinfoAscByPage(searchParams, sdc.parseSql());
			for(HdkfEsNoticeinfoDTO dto:dataList.getResult()){
				//获取批架次的分组总数	
				   String countBatchNo = dao.findCsmpEsNoticeinfoDetailByIdCountBatchNo(dto.getId());
				   if(countBatchNo != null && !"".equals(countBatchNo)){
					   dto.setCountBatchNo(countBatchNo);
				   }else{
					   dto.setCountBatchNo("");
				   }
				  //获取已经执行的批架次总数	
				   String countImplement = dao.findCsmpEsNoticeinfoDetailByIdCountNameYesNo(dto.getId());
				   if(countImplement != null && !"".equals(countImplement)){
					   dto.setCountImplement(countImplement);
				   }else{
					   dto.setCountImplement("");
				   }
				   if(dto.getBusinessstate_()!=null&&!dto.getBusinessstate_().equals("ended")){
					   dto.setCurStatus("编制");
					   dto.setCurProcess(BpmTools.processStateCode2StateName(dto
								.getBusinessstate_()));
				   }else if(!countImplement.equals("0")&&!countImplement.equals("")){
					   if(countImplement.equals(countBatchNo)){
						   dto.setCurStatus("已落实");
						   dto.setCurProcess("全部完成");
					   }else {
						   dto.setCurStatus("执行中");
						   dto.setCurProcess("部分完成");
					}
				   }else if(countImplement.equals("")||countImplement.equals("0")){
					   if(dto.getForwardNo()!=null&&!dto.getForwardNo().equals("")){
						   dto.setCurStatus("跟踪");
						   dto.setCurProcess("已转发");
					   }else   if(dto.getReplyNo()!=null&&!dto.getReplyNo().equals("")){
						   dto.setCurStatus("跟踪");
						   dto.setCurProcess("已批复");
					   }else   if(dto.getReportNo()!=null&&!dto.getReportNo().equals("")){
						   dto.setCurStatus("跟踪");
						   dto.setCurProcess("已上报");
					   }
				   }
				   
				   if(dto.getBusinessstate_()!=null&&dto.getBusinessstate_().equals("ended")&&dto.getCurStatus()==null){
					   dto.setCurStatus("编制");
					   dto.setCurProcess("结束");
				   }
				   
			}
			
			
			
			QueryRespBean<HdkfEsNoticeinfoDTO> queryRespBean =new QueryRespBean<HdkfEsNoticeinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfEsNoticeinfoByPaging出错：", e);
			throw e;
		}
	}
	
	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfEsNoticeinfoDTO> searchHdkfEsNoticeinfoByPage(QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfEsNoticeinfoDTO> dataList =  dao.searchHdkfEsNoticeinfoByPage(searchParams, sdc.parseSql());
			for(HdkfEsNoticeinfoDTO dto:dataList.getResult()){
				//获取批架次的分组总数	
				   String countBatchNo = dao.findCsmpEsNoticeinfoDetailByIdCountBatchNo(dto.getId());
				   if(countBatchNo != null && !"".equals(countBatchNo)){
					   dto.setCountBatchNo(countBatchNo);
				   }else{
					   dto.setCountBatchNo("");
				   }
				  //获取用户的分组总数	
				   String countName = dao.findCsmpEsNoticeinfoDetailByIdCountName(dto.getId());
				   if(countName != null && !"".equals(countName)){
					   dto.setCountName(countName);
				   }else{
					   dto.setCountName("");
				   }
			}
			
			
			
			QueryRespBean<HdkfEsNoticeinfoDTO> queryRespBean =new QueryRespBean<HdkfEsNoticeinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfEsNoticeinfoByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 通过主键查询单条记录
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public HdkfEsNoticeinfoDTO queryHdkfEsNoticeinfoByPrimaryKey(String id) throws Exception {
		try{
			HdkfEsNoticeinfoDTO dto = dao.findHdkfEsNoticeinfoById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
			logger.error("searchHdkfEsNoticeinfo出错：", e);
			throw new DaoException("",e);
		}
	}
	/**
	 * 通过通报编号查询单条记录
	 * @param bulletinNo
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public HdkfEsNoticeinfoDTO queryHdkfEsNoticeinfoByBullitenNo(String bullitenNo) throws Exception {
		try{
			HdkfEsNoticeinfoDTO dto = dao.findHdkfEsNoticeinfoByBulletinNo(bullitenNo);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
			logger.error("searchHdkfEsNoticeinfo出错：", e);
			throw new DaoException("",e);
		}
	}
 	/**
	 * 新增对象
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertHdkfEsNoticeinfo(HdkfEsNoticeinfoDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfEsNoticeinfo(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfEsNoticeinfo出错：", e);
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
	public int updateHdkfEsNoticeinfo(HdkfEsNoticeinfoDTO dto) throws Exception {
			//记录日志
			HdkfEsNoticeinfoDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfEsNoticeinfoAll(old);
			if(ret ==0){
				throw new DaoException("数据失效，请从新更新");
			}
			return ret;
	}
	/**
	 * 修改对象部分字段
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfEsNoticeinfoSensitive(HdkfEsNoticeinfoDTO dto) throws Exception {
		try{
			//记录日志
			HdkfEsNoticeinfoDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateHdkfEsNoticeinfoSensitive(old);
			if(count ==0){
				throw new DaoException("数据失效，请从新更新");
			}
			return count;
		}catch(Exception e){
			logger.error("searchDemoBusinessTrip出错：", e);
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
	public int deleteHdkfEsNoticeinfoById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfEsNoticeinfoById(id);
		}catch(Exception e){
			logger.error("deleteHdkfEsNoticeinfo出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfEsNoticeinfoByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			sysAttachmentAPI.deleteAttachByFormId(id);
			deleteHdkfEsNoticeinfoById(id);
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
	private HdkfEsNoticeinfoDTO findById(String id) throws Exception {
		try{
			HdkfEsNoticeinfoDTO dto = dao.findHdkfEsNoticeinfoById(id);
			return dto;
		}catch(DaoException e){
				logger.error("findHdkfEsNoticeinfo出错：", e);
				throw e;
		}
	}
	
	public BeanProcess insertHdkfEsNoticeinfoStartProcess(
			HdkfEsNoticeinfoDTO bean, Map<String, Object> parameter) throws Exception {
		Assert.notNull(parameter, "启动流程失败，请传递流程启动参数！");
		String processDefId = (String)parameter.get("processDefId");
		String formCode = (String)parameter.get("formCode");
		String jsonString = (String)parameter.get("jsonString");
		String userId = (String)parameter.get("userId");
		String deptId = (String)parameter.get("deptId");
		String processInstanceId = null; //流程实例ID
		String taskUrl = ""; //待办url
		Assert.hasText(processDefId, "启动流程失败，请传递流程启动参数！");
		String formId = bean.getId();
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
	
	
	/**
	 * 根据主表Id查询数据
	 * 2016-6-28
	 * @param id
	 * @return
	 * TODO
	 * Administrator
	 */
	public HdkfEsNoticeinfoDTO queryHdkfEsNoticeinfoTrackReportByPrimaryId(String id) throws Exception{
		try{
			HdkfEsNoticeinfoDTO dto = dao.findHdkfEsNoticeinfoById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("queryHdkfEsNoticeinfoByPrimaryId出错：", e);
	    		throw e;
	    }
	}
		
	
	
}

