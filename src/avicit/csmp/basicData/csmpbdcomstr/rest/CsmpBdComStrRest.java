package avicit.csmp.basicData.csmpbdcomstr.rest;

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

import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdComStrDTO;
import avicit.csmp.basicData.csmpbdcomstr.service.CsmpBdComStrService;

@RestEasyController
@Path("/api/csmp/basicData/csmpbdcomstr/CsmpBdComStrRest")
public class CsmpBdComStrRest{
    private static final Logger logger =  LoggerFactory.getLogger(CsmpBdComStrRest.class);
    
	@Autowired
	private CsmpBdComStrService csmpBdComStrService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<CsmpBdComStrDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<CsmpBdComStrDTO> responseMsg = new ResponseMsg<CsmpBdComStrDTO>();
		CsmpBdComStrDTO dto = csmpBdComStrService.queryCsmpBdComStrByPrimaryKey(id);
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
	public ResponseMsg<String> save(CsmpBdComStrDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = csmpBdComStrService.insertCsmpBdComStr(dto);
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
	public ResponseMsg<Integer> updateSensitive(CsmpBdComStrDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdComStrService.updateCsmpBdComStrSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(CsmpBdComStrDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdComStrService.updateCsmpBdComStr(dto);
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
		int count = csmpBdComStrService.deleteCsmpBdComStrById(id);
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
	public ResponseMsg<QueryRespBean<CsmpBdComStrDTO>> searchByPage(QueryReqBean<CsmpBdComStrDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<CsmpBdComStrDTO>> responseMsg = new ResponseMsg<QueryRespBean<CsmpBdComStrDTO>>();
		QueryRespBean<CsmpBdComStrDTO> queryRespBean = csmpBdComStrService.searchCsmpBdComStrByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<CsmpBdComStrDTO>> search(QueryReqBean<CsmpBdComStrDTO> queryReqBean) throws Exception {
		ResponseMsg<List<CsmpBdComStrDTO>> responseMsg = new ResponseMsg<List<CsmpBdComStrDTO>>();
		List<CsmpBdComStrDTO> queryRespBean = csmpBdComStrService.searchCsmpBdComStr(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
