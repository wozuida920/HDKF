package avicit.csmp.basicData.csmpbdaircraftinfo.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.csmp.basicData.csmpbdaircraftinfo.dao.CsmpBdAircraftinfoDao;
import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.operateMonitor.csmpomaircraftdynamics.dao.CsmpOmAircraftdynamicsDao;
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
 * @classname: CsmpBdAircraftinfoService
 * @description: 定义 飞机信息表实现类
 * @author: AVICIT DEV
 */
@Service
public class CsmpBdAircraftinfoService implements Serializable {

	private static final Logger logger = LoggerFactory
			.getLogger(CsmpBdAircraftinfoService.class);

	private static final long serialVersionUID = 1L;

	// @Autowired
	// private SysLogUtil sysLogUtil;

	@Autowired
	private CsmpBdAircraftinfoDao dao;
	@Autowired
	private CsmpOmAircraftdynamicsDao omDao;

	/**
	 * 按条件分页查询
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfoByPage(
			QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean,
			String sfnConditions) throws Exception {
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdAircraftinfoDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc = new SelfDefinedQuery(sfnConditions, "t1");
			Page<CsmpBdAircraftinfoDTO> dataList=null;
			if(searchParams !=null){
				if("1".equals(searchParams.getCompanyId())){
					searchParams.setCompanyId(null);
					dataList=dao.searchGenByPage(searchParams, sdc.parseSql());
				}else{
					 dataList = dao.searchCsmpBdAircraftinfoByPage(searchParams,sdc.parseSql());
					}
			}else{
				 dataList = dao.searchCsmpBdAircraftinfoByPage(searchParams,sdc.parseSql());
				}
			QueryRespBean<CsmpBdAircraftinfoDTO> queryRespBean = new QueryRespBean<CsmpBdAircraftinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (DaoException e) {
			logger.error("searchCsmpBdAircraftinfoByPaging出错：", e);
			throw e;
		}
	}

	/**
	 * 按条件查询，不分页
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfo(
			QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean) throws Exception {
		try {
			CsmpBdAircraftinfoDTO searchParams = queryReqBean.getSearchParams();
			List<CsmpBdAircraftinfoDTO> dataList = dao
					.searchCsmpBdAircraftinfo(searchParams);
			return dataList;
		} catch (Exception e) {
			logger.error("searchCsmpBdAircraftinfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 通过主键查询单条记录
	 * 
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public CsmpBdAircraftinfoDTO queryCsmpBdAircraftinfoByPrimaryKey(String id)
			throws Exception {
		try {
			CsmpBdAircraftinfoDTO dto = dao.findCsmpBdAircraftinfoById(id);
			// 记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		} catch (Exception e) {
			logger.error("searchCsmpBdAircraftinfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 新增对象
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertCsmpBdAircraftinfo(CsmpBdAircraftinfoDTO dto)
			throws Exception {
		try {
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdAircraftinfo(dto);
			// 记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		} catch (Exception e) {
			logger.error("insertCsmpBdAircraftinfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 修改对象全部字段
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateCsmpBdAircraftinfo(CsmpBdAircraftinfoDTO dto)
			throws Exception {
		// 记录日志
		CsmpBdAircraftinfoDTO old = findById(dto.getId());
		SysLogUtil.log4Update(dto, old);
		PojoUtil.setSysProperties(dto, OpType.update);
		PojoUtil.copyProperties(old, dto, true);
		int ret = dao.updateCsmpBdAircraftinfoAll(old);
		if (ret == 0) {
			throw new DaoException("数据失效，请从新更新");
		}
		return ret;

	}

	/**
	 * 修改对象部分字段
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateCsmpBdAircraftinfoSensitive(CsmpBdAircraftinfoDTO dto)
			throws Exception {
		try {
			// 记录日志
			CsmpBdAircraftinfoDTO old = findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto, true);
			int count = dao.updateCsmpBdAircraftinfoSensitive(old);
			if (count == 0) {
				throw new DaoException("数据失效，请从新更新");
			}
			return count;
		} catch (Exception e) {
			logger.error("searchDemoBusinessTrip出错：", e);
			throw new DaoException("", e);
		}

	}

	/**
	 * 按主键单条删除
	 * 
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int deleteCsmpBdAircraftinfoById(String id) throws Exception {
		if (StringUtils.isEmpty(id))
			throw new Exception("删除失败！传入的参数主键为null");
		try {
			// 记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteCsmpBdAircraftinfoById(id);
		} catch (Exception e) {
			logger.error("deleteCsmpBdAircraftinfo出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 批量删除数据
	 * 
	 * @param ids
	 *            id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteCsmpBdAircraftinfoByIds(String[] ids) throws Exception {
		int result = 0;
		for (String id : ids) {
			deleteCsmpBdAircraftinfoById(id);
			result++;
		}
		return result;
	}

	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private CsmpBdAircraftinfoDTO findById(String id) throws Exception {
		try {
			CsmpBdAircraftinfoDTO dto = dao.findCsmpBdAircraftinfoById(id);
			return dto;
		} catch (DaoException e) {
			logger.error("findCsmpBdAircraftinfo出错：", e);
			throw e;
		}
	}

	public List<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfoById(String id)
			throws Exception {
		List<CsmpBdAircraftinfoDTO> dataList = dao.searchCsmpBdAircraftinfoById(id);
		return dataList;
	}
	
	
	/**
	 * 根据传进来的公司id来进行查找他下面所有的飞机并把其转换成了树
	 * @param csmpBdCompanyinfoDTO
	 * @return
	 */
	public List<TreeNode> getAircraTree(CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO){
		List<CsmpBdAircraftinfoDTO> list=dao.CompanyIdInfoByAircraft(csmpBdCompanyinfoDTO.getId());
		List<TreeNode> treeNode = new ArrayList<TreeNode>();
		TreeNode tree = new TreeNode();
		tree.set_parentId("1");
		tree.setId(csmpBdCompanyinfoDTO.getId());
		tree.setText(csmpBdCompanyinfoDTO.getAttribute01());
		List<TreeNode> listchildren = new ArrayList<TreeNode>(list.size());
		for(int i=0;i<list.size();i++){//遍历所有的孩子
			TreeNode child = new TreeNode();//把每个孩子转换成树并进行封装
			CsmpBdAircraftinfoDTO dto = list.get(i);//获取集合中的每一个对象
			child.set_parentId(csmpBdCompanyinfoDTO.getId());//给每一个孩子赋值他的父亲id
			child.setId(dto.getId());
//			child.setState("closed");
			child.setText(dto.getAttribute01());
			child.setAttributes(dto);
			listchildren.add(child);
		}
		tree.setChildren(listchildren);
		treeNode.add(tree);
		return treeNode;
	
	}
	
