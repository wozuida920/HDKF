package avicit.hdkf.support.hdkfsupportprocessview.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportProcessView
 * Title: 表HDKF_SUPPORT_PROCESS_VIEW的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_PROCESS_VIEW
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-09-22 10:08
 *
 */
 @PojoRemark(table="hdkf_support_process_view",object="HdkfSupportProcessViewDTO",name="HDKF_SUPPORT_PROCESS_VIEW")
 public class HdkfSupportProcessViewDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
	
							    			@Id
						    			@LogField
			    	
    		
    		    		 	@FieldRemark(column="id",field="id",name="主键")
    		 	private java.lang.String id;
    																    	
    		
    		    		 	@FieldRemark(column="request_id",field="requestId",name="求援请求ID")
    		 	private java.lang.String requestId;
    																    	
    		
    		    		 	@FieldRemark(column="request_no",field="requestNo",name="信息处理卡编号")
    		 	private java.lang.String requestNo;
    																    	
    		
    		    		 	@FieldRemark(column="cur_status",field="curStatus",name="当前所处状态")
    		 	private java.lang.String curStatus;
    																    	
    		
    		    		 	@FieldRemark(column="cur_bpmstate",field="curBpmstate",name="当前步骤")
    		 	private java.lang.String curBpmstate;
    																    	
    		
    		    			@FieldRemark(column="cur_user",field="curUser",name="当前处理人")
    		 	private java.lang.String curUser;
    		 	private java.lang.String curUserAlias;
    																    	
    		
    		    		 	@FieldRemark(column="request_unit",field="requestUnit",name="求援单位")
    		 	private java.lang.String requestUnit;
    																    	
    		
    		    		 	@FieldRemark(column="batch_no",field="batchNo",name="批架次")
    		 	private java.lang.String batchNo;
    																    	
    		
    		    		 	@FieldRemark(column="model_id",field="modelId",name="机型")
    		 	private java.lang.String modelId;
    																    	
    		
    		    			@FieldRemark(column="request_date",field="requestDate",name="求援时间")
    		 	private java.util.Date requestDate;
    		 	
    		 	private java.util.Date requestDateBegin;
    		 	
    		 	private java.util.Date requestDateEnd;
    																    	
    		
    		    		 	@FieldRemark(column="deal_id",field="dealId",name="处理ID")
    		 	private java.lang.String dealId;
    																    	
    		
    		    		 	@FieldRemark(column="deal_name",field="dealName",name="处理单")
    		 	private java.lang.String dealName;
    																    	
    		
    		    		 	@FieldRemark(column="resp_id",field="respId",name="答复文号")
    		 	private java.lang.String respId;
    																    	
    		
    		    		 	@FieldRemark(column="resp_no",field="respNo",name="答复文号")
    		 	private java.lang.String respNo;
    																    	
    		
    		    		 	@FieldRemark(column="task_id",field="taskId",name="任务书ID")
    		 	private java.lang.String taskId;
    																    	
    		
    		    		 	@FieldRemark(column="task_no",field="taskNo",name="任务书编号")
    		 	private java.lang.String taskNo;
    																    	
    		
    		    		 	@FieldRemark(column="borrow_info_id",field="borrowInfoId",name="借人通知单ID")
    		 	private java.lang.String borrowInfoId;
    																    	
    		
    		    		 	@FieldRemark(column="card_archive_id",field="cardArchiveId",name="信息卡归档ID")
    		 	private java.lang.String cardArchiveId;
    																    	
    		
    		    		 	@FieldRemark(column="task_archive_id",field="taskArchiveId",name="任务书归档ID")
    		 	private java.lang.String taskArchiveId;
    																    	
    		
    		    		 	@FieldRemark(column="has_outfiedcard",field="hasOutfiedcard",name="是否发外场信息卡")
    		 	private java.lang.String hasOutfiedcard;
    																    	
    		
    		    		 	@FieldRemark(column="has_oapublishsheet",field="hasOapublishsheet",name="是否发公用笺")
    		 	private java.lang.String hasOapublishsheet;
    																    	
    		
    		    		 	@FieldRemark(column="has_fax",field="hasFax",name="是否发传真")
    		 	private java.lang.String hasFax;
    																																		    	
    		
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
    		    		
 		  	  		    		
    		    			public java.lang.String getCurStatus(){
		  			return curStatus;
				}
			
				public void setCurStatus(java.lang.String curStatus){
		  			this.curStatus = curStatus;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getCurBpmstate(){
		  			return curBpmstate;
				}
			
				public void setCurBpmstate(java.lang.String curBpmstate){
		  			this.curBpmstate = curBpmstate;
				}
    		    		
 		  	  		    		
    			    		public java.lang.String getCurUser(){
		  			return curUser;
				}
			
				public void setCurUser(java.lang.String curUser){
		  			this.curUser = curUser;
				}
				
				public java.lang.String getCurUserAlias(){
		  			return curUserAlias;
				}
			
				public void setCurUserAlias(java.lang.String curUserAlias){
		  			this.curUserAlias = curUserAlias;
				}
			    		
 		  	  		    		
    		    			public java.lang.String getRequestUnit(){
		  			return requestUnit;
				}
			
				public void setRequestUnit(java.lang.String requestUnit){
		  			this.requestUnit = requestUnit;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getBatchNo(){
		  			return batchNo;
				}
			
				public void setBatchNo(java.lang.String batchNo){
		  			this.batchNo = batchNo;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getModelId(){
		  			return modelId;
				}
			
				public void setModelId(java.lang.String modelId){
		  			this.modelId = modelId;
				}
    		    		
 		  	  		    		
    						public java.util.Date getRequestDate(){
		  			return requestDate;
				}
			
				public void setRequestDate(java.util.Date requestDate){
		  			this.requestDate = requestDate;
				}
				
				public java.util.Date getRequestDateBegin(){
		  			return requestDateBegin;
				}
			
				public void setRequestDateBegin(java.util.Date requestDateBegin){
		  			this.requestDateBegin = requestDateBegin;
				}
				
				public java.util.Date getRequestDateEnd(){
		  			return requestDateEnd;
				}
			
				public void setRequestDateEnd(java.util.Date requestDateEnd){
		  			this.requestDateEnd = requestDateEnd;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getDealId(){
		  			return dealId;
				}
			
				public void setDealId(java.lang.String dealId){
		  			this.dealId = dealId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getDealName(){
		  			return dealName;
				}
			
				public void setDealName(java.lang.String dealName){
		  			this.dealName = dealName;
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
    		    		
 		  	  		    		
    		    			public java.lang.String getTaskId(){
		  			return taskId;
				}
			
				public void setTaskId(java.lang.String taskId){
		  			this.taskId = taskId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getTaskNo(){
		  			return taskNo;
				}
			
				public void setTaskNo(java.lang.String taskNo){
		  			this.taskNo = taskNo;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getBorrowInfoId(){
		  			return borrowInfoId;
				}
			
				public void setBorrowInfoId(java.lang.String borrowInfoId){
		  			this.borrowInfoId = borrowInfoId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getCardArchiveId(){
		  			return cardArchiveId;
				}
			
				public void setCardArchiveId(java.lang.String cardArchiveId){
		  			this.cardArchiveId = cardArchiveId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getTaskArchiveId(){
		  			return taskArchiveId;
				}
			
				public void setTaskArchiveId(java.lang.String taskArchiveId){
		  			this.taskArchiveId = taskArchiveId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getHasOutfiedcard(){
		  			return hasOutfiedcard;
				}
			
				public void setHasOutfiedcard(java.lang.String hasOutfiedcard){
		  			this.hasOutfiedcard = hasOutfiedcard;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getHasOapublishsheet(){
		  			return hasOapublishsheet;
				}
			
				public void setHasOapublishsheet(java.lang.String hasOapublishsheet){
		  			this.hasOapublishsheet = hasOapublishsheet;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getHasFax(){
		  			return hasFax;
				}
			
				public void setHasFax(java.lang.String hasFax){
		  			this.hasFax = hasFax;
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
    		    //归档总计
				//curCountall
				private java.lang.String curDoneall;
				public java.lang.String getCurDoneall() {
					return curDoneall;
				}
				public void setCurDoneall(java.lang.String curDoneall) {
					this.curDoneall = curDoneall;
				}
    		    //处理中总计
				//curCountall
				private java.lang.String curDealingall;
				public java.lang.String getCurDealingall() {
					return curDealingall;
				}
				public void setCurDealingall(java.lang.String curDealingall) {
					this.curDealingall = curDealingall;
				}
				
    		    //分发登记总计
				//curCountall
				private java.lang.String curunDoneall;
				public java.lang.String getCurunDoneall() {
					return curunDoneall;
				}
				public void setCurunDoneall(java.lang.String curunDoneall) {
					this.curunDoneall = curunDoneall;
				}
				
				
				//归档数目
				private java.lang.String curDonecount;
				public java.lang.String getCurDonecount() {
					return curDonecount;
				}
				public void setCurDonecount(java.lang.String curDonecount) {
					this.curDonecount = curDonecount;
				}
				
			//处理中数目
				private java.lang.String curDealingcount;
				public java.lang.String getCurDealingcount() {
					return curDealingcount;
				}
				public void setCurDealingcount(java.lang.String curDealingcount) {
					this.curDealingcount = curDealingcount;
				}
 		  	//登记分发数目
				private java.lang.String curunDonecount;
				public java.lang.String getCurunDonecount() {
					return curunDonecount;
				}
				public void setCurunDonecount(java.lang.String curunDonecount) {
					this.curunDonecount = curunDonecount;
				}
       
 
	public String getLogFormName() {
		if(super.logFormName==null||super.logFormName.equals("")){
			return "HDKF_SUPPORT_PROCESS_VIEW";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_PROCESS_VIEW";
		}else{
			return super.logTitle;
		}
	}
	

	public LogType getLogType() {
		if (super.logType == null || super.logType.equals("")) {
			return LogType.module_operate;
		} else {
			return super.logType;
		}
	}
        
}