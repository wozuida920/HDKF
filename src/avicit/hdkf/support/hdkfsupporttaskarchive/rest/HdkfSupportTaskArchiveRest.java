package avicit.hdkf.support.hdkfsupporttaskarchive.rest;

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
import avicit.hdkf.support.hdkfsupporttaskarchive.dto.HdkfSupportTaskArchiveDTO;
import avicit.hdkf.support.hdkfsupporttaskarchive.service.HdkfSupportTaskArchiveService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupporttaskarchive/HdkfSupportTaskArchiveRest")
public class HdkfSupportTaskArchiveRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportTaskArchiveRest.class);
    
	@Autowired
	private HdkfSupportTaskArchiveService hdkfSupportTaskArchiveService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportTaskArchiveDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportTaskArchiveDTO> responseMsg = new ResponseMsg<HdkfSupportTaskArchiveDTO>();
		HdkfSupportTaskArchiveDTO dto = hdkfSupportTaskArchiveService.queryHdkfSupportTaskArchiveByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportTaskArchiveDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportTaskArchiveService.insertHdkfSupportTaskArchive(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportTaskArchiveDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportTaskArchiveService.updateHdkfSupportTaskArchiveSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportTaskArchiveDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportTaskArchiveService.updateHdkfSupportTaskArchive(dto);
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
		int count = hdkfSupportTaskArchiveService.deleteHdkfSupportTaskArchiveById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportTaskArchiveDTO>> searchByPage(QueryReqBean<HdkfSupportTaskArchiveDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportTaskArchiveDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportTaskArchiveDTO>>();
		QueryRespBean<HdkfSupportTaskArchiveDTO> queryRespBean = hdkfSupportTaskArchiveService.searchHdkfSupportTaskArchiveByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportTaskArchiveDTO>> search(QueryReqBean<HdkfSupportTaskArchiveDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportTaskArchiveDTO>> responseMsg = new ResponseMsg<List<HdkfSupportTaskArchiveDTO>>();
		List<HdkfSupportTaskArchiveDTO> queryRespBean = hdkfSupportTaskArchiveService.searchHdkfSupportTaskArchive(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
