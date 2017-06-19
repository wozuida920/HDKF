package avicit.csmp.basicData.hdkfbdcoderule.rest;

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

import avicit.csmp.basicData.hdkfbdcoderule.dto.HdkfBdCodeRuleDTO;
import avicit.csmp.basicData.hdkfbdcoderule.service.HdkfBdCodeRuleService;

@RestEasyController
@Path("/api/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleRest")
public class HdkfBdCodeRuleRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfBdCodeRuleRest.class);
    
	@Autowired
	private HdkfBdCodeRuleService hdkfBdCodeRuleService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<HdkfBdCodeRuleDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<HdkfBdCodeRuleDTO> responseMsg = new ResponseMsg<HdkfBdCodeRuleDTO>();
		HdkfBdCodeRuleDTO dto = hdkfBdCodeRuleService.queryHdkfBdCodeRuleByPrimaryKey(id);
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
	public ResponseMsg<String> save(HdkfBdCodeRuleDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = hdkfBdCodeRuleService.insertHdkfBdCodeRule(dto);
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
	public ResponseMsg<Integer> updateSensitive(HdkfBdCodeRuleDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfBdCodeRuleService.updateHdkfBdCodeRuleSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(HdkfBdCodeRuleDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfBdCodeRuleService.updateHdkfBdCodeRule(dto);
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
		int count = hdkfBdCodeRuleService.deleteHdkfBdCodeRuleById(id);
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
	public ResponseMsg<QueryRespBean<HdkfBdCodeRuleDTO>> searchByPage(QueryReqBean<HdkfBdCodeRuleDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<HdkfBdCodeRuleDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfBdCodeRuleDTO>>();
		QueryRespBean<HdkfBdCodeRuleDTO> queryRespBean = hdkfBdCodeRuleService.searchHdkfBdCodeRuleByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<HdkfBdCodeRuleDTO>> search(QueryReqBean<HdkfBdCodeRuleDTO> queryReqBean) throws Exception {
		ResponseMsg<List<HdkfBdCodeRuleDTO>> responseMsg = new ResponseMsg<List<HdkfBdCodeRuleDTO>>();
		List<HdkfBdCodeRuleDTO> queryRespBean = hdkfBdCodeRuleService.searchHdkfBdCodeRule(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
