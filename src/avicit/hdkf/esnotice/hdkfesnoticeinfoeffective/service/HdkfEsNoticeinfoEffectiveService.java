package avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.service;
import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.csmp.basicData.csmpbdcompanyinfo.dao.CsmpBdCompanyinfoDao;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dao.HdkfEsNoticeinfoEffectiveDao;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dto.HdkfEsNoticeinfoEffectiveDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfEsNoticeinfoEffectiveService
 * @description: 定义 技术通报涉及批架次信息表实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfEsNoticeinfoEffectiveService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfEsNoticeinfoEffectiveService.class);
	
    private static final long serialVersionUID = 1L;
	
	@Autowired
	private HdkfEsNoticeinfoEffectiveDao dao;
	@Autowired
	private CsmpBdCompanyinfoDao csmpBdCompanyinfoDao;

	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> searchHdkfEsNoticeinfoEffective1ByPage(QueryReqBean<HdkfEsNoticeinfoEffectiveDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoEffectiveDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfEsNoticeinfoEffectiveDTO> dataList =  dao.searchHdkfEsNoticeinfoEffective1ByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> queryRespBean =new QueryRespBean<HdkfEsNoticeinfoEffectiveDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfEsNoticeinfoEffectiveByPaging出错：", e);
			throw e;
		}
	
    }
	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> searchHdkfEsNoticeinfoEffectiveByPage(QueryReqBean<HdkfEsNoticeinfoEffectiveDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoEffectiveDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfEsNoticeinfoEffectiveDTO> dataList =  dao.searchHdkfEsNoticeinfoEffectiveByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> queryRespBean =new QueryRespBean<HdkfEsNoticeinfoEffectiveDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfEsNoticeinfoEffectiveByPaging出错：", e);
			throw e;
		}
	
    }
		/**
	 * 批量新增或修改对象
	 * @param demos
	 * @return
	 * @throws Exception
	 */
	
	public void insertOrUpdateHdkfEsNoticeinfoEffective(List<HdkfEsNoticeinfoEffectiveDTO> demos)throws Exception {
		for(HdkfEsNoticeinfoEffectiveDTO demo :demos){
			
			if("".equals(demo.getId())||null==demo.getId()){
				this.insertHdkfEsNoticeinfoEffective(demo);
			}else{
				this.updateHdkfEsNoticeinfoEffective(demo);
			}
		}
	}


	/**
	 * 新增对象
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int insertHdkfEsNoticeinfoEffective(HdkfEsNoticeinfoEffectiveDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			int ret = dao.insertHdkfEsNoticeinfoEffective(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return ret;
		}catch(Exception e){
			logger.error("insertHdkfEsNoticeinfoEffective出错：", e);
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
	public int updateHdkfEsNoticeinfoEffective(HdkfEsNoticeinfoEffectiveDTO dto) throws Exception {
			//记录日志
			HdkfEsNoticeinfoEffectiveDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
		
			int ret = dao.updateHdkfEsNoticeinfoEffectiveSensitive(old);
			if(ret ==0){
				throw new DaoException("数据失效，请重新更新");
			}
			return ret;

	}
	
	/**
	 * 按主键单条清空执行数据
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int resetHdkfEsNoticeinfoEffectiveById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) return 0;
		try{
			
			return dao.resetHdkfEsNoticeinfoEffectiveById(id);
		}catch(Exception e){
			logger.error("deleteHdkfEsNoticeinfoEffective出错：", e);
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
	public int deleteHdkfEsNoticeinfoEffectiveById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) return 0;
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfEsNoticeinfoEffectiveById(id);
		}catch(Exception e){
			logger.error("deleteHdkfEsNoticeinfoEffective出错：", e);
			throw new DaoException("",e);
		}
	}
	/**
	 * 批量重置数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int resetHdkfEsNoticeinfoEffectiveByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			resetHdkfEsNoticeinfoEffectiveById(id);
			result++;
		}
		return result;
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfEsNoticeinfoEffectiveByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfEsNoticeinfoEffectiveById(id);
			result++;
		}
		return result;
	}
		/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfEsNoticeinfoEffectiveDTO findById(String id) throws Exception {
		try{
			HdkfEsNoticeinfoEffectiveDTO dto = dao.findHdkfEsNoticeinfoEffectiveById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfEsNoticeinfoEffective出错：", e);
	    		throw e;
	    }
	}
	/**
 * 日志专用，内部方法，不再记录日志
 */
