package avicit.csmp.basicData.csmpbdaricarftmodel.service;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.csmp.basicData.csmpbdaircraftinfo.dao.CsmpBdAircraftinfoDao;
import avicit.csmp.basicData.csmpbdaricarftmodel.dao.CsmpBdAricarftmodelDao;
import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  CsmpBdAricarftmodelService
 * @description: 定义 飞机机型管理实现类
 * @author:  AVICIT DEV
 */
@Service
public class CsmpBdAricarftmodelService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(CsmpBdAricarftmodelService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private CsmpBdAricarftmodelDao dao;
	@Autowired
	private CsmpBdAircraftinfoDao infoDao;
	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdAricarftmodelDTO> searchCsmpBdAricarftmodelByPage(QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdAricarftmodelDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<CsmpBdAricarftmodelDTO> dataList =  dao.searchCsmpBdAricarftmodelByPage(searchParams,sdc.parseSql());
			QueryRespBean<CsmpBdAricarftmodelDTO> queryRespBean =new QueryRespBean<CsmpBdAricarftmodelDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdAricarftmodelByPaging出错：", e);
			throw e;
		}
	}
	
	
	/**
	 * 查询公共页面
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdAricarftmodelDTO> searchmodelByPage(QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdAricarftmodelDTO searchParams = queryReqBean.getSearchParams();
            SelfDefinedQuery sdc=new SelfDefinedQuery(sfnConditions,"t1");
			Page<CsmpBdAricarftmodelDTO> dataList =  dao.searchmodelByPage(searchParams,sdc.parseSql());
			QueryRespBean<CsmpBdAricarftmodelDTO> queryRespBean =new QueryRespBean<CsmpBdAricarftmodelDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdAricarftmodelByPaging出错：", e);
			throw e;
		}
	}
	
	
	
	
	
	
	
	/**
	 * 按条件查询，不分页   searchmodelByPage
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<CsmpBdAricarftmodelDTO> searchCsmpBdAricarftmodel(QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean) throws Exception {
	    try{
	    	CsmpBdAricarftmodelDTO searchParams = queryReqBean.getSearchParams();
	    	List<CsmpBdAricarftmodelDTO> dataList = dao.searchCsmpBdAricarftmodel(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchCsmpBdAricarftmodel出错：", e);
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
	public CsmpBdAricarftmodelDTO queryCsmpBdAricarftmodelByPrimaryKey(String id) throws Exception {
		try{
			CsmpBdAricarftmodelDTO dto = dao.findCsmpBdAricarftmodelById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchCsmpBdAricarftmodel出错：", e);
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
	public String insertCsmpBdAricarftmodel(CsmpBdAricarftmodelDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdAricarftmodel(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdAricarftmodel出错：", e);
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
	public int updateCsmpBdAricarftmodel(CsmpBdAricarftmodelDTO dto) throws Exception {
			//记录日志
			CsmpBdAricarftmodelDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateCsmpBdAricarftmodelAll(old);
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
	public int updateCsmpBdAricarftmodelSensitive(CsmpBdAricarftmodelDTO dto) throws Exception {
		try{
			//记录日志
			CsmpBdAricarftmodelDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateCsmpBdAricarftmodelSensitive(old);
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
	public int deleteCsmpBdAricarftmodelById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteCsmpBdAricarftmodelById(id);
		}catch(Exception e){
			logger.error("deleteCsmpBdAricarftmodel出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteCsmpBdAricarftmodelByIds(String[] ids) throws Exception{
		int result = 0;
		for(String id : ids ){
//			Integer count = this.getCountBatchno(id);
			deleteCsmpBdAricarftmodelById(id);
			result++;
		}
		
		return result;
	}
	
	//search no by id
	public Integer getCountBatchno(String id){
		return infoDao.countBatchno(id);
	}
	
	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private CsmpBdAricarftmodelDTO findById(String id) throws Exception {
		try{
			CsmpBdAricarftmodelDTO dto = dao.findCsmpBdAricarftmodelById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findCsmpBdAricarftmodel出错：", e);
	    		throw e;
	    }
	}
	
	/**
	 * 将数据转换成树
	 */
	public List<TreeNode> contrivTree (){
		List<TreeNode> nodes = new ArrayList<TreeNode>();
		TreeNode treenode = new TreeNode();
		treenode.setId("1");
		treenode.setText("飞机机型");
		treenode.set_parentId("-1");
		List<CsmpBdAricarftmodelDTO> list = dao.selectTree();
		List<TreeNode> listChild = new ArrayList<TreeNode>(list.size());
		for (int i = 0; i < list.size(); i++) {
			TreeNode child = new TreeNode();
			CsmpBdAricarftmodelDTO dto = list.get(i);
			child.set_parentId(treenode.getId());
			child.setId(dto.getId());
			child.setText(dto.getModelName());
//			child.setState("closed");
			child.setAttributes(dto);
			listChild.add(child);
		}
		treenode.setChildren(listChild);
		nodes.add(treenode);
		return nodes;
		
	}
		

}

