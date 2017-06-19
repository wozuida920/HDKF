package avicit.csmp.basicData.hdkfbdaircraftmodelt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import avicit.platform6.commons.utils.web.TreeNode;
import avicit.platform6.core.properties.PlatformConstant.OpResult;

import avicit.csmp.basicData.hdkfbdaircraftmodelt.dto.HdkfBdAircraftModelTDTO;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.service.HdkfBdAircraftModelTService;

/**
 * @classname: HdkfBdAircraftModelTController
 * @description: 定义  HDKF_BD_AIRCRAFT_MODEL_T 控制层
 * @author:   AVICIT DEV 
 */
@Controller
@Scope("prototype")
@RequestMapping("csmp/basicData/hdkfbdaircraftmodelt/HdkfBdAircraftModelTController")
public class HdkfBdAircraftModelTController{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfBdAircraftModelTController.class);
    
    @Autowired
    private  HdkfBdAircraftModelTService service;
    /**
     * 跳转到管理页面
     * @param request 请求
     * @param reponse 响应
     * @return
     */
    @RequestMapping(value="HdkfBdAircraftModelTInfo")
	public ModelAndView toHdkfBdAircraftModelT(HttpServletRequest request,HttpServletResponse reponse){
		ModelAndView mav = new ModelAndView();
		String url ="platform/csmp/basicData/hdkfbdaircraftmodelt/HdkfBdAircraftModelTController";
		mav.setViewName("avicit/csmp/basicData/hdkfbdaircraftmodelt/HdkfBdAircraftModelTManage");
		request.setAttribute("url", url);
		return mav;
	}
    
    @RequestMapping(value="/gettree/{level}")
	@ResponseBody
	public List<TreeNode> getHdkfBdAircraftModelTByParentId(@PathVariable(value="level")int level,@RequestParam(required=false) String id){	
		if(id == null){
			id ="-1";
		}else{
			level=1;
		}
		return service.getHdkfBdAircraftModelTByFatherId(id,level);
	}
    @RequestMapping(value="/search")
	@ResponseBody
	public List<TreeNode> searchHdkfBdAircraftModelT(@RequestParam(required=true,value="search_text") String searchText){	
		List<TreeNode> result =new ArrayList<TreeNode>(1);
		Map<String,TreeNode> mapTree= new HashMap<String,TreeNode>();
		
		service.searchHdkfBdAircraftModelT(searchText,mapTree);
		
		TreeNode rootNode = mapTree.get("1");
		if(rootNode !=null){
			 result.add(mapTree.get("1"));
		}
		 return result;
	}
        @RequestMapping(value="/operation/{type}/{id}")
	public ModelAndView  toInsertOrModifyHdkfBdAircraftModelT(@PathVariable(value="type")String type,
												 @PathVariable(value="id")String id,
												 HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url ="platform/csmp/basicData/hdkfbdaircraftmodelt/HdkfBdAircraftModelTController/saveHdkfBdAircraftModelT/"+id;
		if("Edit".equals(type)){
			request.setAttribute("hdkfBdAircraftModelTDTO", service.getHdkfBdAircraftModelTDTOById(id));
		}
		request.setAttribute("url", url);
		request.setAttribute("id", id);
		mav.setViewName("avicit/csmp/basicData/hdkfbdaircraftmodelt/"+"HdkfBdAircraftModelT"+type);
		return mav;
	}
	
	@RequestMapping(value="/saveHdkfBdAircraftModelT/{pid}",method=RequestMethod.POST)
	public ModelAndView toSaveHdkfBdAircraftModelT(@PathVariable(value="pid")String pid,
			 						  HttpServletRequest request,
			 						  @RequestBody HdkfBdAircraftModelTDTO tree){
		ModelAndView mav= new ModelAndView();
		
		TreeNode treeNode= new TreeNode();
		try {
			if ("".equals(tree.getId())) {// 新增
				tree.setFatherId(pid);
				service.insertHdkfBdAircraftModelT(tree);
				mav.addObject("type", "1");
				HashMap<String, Object> attr = new HashMap<String, Object>(1);
				attr.put("count", 0);
				treeNode.setAttributes(attr);
				treeNode.setId(tree.getId());
			} else {
				service.updateHdkfBdAircraftModelT(tree);
				mav.addObject("type", "2");
				treeNode.setId(tree.getId());
			}
			mav.addObject("flag", OpResult.success);
			treeNode.set_parentId(pid);
			treeNode.setText(tree.getAircraftName());
			treeNode.setState("open");
			mav.addObject("data", treeNode);
			mav.addObject("pid", pid);
		}catch(Exception e){
			logger.debug(e.getMessage());
			mav.addObject("error", e.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;  
		}
		return mav;
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public ModelAndView toDeleteHdkfBdAircraftModelT(@RequestBody String[] ids,HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		try {
			for(String id :ids){
				service.deleteHdkfBdAircraftModelT(id);
			}
		}catch (Exception ex) {
			logger.debug(ex.getMessage());
			mav.addObject("error", ex.getMessage());
			mav.addObject("flag", OpResult.failure);
			return mav;
		}
		mav.addObject("flag", OpResult.success);
		return mav;
	}
	}
