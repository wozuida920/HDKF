package avicit.csmp.basicData.csmpbdaricarftmodel.rest;

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

import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
import avicit.csmp.basicData.csmpbdaricarftmodel.service.CsmpBdAricarftmodelService;

@RestEasyController
@Path("/api/csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelRest")
public class CsmpBdAricarftmodelRest{
    private static final Logger logger =  LoggerFactory.getLogger(CsmpBdAricarftmodelRest.class);
    
	@Autowired
	private CsmpBdAricarftmodelService csmpBdAricarftmodelService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<CsmpBdAricarftmodelDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<CsmpBdAricarftmodelDTO> responseMsg = new ResponseMsg<CsmpBdAricarftmodelDTO>();
		CsmpBdAricarftmodelDTO dto = csmpBdAricarftmodelService.queryCsmpBdAricarftmodelByPrimaryKey(id);
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
	public ResponseMsg<String> save(CsmpBdAricarftmodelDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = csmpBdAricarftmodelService.insertCsmpBdAricarftmodel(dto);
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
	public ResponseMsg<Integer> updateSensitive(CsmpBdAricarftmodelDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdAricarftmodelService.updateCsmpBdAricarftmodelSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(CsmpBdAricarftmodelDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdAricarftmodelService.updateCsmpBdAricarftmodel(dto);
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
		int count = csmpBdAricarftmodelService.deleteCsmpBdAricarftmodelById(id);
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
	public ResponseMsg<QueryRespBean<CsmpBdAricarftmodelDTO>> searchByPage(QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<CsmpBdAricarftmodelDTO>> responseMsg = new ResponseMsg<QueryRespBean<CsmpBdAricarftmodelDTO>>();
		QueryRespBean<CsmpBdAricarftmodelDTO> queryRespBean = csmpBdAricarftmodelService.searchCsmpBdAricarftmodelByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<CsmpBdAricarftmodelDTO>> search(QueryReqBean<CsmpBdAricarftmodelDTO> queryReqBean) throws Exception {
		ResponseMsg<List<CsmpBdAricarftmodelDTO>> responseMsg = new ResponseMsg<List<CsmpBdAricarftmodelDTO>>();
		List<CsmpBdAricarftmodelDTO> queryRespBean = csmpBdAricarftmodelService.searchCsmpBdAricarftmodel(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
