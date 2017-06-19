package avicit.hdkf.esnotice.hdkfesreporttrack.rest;

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

import avicit.hdkf.esnotice.hdkfesreporttrack.dto.HdkfEsReportTrackDTO;
import avicit.hdkf.esnotice.hdkfesreporttrack.service.HdkfEsReportTrackService;

@RestEasyController
@Path("/api/hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackRest")
public class HdkfEsReportTrackRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfEsReportTrackRest.class);
    
	@Autowired
	private HdkfEsReportTrackService hdkfEsReportTrackService;
	
	
	
	
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfEsReportTrackDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfEsReportTrackDTO> responseMsg = new ResponseMsg<HdkfEsReportTrackDTO>();
		HdkfEsReportTrackDTO dto = hdkfEsReportTrackService.queryHdkfEsReportTrackByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfEsReportTrackDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfEsReportTrackService.insertHdkfEsReportTrack(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfEsReportTrackDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfEsReportTrackService.updateHdkfEsReportTrackSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfEsReportTrackDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfEsReportTrackService.updateHdkfEsReportTrack(dto);
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
		int count = hdkfEsReportTrackService.deleteHdkfEsReportTrackById(id);
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
	public ResponseMsg<QueryRespBean<HdkfEsReportTrackDTO>> searchByPage(QueryReqBean<HdkfEsReportTrackDTO> queryReqBean) throws Exception {
		ResponseMsg<QueryRespBean<HdkfEsReportTrackDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfEsReportTrackDTO>>();
		QueryRespBean<HdkfEsReportTrackDTO> queryRespBean = hdkfEsReportTrackService.searchHdkfEsReportTrackByPage(queryReqBean,"");
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
	public ResponseMsg<List<HdkfEsReportTrackDTO>> search(QueryReqBean<HdkfEsReportTrackDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfEsReportTrackDTO>> responseMsg = new ResponseMsg<List<HdkfEsReportTrackDTO>>();
		List<HdkfEsReportTrackDTO> queryRespBean = hdkfEsReportTrackService.searchHdkfEsReportTrack(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
