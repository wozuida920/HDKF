package avicit.hdkf.support.hdkfsupportfaultdetail.rest;

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

import avicit.hdkf.support.hdkfsupportfaultdetail.dto.HdkfSupportFaultDetailDTO;
import avicit.hdkf.support.hdkfsupportfaultdetail.service.HdkfSupportFaultDetailService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailRest")
public class HdkfSupportFaultDetailRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportFaultDetailRest.class);
    
	@Autowired
	private HdkfSupportFaultDetailService hdkfSupportFaultDetailService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportFaultDetailDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportFaultDetailDTO> responseMsg = new ResponseMsg<HdkfSupportFaultDetailDTO>();
		HdkfSupportFaultDetailDTO dto = hdkfSupportFaultDetailService.queryHdkfSupportFaultDetailByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportFaultDetailDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportFaultDetailService.insertHdkfSupportFaultDetail(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportFaultDetailDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportFaultDetailService.updateHdkfSupportFaultDetailSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportFaultDetailDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportFaultDetailService.updateHdkfSupportFaultDetail(dto);
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
		int count = hdkfSupportFaultDetailService.deleteHdkfSupportFaultDetailById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportFaultDetailDTO>> searchByPage(QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportFaultDetailDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportFaultDetailDTO>>();
		QueryRespBean<HdkfSupportFaultDetailDTO> queryRespBean = hdkfSupportFaultDetailService.searchHdkfSupportFaultDetailByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportFaultDetailDTO>> search(QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportFaultDetailDTO>> responseMsg = new ResponseMsg<List<HdkfSupportFaultDetailDTO>>();
		List<HdkfSupportFaultDetailDTO> queryRespBean = hdkfSupportFaultDetailService.searchHdkfSupportFaultDetail(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
