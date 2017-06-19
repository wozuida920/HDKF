package avicit.csmp.basicData.csmpbdcompanyinfo.rest;

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

import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.csmp.basicData.csmpbdcompanyinfo.service.CsmpBdCompanyinfoService;

@RestEasyController
@Path("/api/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoRest")
public class CsmpBdCompanyinfoRest{
    private static final Logger logger =  LoggerFactory.getLogger(CsmpBdCompanyinfoRest.class);
    
	@Autowired
	private CsmpBdCompanyinfoService csmpBdCompanyinfoService;
	/**
	 * 通过ID获取单条记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GET
	@Path("/get/v1/{id}")
	@Produces("application/json;charset=UTF-8")
	public ResponseMsg<CsmpBdCompanyinfoDTO> get(@PathParam("id") String id) throws Exception {
		ResponseMsg<CsmpBdCompanyinfoDTO> responseMsg = new ResponseMsg<CsmpBdCompanyinfoDTO>();
		CsmpBdCompanyinfoDTO dto = csmpBdCompanyinfoService.queryCsmpBdCompanyinfoByPrimaryKey(id);
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
	public ResponseMsg<String> save(CsmpBdCompanyinfoDTO dto) throws Exception {
		ResponseMsg<String> responseMsg = new ResponseMsg<String>();
		String id = csmpBdCompanyinfoService.insertCsmpBdCompanyinfo(dto);
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
	public ResponseMsg<Integer> updateSensitive(CsmpBdCompanyinfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdCompanyinfoService.updateCsmpBdCompanyinfoSensitive(dto);
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
	public ResponseMsg<Integer> updateAll(CsmpBdCompanyinfoDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = csmpBdCompanyinfoService.updateCsmpBdCompanyinfo(dto);
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
		int count = csmpBdCompanyinfoService.deleteCsmpBdCompanyinfoById(id);
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
	public ResponseMsg<QueryRespBean<CsmpBdCompanyinfoDTO>> searchByPage(QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean,String sfnConditions) throws Exception {
		ResponseMsg<QueryRespBean<CsmpBdCompanyinfoDTO>> responseMsg = new ResponseMsg<QueryRespBean<CsmpBdCompanyinfoDTO>>();
		QueryRespBean<CsmpBdCompanyinfoDTO> queryRespBean = csmpBdCompanyinfoService.searchCsmpBdCompanyinfoByPage(queryReqBean,sfnConditions);
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
	public ResponseMsg<List<CsmpBdCompanyinfoDTO>> search(QueryReqBean<CsmpBdCompanyinfoDTO> queryReqBean) throws Exception {
		ResponseMsg<List<CsmpBdCompanyinfoDTO>> responseMsg = new ResponseMsg<List<CsmpBdCompanyinfoDTO>>();
		List<CsmpBdCompanyinfoDTO> queryRespBean = csmpBdCompanyinfoService.searchCsmpBdCompanyinfo(queryReqBean);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
}
