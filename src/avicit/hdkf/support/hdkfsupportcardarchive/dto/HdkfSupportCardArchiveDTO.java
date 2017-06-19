package avicit.hdkf.support.hdkfsupportcardarchive.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportCardArchive
 * Title: 表HDKF_SUPPORT_CARD_ARCHIVE的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_CARD_ARCHIVE
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-08-25 13:24
 *
 */
 @PojoRemark(table="hdkf_support_card_archive",object="HdkfSupportCardArchiveDTO",name="HDKF_SUPPORT_CARD_ARCHIVE")
 public class HdkfSupportCardArchiveDTO extends BeanDTO{
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
												
				 	@FieldRemark(column="archive_type",field="archiveType",name="归档类别")
		 	private java.lang.String archiveType;
												
				 	@FieldRemark(column="resp_id",field="respId",name="答复文号")
		 	private java.lang.String respId;
												
				 	@FieldRemark(column="resp_no",field="respNo",name="答复文号")
		 	private java.lang.String respNo;
												
				 	@FieldRemark(column="deal_id",field="dealId",name="处理ID")
		 	private java.lang.String dealId;
												
		    			@FieldRemark(column="trip_start_time",field="tripStartTime",name="赴外场出发时间")
    		 	private java.util.Date tripStartTime;
    		 	
    		 	private java.util.Date tripStartTimeBegin;
    		 	
    		 	private java.util.Date tripStartTimeEnd;
												
				 	@FieldRemark(column="request_id",field="requestId",name="求援请求ID")
		 	private java.lang.String requestId;
												
				 	@FieldRemark(column="request_no",field="requestNo",name="求援信息编号")
		 	private java.lang.String requestNo;
												
				 	@FieldRemark(column="archive_no",field="archiveNo",name="归档编号")
		 	private java.lang.String archiveNo;
												
		    			@FieldRemark(column="archive_time",field="archiveTime",name="归档时间")
    		 	private java.util.Date archiveTime;
    		 	
    		 	private java.util.Date archiveTimeBegin;
    		 	
    		 	private java.util.Date archiveTimeEnd;
																		
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
						
								
							public java.lang.String getArchiveType(){
		  			return archiveType;
				}
			
				public void setArchiveType(java.lang.String archiveType){
		  			this.archiveType = archiveType;
				}
						
								
							public java.lang.String getRespId(){
		  			return respId;
				}
			
				public void setRespId(java.lang.String respId){
		  			this.respId = respId;
				}
						
								
							public java.lang.String getRespNo(){
		  			return respNo;
				}
			
				public void setRespNo(java.lang.String respNo){
		  			this.respNo = respNo;
				}
						
								
							public java.lang.String getDealId(){
		  			return dealId;
				}
			
				public void setDealId(java.lang.String dealId){
		  			this.dealId = dealId;
				}
						
								
							public java.util.Date getTripStartTime(){
		  			return tripStartTime;
				}
			
				public void setTripStartTime(java.util.Date tripStartTime){
		  			this.tripStartTime = tripStartTime;
				}
				
				public java.util.Date getTripStartTimeBegin(){
		  			return tripStartTimeBegin;
				}
			
				public void setTripStartTimeBegin(java.util.Date tripStartTimeBegin){
		  			this.tripStartTimeBegin = tripStartTimeBegin;
				}
				
				public java.util.Date getTripStartTimeEnd(){
		  			return tripStartTimeEnd;
				}
			
				public void setTripStartTimeEnd(java.util.Date tripStartTimeEnd){
		  			this.tripStartTimeEnd = tripStartTimeEnd;
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
						
								
							public java.lang.String getArchiveNo(){
		  			return archiveNo;
				}
			
				public void setArchiveNo(java.lang.String archiveNo){
		  			this.archiveNo = archiveNo;
				}
						
								
							public java.util.Date getArchiveTime(){
		  			return archiveTime;
				}
			
				public void setArchiveTime(java.util.Date archiveTime){
		  			this.archiveTime = archiveTime;
				}
				
				public java.util.Date getArchiveTimeBegin(){
		  			return archiveTimeBegin;
				}
			
				public void setArchiveTimeBegin(java.util.Date archiveTimeBegin){
		  			this.archiveTimeBegin = archiveTimeBegin;
				}
				
				public java.util.Date getArchiveTimeEnd(){
		  			return archiveTimeEnd;
				}
			
				public void setArchiveTimeEnd(java.util.Date archiveTimeEnd){
		  			this.archiveTimeEnd = archiveTimeEnd;
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
			return "HDKF_SUPPORT_CARD_ARCHIVE";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_CARD_ARCHIVE";
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