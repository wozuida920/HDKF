package avicit.hdkf.support.hdkfsupportfaxinfo.rest;

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
import avicit.hdkf.support.hdkfsupportfaxinfo.dto.HdkfSupportFaxInfoDTO;
import avicit.hdkf.support.hdkfsupportfaxinfo.service.HdkfSupportFaxInfoService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoRest")
public class HdkfSupportFaxInfoRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportFaxInfoRest.class);
    
	@Autowired
	private HdkfSupportFaxInfoService hdkfSupportFaxInfoService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportFaxInfoDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportFaxInfoDTO> responseMsg = new ResponseMsg<HdkfSupportFaxInfoDTO>();
		HdkfSupportFaxInfoDTO dto = hdkfSupportFaxInfoService.queryHdkfSupportFaxInfoByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportFaxInfoDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportFaxInfoService.insertHdkfSupportFaxInfo(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportFaxInfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportFaxInfoService.updateHdkfSupportFaxInfoSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportFaxInfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportFaxInfoService.updateHdkfSupportFaxInfo(dto);
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
		int count = hdkfSupportFaxInfoService.deleteHdkfSupportFaxInfoById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportFaxInfoDTO>> searchByPage(QueryReqBean<HdkfSupportFaxInfoDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportFaxInfoDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportFaxInfoDTO>>();
		QueryRespBean<HdkfSupportFaxInfoDTO> queryRespBean = hdkfSupportFaxInfoService.searchHdkfSupportFaxInfoByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportFaxInfoDTO>> search(QueryReqBean<HdkfSupportFaxInfoDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportFaxInfoDTO>> responseMsg = new ResponseMsg<List<HdkfSupportFaxInfoDTO>>();
		List<HdkfSupportFaxInfoDTO> queryRespBean = hdkfSupportFaxInfoService.searchHdkfSupportFaxInfo(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
