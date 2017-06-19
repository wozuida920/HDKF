package avicit.csmp.basicData.csmpbdsparepart.service;
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
import avicit.csmp.basicData.csmpbdsparepart.dao.CsmpBdSparepartDao;
import avicit.csmp.basicData.csmpbdsparepart.dto.CsmpBdSparepartDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  CsmpBdSparepartService
 * @description: 定义 备件信息表实现类
 * @author:  AVICIT DEV
 */
@Service
public class CsmpBdSparepartService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(CsmpBdSparepartService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private CsmpBdSparepartDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdSparepartDTO> searchCsmpBdSparepartByPage(QueryReqBean<CsmpBdSparepartDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdSparepartDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<CsmpBdSparepartDTO> dataList =  dao.searchCsmpBdSparepartByPage(searchParams,sdc.parseSql());
			QueryRespBean<CsmpBdSparepartDTO> queryRespBean =new QueryRespBean<CsmpBdSparepartDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdSparepartByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<CsmpBdSparepartDTO> searchCsmpBdSparepart(QueryReqBean<CsmpBdSparepartDTO> queryReqBean) throws Exception {
	    try{
	    	CsmpBdSparepartDTO searchParams = queryReqBean.getSearchParams();
	    	List<CsmpBdSparepartDTO> dataList = dao.searchCsmpBdSparepart(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchCsmpBdSparepart出错：", e);
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
	public CsmpBdSparepartDTO queryCsmpBdSparepartByPrimaryKey(String id) throws Exception {
		try{
			CsmpBdSparepartDTO dto = dao.findCsmpBdSparepartById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchCsmpBdSparepart出错：", e);
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
	public String insertCsmpBdSparepart(CsmpBdSparepartDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdSparepart(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdSparepart出错：", e);
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
	public int updateCsmpBdSparepart(CsmpBdSparepartDTO dto) throws Exception {
			//记录日志
			CsmpBdSparepartDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateCsmpBdSparepartAll(old);
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
	public int updateCsmpBdSparepartSensitive(CsmpBdSparepartDTO dto) throws Exception {
		try{
			//记录日志
			CsmpBdSparepartDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateCsmpBdSparepartSensitive(old);
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
	public int deleteCsmpBdSparepartById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteCsmpBdSparepartById(id);
		}catch(Exception e){
			logger.error("deleteCsmpBdSparepart出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteCsmpBdSparepartByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteCsmpBdSparepartById(id);
			result++;
		}
		return result;
	}
		
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private CsmpBdSparepartDTO findById(String id) throws Exception {
		try{
			CsmpBdSparepartDTO dto = dao.findCsmpBdSparepartById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findCsmpBdSparepart出错：", e);
	    		throw e;
	    }
	}
		
	/**
	 * 用来查询是有多少个对象
	 * @param csmpBdSparepartDTO
	 * @return
	 */
	public int findcsmpBdSparepartDTO(CsmpBdSparepartDTO csmpBdSparepartDTO){
		
		List<CsmpBdSparepartDTO> list=	dao.seleCsmpBdSparepart(csmpBdSparepartDTO);
		int num = list.size();
		
	 return num;
	}
	
	
	/**
	 * 备件购物查询信息
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdSparepartDTO> searchCsmpBdSparepartByPage4shopCart(QueryReqBean<CsmpBdSparepartDTO> queryReqBean) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdSparepartDTO searchParams = queryReqBean.getSearchParams();
			Page<CsmpBdSparepartDTO> dataList =  dao.searchCsmpBdSparepartByPage4shopCart(searchParams);
			QueryRespBean<CsmpBdSparepartDTO> queryRespBean =new QueryRespBean<CsmpBdSparepartDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdSparepartByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 查询该表中是否有形同名字的数据
	 * @param drawingNo
	 * @return其中1表示有相同名字的，0表示没有相同名字
	 */
	public String checkDrawingNo(String drawingNo){
		try{
		int count =dao.checkedByNumber(drawingNo);
		if(count>0){
			return "1";//其中1表示有
		}
		return "0";//表示没有
		}catch(DaoException e){
			logger.error("searchCsmpBdSparepartByPaging出错：", e);
			throw e;
		}
	}
}

