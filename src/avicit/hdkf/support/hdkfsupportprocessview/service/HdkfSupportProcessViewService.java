package avicit.hdkf.support.hdkfsupportprocessview.service;
import java.io.Serializable;
import java.util.List;


import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
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
import avicit.hdkf.support.hdkfsupportfaultdetail.dto.HdkfSupportFaultDetailDTO;
import avicit.hdkf.support.hdkfsupportprocessview.dao.HdkfSupportProcessViewDao;
import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportProcessViewService
 * @description: 定义 HDKF_SUPPORT_PROCESS_VIEW实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportProcessViewService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportProcessViewService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfSupportProcessViewDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public HdkfSupportProcessViewDTO findDtoByTaskId(String taskId){
		QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean = new QueryReqBean<HdkfSupportProcessViewDTO>();
		HdkfSupportProcessViewDTO searchParams= new HdkfSupportProcessViewDTO();
		searchParams.setTaskId(taskId);
		queryReqBean.setSearchParams(searchParams);
		 try {
			QueryRespBean<HdkfSupportProcessViewDTO> respBean = searchHdkfSupportProcessViewByPage(queryReqBean, "");
			Page<HdkfSupportProcessViewDTO> page =    respBean.getResult();
			if(page.size()>0){
				return page.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return null;
	}
	
	public HdkfSupportProcessViewDTO findDtoByRequestId(String requestId){
		QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean = new QueryReqBean<HdkfSupportProcessViewDTO>();
		HdkfSupportProcessViewDTO searchParams= new HdkfSupportProcessViewDTO();
		searchParams.setRequestId(requestId);
		queryReqBean.setSearchParams(searchParams);
		 try {
			QueryRespBean<HdkfSupportProcessViewDTO> respBean = searchHdkfSupportProcessViewByPage(queryReqBean, "");
			Page<HdkfSupportProcessViewDTO> page =    respBean.getResult();
			if(page.size()>0){
				return page.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return null;
	}
	
	public QueryRespBean<HdkfSupportProcessViewDTO> searchHdkfSupportProcessViewByPage(QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportProcessViewDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfSupportProcessViewDTO> dataList =  dao.searchHdkfSupportProcessViewByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportProcessViewDTO> queryRespBean =new QueryRespBean<HdkfSupportProcessViewDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportProcessViewByPaging出错：", e);
			throw e;
		}
	}
	
	//查询出处理中
	public QueryRespBean<HdkfSupportProcessViewDTO> searchHdkfModelinfoDoingByPage(QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportProcessViewDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfSupportProcessViewDTO> dataList =  dao.searchHdkfModelinfoDoingByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportProcessViewDTO> queryRespBean =new QueryRespBean<HdkfSupportProcessViewDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportProcessViewByPaging出错：", e);
			throw e;
		}
	}
	
	
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfSupportProcessViewDTO> searchHdkfSupportProcessView(QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfSupportProcessViewDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfSupportProcessViewDTO> dataList = dao.searchHdkfSupportProcessView(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfSupportProcessView出错：", e);
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
	public HdkfSupportProcessViewDTO queryHdkfSupportProcessViewByPrimaryKey(String id) throws Exception {
		try{
			HdkfSupportProcessViewDTO dto = dao.findHdkfSupportProcessViewById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfSupportProcessView出错：", e);
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
	public String insertHdkfSupportProcessView(HdkfSupportProcessViewDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportProcessView(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfSupportProcessView出错：", e);
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
	public int updateHdkfSupportProcessView(HdkfSupportProcessViewDTO dto) throws Exception {
			//记录日志
			HdkfSupportProcessViewDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportProcessViewAll(old);
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
	public int updateHdkfSupportProcessViewSensitive(HdkfSupportProcessViewDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportProcessViewDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateHdkfSupportProcessViewSensitive(old);
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
	public int deleteHdkfSupportProcessViewById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportProcessViewById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportProcessView出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportProcessViewByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportProcessViewById(id);
			result++;
		}
		return result;
	}
		
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfSupportProcessViewDTO findById(String id) throws Exception {
		try{
			HdkfSupportProcessViewDTO dto = dao.findHdkfSupportProcessViewById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportProcessView出错：", e);
	    		throw e;
	    }
	}
	public List<HdkfSupportProcessViewDTO> seachHdkfModelinfoViewQuery(HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO) throws Exception {
		try{			
            List<HdkfSupportProcessViewDTO> dataList =  dao.seachModelinfoQuery(hdkfSupportProcessViewDTO);
			return dataList;
		}catch(DaoException e){
			logger.error("searchHdkfSupportProcessViewByPaging出错：", e);
			throw e;
		}
	}
	public List<HdkfSupportProcessViewDTO> seachHdkfModelinfoallViewQuery(HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO) throws Exception {
		try{			
            List<HdkfSupportProcessViewDTO> dataListall =  dao.seachModelinfoallQuery(hdkfSupportProcessViewDTO);
			return dataListall;
		}catch(DaoException e){
			logger.error("searchHdkfSupportProcessViewByPaging出错：", e);
			throw e;
		}
	}


/*	public List<HdkfSupportProcessViewDTO> seachHdkfModelinfoViewQuery(
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO) {
		// TODO Auto-generated method stub
		List<HdkfSupportProcessViewDTO> list = dao.seachModelinfoQuery(hdkfSupportProcessViewDTO);
		return list;
	}*/

	

}

