package avicit.hdkf.support.hdkfsupportresponseinfo.rest;

import java.util.List;
import java.util.Map;

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
import avicit.hdkf.support.hdkfsupportresponseinfo.dto.HdkfSupportResponseInfoDTO;
import avicit.hdkf.support.hdkfsupportresponseinfo.service.HdkfSupportResponseInfoService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoRest")
public class HdkfSupportResponseInfoRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportResponseInfoRest.class);
    
	@Autowired
	private HdkfSupportResponseInfoService hdkfSupportResponseInfoService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportResponseInfoDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportResponseInfoDTO> responseMsg = new ResponseMsg<HdkfSupportResponseInfoDTO>();
		HdkfSupportResponseInfoDTO dto = hdkfSupportResponseInfoService.queryHdkfSupportResponseInfoByPrimaryKey(id);
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
	@Path("/save/v1/")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<String> save(HdkfSupportResponseInfoDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportResponseInfoService.insertHdkfSupportResponseInfo(dto);
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
	@Path("/updateSensitive/v1/")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<Integer> updateSensitive(HdkfSupportResponseInfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportResponseInfoService.updateHdkfSupportResponseInfoSensitive(dto);
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
	@Path("/updateAll/v1/")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<Integer> updateAll(HdkfSupportResponseInfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportResponseInfoService.updateHdkfSupportResponseInfo(dto);
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
	@Path("/deleteById/v1/")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<Integer> deleteById(String id) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportResponseInfoService.deleteHdkfSupportResponseInfoById(id);
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
	@Path("/searchByPage/v1/")
	@Produces("application/json;charset=UTF-8")
	@Consumes("application/json;charset=UTF-8")
	public ResponseMsg<QueryRespBean<HdkfSupportResponseInfoDTO>> searchByPage(QueryReqBean<HdkfSupportResponseInfoDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportResponseInfoDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportResponseInfoDTO>>();
		QueryRespBean<HdkfSupportResponseInfoDTO> queryRespBean = hdkfSupportResponseInfoService.searchHdkfSupportResponseInfoByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportResponseInfoDTO>> search(QueryReqBean<HdkfSupportResponseInfoDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportResponseInfoDTO>> responseMsg = new ResponseMsg<List<HdkfSupportResponseInfoDTO>>();
		List<HdkfSupportResponseInfoDTO> queryRespBean = hdkfSupportResponseInfoService.searchHdkfSupportResponseInfo(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
