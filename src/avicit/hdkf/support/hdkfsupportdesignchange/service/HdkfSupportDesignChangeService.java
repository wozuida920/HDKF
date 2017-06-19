package avicit.hdkf.support.hdkfsupportdesignchange.service;
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
import avicit.hdkf.support.hdkfsupportdesignchange.dao.HdkfSupportDesignChangeDao;
import avicit.hdkf.support.hdkfsupportdesignchange.dto.HdkfSupportDesignChangeDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportDesignChangeService
 * @description: 定义 HDKF_SUPPORT_DESIGN_CHANGE实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportDesignChangeService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportDesignChangeService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfSupportDesignChangeDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportDesignChangeDTO> searchHdkfSupportDesignChangeByPage(QueryReqBean<HdkfSupportDesignChangeDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportDesignChangeDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfSupportDesignChangeDTO> dataList =  dao.searchHdkfSupportDesignChangeByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportDesignChangeDTO> queryRespBean =new QueryRespBean<HdkfSupportDesignChangeDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportDesignChangeByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfSupportDesignChangeDTO> searchHdkfSupportDesignChange(QueryReqBean<HdkfSupportDesignChangeDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfSupportDesignChangeDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfSupportDesignChangeDTO> dataList = dao.searchHdkfSupportDesignChange(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfSupportDesignChange出错：", e);
	    	throw new DaoException(e.getMessage(),e);
	    }
    }
	/**
	 * 通过主键查询单条记录
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public HdkfSupportDesignChangeDTO queryHdkfSupportDesignChangeByPrimaryKey(String id) throws Exception {
		try{
			HdkfSupportDesignChangeDTO dto = dao.findHdkfSupportDesignChangeById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfSupportDesignChange出错：", e);
	    	throw new DaoException(e.getMessage(),e);
	    }
	}

	/**
	 * 新增对象
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertHdkfSupportDesignChange(HdkfSupportDesignChangeDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfSupportDesignChange(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfSupportDesignChange出错：", e);
			throw new DaoException(e.getMessage(),e);
		}
	}
	/**
	 * 修改对象全部字段
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfSupportDesignChange(HdkfSupportDesignChangeDTO dto) throws Exception {
			//记录日志
			HdkfSupportDesignChangeDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportDesignChangeAll(old);
			if(ret ==0){
				throw new DaoException("数据失效，请重新更新");
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
	public int updateHdkfSupportDesignChangeSensitive(HdkfSupportDesignChangeDTO dto) throws Exception {
		try{
			//记录日志
			HdkfSupportDesignChangeDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateHdkfSupportDesignChangeSensitive(old);
			if(count ==0){
				throw new DaoException("数据失效，请重新更新");
			}
			return count;
		}catch(Exception e){
			logger.error("searchDemoBusinessTrip出错：", e);
			throw new DaoException(e.getMessage(),e);
		}

	}
	
	/**
	 * 按主键单条删除
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportDesignChangeById(String id) throws Exception {
		if(StringUtils.isEmpty(id)){
		   throw new Exception("删除失败！传入的参数主键为null");
		   }
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportDesignChangeById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportDesignChange出错：", e);
			throw new DaoException(e.getMessage(),e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportDesignChangeByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportDesignChangeById(id);
			result++;
		}
		return result;
	}
		
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfSupportDesignChangeDTO findById(String id) throws Exception {
		try{
			HdkfSupportDesignChangeDTO dto = dao.findHdkfSupportDesignChangeById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportDesignChange出错：", e);
	    		throw e;
	    }
	}
		

}

