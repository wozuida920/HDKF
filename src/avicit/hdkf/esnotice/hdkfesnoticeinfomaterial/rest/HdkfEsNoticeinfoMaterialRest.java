package avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.rest;

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

import avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.dto.HdkfEsNoticeinfoMaterialDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.service.HdkfEsNoticeinfoMaterialService;

@RestEasyController
@Path("/api/hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialRest")
public class HdkfEsNoticeinfoMaterialRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfEsNoticeinfoMaterialRest.class);
    
	@Autowired
	private HdkfEsNoticeinfoMaterialService hdkfEsNoticeinfoMaterialService;
	
	
	
	
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
	public ResponseMsg<Integer> updateAll(HdkfEsNoticeinfoMaterialDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfEsNoticeinfoMaterialService.updateHdkfEsNoticeinfoMaterial(dto);
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
		int count = hdkfEsNoticeinfoMaterialService.deleteHdkfEsNoticeinfoMaterialById(id);
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
	public ResponseMsg<QueryRespBean<HdkfEsNoticeinfoMaterialDTO>> searchByPage(QueryReqBean<HdkfEsNoticeinfoMaterialDTO> queryReqBean) throws Exception {
		ResponseMsg<QueryRespBean<HdkfEsNoticeinfoMaterialDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfEsNoticeinfoMaterialDTO>>();
		QueryRespBean<HdkfEsNoticeinfoMaterialDTO> queryRespBean = hdkfEsNoticeinfoMaterialService.searchHdkfEsNoticeinfoMaterialByPage(queryReqBean,null);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
	
}
