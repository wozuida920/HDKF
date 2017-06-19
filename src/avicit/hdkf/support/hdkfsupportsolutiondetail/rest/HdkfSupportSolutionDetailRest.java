package avicit.hdkf.support.hdkfsupportsolutiondetail.rest;

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

import avicit.hdkf.support.hdkfsupportsolutiondetail.dto.HdkfSupportSolutionDetailDTO;
import avicit.hdkf.support.hdkfsupportsolutiondetail.service.HdkfSupportSolutionDetailService;

@RestEasyController
@Path("/api/hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailRest")
public class HdkfSupportSolutionDetailRest{
    private static final Logger logger =  LoggerFactory.getLogger(HdkfSupportSolutionDetailRest.class);
    
	@Autowired
	private HdkfSupportSolutionDetailService hdkfSupportSolutionDetailService;
	
	
	
	
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
	public ResponseMsg<Integer> updateAll(HdkfSupportSolutionDetailDTO dto) throws Exception {
		ResponseMsg<Integer> responseMsg = new ResponseMsg<Integer>();
		int count = hdkfSupportSolutionDetailService.updateHdkfSupportSolutionDetail(dto);
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
		int count = hdkfSupportSolutionDetailService.deleteHdkfSupportSolutionDetailById(id);
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
	public ResponseMsg<QueryRespBean<HdkfSupportSolutionDetailDTO>> searchByPage(QueryReqBean<HdkfSupportSolutionDetailDTO> queryReqBean) throws Exception {
		ResponseMsg<QueryRespBean<HdkfSupportSolutionDetailDTO>> responseMsg = new ResponseMsg<QueryRespBean<HdkfSupportSolutionDetailDTO>>();
		QueryRespBean<HdkfSupportSolutionDetailDTO> queryRespBean = hdkfSupportSolutionDetailService.searchHdkfSupportSolutionDetailByPage(queryReqBean,null);
		responseMsg.setResponseBody(queryRespBean);
		return responseMsg;
	}
	
	
}
