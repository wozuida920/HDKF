package avicit.hdkf.support.hdkfsupporttriptask.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportTripTask
 * Title: 表HDKF_SUPPORT_TRIP_TASK的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_TRIP_TASK
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-08-20 14:28
 *
 */
 @PojoRemark(table="hdkf_support_trip_task",object="HdkfSupportTripTaskDTO",name="HDKF_SUPPORT_TRIP_TASK")
 public class HdkfSupportTripTaskDTO extends BeanDTO{
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
												
				 	@FieldRemark(column="kf_deal_id",field="kfDealId",name="请求处理ID")
		 	private java.lang.String kfDealId;
												
				 	@FieldRemark(column="task_no",field="taskNo",name="任务书编号")
		 	private java.lang.String taskNo;
												
				 	@FieldRemark(column="task_name",field="taskName",name="任务书名称")
		 	private java.lang.String taskName;
												
				 	@FieldRemark(column="is_need_equipment",field="isNeedEquipment",name="是否需要器材")
		 	private java.lang.String isNeedEquipment;
												
				 	@FieldRemark(column="need_equipment",field="needEquipment",name="需要的器材")
		 	private java.lang.String needEquipment;
												
				 	@FieldRemark(column="is_borrow_someone",field="isBorrowSomeone",name="是否派人")
		 	private java.lang.String isBorrowSomeone;
												
				 	@FieldRemark(column="write_man_id",field="writeManId",name="填写人ID")
		 	private java.lang.String writeManId;
												
				 	@FieldRemark(column="write_man_name",field="writeManName",name="填写人姓名")
		 	private java.lang.String writeManName;
												
				 	@FieldRemark(column="content_demand",field="contentDemand",name="任务内容与要求")
		 	private java.lang.String contentDemand;
												
				 	@FieldRemark(column="fee_no",field="feeNo",name="费用编号")
		 	private java.lang.String feeNo;
												
				 	@FieldRemark(column="to_army_name",field="toArmyName",name="排故所去部队")
		 	private java.lang.String toArmyName;
												
				 	@FieldRemark(column="executors",field="executors",name="执行者")
		 	private java.lang.String executors;
												
				 	@FieldRemark(column="total_hours",field="totalHours",name="总任务完成时间")
		 	private long totalHours;
												
		    			@FieldRemark(column="start_date",field="startDate",name="任务实际开始时间")
    		 	private java.util.Date startDate;
    		 	
    		 	private java.util.Date startDateBegin;
    		 	
    		 	private java.util.Date startDateEnd;
												
		    			@FieldRemark(column="end_date",field="endDate",name="任务实际完成时间")
    		 	private java.util.Date endDate;
    		 	
    		 	private java.util.Date endDateBegin;
    		 	
    		 	private java.util.Date endDateEnd;
												
				 	@FieldRemark(column="task_details",field="taskDetails",name="任务完成详细说明")
		 	private java.lang.String taskDetails;
												
				 	@FieldRemark(column="suggestion_demand",field="suggestionDemand",name="部队领导意见及要求")
		 	private java.lang.String suggestionDemand;
												
				 	@FieldRemark(column="evaluate",field="evaluate",name="任务评价")
		 	private java.lang.String evaluate;
												
				 	@FieldRemark(column="director",field="director",name="部队技术室主任")
		 	private java.lang.String director;
												
				 	@FieldRemark(column="head",field="head",name="部队技术室部长")
		 	private java.lang.String head;
												
		    			@FieldRemark(column="notice_time",field="noticeTime",name="通知客户时间")
    		 	private java.util.Date noticeTime;
    		 	
    		 	private java.util.Date noticeTimeBegin;
    		 	
    		 	private java.util.Date noticeTimeEnd;
												
		    			@FieldRemark(column="trip_start_time",field="tripStartTime",name="赴外场出发时间")
    		 	private java.util.Date tripStartTime;
    		 	
    		 	private java.util.Date tripStartTimeBegin;
    		 	
    		 	private java.util.Date tripStartTimeEnd;
													@LogField
				
				 	@FieldRemark(column="request_id",field="requestId",name="求援请求ID")
		 	private java.lang.String requestId;
												
				 	@FieldRemark(column="request_no",field="requestNo",name="信息处理卡编号")
		 	private java.lang.String requestNo;
																		
				 	@FieldRemark(column="attribute_01",field="attribute01",name="扩展字段01")
		 	private java.lang.String attribute01;
												
				 	@FieldRemark(column="attribute_02",field="attribute02",name="扩展字段02")
		 	private java.lang.String attribute02;
													@LogField
				
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
						
								
							public java.lang.String getKfDealId(){
		  			return kfDealId;
				}
			
				public void setKfDealId(java.lang.String kfDealId){
		  			this.kfDealId = kfDealId;
				}
						
								
							public java.lang.String getTaskNo(){
		  			return taskNo;
				}
			
				public void setTaskNo(java.lang.String taskNo){
		  			this.taskNo = taskNo;
				}
						
								
							public java.lang.String getTaskName(){
		  			return taskName;
				}
			
				public void setTaskName(java.lang.String taskName){
		  			this.taskName = taskName;
				}
						
								
							public java.lang.String getIsNeedEquipment(){
		  			return isNeedEquipment;
				}
			
				public void setIsNeedEquipment(java.lang.String isNeedEquipment){
		  			this.isNeedEquipment = isNeedEquipment;
				}
						
								
							public java.lang.String getNeedEquipment(){
		  			return needEquipment;
				}
			
				public void setNeedEquipment(java.lang.String needEquipment){
		  			this.needEquipment = needEquipment;
				}
						
								
							public java.lang.String getIsBorrowSomeone(){
		  			return isBorrowSomeone;
				}
			
				public void setIsBorrowSomeone(java.lang.String isBorrowSomeone){
		  			this.isBorrowSomeone = isBorrowSomeone;
				}
						
								
							public java.lang.String getWriteManId(){
		  			return writeManId;
				}
			
				public void setWriteManId(java.lang.String writeManId){
		  			this.writeManId = writeManId;
				}
						
								
							public java.lang.String getWriteManName(){
		  			return writeManName;
				}
			
				public void setWriteManName(java.lang.String writeManName){
		  			this.writeManName = writeManName;
				}
						
								
							public java.lang.String getContentDemand(){
		  			return contentDemand;
				}
			
				public void setContentDemand(java.lang.String contentDemand){
		  			this.contentDemand = contentDemand;
				}
						
								
							public java.lang.String getFeeNo(){
		  			return feeNo;
				}
			
				public void setFeeNo(java.lang.String feeNo){
		  			this.feeNo = feeNo;
				}
						
								
							public java.lang.String getToArmyName(){
		  			return toArmyName;
				}
			
				public void setToArmyName(java.lang.String toArmyName){
		  			this.toArmyName = toArmyName;
				}
						
								
							public java.lang.String getExecutors(){
		  			return executors;
				}
			
				public void setExecutors(java.lang.String executors){
		  			this.executors = executors;
				}
						
								
							public long getTotalHours(){
		  			return totalHours;
				}
			
				public void setTotalHours(long totalHours){
		  			this.totalHours = totalHours;
				}
						
								
							public java.util.Date getStartDate(){
		  			return startDate;
				}
			
				public void setStartDate(java.util.Date startDate){
		  			this.startDate = startDate;
				}
				
				public java.util.Date getStartDateBegin(){
		  			return startDateBegin;
				}
			
				public void setStartDateBegin(java.util.Date startDateBegin){
		  			this.startDateBegin = startDateBegin;
				}
				
				public java.util.Date getStartDateEnd(){
		  			return startDateEnd;
				}
			
				public void setStartDateEnd(java.util.Date startDateEnd){
		  			this.startDateEnd = startDateEnd;
				}
						
								
							public java.util.Date getEndDate(){
		  			return endDate;
				}
			
				public void setEndDate(java.util.Date endDate){
		  			this.endDate = endDate;
				}
				
				public java.util.Date getEndDateBegin(){
		  			return endDateBegin;
				}
			
				public void setEndDateBegin(java.util.Date endDateBegin){
		  			this.endDateBegin = endDateBegin;
				}
				
				public java.util.Date getEndDateEnd(){
		  			return endDateEnd;
				}
			
				public void setEndDateEnd(java.util.Date endDateEnd){
		  			this.endDateEnd = endDateEnd;
				}
						
								
							public java.lang.String getTaskDetails(){
		  			return taskDetails;
				}
			
				public void setTaskDetails(java.lang.String taskDetails){
		  			this.taskDetails = taskDetails;
				}
						
								
							public java.lang.String getSuggestionDemand(){
		  			return suggestionDemand;
				}
			
				public void setSuggestionDemand(java.lang.String suggestionDemand){
		  			this.suggestionDemand = suggestionDemand;
				}
						
								
							public java.lang.String getEvaluate(){
		  			return evaluate;
				}
			
				public void setEvaluate(java.lang.String evaluate){
		  			this.evaluate = evaluate;
				}
						
								
							public java.lang.String getDirector(){
		  			return director;
				}
			
				public void setDirector(java.lang.String director){
		  			this.director = director;
				}
						
								
							public java.lang.String getHead(){
		  			return head;
				}
			
				public void setHead(java.lang.String head){
		  			this.head = head;
				}
						
								
							public java.util.Date getNoticeTime(){
		  			return noticeTime;
				}
			
				public void setNoticeTime(java.util.Date noticeTime){
		  			this.noticeTime = noticeTime;
				}
				
				public java.util.Date getNoticeTimeBegin(){
		  			return noticeTimeBegin;
				}
			
				public void setNoticeTimeBegin(java.util.Date noticeTimeBegin){
		  			this.noticeTimeBegin = noticeTimeBegin;
				}
				
				public java.util.Date getNoticeTimeEnd(){
		  			return noticeTimeEnd;
				}
			
				public void setNoticeTimeEnd(java.util.Date noticeTimeEnd){
		  			this.noticeTimeEnd = noticeTimeEnd;
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
			return "HDKF_SUPPORT_TRIP_TASK";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_TRIP_TASK";
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