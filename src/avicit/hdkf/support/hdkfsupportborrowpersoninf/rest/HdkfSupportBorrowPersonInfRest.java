package avicit.hdkf.support.hdkfsupportborrowpersoninf.rest;

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
import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.service.HdkfSupportBorrowPersonInfService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfRest")
public class HdkfSupportBorrowPersonInfRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportBorrowPersonInfRest.class);
    
	@Autowired
	private HdkfSupportBorrowPersonInfService hdkfSupportBorrowPersonInfService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportBorrowPersonInfDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportBorrowPersonInfDTO> responseMsg = new ResponseMsg<HdkfSupportBorrowPersonInfDTO>();
		HdkfSupportBorrowPersonInfDTO dto = hdkfSupportBorrowPersonInfService.queryHdkfSupportBorrowPersonInfByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportBorrowPersonInfDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportBorrowPersonInfService.insertHdkfSupportBorrowPersonInf(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportBorrowPersonInfDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportBorrowPersonInfService.updateHdkfSupportBorrowPersonInfSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportBorrowPersonInfDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportBorrowPersonInfService.updateHdkfSupportBorrowPersonInf(dto);
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
		int count = hdkfSupportBorrowPersonInfService.deleteHdkfSupportBorrowPersonInfById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportBorrowPersonInfDTO>> searchByPage(QueryReqBean<HdkfSupportBorrowPersonInfDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportBorrowPersonInfDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportBorrowPersonInfDTO>>();
		QueryRespBean<HdkfSupportBorrowPersonInfDTO> queryRespBean = hdkfSupportBorrowPersonInfService.searchHdkfSupportBorrowPersonInfByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportBorrowPersonInfDTO>> search(QueryReqBean<HdkfSupportBorrowPersonInfDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportBorrowPersonInfDTO>> responseMsg = new ResponseMsg<List<HdkfSupportBorrowPersonInfDTO>>();
		List<HdkfSupportBorrowPersonInfDTO> queryRespBean = hdkfSupportBorrowPersonInfService.searchHdkfSupportBorrowPersonInf(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
