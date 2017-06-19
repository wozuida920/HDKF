package avicit.hdkf.support.hdkfsupportsolutiondetail.service;
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
import avicit.hdkf.support.hdkfsupportsolutiondetail.dao.HdkfSupportSolutionDetailDao;
import avicit.hdkf.support.hdkfsupportsolutiondetail.dto.HdkfSupportSolutionDetailDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfSupportSolutionDetailService
 * @description: 定义 HDKF_SUPPORT_SOLUTION_DETAIL实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfSupportSolutionDetailService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportSolutionDetailService.class);
	
    private static final long serialVersionUID = 1L;
	
	@Autowired
	private HdkfSupportSolutionDetailDao dao;


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfSupportSolutionDetailDTO> searchHdkfSupportSolutionDetailByPage(QueryReqBean<HdkfSupportSolutionDetailDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfSupportSolutionDetailDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
            Page<HdkfSupportSolutionDetailDTO> dataList =  dao.searchHdkfSupportSolutionDetailByPage(searchParams,sdc.parseSql());
			QueryRespBean<HdkfSupportSolutionDetailDTO> queryRespBean =new QueryRespBean<HdkfSupportSolutionDetailDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchHdkfSupportSolutionDetailByPaging出错：", e);
			throw e;
		}
	
    }
		/**
	 * 批量新增或修改对象
	 * @param demos
	 * @return
	 * @throws Exception
	 */
	
	public void insertOrUpdateHdkfSupportSolutionDetail(List<HdkfSupportSolutionDetailDTO> demos)throws Exception {
		for(HdkfSupportSolutionDetailDTO demo :demos){
			
			if("".equals(demo.getId())||null==demo.getId()){
				this.insertHdkfSupportSolutionDetail(demo);
			}else{
				this.updateHdkfSupportSolutionDetail(demo);
			}
		}
	}


	/**
	 * 新增对象
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int insertHdkfSupportSolutionDetail(HdkfSupportSolutionDetailDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			int ret = dao.insertHdkfSupportSolutionDetail(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return ret;
		}catch(Exception e){
			logger.error("insertHdkfSupportSolutionDetail出错：", e);
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
	public int updateHdkfSupportSolutionDetail(HdkfSupportSolutionDetailDTO dto) throws Exception {
			//记录日志
			HdkfSupportSolutionDetailDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateHdkfSupportSolutionDetailSensitive(old);
			if(ret ==0){
				throw new DaoException("数据失效，请重新更新");
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
	public int deleteHdkfSupportSolutionDetailById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) return 0;
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfSupportSolutionDetailById(id);
		}catch(Exception e){
			logger.error("deleteHdkfSupportSolutionDetail出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfSupportSolutionDetailByIds(String[] ids) throws Exception{
		int result =0;
		for(String id : ids ){
			deleteHdkfSupportSolutionDetailById(id);
			result++;
		}
		return result;
	}
		/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfSupportSolutionDetailDTO findById(String id) throws Exception {
		try{
			HdkfSupportSolutionDetailDTO dto = dao.findHdkfSupportSolutionDetailById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findHdkfSupportSolutionDetail出错：", e);
	    		throw e;
	    }
	}
		

}

