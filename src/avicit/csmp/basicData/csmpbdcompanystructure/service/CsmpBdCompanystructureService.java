package avicit.csmp.basicData.csmpbdcompanystructure.service;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.csmp.basicData.csmpbdcompanystructure.dao.CsmpBdCompanystructureDao;
import avicit.csmp.basicData.csmpbdcompanystructure.dto.CsmpBdCompanystructureDTO;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  CsmpBdCompanystructureService
 * @description: 定义 单位信息结构表实现类
 * @author:  AVICIT DEV
 */
@Service
public class CsmpBdCompanystructureService{

	private static final Logger logger =  LoggerFactory.getLogger(CsmpBdCompanystructureService.class);
	
	@Autowired
	private CsmpBdCompanystructureDao dao;
	/**
	 * 按id查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public CsmpBdCompanystructureDTO getCsmpBdCompanystructureDTOById(String id)throws Exception{
		CsmpBdCompanystructureDTO dto = dao.getNodeById(id);
		SysLogUtil.log4Query(dto);
		return dto;
		
	}
	
	private CsmpBdCompanystructureDTO findById(String id){
		CsmpBdCompanystructureDTO dto = dao.getNodeById(id);
		return dto;
	}
	
		//插入数据
	public String insertCsmpBdCompanystructure(CsmpBdCompanystructureDTO dto) throws Exception{
		
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertCsmpBdCompanystructure(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertCsmpBdCompanystructure出错：", e);
			throw new DaoException("",e);
		}	
	}
	//更新数据
	public int updateCsmpBdCompanystructure(CsmpBdCompanystructureDTO dto) throws Exception{
		
		CsmpBdCompanystructureDTO old = findById(dto.getId());
		SysLogUtil.log4Update(dto,old);	
		
		if(old.getIsValid()!=dto.getIsValid()){
			updataIsValidByPid(dto.getId(),dto.getIsValid());
		}
		PojoUtil.setSysProperties(dto, OpType.update);
		PojoUtil.copyProperties(old, dto,true);
		int ret = dao.updateCsmpBdCompanystructureSensitive(old);
		if(ret ==0){
			throw new DaoException("数据失效，请从新更新");
		}
		return ret;
	}
	//删除数据
	public int deleteCsmpBdCompanystructure(String id) throws Exception{
		SysLogUtil.log4Delete(findById(id));
		return dao.deleteCsmpBdCompanystructureById(id);
	}
	
		//按照父id查询数据
	public List<TreeNode> getCsmpBdCompanystructureByPid(String parentId,int level){
		List<TreeNode> tree = new ArrayList<TreeNode>();
		if (level == 0) {
			return null;
		}
		level--;
		
		List<Map<String, Object>> subTrees = dao.getCsmpBdCompanystructureByPid(parentId);
		
		for (Map<String, Object> map : subTrees) {
			TreeNode node = new TreeNode();
			node.set_parentId(map.get("Pid").toString());
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("CatalogName").toString());
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
				node.setChildren(this.getCsmpBdCompanystructureByPid(id,level));
			} else {
				node.setState("open");
			}
			tree.add(node);
		}
		return tree;
	}
	//2按节点火的level节点 child 设置子节典点时使用
		public List<TreeNode> getCsmpBdCompanystructuresCanUseByPid(String parentId,int level){
			List<TreeNode> tree = new ArrayList<TreeNode>();
			if (level == 0) {
				return null;
			}
			level--;
			
			List<Map<String, Object>> subTrees = dao.getCsmpBdCompanystructureByPid(parentId);
			   String isValid="";
			for (Map<String, Object> map : subTrees) {
				isValid=map.get("IsValid").toString();
				if("1".equals(isValid)){
				TreeNode node = new TreeNode();
				node.set_parentId(map.get("Pid").toString());
				String id = map.get("Id").toString();
				node.setId(id);
				node.setText(map.get("CatalogName").toString());
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
					node.setChildren(this.getCsmpBdCompanystructureByPid(id,level));
				} else {
					node.setState("open");
				}
				tree.add(node);
			}
			}
			return tree;
		}
	//1按照父id查询有效节点
		public List<TreeNode> getCsmpBdCompanystructureCanUseByPid(String parentId,int level){
			List<TreeNode> tree = new ArrayList<TreeNode>();
			if (level == 0) {
				return null;
			}
			level--;
			
			List<Map<String, Object>> subTrees = dao.getCsmpBdCompanystructureCanUseByPid(parentId);
			for (Map<String, Object> map : subTrees) {
				TreeNode node = new TreeNode();
				node.set_parentId(map.get("Pid").toString());
				String id = map.get("Id").toString();
				node.setId(id);
				node.setText(map.get("CatalogName").toString());
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
					node.setChildren(this.getCsmpBdCompanystructuresCanUseByPid(id,level));
				} else {
					node.setState("open");
				}
				tree.add(node);
			}
			return tree;
		}
	//查询数据
	public List<TreeNode> searchCsmpBdCompanystructure(String text,Map<String,TreeNode> mapTree){
		
		List<TreeNode> tree = new ArrayList<TreeNode>();
		
		List<Map<String, Object>> searchNodes = dao.searchCsmpBdCompanystructure(text);
		List<TreeNode> treeList = new ArrayList<TreeNode>(searchNodes.size());
		
		for(Map<String, Object> map : searchNodes){
			TreeNode node = new TreeNode();
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("CatalogName").toString());
			node.set_parentId(map.get("Pid").toString());
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
	//查询数据
		public List<TreeNode> searchCsmpBdCompanystructureValid(String text,Map<String,TreeNode> mapTree){
			List<TreeNode> tree = new ArrayList<TreeNode>();
			List<Map<String, Object>> searchNodes = dao.searchCsmpBdCompanystructureValid(text);
			List<TreeNode> treeList = new ArrayList<TreeNode>(searchNodes.size());
			for(Map<String, Object> map : searchNodes){
				TreeNode node = new TreeNode();
				String id = map.get("Id").toString();
				node.setId(id);
				node.setText(map.get("CatalogName").toString());
				node.set_parentId(map.get("Pid").toString());
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
	//根据当前id递归查找父id
	private void getParentTreeNode(String id,Map<String,TreeNode> mapTree){
		//父节点
		TreeNode parentNode= new TreeNode();
		CsmpBdCompanystructureDTO dto = dao.getNodeById(id);		
		String parentId=dto.getPid();
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
			CsmpBdCompanystructureDTO pdto = dao.getNodeById(parentId);
			parentNode.setText(pdto.getCatalogName());
			parentNode.setState("open");
			parentNode.set_parentId(pdto.getPid());
			List<TreeNode> child = new ArrayList<TreeNode>();
			child.add(mapTree.get(id));
			parentNode.setChildren(child);
			mapTree.put(parentId, parentNode);
		}
		if(!"-1".equals(id)){//如果没有找到根节点，则继续递归上一个根节点
			this.getParentTreeNode(parentId,mapTree);
		}
	}
	
	/**
	 * 根据INFO表中的主键ID返回所有关系表中为对应的单位信息
	 * @param compID
	 * @return
	 */
	public List<TreeNode> getUnitList(String compID){
		List<TreeNode> tree = new ArrayList<TreeNode>();
		List<Map<String, Object>> searchNodes = dao.getUnitList(compID);
		for(Map<String, Object> map : searchNodes){
			TreeNode node = new TreeNode();
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("CatalogName").toString());
			Map<String,Object> attr = new HashMap<String,Object>();
			attr.put("CatalogType", map.get("CATALOG_TYPE"));
			node.setAttributes(attr);			
			tree.add(node);
		}
		return tree;
	}	
	//更新所有子节点的isValid属性
		private void updataIsValidByPid(String id,String isValid){					
			List<CsmpBdCompanystructureDTO> subList = dao.getAllNodeByPid(id);			
			if(subList.size()>0){
				for(CsmpBdCompanystructureDTO dto:subList ){
					dto.setIsValid(isValid);
					dao.updateCsmpBdCompanystructureSensitive(dto);
					updataIsValidByPid(dto.getId(),isValid);
				}				
			}			
		}
}