	/**
	 * 按条件分页查询
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdAircraftinfoDTO> searchOmByPage(
			QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean,
			String sfnConditions) throws Exception {
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdAircraftinfoDTO searchParams = queryReqBean.getSearchParams();
			if(searchParams!=null){
				if(searchParams.getCustumerName()!=null && !"".equals(searchParams.getCustumerName())){
				searchParams.setCompanyId(searchParams.getCustumerName());
				searchParams.setCustumerName(null);
				}
				if(searchParams.getBatchNo()!=null && !"".equals(searchParams.getBatchNo()) ){
					searchParams.setId(searchParams.getBatchNo());
					searchParams.setBatchNo(null);
				}
			}
			SelfDefinedQuery sdc = new SelfDefinedQuery(sfnConditions, "t1");
			Page<CsmpBdAircraftinfoDTO> dataList = omDao.selectByAircraft(searchParams,
							sdc.parseSql());
			QueryRespBean<CsmpBdAircraftinfoDTO> queryRespBean = new QueryRespBean<CsmpBdAircraftinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (DaoException e) {
			logger.error("searchCsmpBdAircraftinfoByPaging出错：", e);
			throw e;
		}
	}

	
	/**
	 * 查询有效的机型架次信息
	 * 2016-7-7
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * Administrator
	 */
	public QueryRespBean<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfoValidFlagByPage(
			QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean,
			String sfnConditions) throws Exception{
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdAircraftinfoDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc = new SelfDefinedQuery(sfnConditions, "t1");
			Page<CsmpBdAircraftinfoDTO> dataList = dao
					.searchCsmpBdAircraftinfoValidFlagByPage(searchParams,
							sdc.parseSql());
			QueryRespBean<CsmpBdAircraftinfoDTO> queryRespBean = new QueryRespBean<CsmpBdAircraftinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (DaoException e) {
			logger.error("searchCsmpBdAircraftinfoByPaging出错：", e);
			throw e;
		}
	}

	public QueryRespBean<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftModelinfoByPage(
			QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean,
			String sfnConditions) {
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdAircraftinfoDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc = new SelfDefinedQuery(sfnConditions, "t1");
			Page<CsmpBdAircraftinfoDTO> dataList=null;
			if(searchParams !=null){
				if("1".equals(searchParams.getCompanyId())){
					searchParams.setCompanyId(null);
					dataList=dao.searchGenModelByPage(searchParams, sdc.parseSql());
				}else{
					 dataList = dao.searchCsmpBdAircraftModelinfoByPage(searchParams,sdc.parseSql());
					}
			}else{
				 dataList = dao.searchCsmpBdAircraftModelinfoByPage(searchParams,sdc.parseSql());
				}
			QueryRespBean<CsmpBdAircraftinfoDTO> queryRespBean = new QueryRespBean<CsmpBdAircraftinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (DaoException e) {
			logger.error("searchCsmpBdAircraftinfoByPaging出错：", e);
			throw e;
		}
	}
	

}
