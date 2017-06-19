package avicit.hdkf.support.hdkfsupportdesignchange.rest;

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

import avicit.hdkf.support.hdkfsupportdesignchange.dto.HdkfSupportDesignChangeDTO;
import avicit.hdkf.support.hdkfsupportdesignchange.service.HdkfSupportDesignChangeService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeRest")
public class HdkfSupportDesignChangeRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportDesignChangeRest.class);
    
	@Autowired
	private HdkfSupportDesignChangeService hdkfSupportDesignChangeService;
	
	
	
	
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportDesignChangeDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportDesignChangeDTO> responseMsg = new ResponseMsg<HdkfSupportDesignChangeDTO>();
		HdkfSupportDesignChangeDTO dto = hdkfSupportDesignChangeService.queryHdkfSupportDesignChangeByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportDesignChangeDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportDesignChangeService.insertHdkfSupportDesignChange(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportDesignChangeDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportDesignChangeService.updateHdkfSupportDesignChangeSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportDesignChangeDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportDesignChangeService.updateHdkfSupportDesignChange(dto);
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
		int count = hdkfSupportDesignChangeService.deleteHdkfSupportDesignChangeById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportDesignChangeDTO>> searchByPage(QueryReqBean<HdkfSupportDesignChangeDTO> queryReqBean) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportDesignChangeDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportDesignChangeDTO>>();
		QueryRespBean<HdkfSupportDesignChangeDTO> queryRespBean = hdkfSupportDesignChangeService.searchHdkfSupportDesignChangeByPage(queryReqBean,"");
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
	public ResponseMsg<List<HdkfSupportDesignChangeDTO>> search(QueryReqBean<HdkfSupportDesignChangeDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportDesignChangeDTO>> responseMsg = new ResponseMsg<List<HdkfSupportDesignChangeDTO>>();
		List<HdkfSupportDesignChangeDTO> queryRespBean = hdkfSupportDesignChangeService.searchHdkfSupportDesignChange(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
