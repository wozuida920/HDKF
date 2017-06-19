package avicit.csmp.basicData.csmpbdaircraftinfo.rest;

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

import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdaircraftinfo.service.CsmpBdAircraftinfoService;

@RestEasyController
@Path("/api/csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoRest")
public class CsmpBdAircraftinfoRest{
    private static final Logger logger =  LoggerFactory.getLogger(CsmpBdAircraftinfoRest.class);
    
	@Autowired
	private CsmpBdAircraftinfoService csmpBdAircraftinfoService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<CsmpBdAircraftinfoDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<CsmpBdAircraftinfoDTO> responseMsg = new ResponseMsg<CsmpBdAircraftinfoDTO>();
		CsmpBdAircraftinfoDTO dto = csmpBdAircraftinfoService.queryCsmpBdAircraftinfoByPrimaryKey(id);
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
	public ResponseMsg<String> save(CsmpBdAircraftinfoDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = csmpBdAircraftinfoService.insertCsmpBdAircraftinfo(dto);
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
	public ResponseMsg<Integer> updateSensitive(CsmpBdAircraftinfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdAircraftinfoService.updateCsmpBdAircraftinfoSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(CsmpBdAircraftinfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdAircraftinfoService.updateCsmpBdAircraftinfo(dto);
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
		int count = csmpBdAircraftinfoService.deleteCsmpBdAircraftinfoById(id);
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
	public ResponseMsg<QueryRespBean<CsmpBdAircraftinfoDTO>> searchByPage(QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<CsmpBdAircraftinfoDTO>> responseMsg = new ResponseMsg<QueryRespBean<CsmpBdAircraftinfoDTO>>();
		QueryRespBean<CsmpBdAircraftinfoDTO> queryRespBean = csmpBdAircraftinfoService.searchCsmpBdAircraftinfoByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<CsmpBdAircraftinfoDTO>> search(QueryReqBean<CsmpBdAircraftinfoDTO> queryReqBean) throws Exception {
		ResponseMsg<List<CsmpBdAircraftinfoDTO>> responseMsg = new ResponseMsg<List<CsmpBdAircraftinfoDTO>>();
		List<CsmpBdAircraftinfoDTO> queryRespBean = csmpBdAircraftinfoService.searchCsmpBdAircraftinfo(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
