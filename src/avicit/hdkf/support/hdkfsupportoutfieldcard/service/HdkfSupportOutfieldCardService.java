package avicit.hdkf.support.hdkfsupportoutfieldcard.service;
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

import avicit.platform6.bpmclient.bpm.service.BpmOperateService;
import avicit.platform6.commons.utils.ComUtil;
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
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dao.HdkfSupportOutfieldCardDao;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportOutfieldCardService
 * @description: 定义HDKF_SUPPORT_OUTFIELD_CARD实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportOutfieldCardService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportOutfieldCardService.class);
	
	@Autowired
	private BpmOperateService bpmOperateService;
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfSupportOutfieldCardDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportOutfieldCardDTO> searchHdkfSupportOutfieldCardByPage(QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportOutfieldCardDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfSupportOutfieldCardDTO> dataList =  dao.searchHdkfSupportOutfieldCardByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportOutfieldCardDTO> queryRespBean =new QueryRespBean<HdkfSupportOutfieldCardDTO>();

			/**
			for(DemoBusinessFlowR3DTO dto : dataList.getResult()){
				Map<String, String> map = bpmOperateService.getActivitynamesByFormid(dto.getId());
				dto.setActivityalias_(map.get("activityalias_"));
				dto.setBusinessstate_(processStateCode2StateName(map.get("businessstate_")));
			}
			*/
			for(HdkfSupportOutfieldCardDTO dto : dataList.getResult()){
				dto.setBusinessstate_(processStateCode2StateName(dto.getBusinessstate_()));
			}
			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportOutfieldCardByPaging出错：", e);
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
	public List<HdkfSupportOutfieldCardDTO> searchHdkfSupportOutfieldCard(QueryReqBean<HdkfSupportOutfieldCardDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfSupportOutfieldCardDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfSupportOutfieldCardDTO> dataList = dao.searchHdkfSupportOutfieldCard(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfSupportOutfieldCard出错：", e);
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
	public HdkfSupportOutfieldCardDTO queryHdkfSupportOutfieldCardByPrimaryKey(String id) throws Exception {
		try{
			HdkfSupportOutfieldCardDTO dto = dao.findHdkfSupportOutfieldCardById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfSupportOutfieldCard出错：", e);
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
	public String insertHdkfSupportOutfieldCard(HdkfSupportOutfieldCardDTO dto) throws Exception {
		try{
			String id = dto.getId();
			if(dto.getId()==null||dto.getId().equals(""))
			{  id = ComUtil.getId();
			   dto.setId(id);
			}
			
			
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportOutfieldCard(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return dto.getId();
		}catch(Exception e){
			logger.error("insertHdkfSupportOutfieldCard出错：", e);
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
	public int updateHdkfSupportOutfieldCard(HdkfSupportOutfieldCardDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportOutfieldCardDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto,old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportOutfieldCardAll(old);
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
	 * 修改对象部分字段
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfSupportOutfieldCardSensitive(HdkfSupportOutfieldCardDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportOutfieldCardDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportOutfieldCardSensitive(old);
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
	public int deleteHdkfSupportOutfieldCardById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportOutfieldCardById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportOutfieldCard出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportOutfieldCardByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportOutfieldCardById(id);
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
	private HdkfSupportOutfieldCardDTO findById(String id) throws Exception {
		try{
			HdkfSupportOutfieldCardDTO dto = dao.findHdkfSupportOutfieldCardById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportOutfieldCard出错：", e);
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
	public BeanProcess insertHdkfSupportOutfieldCardAndStartProcess(HdkfSupportOutfieldCardDTO bean, Map<String, Object> parameter) throws Exception{
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
		String formId = this.insertHdkfSupportOutfieldCard(bean);
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

		public boolean updateDesignNo(String[] ids) {
			// TODO Auto-generated method stub
			boolean noFlag=false;
			for(String o:ids){
				try {
					HdkfSupportOutfieldCardDTO dto = findById(o);
					String designNo= dao.getDesignNo(dto.getInfoCardNo());	
					if(designNo==null||designNo.equals(""))
						noFlag = true;
					dto.setAttribute04(designNo);
					updateHdkfSupportOutfieldCardSensitive(dto);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return  noFlag;
		}
}

