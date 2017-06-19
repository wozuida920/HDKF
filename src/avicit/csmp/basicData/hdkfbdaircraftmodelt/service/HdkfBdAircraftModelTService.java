package avicit.csmp.basicData.hdkfbdaircraftmodelt.service;
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
import avicit.csmp.basicData.hdkfbdaircraftmodelt.dao.HdkfBdAircraftModelTDao;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.dto.HdkfBdAircraftModelTDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname:  HdkfBdAircraftModelTService
 * @description: 定义 HDKF_BD_AIRCRAFT_MODEL_T实现类
 * @author:  AVICIT DEV
 */
@Service
public class HdkfBdAircraftModelTService{

	private static final Logger logger =  LoggerFactory.getLogger(HdkfBdAircraftModelTService.class);
	
	@Autowired
	private HdkfBdAircraftModelTDao dao;


	/**
	 * 按id查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public HdkfBdAircraftModelTDTO getHdkfBdAircraftModelTDTOById(String id)throws Exception{
		HdkfBdAircraftModelTDTO dto = dao.getNodeById(id);
		SysLogUtil.log4Query(dto);
		return dto;
		
	}
	/**
	 * 按id查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public HdkfBdAircraftModelTDTO getHdkfBdAircraftModelTDTOByModelId(String id)throws Exception{
		HdkfBdAircraftModelTDTO dto = dao.getNodeByModelId(id);
		SysLogUtil.log4Query(dto);
		return dto;
		
	}
	
	private HdkfBdAircraftModelTDTO findById(String id){
		HdkfBdAircraftModelTDTO dto = dao.getNodeById(id);
		return dto;
	}
	
		//插入数据
	public String insertHdkfBdAircraftModelT(HdkfBdAircraftModelTDTO dto) throws Exception{
		
		try{
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfBdAircraftModelT(dto);
			//记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		}catch(Exception e){
			logger.error("insertHdkfBdAircraftModelT出错：", e);
			throw new DaoException(e.getMessage(),e);
		}	
	}
	//更新数据
	public int updateHdkfBdAircraftModelT(HdkfBdAircraftModelTDTO dto) throws Exception{
		
		HdkfBdAircraftModelTDTO old = findById(dto.getId());
		SysLogUtil.log4Update(dto,old);
		PojoUtil.setSysProperties(dto, OpType.update);
		PojoUtil.copyProperties(old, dto,true);
		int ret = dao.updateHdkfBdAircraftModelTSensitive(old);
		if(ret ==0){
			throw new DaoException("数据失效，请重新更新");
		}
		return ret;
	}
	//删除数据
	public int deleteHdkfBdAircraftModelT(String id) throws Exception{
		SysLogUtil.log4Delete(findById(id));
		return dao.deleteHdkfBdAircraftModelTById(id);
	}
		//按照父id查询数据
	public List<TreeNode> getHdkfBdAircraftModelTByFatherId(String parentId,int level){
		List<TreeNode> tree = new ArrayList<TreeNode>();
		if (level == 0) {
			return null;
		}
		level--;
		
		List<Map<String, Object>> subTrees = dao.getHdkfBdAircraftModelTByFatherId(parentId);
		
		for (Map<String, Object> map : subTrees) {
			TreeNode node = new TreeNode();
			node.set_parentId(map.get("FatherId").toString());
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("AircraftName").toString());
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
				node.setChildren(this.getHdkfBdAircraftModelTByFatherId(id,level));
			} else {
				node.setState("open");
			}
			tree.add(node);
		}
		return tree;
	}
	//查询数据
	public List<TreeNode> searchHdkfBdAircraftModelT(String text,Map<String,TreeNode> mapTree){
		
		List<TreeNode> tree = new ArrayList<TreeNode>();
		
		List<Map<String, Object>> searchNodes = dao.searchHdkfBdAircraftModelT(text);
		List<TreeNode> treeList = new ArrayList<TreeNode>(searchNodes.size());
		
		for(Map<String, Object> map : searchNodes){
			TreeNode node = new TreeNode();
			String id = map.get("Id").toString();
			node.setId(id);
			node.setText(map.get("AircraftName").toString());
			node.set_parentId(map.get("FatherId").toString());
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
		HdkfBdAircraftModelTDTO dto = dao.getNodeById(id);

		
		String parentId=dto.getFatherId();
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
			HdkfBdAircraftModelTDTO pdto = dao.getNodeById(parentId);
			parentNode.setText(pdto.getAircraftName());
			parentNode.setState("open");
			parentNode.set_parentId(pdto.getFatherId());
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

