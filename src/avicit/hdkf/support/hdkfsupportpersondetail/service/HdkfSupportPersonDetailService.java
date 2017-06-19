package avicit.hdkf.support.hdkfsupportpersondetail.service;
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
import avicit.hdkf.support.hdkfsupportpersondetail.dao.HdkfSupportPersonDetailDao;
import avicit.hdkf.support.hdkfsupportpersondetail.dto.HdkfSupportPersonDetailDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportPersonDetailService
 * @description: 定义 HDKF_SUPPORT_PERSON_DETAIL实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportPersonDetailService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportPersonDetailService.class);
	
    private static final long serialVersionUID = 1L;
	
	@Autowired
	private HdkfSupportPersonDetailDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportPersonDetailDTO> searchHdkfSupportPersonDetailByPage(QueryReqBean<HdkfSupportPersonDetailDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportPersonDetailDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfSupportPersonDetailDTO> dataList =  dao.searchHdkfSupportPersonDetailByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportPersonDetailDTO> queryRespBean =new QueryRespBean<HdkfSupportPersonDetailDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportPersonDetailByPaging出错：", e);
			throw e;
		}
	
    }
		/**
	 * 批量新增或修改对象
	 * @param demos
	 * @return
	 * @throws Exception
	 */
	
	public void insertOrUpdateHdkfSupportPersonDetail(List<HdkfSupportPersonDetailDTO> demos)throws Exception {
		for(HdkfSupportPersonDetailDTO demo :demos){
			
			if("".equals(demo.getId())||null==demo.getId()){
				this.insertHdkfSupportPersonDetail(demo);
			}else{
				this.updateHdkfSupportPersonDetail(demo);
			}
		}
	}


	/**
	 * 新增对象
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int insertHdkfSupportPersonDetail(HdkfSupportPersonDetailDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			int ret = dao.insertHdkfSupportPersonDetail(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return ret;
		}catch(Exception e){
			logger.error("insertHdkfSupportPersonDetail出错：", e);
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
	public int updateHdkfSupportPersonDetail(HdkfSupportPersonDetailDTO dto) throws Exception {
			//记录日志
			HdkfSupportPersonDetailDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportPersonDetailSensitive(old);
			if(ret ==0){
				throw new DaoException("数据失效，请从新更新");
			}
			return ret;

	}
	
	/**
	 * 按主键单条删除
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportPersonDetailById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) return 0;
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportPersonDetailById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportPersonDetail出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportPersonDetailByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportPersonDetailById(id);
			result++;
		}
		return result;
	}
		/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfSupportPersonDetailDTO findById(String id) throws Exception {
		try{
			HdkfSupportPersonDetailDTO dto = dao.findHdkfSupportPersonDetailById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportPersonDetail出错：", e);
	    		throw e;
	    }
	}
		

}

