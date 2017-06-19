package avicit.csmp.basicData.csmpbdcompanyinfo.service;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import avicit.platform6.modules.system.sysfileupload.service.SwfUploadService;

import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.csmp.basicData.csmpbdcompanyinfo.dao.CsmpBdCompanyinfoDao;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.basicData.csmpbdcomstr.dao.CsmpBdComStrDao;
import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdComStrDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  CsmpBdCompanyinfoService
 * @description: 定义 单位信息表实现类
 * @author:  AVICIT DEV
 */
@Service
public class CsmpBdCompanyinfoService  implements Serializable {

	private static final Logger logger =  LoggerFactory.getLogger(CsmpBdCompanyinfoService.class);
	
    private static final long serialVersionUID = 1L;
    
//	@Autowired
//	private SysLogUtil sysLogUtil;
	
	@Autowired
	private CsmpBdCompanyinfoDao dao;
	
	@Autowired
	//维护关系
	private CsmpBdComStrDao comStrDao;
	
	
	@Autowired
    private SwfUploadService sysAttachmentAPI;
	


	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdCompanyinfoDTO> searchCsmpBdCompanyinfoByPage(QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdCompanyinfoDTO searchParams = queryReqBean.getSearchParams();
			//新增查询关系表searchCompAndStruByPage
			Page<CsmpBdCompanyinfoDTO> dataList =  dao.searchCompAndStruByPage(searchParams);
			QueryRespBean<CsmpBdCompanyinfoDTO> queryRespBean =new QueryRespBean<CsmpBdCompanyinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdCompanyinfoByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<CsmpBdCompanyinfoDTO> searchCsmpBdCompanyinfoParentByPage(QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdCompanyinfoDTO searchParams = queryReqBean.getSearchParams();
			Page<CsmpBdCompanyinfoDTO> dataList =  dao.searchCsmpBdCompanyinfoParentByPage(searchParams);
			QueryRespBean<CsmpBdCompanyinfoDTO> queryRespBean =new QueryRespBean<CsmpBdCompanyinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdCompanyinfoByPaging出错：", e);
			throw e;
		}
	}
	
/*	根节点加载的信息*/
	public QueryRespBean<CsmpBdCompanyinfoDTO> searchRootsComps(QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		try{
			PageHelper.startPage(queryReqBean.getPageParameter());
			CsmpBdCompanyinfoDTO searchParams = queryReqBean.getSearchParams();
			
			Page<CsmpBdCompanyinfoDTO> dataList =  dao.searchRootCominfos(searchParams);
			QueryRespBean<CsmpBdCompanyinfoDTO> queryRespBean =new QueryRespBean<CsmpBdCompanyinfoDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		}catch(DaoException e){
			logger.error("searchCsmpBdCompanyinfoByPaging出错：", e);
			throw e;
		}
	}
	/**
	 * 按条件查询，不分页
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<CsmpBdCompanyinfoDTO> searchCsmpBdCompanyinfo(QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean) throws Exception {
	    try{
	    	CsmpBdCompanyinfoDTO searchParams = queryReqBean.getSearchParams();
	    	List<CsmpBdCompanyinfoDTO> dataList = dao.searchCsmpBdCompanyinfo(searchParams);
	    	return dataList;
	    }catch(Exception e){
	    	logger.error("searchCsmpBdCompanyinfo出错：", e);
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
	public CsmpBdCompanyinfoDTO queryCsmpBdCompanyinfoByPrimaryKey(String id) throws Exception {
		try{
			CsmpBdCompanyinfoDTO dto = dao.findCsmpBdCompanyinfoById(id);
			//记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		}catch(Exception e){
	    	logger.error("searchCsmpBdCompanyinfo出错：", e);
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
	public String insertCsmpBdCompanyinfo(CsmpBdCompanyinfoDTO dto) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdCompanyinfo(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdCompanyinfo出错：", e);
			throw new DaoException("",e);
		}
	}
 	/**
	 * 新增对象并且维护关系
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertCsmpBdCompanyinfo(CsmpBdCompanyinfoDTO dto,String strID,String catalogType) throws Exception {
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdCompanyinfo(dto);
			this.saveComStr(id, strID,catalogType);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdCompanyinfo出错：", e);
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
	public int updateCsmpBdCompanyinfo(CsmpBdCompanyinfoDTO dto) throws Exception {
			//记录日志
			CsmpBdCompanyinfoDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int ret = dao.updateCsmpBdCompanyinfoAll(old);
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
	public int updateCsmpBdCompanyinfoSensitive(CsmpBdCompanyinfoDTO dto) throws Exception {
		try{
			//记录日志
			CsmpBdCompanyinfoDTO old =findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto,true);
			int count = dao.updateCsmpBdCompanyinfoSensitive(old);
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
	public int deleteCsmpBdCompanyinfoById(String id) throws Exception {
		if(StringUtils.isEmpty(id)) throw new Exception("删除失败！传入的参数主键为null");
		try{
			//记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteCsmpBdCompanyinfoById(id);
		}catch(Exception e){
			logger.error("deleteCsmpBdCompanyinfo出错：", e);
			throw new DaoException("",e);
		}
	}

	/**
	 * 批量删除数据
	 * @param ids id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteCsmpBdCompanyinfoByIds(String[] ids) throws Exception{
		
		int result =0;
		for(String id : ids ){
			
		    sysAttachmentAPI.deleteAttachByFormId(id);
		    comStrDao.deleteCsmpBdComStrBycomIds(id);
			deleteCsmpBdCompanyinfoById(id);
			
			result++;
		}
		return result;
	}
		/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private CsmpBdCompanyinfoDTO findById(String id) throws Exception {
		try{
			CsmpBdCompanyinfoDTO dto = dao.findCsmpBdCompanyinfoById(id);
			return dto;
		}catch(DaoException e){
	    		logger.error("findCsmpBdCompanyinfo出错：", e);
	    		throw e;
	    }
	}
		
	/**
	 * 查询出列表转换为树
	 * @return
	 */
	public List<TreeNode> getListTree(){
		List<TreeNode> treeNode = new ArrayList<TreeNode>();
		TreeNode tree = new TreeNode();
		tree.set_parentId("-1");
		tree.setId("1");
		tree.setText("运营单位");
		List<CsmpBdCompanyinfoDTO> list = dao.selectByTreeId("customer");//getTree该处以前是查询所有的公司，目前是要查询为客户的公司
		List<TreeNode> listchildren = new ArrayList<TreeNode>(list.size());
		for(int i=0;i<list.size();i++){
			TreeNode child = new TreeNode();
			CsmpBdCompanyinfoDTO dto = list.get(i);
			child.set_parentId(tree.getId());
			child.setId(dto.getId());
//			child.setState("closed");
			child.setText(dto.getCompanyName());
			child.setAttributes(dto);
			listchildren.add(child);
		}
		tree.setChildren(listchildren);
		treeNode.add(tree);
		return treeNode;
	}
	/**
	 * 维护关系表数据
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String saveComStr(String comId,String strId ,String catalogType) throws Exception {
		try{
			String id = ComUtil.getId();
			CsmpBdComStrDTO comStrDTO = new CsmpBdComStrDTO();
			comStrDTO.setId(id);
			comStrDTO.setComId(comId);
			comStrDTO.setStrId(strId);
			comStrDTO.setComType(catalogType);
			PojoUtil.setSysProperties(comStrDTO, OpType.insert);
			comStrDao.insertCsmpBdComStr(comStrDTO);
			//记录日志
			SysLogUtil.log4Insert(comStrDTO);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdCompanyinfo出错：", e);
			throw new DaoException("",e);
		}
	}
	
	/**
	 * 根据一个树的id来查询类型为客户的公司的名字（此处返回list其中每个对象是一个完整对象）
	 * @param treeID
	 * @return
	 */
	public List<CsmpBdCompanyinfoDTO> selectByTreeIdToComparyInfo(String catalogType){
		List<CsmpBdCompanyinfoDTO> list =dao.selectByTreeId(catalogType);
		return list;
	}
	
	/**
	 * 根据联系人ID 查询 info信息
	 * @param id
	 * @return
	 */
	public List<CsmpBdCompanyinfoDTO> searchInfoByContacts(String id){
		return dao.searchInfoByContacts(id);
	}
	
		
}

