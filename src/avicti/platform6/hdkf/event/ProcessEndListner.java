package avicti.platform6.hdkf.event;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javassist.runtime.DotClass;

import org.springframework.beans.factory.annotation.Autowired;

import avicit.csmp.basicData.hdkfbdcoderule.service.HdkfBdCodeRuleService;
import avicit.hdkf.support.hdkfoapublicsheet.dto.HdkfOaPublicsheetDTO;
import avicit.hdkf.support.hdkfoapublicsheet.service.HdkfOaPublicsheetService;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.service.HdkfSupportBorrowPersonInfService;
import avicit.hdkf.support.hdkfsupportcardarchive.dto.HdkfSupportCardArchiveDTO;
import avicit.hdkf.support.hdkfsupportcardarchive.service.HdkfSupportCardArchiveService;
import avicit.hdkf.support.hdkfsupportdealbykf.dto.HdkfSupportDealByKfDTO;
import avicit.hdkf.support.hdkfsupportdealbykf.service.HdkfSupportDealByKfService;
import avicit.hdkf.support.hdkfsupportfaultdetail.dto.HdkfSupportFaultDetailDTO;
import avicit.hdkf.support.hdkfsupportfaultdetail.service.HdkfSupportFaultDetailService;
import avicit.hdkf.support.hdkfsupportfaxinfo.dto.HdkfSupportFaxInfoDTO;
import avicit.hdkf.support.hdkfsupportfaxinfo.service.HdkfSupportFaxInfoService;
import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;
import avicit.hdkf.support.hdkfsupportpersondetail.dto.HdkfSupportPersonDetailDTO;
import avicit.hdkf.support.hdkfsupportpersondetail.service.HdkfSupportPersonDetailService;
import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
import avicit.hdkf.support.hdkfsupportprocessview.service.HdkfSupportProcessViewService;
import avicit.hdkf.support.hdkfsupportrequestinfo.dto.HdkfSupportRequestInfoDTO;
import avicit.hdkf.support.hdkfsupportrequestinfo.service.HdkfSupportRequestInfoService;
import avicit.hdkf.support.hdkfsupportresponseinfo.dto.HdkfSupportResponseInfoDTO;
import avicit.hdkf.support.hdkfsupportresponseinfo.service.HdkfSupportResponseInfoService;
import avicit.hdkf.support.hdkfsupporttaskarchive.dto.HdkfSupportTaskArchiveDTO;
import avicit.hdkf.support.hdkfsupporttaskarchive.service.HdkfSupportTaskArchiveService;
import avicit.hdkf.support.hdkfsupporttriptask.dto.HdkfSupportTripTaskDTO;
import avicit.hdkf.support.hdkfsupporttriptask.service.HdkfSupportTripTaskService;
import avicit.platform6.api.sysuser.SysUserAPI;
import avicit.platform6.api.sysuser.dto.SysUser;
import avicit.platform6.bpm.api.listener.EventListener;
import avicit.platform6.bpm.api.listener.EventListenerExecution;
import avicit.platform6.core.domain.BeanProcess;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.spring.SpringFactory;

