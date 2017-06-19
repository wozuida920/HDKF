package avicit.hdkf.support.hdkfsupportassigninfo.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportAssignInfo
 * Title: 表HDKF_SUPPORT_ASSIGN_INFO的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_ASSIGN_INFO
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-12-23 17:31
 *
 */
 @PojoRemark(table="hdkf_support_assign_info",object="HdkfSupportAssignInfoDTO",name="HDKF_SUPPORT_ASSIGN_INFO")
 public class HdkfSupportAssignInfoDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
	
							    			@Id
						    			@LogField
			    	
    		
    		    		 	@FieldRemark(column="id",field="id",name="主键")
    		 	private java.lang.String id;
    																    	
    		
    		    		 	@FieldRemark(column="assign_user_id",field="assignUserId",name="委托人ID")
    		 	private java.lang.String assignUserId;
    																    	
    		
    		    		 	@FieldRemark(column="assign_user_name",field="assignUserName",name="委托人")
    		 	private java.lang.String assignUserName;
    																    	
    		
    		    		 	@FieldRemark(column="assigned_user_id",field="assignedUserId",name="受托人ID")
    		 	private java.lang.String assignedUserId;
    																    	
    		
    		    		 	@FieldRemark(column="assigned_user_name",field="assignedUserName",name="受托人")
    		 	private java.lang.String assignedUserName;
    																    	
    		
    		    			@FieldRemark(column="assign_start_date",field="assignStartDate",name="委托开始日期")
    		 	private java.util.Date assignStartDate;
    		 	
    		 	private java.util.Date assignStartDateBegin;
    		 	
    		 	private java.util.Date assignStartDateEnd;
    																    	
    		
    		    			@FieldRemark(column="assign_end_date",field="assignEndDate",name="委托结束日期")
    		 	private java.util.Date assignEndDate;
    		 	
    		 	private java.util.Date assignEndDateBegin;
    		 	
    		 	private java.util.Date assignEndDateEnd;
    																    	
    		
    		    		 	@FieldRemark(column="assign_reason",field="assignReason",name="委托理由")
    		 	private java.lang.String assignReason;
    																    	
    		
    		    		 	@FieldRemark(column="suspend_flag",field="suspendFlag",name="是否中止委托")
    		 	private java.lang.String suspendFlag;
    																    	
    		
    		    		 	@FieldRemark(column="suspend_reason",field="suspendReason",name="中止委托理由")
    		 	private java.lang.String suspendReason;
    																    	
    		
    		    			@FieldRemark(column="suspend_date",field="suspendDate",name="中止委托日期")
    		 	private java.util.Date suspendDate;
    		 	
    		 	private java.util.Date suspendDateBegin;
    		 	
    		 	private java.util.Date suspendDateEnd;
    																																		    	
    		
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
    		 	private Long attribute11;
    																    	
    		
    		    		 	@FieldRemark(column="attribute_12",field="attribute12",name="扩展字段12")
    		 	private Long attribute12;
    																    	
    		
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
    		    		
 		  	  		    		
    		    			public java.lang.String getAssignUserId(){
		  			return assignUserId;
				}
			
				public void setAssignUserId(java.lang.String assignUserId){
		  			this.assignUserId = assignUserId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getAssignUserName(){
		  			return assignUserName;
				}
			
				public void setAssignUserName(java.lang.String assignUserName){
		  			this.assignUserName = assignUserName;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getAssignedUserId(){
		  			return assignedUserId;
				}
			
				public void setAssignedUserId(java.lang.String assignedUserId){
		  			this.assignedUserId = assignedUserId;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getAssignedUserName(){
		  			return assignedUserName;
				}
			
				public void setAssignedUserName(java.lang.String assignedUserName){
		  			this.assignedUserName = assignedUserName;
				}
    		    		
 		  	  		    		
    						public java.util.Date getAssignStartDate(){
		  			return assignStartDate;
				}
			
				public void setAssignStartDate(java.util.Date assignStartDate){
		  			this.assignStartDate = assignStartDate;
				}
				
				public java.util.Date getAssignStartDateBegin(){
		  			return assignStartDateBegin;
				}
			
				public void setAssignStartDateBegin(java.util.Date assignStartDateBegin){
		  			this.assignStartDateBegin = assignStartDateBegin;
				}
				
				public java.util.Date getAssignStartDateEnd(){
		  			return assignStartDateEnd;
				}
			
				public void setAssignStartDateEnd(java.util.Date assignStartDateEnd){
		  			this.assignStartDateEnd = assignStartDateEnd;
				}
    		    		
 		  	  		    		
    						public java.util.Date getAssignEndDate(){
		  			return assignEndDate;
				}
			
				public void setAssignEndDate(java.util.Date assignEndDate){
		  			this.assignEndDate = assignEndDate;
				}
				
				public java.util.Date getAssignEndDateBegin(){
		  			return assignEndDateBegin;
				}
			
				public void setAssignEndDateBegin(java.util.Date assignEndDateBegin){
		  			this.assignEndDateBegin = assignEndDateBegin;
				}
				
				public java.util.Date getAssignEndDateEnd(){
		  			return assignEndDateEnd;
				}
			
				public void setAssignEndDateEnd(java.util.Date assignEndDateEnd){
		  			this.assignEndDateEnd = assignEndDateEnd;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getAssignReason(){
		  			return assignReason;
				}
			
				public void setAssignReason(java.lang.String assignReason){
		  			this.assignReason = assignReason;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getSuspendFlag(){
		  			return suspendFlag;
				}
			
				public void setSuspendFlag(java.lang.String suspendFlag){
		  			this.suspendFlag = suspendFlag;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getSuspendReason(){
		  			return suspendReason;
				}
			
				public void setSuspendReason(java.lang.String suspendReason){
		  			this.suspendReason = suspendReason;
				}
    		    		
 		  	  		    		
    						public java.util.Date getSuspendDate(){
		  			return suspendDate;
				}
			
				public void setSuspendDate(java.util.Date suspendDate){
		  			this.suspendDate = suspendDate;
				}
				
				public java.util.Date getSuspendDateBegin(){
		  			return suspendDateBegin;
				}
			
				public void setSuspendDateBegin(java.util.Date suspendDateBegin){
		  			this.suspendDateBegin = suspendDateBegin;
				}
				
				public java.util.Date getSuspendDateEnd(){
		  			return suspendDateEnd;
				}
			
				public void setSuspendDateEnd(java.util.Date suspendDateEnd){
		  			this.suspendDateEnd = suspendDateEnd;
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
    		    		
 		  	  		    		
    		    			public Long getAttribute11(){
		  			return attribute11;
				}
			
				public void setAttribute11(Long attribute11){
		  			this.attribute11 = attribute11;
				}
    		    		
 		  	  		    		
    		    			public Long getAttribute12(){
		  			return attribute12;
				}
			
				public void setAttribute12(Long attribute12){
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
    		    		
 		  	
       
 
	public String getLogFormName() {
		if(super.logFormName==null||super.logFormName.equals("")){
			return "HDKF_SUPPORT_ASSIGN_INFO";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_ASSIGN_INFO";
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