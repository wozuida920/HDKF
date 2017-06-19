package avicit.hdkf.support.hdkfsupportresponseinfo.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportResponseInfo
 * Title: 表HDKF_SUPPORT_RESPONSE_INFO的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_RESPONSE_INFO
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-08-24 11:38
 *
 */
 @PojoRemark(table="hdkf_support_response_info",object="HdkfSupportResponseInfoDTO",name="HDKF_SUPPORT_RESPONSE_INFO")
 public class HdkfSupportResponseInfoDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
    private java.lang.String activityalias_; // 节点中文名称
	private java.lang.String activityname_; // 当前节点id
	private java.lang.String businessstate_; // 流程当前状态
	private java.lang.String currUserId; // 当前登录人ID
	private java.lang.String bpmType; 
    private java.lang.String bpmState; 
	
						@Id
							@LogField
				
				 	@FieldRemark(column="id",field="id",name="主键")
		 	private java.lang.String id;
												
				 	@FieldRemark(column="request_deal_id",field="requestDealId",name="请求处理ID")
		 	private java.lang.String requestDealId;
												
				 	@FieldRemark(column="deal_no",field="dealNo",name="处理信息编号")
		 	private java.lang.String dealNo;
												
				 	@FieldRemark(column="resp_name",field="respName",name="答复名称")
		 	private java.lang.String respName;
												
				 	@FieldRemark(column="final_decision",field="finalDecision",name="最终处理意见")
		 	private java.lang.String finalDecision;
												
				 	@FieldRemark(column="resp_user_id",field="respUserId",name="经办人ID")
		 	private java.lang.String respUserId;
												
				 	@FieldRemark(column="resp_user_name",field="respUserName",name="经办人姓名")
		 	private java.lang.String respUserName;
												
		    			@FieldRemark(column="actual_time",field="actualTime",name="答复时间")
    		 	private java.util.Date actualTime;
    		 	
    		 	private java.util.Date actualTimeBegin;
    		 	
    		 	private java.util.Date actualTimeEnd;
												
				 	@FieldRemark(column="resp_by",field="respBy",name="答复方式")
		 	private long respBy;
												
				 	@FieldRemark(column="resp_no",field="respNo",name="答复文号")
		 	private java.lang.String respNo;
													@LogField
				
				 	@FieldRemark(column="request_id",field="requestId",name="求援请求ID")
		 	private java.lang.String requestId;
												
				 	@FieldRemark(column="request_no",field="requestNo",name="信息处理卡编号")
		 	private java.lang.String requestNo;
																		
				 	@FieldRemark(column="attribute_01",field="attribute01",name="扩展字段01")
		 	private java.lang.String attribute01;
												
				 	@FieldRemark(column="attribute_02",field="attribute02",name="扩展字段02")
		 	private java.lang.String attribute02;
												
				 	@FieldRemark(column="attribute_03",field="attribute03",name="扩展字段03")
		 	private java.lang.String attribute03;
												
				 	@FieldRemark(column="attribute_04",field="attribute04",name="扩展字段04")
		 	private java.lang.String attribute04;
												
				 	@FieldRemark(column="attribute_05",field="attribute05",name="扩展字段05")
		 	private java.lang.String attribute05;
												
				 	@FieldRemark(column="attribute_06",field="attribute06",name="扩展字段06")
		 	private java.lang.String attribute06;
												
				 	@FieldRemark(column="attribute_07",field="attribute07",name="扩展字段07")
		 	private java.lang.String attribute07;
												
				 	@FieldRemark(column="attribute_08",field="attribute08",name="扩展字段08")
		 	private java.lang.String attribute08;
												
				 	@FieldRemark(column="attribute_09",field="attribute09",name="扩展字段09")
		 	private java.lang.String attribute09;
												
				 	@FieldRemark(column="attribute_10",field="attribute10",name="扩展字段10")
		 	private java.lang.String attribute10;
												
				 	@FieldRemark(column="attribute_11",field="attribute11",name="扩展字段11")
		 	private long attribute11;
												
				 	@FieldRemark(column="attribute_12",field="attribute12",name="扩展字段12")
		 	private long attribute12;
												
		    			@FieldRemark(column="attribute_13",field="attribute13",name="扩展字段13")
    		 	private java.util.Date attribute13;
    		 	
    		 	private java.util.Date attribute13Begin;
    		 	
    		 	private java.util.Date attribute13End;
												
		    			@FieldRemark(column="attribute_14",field="attribute14",name="扩展字段14")
    		 	private java.util.Date attribute14;
    		 	
    		 	private java.util.Date attribute14Begin;
    		 	
    		 	private java.util.Date attribute14End;
			

  							
							public java.lang.String getId(){
		  			return id;
				}
			
				public void setId(java.lang.String id){
		  			this.id = id;
				}
						
								
							public java.lang.String getRequestDealId(){
		  			return requestDealId;
				}
			
				public void setRequestDealId(java.lang.String requestDealId){
		  			this.requestDealId = requestDealId;
				}
						
								
							public java.lang.String getDealNo(){
		  			return dealNo;
				}
			
				public void setDealNo(java.lang.String dealNo){
		  			this.dealNo = dealNo;
				}
						
								
							public java.lang.String getRespName(){
		  			return respName;
				}
			
				public void setRespName(java.lang.String respName){
		  			this.respName = respName;
				}
						
								
							public java.lang.String getFinalDecision(){
		  			return finalDecision;
				}
			
				public void setFinalDecision(java.lang.String finalDecision){
		  			this.finalDecision = finalDecision;
				}
						
								
							public java.lang.String getRespUserId(){
		  			return respUserId;
				}
			
				public void setRespUserId(java.lang.String respUserId){
		  			this.respUserId = respUserId;
				}
						
								
							public java.lang.String getRespUserName(){
		  			return respUserName;
				}
			
				public void setRespUserName(java.lang.String respUserName){
		  			this.respUserName = respUserName;
				}
						
								
							public java.util.Date getActualTime(){
		  			return actualTime;
				}
			
				public void setActualTime(java.util.Date actualTime){
		  			this.actualTime = actualTime;
				}
				
				public java.util.Date getActualTimeBegin(){
		  			return actualTimeBegin;
				}
			
				public void setActualTimeBegin(java.util.Date actualTimeBegin){
		  			this.actualTimeBegin = actualTimeBegin;
				}
				
				public java.util.Date getActualTimeEnd(){
		  			return actualTimeEnd;
				}
			
				public void setActualTimeEnd(java.util.Date actualTimeEnd){
		  			this.actualTimeEnd = actualTimeEnd;
				}
						
								
							public long getRespBy(){
		  			return respBy;
				}
			
				public void setRespBy(long respBy){
		  			this.respBy = respBy;
				}
						
								
							public java.lang.String getRespNo(){
		  			return respNo;
				}
			
				public void setRespNo(java.lang.String respNo){
		  			this.respNo = respNo;
				}
						
								
							public java.lang.String getRequestId(){
		  			return requestId;
				}
			
				public void setRequestId(java.lang.String requestId){
		  			this.requestId = requestId;
				}
						
								
							public java.lang.String getRequestNo(){
		  			return requestNo;
				}
			
				public void setRequestNo(java.lang.String requestNo){
		  			this.requestNo = requestNo;
				}
						
																										
							public java.lang.String getAttribute01(){
		  			return attribute01;
				}
			
				public void setAttribute01(java.lang.String attribute01){
		  			this.attribute01 = attribute01;
				}
						
								
							public java.lang.String getAttribute02(){
		  			return attribute02;
				}
			
				public void setAttribute02(java.lang.String attribute02){
		  			this.attribute02 = attribute02;
				}
						
								
							public java.lang.String getAttribute03(){
		  			return attribute03;
				}
			
				public void setAttribute03(java.lang.String attribute03){
		  			this.attribute03 = attribute03;
				}
						
								
							public java.lang.String getAttribute04(){
		  			return attribute04;
				}
			
				public void setAttribute04(java.lang.String attribute04){
		  			this.attribute04 = attribute04;
				}
						
								
							public java.lang.String getAttribute05(){
		  			return attribute05;
				}
			
				public void setAttribute05(java.lang.String attribute05){
		  			this.attribute05 = attribute05;
				}
						
								
							public java.lang.String getAttribute06(){
		  			return attribute06;
				}
			
				public void setAttribute06(java.lang.String attribute06){
		  			this.attribute06 = attribute06;
				}
						
								
							public java.lang.String getAttribute07(){
		  			return attribute07;
				}
			
				public void setAttribute07(java.lang.String attribute07){
		  			this.attribute07 = attribute07;
				}
						
								
							public java.lang.String getAttribute08(){
		  			return attribute08;
				}
			
				public void setAttribute08(java.lang.String attribute08){
		  			this.attribute08 = attribute08;
				}
						
								
							public java.lang.String getAttribute09(){
		  			return attribute09;
				}
			
				public void setAttribute09(java.lang.String attribute09){
		  			this.attribute09 = attribute09;
				}
						
								
							public java.lang.String getAttribute10(){
		  			return attribute10;
				}
			
				public void setAttribute10(java.lang.String attribute10){
		  			this.attribute10 = attribute10;
				}
						
								
							public long getAttribute11(){
		  			return attribute11;
				}
			
				public void setAttribute11(long attribute11){
		  			this.attribute11 = attribute11;
				}
						
								
							public long getAttribute12(){
		  			return attribute12;
				}
			
				public void setAttribute12(long attribute12){
		  			this.attribute12 = attribute12;
				}
						
								
							public java.util.Date getAttribute13(){
		  			return attribute13;
				}
			
				public void setAttribute13(java.util.Date attribute13){
		  			this.attribute13 = attribute13;
				}
				
				public java.util.Date getAttribute13Begin(){
		  			return attribute13Begin;
				}
			
				public void setAttribute13Begin(java.util.Date attribute13Begin){
		  			this.attribute13Begin = attribute13Begin;
				}
				
				public java.util.Date getAttribute13End(){
		  			return attribute13End;
				}
			
				public void setAttribute13End(java.util.Date attribute13End){
		  			this.attribute13End = attribute13End;
				}
						
								
							public java.util.Date getAttribute14(){
		  			return attribute14;
				}
			
				public void setAttribute14(java.util.Date attribute14){
		  			this.attribute14 = attribute14;
				}
				
				public java.util.Date getAttribute14Begin(){
		  			return attribute14Begin;
				}
			
				public void setAttribute14Begin(java.util.Date attribute14Begin){
		  			this.attribute14Begin = attribute14Begin;
				}
				
				public java.util.Date getAttribute14End(){
		  			return attribute14End;
				}
			
				public void setAttribute14End(java.util.Date attribute14End){
		  			this.attribute14End = attribute14End;
				}
						
			
       

  public java.lang.String getActivityalias_() {
		return activityalias_;
	}

	public void setActivityalias_(java.lang.String activityalias_) {
		this.activityalias_ = activityalias_;
	}

	public java.lang.String getActivityname_() {
		return activityname_;
	}

	public void setActivityname_(java.lang.String activityname_) {
		this.activityname_ = activityname_;
	}

	public java.lang.String getBusinessstate_() {
		return businessstate_;
	}

	public void setBusinessstate_(java.lang.String businessstate_) {
		this.businessstate_ = businessstate_;
	}
	
	public String getLogFormName() {
		if(super.logFormName==null||super.logFormName.equals("")){
			return "HDKF_SUPPORT_RESPONSE_INFO";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_RESPONSE_INFO";
		}else{
			return super.logTitle;
		}
	}
	
	public java.lang.String getCurrUserId() {
        return currUserId;
    }

    public void setCurrUserId(java.lang.String currUserId) {
        this.currUserId = currUserId;
    }
    public java.lang.String getBpmType() {
        return bpmType;
    }

    public void setBpmType(java.lang.String bpmType) {
        this.bpmType = bpmType;
    }

    public java.lang.String getBpmState() {
        return bpmState;
    }

    public void setBpmState(java.lang.String bpmState) {
        this.bpmState = bpmState;
    }
	public LogType getLogType() {
		if (super.logType == null || super.logType.equals("")) {
			return LogType.module_operate;
		} else {
			return super.logType;
		}
	}
        
}