public class ProcessEndListner implements EventListener {
	/**
	 * avicti.platform6.hdkf.event.ProcessEndListner
	 */
	private static final long serialVersionUID = 1L;
	// private int eventType;
	//
	//
	// public int getEventType() {
	// return eventType;
	// }
	//
	//
	// public void setEventType(int eventType) {
	// this.eventType = eventType;
	// }
	String msg;
	private HdkfSupportProcessViewService hdkfSupportProcessViewService = SpringFactory
			.getBean(HdkfSupportProcessViewService.class);
	
	
	private void setBatchNos(String requestId,String batchNo)
	{
		HdkfSupportRequestInfoService hdkfSupportRequestInfoService = SpringFactory
				.getBean(HdkfSupportRequestInfoService.class);
		try {
			HdkfSupportRequestInfoDTO  hdkfSupportRequestInfoDTO = hdkfSupportRequestInfoService.queryHdkfSupportRequestInfoByPrimaryKey(requestId);
			hdkfSupportRequestInfoDTO.setBatchNo(batchNo);
			hdkfSupportRequestInfoService.updateHdkfSupportRequestInfoSensitive(hdkfSupportRequestInfoDTO);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	private  String getBatchNos(String requestId){
		
		
		String batchNo="";
		HdkfSupportFaultDetailService  hdkfSupportFaultDetailService=  SpringFactory
				.getBean(HdkfSupportFaultDetailService.class);
		
		try {
			QueryReqBean<HdkfSupportFaultDetailDTO> queryReqBean= new QueryReqBean<HdkfSupportFaultDetailDTO>() ;
			HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO = new HdkfSupportFaultDetailDTO();
			hdkfSupportFaultDetailDTO.setRequestId(requestId);
			queryReqBean.setSearchParams(hdkfSupportFaultDetailDTO);
			QueryRespBean<HdkfSupportFaultDetailDTO>  respBean =hdkfSupportFaultDetailService.searchHdkfSupportFaultDetailByPage(queryReqBean, "");
		
			int i=0;
			for(HdkfSupportFaultDetailDTO o:respBean.getResult()){
				if(i==0)
					batchNo +=o.getBatchNo();
				else {
					batchNo +=","+o.getBatchNo();
				}
				
				i++;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return batchNo;
	}
	

	private void notifyAfterRequest(EventListenerExecution execution) {
		String id = (String) execution.getVariable("id");
		String requestNo = (String) execution.getVariable("requestNo");
		String distributionType = (String) execution
				.getVariable("distributionType");
		String faultType = (String) execution.getVariable("faultType");
		{
			// 启动 处理DealByKf

			String requestManagerId = (String) execution
					.getVariable("requestManagerId");
			String requestManagerName = (String) execution
					.getVariable("requestManagerName");

			Map<String, Object> parameter = new HashMap<String, Object>();

			parameter.put("processDefId", "8a58bc4c569cdcd701569cf14eba0113-2");// 需要更换
			parameter.put("formCode", "hdkfSupportDealByKf");
			parameter.put("userId", requestManagerId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(requestManagerId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);

			HdkfSupportDealByKfDTO dto = new HdkfSupportDealByKfDTO();
			dto.setRequestId(id);
			dto.setRequestNo(requestNo);
			if(distributionType.equals("0"))
			    dto.setIsSelfDeal("Y");
			else 
				 dto.setIsSelfDeal("N");
			
			dto.setDealUserId(requestManagerId);
			dto.setDealUserName(requestManagerName);
			dto.setDealDepartId(deptId);

			dto.setDealDepartIdAlias(sysUser1.getDeptName());
			HdkfSupportDealByKfService service = SpringFactory
					.getBean(HdkfSupportDealByKfService.class);
			try {
				BeanProcess bp = service
						.insertHdkfSupportDealByKfAndStartProcess(dto,
								parameter);
				HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
						.findDtoByRequestId(id);
				hdkfSupportProcessViewDTO.setDealId(bp.getFormId());
				if (distributionType.equals("0"))
					hdkfSupportProcessViewDTO.setHasOutfiedcard("N");
				else
					hdkfSupportProcessViewDTO.setHasOutfiedcard("Y");
				if (faultType.equals("1"))
					hdkfSupportProcessViewDTO.setHasOapublishsheet("Y");
				else
					hdkfSupportProcessViewDTO.setHasOapublishsheet("N");

				hdkfSupportProcessViewDTO.setCurStatus("3");
				hdkfSupportProcessViewDTO.setCurBpmstate("拟稿");
				hdkfSupportProcessViewDTO.setCurUser(requestManagerId);

				hdkfSupportProcessViewService
						.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		String requestManagerId = (String) execution
				.getVariable("requestManagerId");
		String requestManagerName = (String) execution
				.getVariable("requestManagerName");
		String requestUnitAlias = (String) execution
				.getVariable("requestUnitAlias");
	//	String batchNoAlias = (String) execution.getVariable("batchNo");
		String batchNoAlias = getBatchNos(id);
		setBatchNos(id,batchNoAlias);
		
		String modelIdAlias = (String) execution.getVariable("modelIdAlias");
		String productionUnit = (String) execution
				.getVariable("productionUnit");
//		java.util.Date repairTime = new java.util.Date(
//				(Long) execution.getVariable("repairTime"));
		//float flightHours = Float.parseFloat((Double) execution
			//	.getVariable("flightHours") + "");
		//long flightLanding = (Integer) execution.getVariable("flightLanding");
		String requestMethod = (String) execution.getVariable("requestMethod");
		String requestName = (String) execution.getVariable("requestName");
		if (distributionType.equals("1")) {
			// 启动 outFieldCard
			// String id = (String)execution.getVariable("id");
			// String requestNo = (String)execution.getVariable("requestNo");

			Map<String, Object> parameter = new HashMap<String, Object>();

			parameter.put("processDefId", "8a58c6f656a1ca570156a206a5ec0179-3");// 需要更换8a58c6f656a1ca570156a206a5ec0179-1
			parameter.put("formCode", "hdkfSupportOutfieldCard");// hdkfSupportOutfieldCard
			parameter.put("userId", requestManagerId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(requestManagerId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);

			// 修改成外场信息处理卡
			HdkfSupportOutfieldCardDTO dto = new HdkfSupportOutfieldCardDTO();
			dto.setRequestId(id);
			dto.setRequestNo(requestNo);

			// dto.setDealUserId(requestManagerId);
			// dto.setDealUserName(requestManagerName);
			dto.setKfUserId(requestManagerId);
			dto.setKfUserName(requestManagerName);
		    dto.setBatchNo(batchNoAlias);
			dto.setProductionUnit(productionUnit);
			dto.setModelId(modelIdAlias);
			dto.setRequestUnit(requestUnitAlias);
			//dto.setFactoryTime(repairTime);
			dto.setRequestMethod(requestMethod);
			//dto.setFlightLanding(flightLanding);
			//dto.setFlightHours(flightHours);
			dto.setFaultName(requestName);

			HdkfBdCodeRuleService hdkfBdCodeRuleService = SpringFactory
					.getBean(HdkfBdCodeRuleService.class);
			String outCardNo = "";
			try {
				outCardNo = hdkfBdCodeRuleService.getAutomicCode("B", null, id);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			dto.setInfoCardNo(outCardNo);

			HdkfSupportOutfieldCardService service = SpringFactory
					.getBean(HdkfSupportOutfieldCardService.class);
			try {
				service.insertHdkfSupportOutfieldCardAndStartProcess(dto,
						parameter);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (faultType.equals("1")) {
			// 是,启动公用笺流程
			// 待补充
			//System.out.println("faultType---->" + faultType);
			Map<String, Object> parameter = new HashMap<String, Object>();

			parameter.put("processDefId", "4028e43a5721085201572139d6c80118-1");// 需要更换8a58c6f656a1ca570156a206a5ec0179-1
			parameter.put("formCode", "hdkfOaPublicsheet");// hdkfSupportOutfieldCard
			parameter.put("userId", requestManagerId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(requestManagerId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);

			HdkfOaPublicsheetDTO dto = new HdkfOaPublicsheetDTO();
			dto.setAttribute01(id);
			dto.setAttribute02(requestNo);
			dto.setAttribute03("Y");

			//dto.setPlanetype(modelIdAlias);
			dto.setSendDep("8a58bc4c569605940156961f6ee60063");
			dto.setRecorder(requestManagerName);

			HdkfOaPublicsheetService service = SpringFactory
					.getBean(HdkfOaPublicsheetService.class);
			try {
				service.insertHdkfOaPublicsheetAndStartProcess(dto, parameter);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	private void notifyAfterOutFiled(EventListenerExecution execution) {
		String requestId = (String) execution.getVariable("requestId");
		String requestNo = (String) execution.getVariable("requestNo");
		String requestManagerId = (String) execution.getVariable("kfUserId");
		String requestManagerName = (String) execution
				.getVariable("kfUserName");
		String outfieldCardId = (String) execution.getVariable("id");
		String outfieldCardNo = (String) execution.getVariable("infoCardNo");
		Map<String, Object> parameter = new HashMap<String, Object>();

		parameter.put("processDefId", "8a58bc4c569cdcd701569cf14eba0113-1");// 需要更换
		parameter.put("formCode", "hdkfSupportDealByKf");
		parameter.put("userId", requestManagerId);
		SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
		SysUser sysUser1 = userApi.getSysUserById(requestManagerId);
		String deptId = sysUser1.getDeptId();
		parameter.put("deptId", deptId);

		HdkfSupportDealByKfDTO dto = new HdkfSupportDealByKfDTO();
		dto.setRequestId(requestId);
		dto.setRequestNo(requestNo);
		dto.setIsSelfDeal("N");
		dto.setOutfieldCardId(outfieldCardId);
		dto.setOutfieldCardNo(outfieldCardNo);
		dto.setDealUserId(requestManagerId);
		dto.setDealUserName(requestManagerName);
		dto.setDealDepartId(deptId);

		dto.setDealDepartIdAlias(sysUser1.getDeptName());
		HdkfSupportDealByKfService service = SpringFactory
				.getBean(HdkfSupportDealByKfService.class);
		try {
			service.insertHdkfSupportDealByKfAndStartProcess(dto, parameter);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void notifyAfterDealByKf(EventListenerExecution execution) {
		String isOutfield = (String) execution.getVariable("isOutfield");
		String requestId = (String) execution.getVariable("requestId");
		String requestNo = (String) execution.getVariable("requestNo");
		String dealName = (String) execution.getVariable("dealName");
		String id = (String) execution.getVariable("id");
		String writeManId = (String) execution.getVariable("dealUserId");
		String writeManName = (String) execution.getVariable("dealUserName");
		String isFax = (String) execution.getVariable("isFax");
		// String requestNo = (String)execution.getVariable("dealNo");
		if (isOutfield != null && isOutfield.equals("Y")) {
			Map<String, Object> parameter = new HashMap<String, Object>();

			parameter.put("processDefId", "8a58bc4c56b6615a0156b6636561007f-1");// 需要更换
			parameter.put("formCode", "hdkfSupportTripTask");
			parameter.put("userId", writeManId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(writeManId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);

			HdkfSupportTripTaskDTO dto = new HdkfSupportTripTaskDTO();
			dto.setRequestId(requestId);
			dto.setRequestNo(requestNo);
			dto.setKfDealId(id);
			dto.setWriteManId(writeManId);
			dto.setWriteManName(writeManName);
			HdkfBdCodeRuleService hdkfBdCodeRuleService = SpringFactory
					.getBean(HdkfBdCodeRuleService.class);
			String taskNo = "";
			try {
				taskNo = hdkfBdCodeRuleService.getAutomicCode("C", null,
						requestId);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			dto.setTaskNo(taskNo);

			HdkfSupportTripTaskService service = SpringFactory
					.getBean(HdkfSupportTripTaskService.class);
			try {
				BeanProcess bp = service
						.insertHdkfSupportTripTaskAndStartProcess(dto,
								parameter);
				HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
						.findDtoByRequestId(requestId);
				hdkfSupportProcessViewDTO.setTaskId(bp.getFormId());
				hdkfSupportProcessViewDTO.setTaskNo(taskNo);
				hdkfSupportProcessViewDTO.setHasFax(isFax);
				hdkfSupportProcessViewDTO.setDealName(dealName);

				hdkfSupportProcessViewDTO.setCurStatus("5");
				hdkfSupportProcessViewDTO.setCurBpmstate("拟稿");
				hdkfSupportProcessViewDTO.setCurUser(writeManId);

				hdkfSupportProcessViewService
						.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

			} catch (Exception e) {
				// TODO: handle exception

				e.printStackTrace();
			}
		} else if (isOutfield != null && isOutfield.equals("N")) {
			Map<String, Object> parameter = new HashMap<String, Object>();
			parameter.put("processDefId", "8a58c6f656bbaf990156bbbdcb37008d-2");// 需要更换
			parameter.put("formCode", "hdkfSupportResponseInfo");
			parameter.put("userId", writeManId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(writeManId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);

			HdkfSupportResponseInfoDTO dto = new HdkfSupportResponseInfoDTO();
			dto.setRequestDealId(id);
			dto.setDealNo(dealName);
			dto.setRequestId(requestId);
			dto.setRequestNo(requestNo);
			dto.setAttribute01(writeManId);
			dto.setAttribute02(writeManName);
			dto.setRespUserId(writeManId);
			dto.setRespUserName(writeManName);
			HdkfSupportResponseInfoService service = SpringFactory
					.getBean(HdkfSupportResponseInfoService.class);
			try {
				BeanProcess bp = service
						.insertHdkfSupportResponseInfoAndStartProcess(dto,
								parameter);
				HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
						.findDtoByRequestId(requestId);
				hdkfSupportProcessViewDTO.setRespId(bp.getFormId());
				hdkfSupportProcessViewDTO.setHasFax(isFax);
				hdkfSupportProcessViewDTO.setDealName(dealName);

				hdkfSupportProcessViewDTO.setCurStatus("4");
				hdkfSupportProcessViewDTO.setCurBpmstate("拟稿");
				hdkfSupportProcessViewDTO.setCurUser(writeManId);

				hdkfSupportProcessViewService
						.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
		if (isFax != null && isFax.equals("Y")) {
		//	System.out.println("isFax in endListner---->" + isFax);
			//
			//hdkfSupportFaxInfo
			Map<String, Object> parameter = new HashMap<String, Object>();
			parameter.put("processDefId", "4028e4ec5755ddc5015755e5fdf8017a-1");// 需要更换
			parameter.put("formCode", "hdkfSupportFaxInfo");
			parameter.put("userId", writeManId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(writeManId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);
			
			HdkfSupportFaxInfoDTO dto = new HdkfSupportFaxInfoDTO();
			dto.setFromAddr("中国南昌新溪桥");
			dto.setFromEnAddr("Xinxiqiao,330024,Nanchang,P.R.China");
			dto.setFromZipcode("330024");
			dto.setRequestDealId(id);
			dto.setDealName(dealName);
			dto.setRequestId(requestId);
			dto.setRequestNo(requestNo);
			
			
			HdkfBdCodeRuleService hdkfBdCodeRuleService = SpringFactory
					.getBean(HdkfBdCodeRuleService.class);
			String faxNo = "";
			try {
				faxNo = hdkfBdCodeRuleService.getAutomicCode("D", null,
						requestId);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			dto.setFaxNo(faxNo);
			//dto.setSendDate(sendDate)
			
			HdkfSupportFaxInfoService hdkfSupportFaxInfoService = SpringFactory.getBean(HdkfSupportFaxInfoService.class);
			try {
				hdkfSupportFaxInfoService.insertHdkfSupportFaxInfoAndStartProcess(dto, parameter);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void notifyBorrowInTripTask(EventListenerExecution execution) {
		String isBorrowSomeone = (String) execution
				.getVariable("isBorrowSomeone");
		if (isBorrowSomeone.equals("Y")) {
			// String id = (String)execution.getVariable("id");
			// String writeManId=(String)execution.getVariable("writeManId");
			// String writeManName =
			// (String)execution.getVariable("writeManName");
			// String taskNo = (String)execution.getVariable("taskNo");
			//
			// Map<String, Object> parameter = new HashMap<String,Object>();
			//
			// parameter.put("processDefId",
			// "8a58c6db56b64ba50156b652c2570084-1");//需要更换
			// parameter.put("formCode", "hdkfSupportBorrowPersonInf");
			// parameter.put("userId", writeManId);
			// SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			// SysUser sysUser1 = userApi.getSysUserById(writeManId);
			// String deptId = sysUser1.getDeptId();
			// parameter.put("deptId", deptId);
			//
			//
			// HdkfSupportBorrowPersonInfDTO dto = new
			// HdkfSupportBorrowPersonInfDTO();
			// dto.setTaskId(id);
			// dto.setTaskNo(taskNo);
			// dto.setLinkManKf(writeManName);
			//
			// HdkfSupportBorrowPersonInfService service =
			// SpringFactory.getBean(HdkfSupportBorrowPersonInfService.class);
			// try {
			// service.insertHdkfSupportBorrowPersonInfAndStartProcess(dto,
			// parameter);
			// } catch (Exception e) {
			// // TODO: handle exception
			// e.printStackTrace();
			// }
			//System.out.println("isBorrowSomeone in ProcessEndListner----->"
				//	+ isBorrowSomeone);

		} else {
			//System.out.println("isBorrowSomeone in ProcessEndListner----->"
				//	+ isBorrowSomeone);
		}
	}

	private void notifyCardArchiveInTripTask(EventListenerExecution execution) {
		// Date tripStartTime = (Date)execution.getVariable("tripStartTime");
		java.util.Date tripStartTime = (java.util.Date) execution
				.getVariable("tripStartTime");
		if (tripStartTime != null) {
			String id = (String) execution.getVariable("id");
			String writeManId = (String) execution.getVariable("writeManId");
			String writeManName = (String) execution
					.getVariable("writeManName");
			String taskNo = (String) execution.getVariable("taskNo");
			String requestId = (String) execution.getVariable("requestId");
			String requestNo = (String) execution.getVariable("requestNo");
			String kfDealId = (String) execution.getVariable("kfDealId");
			Map<String, Object> parameter = new HashMap<String, Object>();

			parameter.put("processDefId", "8a58bc4c56c050a80156c06305b201ce-1");// 需要更换
			parameter.put("formCode", "hdkfSupportCardArchive");
			parameter.put("userId", writeManId);
			SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
			SysUser sysUser1 = userApi.getSysUserById(writeManId);
			String deptId = sysUser1.getDeptId();
			parameter.put("deptId", deptId);

			HdkfSupportCardArchiveDTO dto = new HdkfSupportCardArchiveDTO();
			dto.setTripStartTime(tripStartTime);
			dto.setAttribute01(id);
			dto.setAttribute02(taskNo);
			dto.setRequestId(requestId);
			dto.setRequestNo(requestNo);
			dto.setDealId(kfDealId);
			dto.setArchiveType("2");

			HdkfSupportCardArchiveService service = SpringFactory
					.getBean(HdkfSupportCardArchiveService.class);
			try {
				BeanProcess bp = service
						.insertHdkfSupportCardArchiveAndStartProcess(dto,
								parameter);
				HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
						.findDtoByRequestId(requestId);
				hdkfSupportProcessViewDTO.setCardArchiveId(bp.getFormId());

				hdkfSupportProcessViewDTO.setCurStatus("54");
				hdkfSupportProcessViewDTO.setCurBpmstate("信息卡归档拟稿");
				hdkfSupportProcessViewDTO.setCurUser(writeManId);

				hdkfSupportProcessViewService
						.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	private void notifyAfterTripTask(EventListenerExecution execution) {
		String id = (String) execution.getVariable("id");
		String writeManId = (String) execution.getVariable("writeManId");
		String writeManName = (String) execution.getVariable("writeManName");
		String requestId = (String) execution.getVariable("requestId");
		String taskNo = (String) execution.getVariable("taskNo");
		Map<String, Object> parameter = new HashMap<String, Object>();

		parameter.put("processDefId", "8a58c6db56c08f3b0156c0d825660095-1");// 需要更换
		parameter.put("formCode", "hdkfSupportTaskArchive");
		parameter.put("userId", writeManId);
		SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
		SysUser sysUser1 = userApi.getSysUserById(writeManId);
		String deptId = sysUser1.getDeptId();
		parameter.put("deptId", deptId);
		/*
		 * need add
		 */
		HdkfSupportTaskArchiveDTO dto = new HdkfSupportTaskArchiveDTO();
		dto.setTaskId(id);
		dto.setTaskNo(taskNo);

		HdkfSupportTaskArchiveService service = SpringFactory
				.getBean(HdkfSupportTaskArchiveService.class);
		try {
			BeanProcess bp = service
					.insertHdkfSupportTaskArchiveAndStartProcess(dto, parameter);
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
					.findDtoByRequestId(requestId);
			hdkfSupportProcessViewDTO.setTaskArchiveId(bp.getFormId());

			hdkfSupportProcessViewDTO.setCurStatus("6");
			hdkfSupportProcessViewDTO.setCurBpmstate("拟稿");
			hdkfSupportProcessViewDTO.setCurUser(writeManId);

			hdkfSupportProcessViewService
					.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// HdkfsupportTask
	}

	private void notifyAterResponse(EventListenerExecution execution) {
		String requestId = (String) execution.getVariable("requestId");
		String requestNo = (String) execution.getVariable("requestNo");
		String respId = (String) execution.getVariable("id");
		String writeManId = (String) execution.getVariable("attribute01");
		String respNo = (String) execution.getVariable("respNo");
		String requestDealId = (String) execution.getVariable("requestDealId");
		Map<String, Object> parameter = new HashMap<String, Object>();

		parameter.put("processDefId", "8a58bc4c56c050a80156c06305b201ce-1");// 需要更换8a58c6db56c08f3b0156c0d825660095-1

		parameter.put("formCode", "hdkfSupportCardArchive");
		parameter.put("userId", writeManId);
		SysUserAPI userApi = SpringFactory.getBean(SysUserAPI.class);
		SysUser sysUser1 = userApi.getSysUserById(writeManId);
		String deptId = sysUser1.getDeptId();
		parameter.put("deptId", deptId);

		HdkfSupportCardArchiveDTO dto = new HdkfSupportCardArchiveDTO();
		dto.setRequestId(requestId);
		dto.setRequestNo(requestNo);
		dto.setRespId(respId);
		dto.setRespNo(respNo);
		dto.setArchiveType("1");
		dto.setDealId(requestDealId);

		HdkfSupportCardArchiveService service = SpringFactory
				.getBean(HdkfSupportCardArchiveService.class);
		try {

			BeanProcess bp = service
					.insertHdkfSupportCardArchiveAndStartProcess(dto, parameter);
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
					.findDtoByRequestId(requestId);
			hdkfSupportProcessViewDTO.setCardArchiveId(bp.getFormId());
			hdkfSupportProcessViewDTO.setRespNo(respNo);

			hdkfSupportProcessViewDTO.setCurStatus("7");
			hdkfSupportProcessViewDTO.setCurBpmstate("拟稿");
			hdkfSupportProcessViewDTO.setCurUser(writeManId);

			hdkfSupportProcessViewService
					.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void notifyInBorrowPerson(EventListenerExecution execution) {
		String id = (String) execution.getVariable("id");
		try {
			HdkfSupportBorrowPersonInfService service = SpringFactory
					.getBean(HdkfSupportBorrowPersonInfService.class);
			HdkfSupportBorrowPersonInfDTO dto = service
					.queryHdkfSupportBorrowPersonInfByPrimaryKey(id);
			HdkfSupportPersonDetailService hdkfSupportPersonDetailService = SpringFactory
					.getBean(HdkfSupportPersonDetailService.class);

			QueryReqBean<HdkfSupportPersonDetailDTO> queryReqBean = new QueryReqBean<HdkfSupportPersonDetailDTO>();
			HdkfSupportPersonDetailDTO searchParams = new HdkfSupportPersonDetailDTO();
			searchParams.setBorrowInfoId(id);
			queryReqBean.setSearchParams(searchParams);

			QueryRespBean<HdkfSupportPersonDetailDTO> result = hdkfSupportPersonDetailService
					.searchHdkfSupportPersonDetailByPage(queryReqBean, "");

			avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportPersonDetailDTO> page = result
					.getResult();
			dto.setAttribute11(page.getTotal());
			service.updateHdkfSupportBorrowPersonInfSensitive1(dto);
			// System.out.println("------------------------------------------in Listner................");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void notifyAfterBorrowPerson(EventListenerExecution execution) {
		// String formId = (String)execution.getVariable("id");
		String taskId = (String) execution.getVariable("taskId");
		try {
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService
					.findDtoByTaskId(taskId);
			// hdkfSupportProcessViewDTO.setTaskArchiveId(bp.getFormId());

			hdkfSupportProcessViewDTO.setCurStatus("52");
			hdkfSupportProcessViewDTO.setCurBpmstate("借人单结束，继续任务书审批");
			hdkfSupportProcessViewDTO.setCurUser(null);

			hdkfSupportProcessViewService
					.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	private void notifyAfterCardArchive(EventListenerExecution execution) {
		// String formId = (String)execution.getVariable("id");
		String requestId = (String) execution.getVariable("requestId");
		String archiveType=(String)execution.getVariable("archiveType");
		if(archiveType.equals("2")){
		try {
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO = hdkfSupportProcessViewService.findDtoByRequestId(requestId);
			// hdkfSupportProcessViewDTO.setTaskArchiveId(bp.getFormId());

			hdkfSupportProcessViewDTO.setCurStatus("55");
			hdkfSupportProcessViewDTO.setCurBpmstate("信息卡归档结束，继续任务书审批");
			hdkfSupportProcessViewDTO.setCurUser(null);

			hdkfSupportProcessViewService
					.updateHdkfSupportProcessViewSensitive(hdkfSupportProcessViewDTO);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		}

	}

	@Override
	public void notify(EventListenerExecution execution) throws Exception {

		// System.out.println("msg---------->"+msg);
		// TODO Auto-generated method stub
		if (msg.equals("0"))
			notifyAfterRequest(execution);
		// else if(msg.equals("1"))
		// notifyAfterOutFiled(execution);
		else if (msg.equals("2"))
			notifyAfterDealByKf(execution);
		// else if(msg.equals("3"))
		// notifyBorrowInTripTask(execution);
		else if (msg.equals("4"))
			notifyCardArchiveInTripTask(execution);
		else if (msg.equals("5"))
			notifyAfterTripTask(execution);
		else if (msg.equals("6"))
			notifyAterResponse(execution);
		// else if(msg.equals("7"))
		// notifyAfterBorrowPerson(execution);
		else if (msg.equals("8"))
			notifyInBorrowPerson(execution);
		else if (msg.equals("9"))
			notifyAfterBorrowPerson(execution);
		else if (msg.equals("10"))
			notifyAfterCardArchive(execution);
	}

}
