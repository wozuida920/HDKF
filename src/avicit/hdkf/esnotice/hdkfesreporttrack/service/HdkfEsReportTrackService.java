package avicit.hdkf.esnotice.hdkfesreporttrack.service;
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
import avicit.hdkf.esnotice.hdkfesreporttrack.dao.HdkfEsReportTrackDao;
import avicit.hdkf.esnotice.hdkfesreporttrack.dto.HdkfEsReportTrackDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfEsReportTrackService
 * @description: 定义 上报跟踪表实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfEsReportTrackService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfEsReportTrackService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private HdkfEsReportTrackDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfEsReportTrackDTO> searchHdkfEsReportTrackByPage(QueryReqBean<HdkfEsReportTrackDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsReportTrackDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfEsReportTrackDTO> dataList =  dao.searchHdkfEsReportTrackByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfEsReportTrackDTO> queryRespBean =new QueryRespBean<HdkfEsReportTrackDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfEsReportTrackByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfEsReportTrackDTO> searchHdkfEsReportTrack(QueryReqBean<HdkfEsReportTrackDTO> queryReqBean) throws Exception {
	    try{
	    	HdkfEsReportTrackDTO searchParams = queryReqBean.getSearchParams();
	    	List<HdkfEsReportTrackDTO> dataList = dao.searchHdkfEsReportTrack(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchHdkfEsReportTrack出错：", e);
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
	public HdkfEsReportTrackDTO queryHdkfEsReportTrackByPrimaryKey(String id) throws Exception {
		try{
			HdkfEsReportTrackDTO dto = dao.findHdkfEsReportTrackById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchHdkfEsReportTrack出错：", e);
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
	public String insertHdkfEsReportTrack(HdkfEsReportTrackDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfEsReportTrack(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfEsReportTrack出错：", e);
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
	public int updateHdkfEsReportTrack(HdkfEsReportTrackDTO dto) throws Exception {
			//记录日志
			HdkfEsReportTrackDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfEsReportTrackAll(old);
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
	public int updateHdkfEsReportTrackSensitive(HdkfEsReportTrackDTO dto) throws Exception {
		try{
			//记录日志
			HdkfEsReportTrackDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateHdkfEsReportTrackSensitive(old);
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
	public int deleteHdkfEsReportTrackById(String id) throws Exception {
		if(StringUtils.isEmpty(id)){
		   throw new Exception("删除失败！传入的参数主键为null");
		   }
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfEsReportTrackById(id);
		}catch(Exception e){
			logger.error("deleteHdkfEsReportTrack出错：", e);
			throw new DaoException(e.getMessage(),e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfEsReportTrackByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfEsReportTrackById(id);
			result++;
		}
		return result;
	}
		
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfEsReportTrackDTO findById(String id) throws Exception {
		try{
			HdkfEsReportTrackDTO dto = dao.findHdkfEsReportTrackById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfEsReportTrack出错：", e);
	    		throw e;
	    }
	}
		

}

