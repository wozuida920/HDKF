package avicit.hdkf.support.hdkfsupportassigninfo.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.rest.msg.ResponseMsg;
import avicit.platform6.core.rest.resteasy.RestEasyController;

import avicit.hdkf.support.hdkfsupportassigninfo.dto.HdkfSupportAssignInfoDTO;
import avicit.hdkf.support.hdkfsupportassigninfo.service.HdkfSupportAssignInfoService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoRest")
public class HdkfSupportAssignInfoRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportAssignInfoRest.class);
    
	@Autowired
	private HdkfSupportAssignInfoService hdkfSupportAssignInfoService;
	
	
	
	
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportAssignInfoDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportAssignInfoDTO> responseMsg = new ResponseMsg<HdkfSupportAssignInfoDTO>();
		HdkfSupportAssignInfoDTO dto = hdkfSupportAssignInfoService.queryHdkfSupportAssignInfoByPrimaryKey(id);
		responseMsg.setResponseBody(dto);
		return responseMsg;
	}
	
	
	/**
	 * 插入一条记录
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	@POST
	@Path("/save/v1")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<String> save(HdkfSupportAssignInfoDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportAssignInfoService.insertHdkfSupportAssignInfo(dto);
		responseMsg.setResponseBody(id);
		return responseMsg;
	}
	
	/**
	 * 修改一条记录，按照匹配字段修改
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	@POST
	@Path("/updateSensitive/v1")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<Integer> updateSensitive(HdkfSupportAssignInfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportAssignInfoService.updateHdkfSupportAssignInfoSensitive(dto);
		responseMsg.setResponseBody(count);
		return responseMsg;
	}
	/**
	 * 修改一条记录的全部字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	@POST
	@Path("/updateAll/v1")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<Integer> updateAll(HdkfSupportAssignInfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportAssignInfoService.updateHdkfSupportAssignInfo(dto);
		responseMsg.setResponseBody(count);
		return responseMsg;
	}
	/**
	 * 按照ID删除一条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@POST
	@Path("/deleteById/v1")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<Integer> deleteById(String id) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportAssignInfoService.deleteHdkfSupportAssignInfoById(id);
		responseMsg.setResponseBody(count);
		return responseMsg;
	}
	
	/**
	 * 按条件分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	@POST
	@Path("/searchByPage/v1")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<QueryRespBean<HdkfSupportAssignInfoDTO>> searchByPage(QueryReqBean<HdkfSupportAssignInfoDTO> queryReqBean) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportAssignInfoDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportAssignInfoDTO>>();
		QueryRespBean<HdkfSupportAssignInfoDTO> queryRespBean = hdkfSupportAssignInfoService.searchHdkfSupportAssignInfoByPage(queryReqBean,"");
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	/**
	 * 按条件不分页查询
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	@POST
	@Path("/search/v1/")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<List<HdkfSupportAssignInfoDTO>> search(QueryReqBean<HdkfSupportAssignInfoDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportAssignInfoDTO>> responseMsg = new ResponseMsg<List<HdkfSupportAssignInfoDTO>>();
		List<HdkfSupportAssignInfoDTO> queryRespBean = hdkfSupportAssignInfoService.searchHdkfSupportAssignInfo(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