public HdkfEsNoticeinfoEffectiveDTO queryDtoById(String id) throws Exception {
	try{
		HdkfEsNoticeinfoEffectiveDTO dto = dao.findHdkfEsNoticeinfoEffectiveById(id);
		return dto;
	}catch(DaoException e){
    		logger.error("findHdkfEsNoticeinfoEffective出错：", e);
    		throw e;
    }
}
	/**
	 * 根据用户数量查询数据
	 * 2016-7-5
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * Administrator
	 */
	public QueryRespBean<CsmpBdCompanyinfoDTO> searchCsmpEsNoticeinfoEffectiveCountNameByPage(
			QueryReqBean<HdkfEsNoticeinfoEffectiveDTO> queryReqBean,
			String sfnConditions) throws Exception{
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoEffectiveDTO searchParams = queryReqBean.getSearchParams();
	       
			Page<CsmpBdCompanyinfoDTO> dataList =  csmpBdCompanyinfoDao.searchCsmpEsNoticeinfoEffectiveCountNameByPage(searchParams.getBulletinId());
			QueryRespBean<CsmpBdCompanyinfoDTO> queryRespBean =new QueryRespBean<CsmpBdCompanyinfoDTO>();
			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (Exception e) {
			logger.error("searchCsmpEsNoticeinfoEffectiveCountNameByPage出错：", e);
			throw e;
		}
		
	}
	
	/**
	 * 点击批架次进行查询
	 * 2016-7-7
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * @throws Exception
	 * Administrator
	 */
	public QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> searchCsmpEsNoticeinfoEffectiveCountbatchNoByPage(
			QueryReqBean<HdkfEsNoticeinfoEffectiveDTO> queryReqBean,
			String sfnConditions) throws Exception{
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfEsNoticeinfoEffectiveDTO searchParams = queryReqBean.getSearchParams();
	        SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<HdkfEsNoticeinfoEffectiveDTO> dataList =  dao.searchCsmpEsNoticeinfoEffectiveCountbatchNoByPage(searchParams.getBulletinId());
			QueryRespBean<HdkfEsNoticeinfoEffectiveDTO> queryRespBean =new QueryRespBean<HdkfEsNoticeinfoEffectiveDTO>();
			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (Exception e) {
			logger.error("searchCsmpEsNoticeinfoEffectiveCountNameByPage出错：", e);
			throw e;
		}
	}
	
	/**
	 * 技术通报实施用户执行数量查询
	 * 2016-7-7
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * Administrator
	 */
//	public QueryRespBean<CsmpEsNoticeinfoEffectiveDTO> searchCsmpEsNoticeinfoEffectiveCountYesNoNameByPage(
//			QueryReqBean<CsmpEsNoticeinfoEffectiveDTO> queryReqBean,
//			String sfnConditions) throws Exception{
//		try {
//			PageHelper.startPage(queryReqBean.getPageParameter());
//			CsmpEsNoticeinfoEffectiveDTO searchParams = queryReqBean.getSearchParams();
//	        SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
//			Page<CsmpEsNoticeinfoEffectiveDTO> dataList =  dao.searchCsmpEsNoticeinfoEffectiveCountYesNoNameByPage(searchParams,sdc.parseSql());
//			QueryRespBean<CsmpEsNoticeinfoEffectiveDTO> queryRespBean =new QueryRespBean<CsmpEsNoticeinfoEffectiveDTO>();
//			queryRespBean.setResult(dataList);
//			return queryRespBean;
//		} catch (Exception e) {
//			logger.error("searchCsmpEsNoticeinfoEffectiveCountNameByPage出错：", e);
//			throw e;
//		}
//	}
//	
	/**
	 * 技术通报实施批架次数量查询
	 * 2016-7-7
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * Administrator
	 */
//	public QueryRespBean<CsmpEsNoticeinfoEffectiveDTO> searchCsmpEsNoticeinfoEffectiveCountYesNoBatchNoByPage(
//			QueryReqBean<CsmpEsNoticeinfoEffectiveDTO> queryReqBean,
//			String sfnConditions) throws Exception{
//		try {
//			PageHelper.startPage(queryReqBean.getPageParameter());
//			CsmpEsNoticeinfoEffectiveDTO searchParams = queryReqBean.getSearchParams();
//	        SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
//			Page<CsmpEsNoticeinfoEffectiveDTO> dataList =  dao.searchCsmpEsNoticeinfoEffectiveCountYesNoBatchNoByPage(searchParams,sdc.parseSql());
//			QueryRespBean<CsmpEsNoticeinfoEffectiveDTO> queryRespBean =new QueryRespBean<CsmpEsNoticeinfoEffectiveDTO>();
//			queryRespBean.setResult(dataList);
//			return queryRespBean;
//		} catch (Exception e) {
//			logger.error("searchCsmpEsNoticeinfoEffectiveCountYesNoBatchNoByPage出错：", e);
//			throw e;
//		}
//	}
		

}

