package avicit.hdkf.esnotice.hdkfesnoticeinfo.rest;

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

import avicit.hdkf.esnotice.hdkfesnoticeinfo.dto.HdkfEsNoticeinfoDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfo.service.HdkfEsNoticeinfoService;

@RestEasyController
@Path("/api/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoRest")
public class HdkfEsNoticeinfoRest{
	private static final Logger logger =  LoggerFactory.getLogger(HdkfEsNoticeinfoRest.class);
	
	@Autowired
	private HdkfEsNoticeinfoService hdkfEsNoticeinfoService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfEsNoticeinfoDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfEsNoticeinfoDTO> responseMsg = new ResponseMsg<HdkfEsNoticeinfoDTO>();
		HdkfEsNoticeinfoDTO dto = hdkfEsNoticeinfoService.queryHdkfEsNoticeinfoByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfEsNoticeinfoDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfEsNoticeinfoService.insertHdkfEsNoticeinfo(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfEsNoticeinfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfEsNoticeinfoService.updateHdkfEsNoticeinfoSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfEsNoticeinfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfEsNoticeinfoService.updateHdkfEsNoticeinfo(dto);
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
		int count = hdkfEsNoticeinfoService.deleteHdkfEsNoticeinfoById(id);
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
	public ResponseMsg<QueryRespBean<HdkfEsNoticeinfoDTO>> searchByPage(QueryReqBean<HdkfEsNoticeinfoDTO> queryReqBean, String sdfConditons) throws Exception {
		ResponseMsg<QueryRespBean<HdkfEsNoticeinfoDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfEsNoticeinfoDTO>>();
		QueryRespBean<HdkfEsNoticeinfoDTO> queryRespBean = hdkfEsNoticeinfoService.searchHdkfEsNoticeinfoByPage(queryReqBean, sdfConditons);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
}
