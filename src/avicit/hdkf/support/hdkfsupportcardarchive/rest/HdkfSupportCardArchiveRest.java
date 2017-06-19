package avicit.hdkf.support.hdkfsupportcardarchive.rest;

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
import avicit.hdkf.support.hdkfsupportcardarchive.dto.HdkfSupportCardArchiveDTO;
import avicit.hdkf.support.hdkfsupportcardarchive.service.HdkfSupportCardArchiveService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveRest")
public class HdkfSupportCardArchiveRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportCardArchiveRest.class);
    
	@Autowired
	private HdkfSupportCardArchiveService hdkfSupportCardArchiveService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfSupportCardArchiveDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfSupportCardArchiveDTO> responseMsg = new ResponseMsg<HdkfSupportCardArchiveDTO>();
		HdkfSupportCardArchiveDTO dto = hdkfSupportCardArchiveService.queryHdkfSupportCardArchiveByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfSupportCardArchiveDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfSupportCardArchiveService.insertHdkfSupportCardArchive(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfSupportCardArchiveDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportCardArchiveService.updateHdkfSupportCardArchiveSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfSupportCardArchiveDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportCardArchiveService.updateHdkfSupportCardArchive(dto);
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
		int count = hdkfSupportCardArchiveService.deleteHdkfSupportCardArchiveById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportCardArchiveDTO>> searchByPage(QueryReqBean<HdkfSupportCardArchiveDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportCardArchiveDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportCardArchiveDTO>>();
		QueryRespBean<HdkfSupportCardArchiveDTO> queryRespBean = hdkfSupportCardArchiveService.searchHdkfSupportCardArchiveByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfSupportCardArchiveDTO>> search(QueryReqBean<HdkfSupportCardArchiveDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfSupportCardArchiveDTO>> responseMsg = new ResponseMsg<List<HdkfSupportCardArchiveDTO>>();
		List<HdkfSupportCardArchiveDTO> queryRespBean = hdkfSupportCardArchiveService.searchHdkfSupportCardArchive(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
