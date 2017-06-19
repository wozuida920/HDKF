package avicit.hdkf.support.hdkfsupportfaultdetail.service;
import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.hdkf.support.hdkfsupportfaultdetail.dao.HdkfSupportFaultDetailDao;
import avicit.hdkf.support.hdkfsupportfaultdetail.dto.HdkfSupportFaultDetailDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportFaultDetailService
 * @description: 定义 HDKF_SUPPORT_FAULT_DETAIL实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportFaultDetailService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportFaultDetailService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfSupportFaultDetailDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportFaultDetailDTO> searchHdkfSupportFaultDetailByPage(QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportFaultDetailDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfSupportFaultDetailDTO> dataList =  dao.searchHdkfSupportFaultDetailByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportFaultDetailDTO> queryRespBean =new QueryRespBean<HdkfSupportFaultDetailDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportFaultDetailByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfSupportFaultDetailDTO> searchHdkfSupportFaultDetail(QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfSupportFaultDetailDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfSupportFaultDetailDTO> dataList = dao.searchHdkfSupportFaultDetail(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfSupportFaultDetail出错：", e);
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
	public HdkfSupportFaultDetailDTO queryHdkfSupportFaultDetailByPrimaryKey(String id) throws Exception {
		try{
			HdkfSupportFaultDetailDTO dto = dao.findHdkfSupportFaultDetailById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfSupportFaultDetail出错：", e);
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
	public String insertHdkfSupportFaultDetail(HdkfSupportFaultDetailDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportFaultDetail(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfSupportFaultDetail出错：", e);
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
	public int updateHdkfSupportFaultDetail(HdkfSupportFaultDetailDTO dto) throws Exception {
			//记录日志
			HdkfSupportFaultDetailDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportFaultDetailAll(old);
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
	public int updateHdkfSupportFaultDetailSensitive(HdkfSupportFaultDetailDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportFaultDetailDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateHdkfSupportFaultDetailSensitive(old);
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
	public int deleteHdkfSupportFaultDetailById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportFaultDetailById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportFaultDetail出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportFaultDetailByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportFaultDetailById(id);
			result++;
		}
		return result;
	}
		
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfSupportFaultDetailDTO findById(String id) throws Exception {
		try{
			HdkfSupportFaultDetailDTO dto = dao.findHdkfSupportFaultDetailById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportFaultDetail出错：", e);
	    		throw e;
	    }
	}
	public List<HdkfSupportFaultDetailDTO> seachCsmpFmFaultreportToFlightModelQuery(
			HdkfSupportFaultDetailDTO dto) {
		List<HdkfSupportFaultDetailDTO> list = dao.seachCsmpFmFaultreportToFlightModelQuery(dto);
		// TODO Auto-generated method stub
		return list;
	}
	public QueryRespBean<HdkfSupportFaultDetailDTO> seachBatchNoQueryFormByPage(
			QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean)throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportFaultDetailDTO searchParams = queryReqBean.getSearchParams();

			Page<HdkfSupportFaultDetailDTO> dataList =  dao.seachBatchNoQueryFormByPage(searchParams);
			QueryRespBean<HdkfSupportFaultDetailDTO> queryRespBean =new QueryRespBean<HdkfSupportFaultDetailDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchDacPsSpecialprocessByPaging出错：", e);
			throw e;
		}
	}
	public List<HdkfSupportFaultDetailDTO> seachCsmpFmFaultreportToCustomerQuery(
			HdkfSupportFaultDetailDTO dto) {
		// TODO Auto-generated method stub
		List<HdkfSupportFaultDetailDTO> list = dao.seachCsmpFmFaultreportToCustomerQuery(dto);
		return list;
	}

}

