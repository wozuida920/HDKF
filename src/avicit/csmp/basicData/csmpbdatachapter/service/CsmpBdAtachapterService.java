package avicit.csmp.basicData.csmpbdatachapter.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdatachapter.dao.CsmpBdAtachapterDao;
import avicit.csmp.basicData.csmpbdatachapter.dto.CsmpBdAtachapterDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  CsmpBdAtachapterService
 * @description: 定义 ATM章节号管理实现类
 * @author:  AVICIT DEV
 */
@Service
public class CsmpBdAtachapterService{

	private static final Logger logger =  LoggerFactory.getLogger(CsmpBdAtachapterService.class);
	
	@Autowired
	private CsmpBdAtachapterDao dao;


	/**
	 * 按id查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public CsmpBdAtachapterDTO getCsmpBdAtachapterDTOById(String id)throws Exception{
		CsmpBdAtachapterDTO dto = dao.getNodeById(id);
		SysLogUtil.log4Query(dto);
		return dto;
		
	}
	
	private CsmpBdAtachapterDTO findById(String id){
		CsmpBdAtachapterDTO dto = dao.getNodeById(id);
		return dto;
	}
	
		//插入数据
	public String insertCsmpBdAtachapter(CsmpBdAtachapterDTO dto) throws Exception{
		
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdAtachapter(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdAtachapter出错：", e);
			throw new DaoException("",e);
		}	
	}
	//更新数据
	public int updateCsmpBdAtachapter(CsmpBdAtachapterDTO dto) throws Exception{
		
		CsmpBdAtachapterDTO old = findById(dto.getId());
		SysLogUtil.log4Update(dto,old);
		PojoUtil.setSysProperties(dto, OpType.update);
		PojoUtil.copyProperties(old, dto,true);
		int ret = dao.updateCsmpBdAtachapterSensitive(old);
		if(ret ==0){
			throw new DaoException("数据失效，请从新更新");
		}
		return ret;
	}
	//删除数据
	public int deleteCsmpBdAtachapter(String id) throws Exception{
		SysLogUtil.log4Delete(findById(id));
		return dao.deleteCsmpBdAtachapterById(id);
	}
		//按照父id查询数据
	public List<TreeNode> getCsmpBdAtachapterByParentClassId(String parentId,int level,String validFlag){
		List<TreeNode> tree = new ArrayList<TreeNode>();
		if (level == 0) {
			return null;
		}
		level--;		
		List<Map<String, Object>> subTrees = dao.getCsmpBdAtachapterByParentClassId(parentId,validFlag);
		for (Map<String, Object> map : subTrees) {
			TreeNode node = new TreeNode();
			node.set_parentId(map.get("ParentClassId").toString());
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("CHAPTER").toString()+"         "+map.get("AtaName").toString());
			HashMap<String, Object> attr = new HashMap<String, Object>(1);
			Integer count = Integer.valueOf(map.get("childCount").toString());
			attr.put("count",count);
			node.setAttributes(attr);
			
			if (count > 0) {
				if (level > 0) {
					node.setState("open");
				} else {
					node.setState("closed");
				}
				node.setChildren(this.getCsmpBdAtachapterByParentClassId(id,level,validFlag));
			} else {
				node.setState("open");
			}
			tree.add(node);
		}
		return tree;
	}
	//查询数据
	public List<TreeNode> searchCsmpBdAtachapter(String text,Map<String,TreeNode> mapTree){
		
		List<TreeNode> tree = new ArrayList<TreeNode>();
		
		List<Map<String, Object>> searchNodes = dao.searchCsmpBdAtachapter(text);
		List<TreeNode> treeList = new ArrayList<TreeNode>(searchNodes.size());
		
		for(Map<String, Object> map : searchNodes){
			TreeNode node = new TreeNode();
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("AtaName").toString());
			node.set_parentId(map.get("ParentClassId").toString());
			if (Integer.valueOf(map.get("childCount").toString()) > 0) {
				node.setState("closed");
			} else {
				node.setState("open");
			}
			HashMap<String,Object> attr  = new HashMap<String,Object>(1);
			attr.put("s", 1);
			node.setAttributes(attr);
			treeList.add(node);
			mapTree.put(id, node);
		}
		
		for(TreeNode treeNode :treeList){
			this.getParentTreeNode(treeNode.getId(),mapTree);
		}
		return tree;
	}
	//zhaoyins set
	/**
	 * 按条件查询，不分页
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<CsmpBdAtachapterDTO> searchCsmpBdAtachapterinfo() throws Exception {
		try {
			//CsmpBdAircraftinfoDTO searchParams = queryReqBean.getSearchParams();
			List<CsmpBdAtachapterDTO> dataList = dao.searchCsmpBdAtachapterinfo(new CsmpBdAtachapterDTO());
			return dataList;
		} catch (Exception e) {
			logger.error("searchCsmpBdAtachapterinfo出错：", e);
			throw new DaoException("", e);
		}
	}
	//根据当前id递归查找父id
	private void getParentTreeNode(String id,Map<String,TreeNode> mapTree){
		//父节点
		TreeNode parentNode= new TreeNode();
		CsmpBdAtachapterDTO dto = dao.getNodeById(id);

		
		String parentId=dto.getParentClassId();
		parentNode.setId(parentId);
		
		if("-1".equals(parentId)){
			return;
		}
		
		if(mapTree.containsKey(parentId)){
			TreeNode existNode =mapTree.get(parentId);
			existNode.setState("open");
			existNode.getChildren().add(mapTree.get(id)); 
			return;
		}else{
			CsmpBdAtachapterDTO pdto = dao.getNodeById(parentId);
			parentNode.setText(pdto.getAtaName());
			parentNode.setState("open");
			parentNode.set_parentId(pdto.getParentClassId());
			List<TreeNode> child = new ArrayList<TreeNode>();
			child.add(mapTree.get(id));
			parentNode.setChildren(child);
			mapTree.put(parentId, parentNode);
		}
		if(!"-1".equals(id)){//如果没有找到根节点，则继续递归上一个根节点
			this.getParentTreeNode(parentId,mapTree);
		}
	}
}

