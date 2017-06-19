package avicit.csmp.basicData.csmpbdcomstr.service;
import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.csmp.basicData.csmpbdcomstr.dao.CsmpBdComStrDao;
import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdComStrDTO;
import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdStrVo;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  CsmpBdComStrService
 * @description: 定义 单位结构关系表实现类
 * @author:  AVICIT DEV
 */
@Service
public class CsmpBdComStrService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(CsmpBdComStrService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private CsmpBdComStrDao dao;


	/**
	 * 按条件分页查询
	 * 有改动
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdComStrDTO> searchCsmpBdComStrByPage(QueryReqBean<CsmpBdComStrDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdComStrDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<CsmpBdComStrDTO> dataList =  dao.searchCsmpBdComStrByPage(searchParams,sdc.parseSql());
			QueryRespBean<CsmpBdComStrDTO> queryRespBean =new QueryRespBean<CsmpBdComStrDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdComStrByPaging出错：", e);
			throw e;
		}
	}
	
	/**
	 * 条件查询张佳华
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public  QueryRespBean<CsmpBdStrVo> searchCsmpBdComStrByPage (QueryReqBean<CsmpBdComStrDTO> queryReqBean){
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdComStrDTO searchParams = queryReqBean.getSearchParams();
			Page<CsmpBdStrVo> dataList =  dao.searchComStrAndCompByPage(searchParams);
			QueryRespBean<CsmpBdStrVo> queryRespBean =new QueryRespBean<CsmpBdStrVo>();
			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdComStrByPaging出错：", e);
			throw e;
		}
		
	}
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<CsmpBdComStrDTO> searchCsmpBdComStr(QueryReqBean<CsmpBdComStrDTO> queryReqBean) throws Exception {
	    try{
	    	CsmpBdComStrDTO searchParams = queryReqBean.getSearchParams();
	    	List<CsmpBdComStrDTO> dataList = dao.searchCsmpBdComStr(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchCsmpBdComStr出错：", e);
	    	throw new DaoException("",e);
	    }
    }
	/**
	 * 通过主键查询单条记录
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 * 
	 * 	public CsmpBdComStrDTO queryCsmpBdComStrByPrimaryKey(String id) throws Exception {
		try{
			CsmpBdComStrDTO dto = dao.findCsmpBdComStrById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchCsmpBdComStr出错：", e);
	    	throw new DaoException("",e);
	    }
	 */
	public CsmpBdComStrDTO queryCsmpBdComStrByPrimaryKey(String id) throws Exception {
		try{
			CsmpBdComStrDTO dto = dao.findCsmpBdComStrById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchCsmpBdComStr出错：", e);
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
	public int searchStrByComs(String id) throws Exception {
		try{
			int  strs = dao.searchStrByComId(id);
			//记录日志
			//SysLogUtil.log4Query(strs);
			return strs;
		}catch(Exception e){
	    	logger.error("searchCsmpBdComStr出错：", e);
	    	throw new DaoException("",e);
	    }
	}
	/**
	 * 查询多条记录
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public CsmpBdComStrDTO queryCsmpBdComStrByPrimaryKey(String[] id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 新增对象
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertCsmpBdComStr(CsmpBdComStrDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdComStr(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdComStr出错：", e);
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
	public int updateCsmpBdComStr(CsmpBdComStrDTO dto) throws Exception {
			//记录日志
			CsmpBdComStrDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateCsmpBdComStrAll(old);
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
	public int updateCsmpBdComStrSensitive(CsmpBdComStrDTO dto) throws Exception {
		try{
			//记录日志
			CsmpBdComStrDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateCsmpBdComStrSensitive(old);
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
	public int deleteCsmpBdComStrById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteCsmpBdComStrById(id);
		}catch(Exception e){
			logger.error("deleteCsmpBdComStr出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteCsmpBdComStrByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteCsmpBdComStrById(id);
			result++;
		}
		return result;
	}
		
	/**
     * @author AVICIT DEV
     * @description: 信息表删除 同时删除CSMP_BD_COM_STR
     * @param comid
     * @return
     */ 
	public int	deleteCsmpBdComStrBycomIds(String comId)throws Exception{
		int result =0;
			dao.deleteCsmpBdComStrBycomIds(comId);
			
		
		return result;
		
	}

	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private CsmpBdComStrDTO findById(String id) throws Exception {
		try{
			CsmpBdComStrDTO dto = dao.findCsmpBdComStrById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findCsmpBdComStr出错：", e);
	    		throw e;
	    }
	}

	


}

