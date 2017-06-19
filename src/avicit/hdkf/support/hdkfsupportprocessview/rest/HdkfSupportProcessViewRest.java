package avicit.hdkf.support.hdkfsupportprocessview.rest;

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

import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
import avicit.hdkf.support.hdkfsupportprocessview.service.HdkfSupportProcessViewService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewRest")
public class HdkfSupportProcessViewRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportProcessViewRest.class);
    
	@Autowired
	private HdkfSupportProcessViewService hdkfSupportProcessViewService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportProcessViewDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportProcessViewDTO> responseMsg = new ResponseMsg<HdkfSupportProcessViewDTO>();
		HdkfSupportProcessViewDTO dto = hdkfSupportProcessViewService.queryHdkfSupportProcessViewByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportProcessViewDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportProcessViewService.insertHdkfSupportProcessView(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportProcessViewDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportProcessViewService.updateHdkfSupportProcessViewSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportProcessViewDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportProcessViewService.updateHdkfSupportProcessView(dto);
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
		int count = hdkfSupportProcessViewService.deleteHdkfSupportProcessViewById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportProcessViewDTO>> searchByPage(QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportProcessViewDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportProcessViewDTO>>();
		QueryRespBean<HdkfSupportProcessViewDTO> queryRespBean = hdkfSupportProcessViewService.searchHdkfSupportProcessViewByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportProcessViewDTO>> search(QueryReqBean<HdkfSupportProcessViewDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportProcessViewDTO>> responseMsg = new ResponseMsg<List<HdkfSupportProcessViewDTO>>();
		List<HdkfSupportProcessViewDTO> queryRespBean = hdkfSupportProcessViewService.searchHdkfSupportProcessView(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
