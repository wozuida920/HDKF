package avicit.hdkf.support.hdkfsupportrequestinfo.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportRequestInfo
 * Title: 表HDKF_SUPPORT_REQUEST_INFO的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_REQUEST_INFO
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-08-16 10:23
 *
 */
 @PojoRemark(table="hdkf_support_request_info",object="HdkfSupportRequestInfoDTO",name="HDKF_SUPPORT_REQUEST_INFO")
 public class HdkfSupportRequestInfoDTO extends BeanDTO{
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
												
				 	@FieldRemark(column="request_method",field="requestMethod",name="求援方式")
		 	private java.lang.String requestMethod;
												
				 	@FieldRemark(column="request_no",field="requestNo",name="信息处理卡编号")
		 	private java.lang.String requestNo;
												
				 	@FieldRemark(column="request_name",field="requestName",name="故障标题")
		 	private java.lang.String requestName;
												
				 	@FieldRemark(column="request_unit",field="requestUnit",name="求援单位")
		 	private java.lang.String requestUnit;
		    private  java.lang.String requestUnitAlias;
												
				 	public java.lang.String getRequestUnitAlias() {
				return requestUnitAlias;
			}

			public void setRequestUnitAlias(java.lang.String requestUnitAlias) {
				this.requestUnitAlias = requestUnitAlias;
			}
					@FieldRemark(column="link_man",field="linkMan",name="求援单位联系人")
		 	private java.lang.String linkMan;
												
				 	@FieldRemark(column="link_phone",field="linkPhone",name="求援单位联系电话")
		 	private java.lang.String linkPhone;
												
				 	@FieldRemark(column="fax",field="fax",name="求援单位传真")
		 	private java.lang.String fax;
												
		    			@FieldRemark(column="request_date",field="requestDate",name="求援时间")
    		 	private java.util.Date requestDate;
    		 	
    		 	private java.util.Date requestDateBegin;
    		 	
    		 	private java.util.Date requestDateEnd;
												
				 	@FieldRemark(column="batch_no",field="batchNo",name="批架次")
		 	private java.lang.String batchNo;
												
				 	@FieldRemark(column="model_id",field="modelId",name="机型")
		 	private java.lang.String modelId;
												
				 	@FieldRemark(column="product_name",field="productName",name="产品名称")
		 	private java.lang.String productName;
												
				 	@FieldRemark(column="figure_no",field="figureNo",name="型号图号")
		 	private java.lang.String figureNo;
												
				 	@FieldRemark(column="part_no",field="partNo",name="件号")
		 	private java.lang.String partNo;
												
				 	@FieldRemark(column="production_unit",field="productionUnit",name="生产单位")
		 	private java.lang.String productionUnit;
												
				 	@FieldRemark(column="flight_hours",field="flightHours",name="飞行小时")
		 	private float flightHours;
												
				 	@FieldRemark(column="flight_landing",field="flightLanding",name="飞机起落")
		 	private long flightLanding;
												
		    			@FieldRemark(column="repair_time",field="repairTime",name="何时大修")
    		 	private java.util.Date repairTime;
    		 	
    		 	private java.util.Date repairTimeBegin;
    		 	
    		 	private java.util.Date repairTimeEnd;
												
		    			@FieldRemark(column="occurrence_date",field="occurrenceDate",name="发生日期")
    		 	private java.util.Date occurrenceDate;
    		 	
    		 	private java.util.Date occurrenceDateBegin;
    		 	
    		 	private java.util.Date occurrenceDateEnd;
												
				 	@FieldRemark(column="occurrence_timing",field="occurrenceTiming",name="发现时机")
		 	private java.lang.String occurrenceTiming;
												
				 	@FieldRemark(column="chaper_no",field="chaperNo",name="ATA章节")
		 	private java.lang.String chaperNo;
												
				 	@FieldRemark(column="fault_desc",field="faultDesc",name="故障描述")
		 	private java.lang.String faultDesc;
												
				 	@FieldRemark(column="distribution_type",field="distributionType",name="分发类型")
		 	private java.lang.String distributionType;
												
				 	@FieldRemark(column="request_manager_id",field="requestManagerId",name="技术员ID")
		 	private java.lang.String requestManagerId;
												
				 	@FieldRemark(column="request_manager_name",field="requestManagerName",name="技术员姓名")
		 	private java.lang.String requestManagerName;
												
				 	@FieldRemark(column="info_type",field="infoType",name="信息类别")
		 	private java.lang.String infoType;
												
				 	@FieldRemark(column="fault_type",field="faultType",name="故障类型")
		 	private java.lang.String faultType;
																		
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
						
								
							public java.lang.String getRequestMethod(){
		  			return requestMethod;
				}
			
				public void setRequestMethod(java.lang.String requestMethod){
		  			this.requestMethod = requestMethod;
				}
						
								
							public java.lang.String getRequestNo(){
		  			return requestNo;
				}
			
				public void setRequestNo(java.lang.String requestNo){
		  			this.requestNo = requestNo;
				}
						
								
							public java.lang.String getRequestName(){
		  			return requestName;
				}
			
				public void setRequestName(java.lang.String requestName){
		  			this.requestName = requestName;
				}
						
								
							public java.lang.String getRequestUnit(){
		  			return requestUnit;
				}
			
				public void setRequestUnit(java.lang.String requestUnit){
		  			this.requestUnit = requestUnit;
				}
						
								
							public java.lang.String getLinkMan(){
		  			return linkMan;
				}
			
				public void setLinkMan(java.lang.String linkMan){
		  			this.linkMan = linkMan;
				}
						
								
							public java.lang.String getLinkPhone(){
		  			return linkPhone;
				}
			
				public void setLinkPhone(java.lang.String linkPhone){
		  			this.linkPhone = linkPhone;
				}
						
								
							public java.lang.String getFax(){
		  			return fax;
				}
			
				public void setFax(java.lang.String fax){
		  			this.fax = fax;
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
						
								
							public java.lang.String getProductName(){
		  			return productName;
				}
			
				public void setProductName(java.lang.String productName){
		  			this.productName = productName;
				}
						
								
							public java.lang.String getFigureNo(){
		  			return figureNo;
				}
			
				public void setFigureNo(java.lang.String figureNo){
		  			this.figureNo = figureNo;
				}
						
								
							public java.lang.String getPartNo(){
		  			return partNo;
				}
			
				public void setPartNo(java.lang.String partNo){
		  			this.partNo = partNo;
				}
						
								
							public java.lang.String getProductionUnit(){
		  			return productionUnit;
				}
			
				public void setProductionUnit(java.lang.String productionUnit){
		  			this.productionUnit = productionUnit;
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
						
								
							public java.util.Date getRepairTime(){
		  			return repairTime;
				}
			
				public void setRepairTime(java.util.Date repairTime){
		  			this.repairTime = repairTime;
				}
				
				public java.util.Date getRepairTimeBegin(){
		  			return repairTimeBegin;
				}
			
				public void setRepairTimeBegin(java.util.Date repairTimeBegin){
		  			this.repairTimeBegin = repairTimeBegin;
				}
				
				public java.util.Date getRepairTimeEnd(){
		  			return repairTimeEnd;
				}
			
				public void setRepairTimeEnd(java.util.Date repairTimeEnd){
		  			this.repairTimeEnd = repairTimeEnd;
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
						
								
							public java.lang.String getOccurrenceTiming(){
		  			return occurrenceTiming;
				}
			
				public void setOccurrenceTiming(java.lang.String occurrenceTiming){
		  			this.occurrenceTiming = occurrenceTiming;
				}
						
								
							public java.lang.String getChaperNo(){
		  			return chaperNo;
				}
			
				public void setChaperNo(java.lang.String chaperNo){
		  			this.chaperNo = chaperNo;
				}
						
								
							public java.lang.String getFaultDesc(){
		  			return faultDesc;
				}
			
				public void setFaultDesc(java.lang.String faultDesc){
		  			this.faultDesc = faultDesc;
				}
						
								
							public java.lang.String getDistributionType(){
		  			return distributionType;
				}
			
				public void setDistributionType(java.lang.String distributionType){
		  			this.distributionType = distributionType;
				}
						
								
							public java.lang.String getRequestManagerId(){
		  			return requestManagerId;
				}
			
				public void setRequestManagerId(java.lang.String requestManagerId){
		  			this.requestManagerId = requestManagerId;
				}
						
								
							public java.lang.String getRequestManagerName(){
		  			return requestManagerName;
				}
			
				public void setRequestManagerName(java.lang.String requestManagerName){
		  			this.requestManagerName = requestManagerName;
				}
						
								
							public java.lang.String getInfoType(){
		  			return infoType;
				}
			
				public void setInfoType(java.lang.String infoType){
		  			this.infoType = infoType;
				}
						
								
							public java.lang.String getFaultType(){
		  			return faultType;
				}
			
				public void setFaultType(java.lang.String faultType){
		  			this.faultType = faultType;
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
			return "HDKF_SUPPORT_REQUEST_INFO";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "HDKF_SUPPORT_REQUEST_INFO";
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
	/**
	 *针对  选择下拉框，但是不是 选人，选部门等通用的 
	 */
	private String batchNoAlias,chaperNoAlias,modelIdAlias;

	public String getBatchNoAlias() {
		return batchNoAlias;
	}

	public void setBatchNoAlias(String batchNoAlias) {
		this.batchNoAlias = batchNoAlias;
	}

	public String getChaperNoAlias() {
		return chaperNoAlias;
	}

	public void setChaperNoAlias(String chaperNoAlias) {
		this.chaperNoAlias = chaperNoAlias;
	}

	public String getModelIdAlias() {
		return modelIdAlias;
	}

	public void setModelIdAlias(String modelIdAlias) {
		this.modelIdAlias = modelIdAlias;
	}
	
}