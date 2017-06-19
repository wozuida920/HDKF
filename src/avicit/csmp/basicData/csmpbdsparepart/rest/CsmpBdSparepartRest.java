package avicit.csmp.basicData.csmpbdsparepart.rest;

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

import avicit.csmp.basicData.csmpbdsparepart.dto.CsmpBdSparepartDTO;
import avicit.csmp.basicData.csmpbdsparepart.service.CsmpBdSparepartService;

@RestEasyController
@Path("/api/csmp/basicData/csmpbdsparepart/CsmpBdSparepartRest")
public class CsmpBdSparepartRest{
    private static final Logger logger =  LoggerFactory.getLogger(CsmpBdSparepartRest.class);
    
	@Autowired
	private CsmpBdSparepartService csmpBdSparepartService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<CsmpBdSparepartDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<CsmpBdSparepartDTO> responseMsg = new ResponseMsg<CsmpBdSparepartDTO>();
		CsmpBdSparepartDTO dto = csmpBdSparepartService.queryCsmpBdSparepartByPrimaryKey(id);
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
	public ResponseMsg<String> save(CsmpBdSparepartDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = csmpBdSparepartService.insertCsmpBdSparepart(dto);
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
	public ResponseMsg<Integer> updateSensitive(CsmpBdSparepartDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdSparepartService.updateCsmpBdSparepartSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(CsmpBdSparepartDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdSparepartService.updateCsmpBdSparepart(dto);
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
		int count = csmpBdSparepartService.deleteCsmpBdSparepartById(id);
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
	public ResponseMsg<QueryRespBean<CsmpBdSparepartDTO>> searchByPage(QueryReqBean<CsmpBdSparepartDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<CsmpBdSparepartDTO>> responseMsg = new ResponseMsg<QueryRespBean<CsmpBdSparepartDTO>>();
		QueryRespBean<CsmpBdSparepartDTO> queryRespBean = csmpBdSparepartService.searchCsmpBdSparepartByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<CsmpBdSparepartDTO>> search(QueryReqBean<CsmpBdSparepartDTO> queryReqBean) throws Exception {
		ResponseMsg<List<CsmpBdSparepartDTO>> responseMsg = new ResponseMsg<List<CsmpBdSparepartDTO>>();
		List<CsmpBdSparepartDTO> queryRespBean = csmpBdSparepartService.searchCsmpBdSparepart(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
