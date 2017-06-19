package avicit.hdkf.support.hdkfsupportfaultdetail.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportFaultDetail
 * Title: 表HDKF_SUPPORT_FAULT_DETAIL的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_FAULT_DETAIL
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-10-09 09:55
 *
 */
 @PojoRemark(table="hdkf_support_fault_detail",object="HdkfSupportFaultDetailDTO",name="HDKF_SUPPORT_FAULT_DETAIL")
 public class HdkfSupportFaultDetailDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
	
							    			@Id
						    			@LogField
			    	
    		
    		    		 	@FieldRemark(column="id",field="id",name="主键")
    		 	private java.lang.String id;
    																    	
    		
    		    		 	@FieldRemark(column="batch_no",field="batchNo",name="批架次")
    		 	private java.lang.String batchNo;
    																    	
    		
    		    		 	@FieldRemark(column="model_id",field="modelId",name="机型")
    		 	private java.lang.String modelId;
    		    			
    		    			public java.lang.String getFlightModelName() {
								return flightModelName;
							}

							public void setFlightModelName(java.lang.String flightModelName) {
								this.flightModelName = flightModelName;
							}

							public java.lang.String getFlightModelNum() {
								return flightModelNum;
							}

							public void setFlightModelNum(java.lang.String flightModelNum) {
								this.flightModelNum = flightModelNum;
							}


							//机型名称
    		    			private java.lang.String flightModelName;
    		    			//机型故障次数
    		    			private java.lang.String flightModelNum; 		 	
    		    		 	
    		    			private java.util.Date BeginDate;

    		    			private java.util.Date EndDate;
/*    		    			private String requestDates;
    		    			public String getRequestDates() {
								return requestDates;
							}

							public void setRequestDates(String requestDates) {
								this.requestDates = requestDates;
							}

							public String getOccurrenceDates() {
								return occurrenceDates;
							}

							public void setOccurrenceDates(String occurrenceDates) {
								this.occurrenceDates = occurrenceDates;
							}


							private String occurrenceDates;*/
    		 
    																    	
    		
    		    		 	public java.util.Date getBeginDate() {
								return BeginDate;
							}

							public void setBeginDate(java.util.Date beginDate) {
								BeginDate = beginDate;
							}

							public java.util.Date getEndDate() {
								return EndDate;
							}

							public void setEndDate(java.util.Date endDate) {
								EndDate = endDate;
							}
							//批架次故障次数
							private java.lang.String batchNoNum;
							//批架次名称
							private java.lang.String batchNoName;
							
							
						
							
							//客户名称(柱状图)
							private java.lang.String CustomerName;
							public java.lang.String getBatchNoNum() {
								return batchNoNum;
							}

							public void setBatchNoNum(java.lang.String batchNoNum) {
								this.batchNoNum = batchNoNum;
							}

							public java.lang.String getBatchNoName() {
								return batchNoName;
							}

							public void setBatchNoName(java.lang.String batchNoName) {
								this.batchNoName = batchNoName;
							}

							public java.lang.String getCustomerName() {
								return CustomerName;
							}

							public void setCustomerName(java.lang.String customerName) {
								CustomerName = customerName;
							}

							public java.lang.String getCustomerNum() {
								return CustomerNum;
							}

							public void setCustomerNum(java.lang.String customerNum) {
								CustomerNum = customerNum;
							}

							public java.lang.String getCusName() {
								return cusName;
							}

							public void setCusName(java.lang.String cusName) {
								this.cusName = cusName;
							}


							//客户名词故障次数
							private java.lang.String CustomerNum;
							
						    
							//页面显示的客户的名字(故障填报)
							private java.lang.String cusName;
							

							@FieldRemark(column="flight_hours",field="flightHours",name="飞行小时")
    		 	private float flightHours;
    																    	
    		
    		    		 	@FieldRemark(column="flight_landing",field="flightLanding",name="飞机起落")
    		 	private long flightLanding;
    																    	
    		
    		    			@FieldRemark(column="request_date",field="requestDate",name="求援时间")
    		 	private java.util.Date requestDate;
    		 	
    		 	private java.util.Date requestDateBegin;
    		 	
    		 	private java.util.Date requestDateEnd;
    																    	
    		
    		    			@FieldRemark(column="occurrence_date",field="occurrenceDate",name="发生日期")
    		 	private java.util.Date occurrenceDate;
    		 	
    		 	private java.util.Date occurrenceDateBegin;
    		 	
    		 	private java.util.Date occurrenceDateEnd;
    																    	
    		
    		    		 	@FieldRemark(column="fault_desc",field="faultDesc",name="故障描述")
    		 	private java.lang.String faultDesc;
    																    	
    		
    		    		 	@FieldRemark(column="deal_solution",field="dealSolution",name="处理结论")
    		 	private java.lang.String dealSolution;
    																    	
    		
    		    		 	@FieldRemark(column="request_id",field="requestId",name="求援请求ID")
    		 	private java.lang.String requestId;
    																    	
    		
    		    		 	@FieldRemark(column="request_no",field="requestNo",name="信息卡编号")
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
    		    		
 		  	  		    		
    		    			public float getFlightHours(){
		  			return flightHours;
				}
			
				public void setFlightHours(float flightHours){
		  			this.flightHours = flightHours;
				}
    		    		
 		  	  		    		
    		    			public long getFlightLanding(){
		  			return flightLanding;
				}
			
				public void setFlightLanding(long flightLanding){
		  			this.flightLanding = flightLanding;
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
    		    		
 		  	  		    		
    						public java.util.Date getOccurrenceDate(){
		  			return occurrenceDate;
				}
			
				public void setOccurrenceDate(java.util.Date occurrenceDate){
		  			this.occurrenceDate = occurrenceDate;
				}
				
				public java.util.Date getOccurrenceDateBegin(){
		  			return occurrenceDateBegin;
				}
			
				public void setOccurrenceDateBegin(java.util.Date occurrenceDateBegin){
		  			this.occurrenceDateBegin = occurrenceDateBegin;
				}
				
				public java.util.Date getOccurrenceDateEnd(){
		  			return occurrenceDateEnd;
				}
			
				public void setOccurrenceDateEnd(java.util.Date occurrenceDateEnd){
		  			this.occurrenceDateEnd = occurrenceDateEnd;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getFaultDesc(){
		  			return faultDesc;
				}
			
				public void setFaultDesc(java.lang.String faultDesc){
		  			this.faultDesc = faultDesc;
				}
    		    		
 		  	  		    		
    		    			public java.lang.String getDealSolution(){
		  			return dealSolution;
				}
			
				public void setDealSolution(java.lang.String dealSolution){
		  			this.dealSolution = dealSolution;
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
    		    		
 		  	
       
 
	public String getLogFormName() {
		if(super.logFormName==null||super.logFormName.equals("")){
			return "HDKF_SUPPORT_FAULT_DETAIL";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_FAULT_DETAIL";
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