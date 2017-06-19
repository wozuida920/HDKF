package avicit.csmp.basicData.hdkfbdaircraftmodelt.rest;

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

import avicit.csmp.basicData.hdkfbdaircraftmodelt.dto.HdkfBdAircraftModelTDTO;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.service.HdkfBdAircraftModelTService;

@RestEasyController
@Path("/api/csmp/basicData/hdkfbdaircraftmodelt/HdkfBdAircraftModelTRest")
public class HdkfBdAircraftModelTRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfBdAircraftModelTRest.class);
    
	@Autowired
	private HdkfBdAircraftModelTService hdkfBdAircraftModelTService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfBdAircraftModelTDTO> getHdkfBdAircraftModelTDTOById(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfBdAircraftModelTDTO> responseMsg = new ResponseMsg<HdkfBdAircraftModelTDTO>();
		HdkfBdAircraftModelTDTO dto = hdkfBdAircraftModelTService.getHdkfBdAircraftModelTDTOById(id);
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
	public ResponseMsg<String> save(HdkfBdAircraftModelTDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfBdAircraftModelTService.insertHdkfBdAircraftModelT(dto);
		responseMsg.setResponseBody(id);
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
	public ResponseMsg<Integer> updateAll(HdkfBdAircraftModelTDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfBdAircraftModelTService.updateHdkfBdAircraftModelT(dto);
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
		int count = hdkfBdAircraftModelTService.deleteHdkfBdAircraftModelT(id);
		responseMsg.setResponseBody(count);
		return responseMsg;
	}
	
	
}
