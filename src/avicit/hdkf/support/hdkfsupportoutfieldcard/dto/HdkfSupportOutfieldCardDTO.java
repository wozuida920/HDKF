package avicit.hdkf.support.hdkfsupportoutfieldcard.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean HdkfSupportOutfieldCard Title:
 * 表HDKF_SUPPORT_OUTFIELD_CARD的PoJo类，也就是数据库映射类 Description:
 * HDKF_SUPPORT_OUTFIELD_CARD Copyriht: Copyright (c) 2012 Company: AVICIT Co.,
 * Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-08-18 15:39
 * 
 */
@PojoRemark(table = "hdkf_support_outfield_card", object = "HdkfSupportOutfieldCardDTO", name = "HDKF_SUPPORT_OUTFIELD_CARD")
public class HdkfSupportOutfieldCardDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;
	private java.lang.String activityalias_; // 节点中文名称
	private java.lang.String activityname_; // 当前节点id
	private java.lang.String businessstate_; // 流程当前状态
	private java.lang.String currUserId; // 当前登录人ID
	private java.lang.String bpmType;
	private java.lang.String bpmState;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "request_id", field = "requestId", name = "求援请求ID")
	private java.lang.String requestId;

	@FieldRemark(column = "request_no", field = "requestNo", name = "信息处理卡编号")
	private java.lang.String requestNo;

	@FieldRemark(column = "info_card_no", field = "infoCardNo", name = "外场信息处理卡编号")
	private java.lang.String infoCardNo;

	@FieldRemark(column = "deal_name", field = "dealName", name = "处理单位名称")
	private java.lang.String dealName;

	@FieldRemark(column = "kf_user_id", field = "kfUserId", name = "客服部经办人")
	private java.lang.String kfUserId;
	
	private java.lang.String kfUserName;

	@FieldRemark(column = "request_unit", field = "requestUnit", name = "求援单位")
	private java.lang.String requestUnit;

	@FieldRemark(column = "batch_no", field = "batchNo", name = "批架次")
	private java.lang.String batchNo;

	@FieldRemark(column = "model_id", field = "modelId", name = "机型")
	private java.lang.String modelId;

	@FieldRemark(column = "production_unit", field = "productionUnit", name = "生产单位")
	private java.lang.String productionUnit;

	@FieldRemark(column = "factory_time", field = "factoryTime", name = "出厂时间")
	private java.util.Date factoryTime;

	private java.util.Date factoryTimeBegin;

	private java.util.Date factoryTimeEnd;

	@FieldRemark(column = "flight_hours", field = "flightHours", name = "飞行小时")
	private float flightHours;

	@FieldRemark(column = "flight_landing", field = "flightLanding", name = "飞机起落")
	private long flightLanding;

	@FieldRemark(column = "request_method", field = "requestMethod", name = "求援方式")
	private java.lang.String requestMethod;

	@FieldRemark(column = "fault_name", field = "faultName", name = "问题故障名称")
	private java.lang.String faultName;

	@FieldRemark(column = "case_desc", field = "caseDesc", name = "情况简介")
	private java.lang.String caseDesc;

	@FieldRemark(column = "advice", field = "advice", name = "建议或要求")
	private java.lang.String advice;

	@FieldRemark(column = "deal_depart_id", field = "dealDepartId", name = "承办部门")
	private java.lang.String dealDepartId;
	
	private java.lang.String dealDepartName;

	@FieldRemark(column = "deal_user_id", field = "dealUserId", name = "承办单位处理人")
	private java.lang.String dealUserId;
	
	private java.lang.String dealUserName;

	@FieldRemark(column = "deal_solution", field = "dealSolution", name = "承办单位处理结论")
	private java.lang.String dealSolution;

	@FieldRemark(column = "kf_forward__time", field = "kfForwardTime", name = "客服转发时间")
	private java.util.Date kfForwardTime;

	private java.util.Date kfForwardTimeBegin;

	private java.util.Date kfForwardTimeEnd;

	@FieldRemark(column = "done_time", field = "doneTime", name = "方案形成时间")
	private java.util.Date doneTime;

	private java.util.Date doneTimeBegin;

	private java.util.Date doneTimeEnd;

	@FieldRemark(column = "sendto_kf_time", field = "sendtoKfTime", name = "方案送达客服部时间")
	private java.util.Date sendtoKfTime;

	private java.util.Date sendtoKfTimeBegin;

	private java.util.Date sendtoKfTimeEnd;

	@FieldRemark(column = "attribute_01", field = "attribute01", name = "扩展字段01")
	private java.lang.String attribute01;

	@FieldRemark(column = "attribute_02", field = "attribute02", name = "扩展字段02")
	private java.lang.String attribute02;

	@FieldRemark(column = "attribute_03", field = "attribute03", name = "扩展字段03")
	private java.lang.String attribute03;

	@FieldRemark(column = "attribute_04", field = "attribute04", name = "扩展字段04")
	private java.lang.String attribute04;

	@FieldRemark(column = "attribute_05", field = "attribute05", name = "扩展字段05")
	private java.lang.String attribute05;

	@FieldRemark(column = "attribute_06", field = "attribute06", name = "扩展字段06")
	private java.lang.String attribute06;

	@FieldRemark(column = "attribute_07", field = "attribute07", name = "扩展字段07")
	private java.lang.String attribute07;

	@FieldRemark(column = "attribute_08", field = "attribute08", name = "扩展字段08")
	private java.lang.String attribute08;

	@FieldRemark(column = "attribute_09", field = "attribute09", name = "扩展字段09")
	private java.lang.String attribute09;

	@FieldRemark(column = "attribute_10", field = "attribute10", name = "扩展字段10")
	private java.lang.String attribute10;

	@FieldRemark(column = "attribute_11", field = "attribute11", name = "扩展字段11")
	private long attribute11;

	@FieldRemark(column = "attribute_12", field = "attribute12", name = "扩展字段12")
	private long attribute12;

	@FieldRemark(column = "attribute_13", field = "attribute13", name = "扩展字段13")
	private java.util.Date attribute13;

	private java.util.Date attribute13Begin;

	private java.util.Date attribute13End;

	@FieldRemark(column = "attribute_14", field = "attribute14", name = "扩展字段14")
	private java.util.Date attribute14;

	private java.util.Date attribute14Begin;

	private java.util.Date attribute14End;

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getRequestId() {
		return requestId;
	}

	public void setRequestId(java.lang.String requestId) {
		this.requestId = requestId;
	}

	public java.lang.String getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(java.lang.String requestNo) {
		this.requestNo = requestNo;
	}

	public java.lang.String getInfoCardNo() {
		return infoCardNo;
	}

	public void setInfoCardNo(java.lang.String infoCardNo) {
		this.infoCardNo = infoCardNo;
	}

	public java.lang.String getDealName() {
		return dealName;
	}

	public void setDealName(java.lang.String dealName) {
		this.dealName = dealName;
	}

	public java.lang.String getKfUserId() {
		return kfUserId;
	}

	public void setKfUserId(java.lang.String kfUserId) {
		this.kfUserId = kfUserId;
	}

	public java.lang.String getKfUserName() {
		return kfUserName;
	}

	public void setKfUserName(java.lang.String kfUserName) {
		this.kfUserName = kfUserName;
	}

	public java.lang.String getRequestUnit() {
		return requestUnit;
	}

	public void setRequestUnit(java.lang.String requestUnit) {
		this.requestUnit = requestUnit;
	}

	public java.lang.String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(java.lang.String batchNo) {
		this.batchNo = batchNo;
	}

	public java.lang.String getModelId() {
		return modelId;
	}

	public void setModelId(java.lang.String modelId) {
		this.modelId = modelId;
	}

	public java.lang.String getProductionUnit() {
		return productionUnit;
	}

	public void setProductionUnit(java.lang.String productionUnit) {
		this.productionUnit = productionUnit;
	}

	public java.util.Date getFactoryTime() {
		return factoryTime;
	}

	public void setFactoryTime(java.util.Date factoryTime) {
		this.factoryTime = factoryTime;
	}

	public java.util.Date getFactoryTimeBegin() {
		return factoryTimeBegin;
	}

	public void setFactoryTimeBegin(java.util.Date factoryTimeBegin) {
		this.factoryTimeBegin = factoryTimeBegin;
	}

	public java.util.Date getFactoryTimeEnd() {
		return factoryTimeEnd;
	}

	public void setFactoryTimeEnd(java.util.Date factoryTimeEnd) {
		this.factoryTimeEnd = factoryTimeEnd;
	}

	public float getFlightHours() {
		return flightHours;
	}

	public void setFlightHours(float flightHours) {
		this.flightHours = flightHours;
	}

	public long getFlightLanding() {
		return flightLanding;
	}

	public void setFlightLanding(long flightLanding) {
		this.flightLanding = flightLanding;
	}

	public java.lang.String getRequestMethod() {
		return requestMethod;
	}

	public void setRequestMethod(java.lang.String requestMethod) {
		this.requestMethod = requestMethod;
	}

	public java.lang.String getFaultName() {
		return faultName;
	}

	public void setFaultName(java.lang.String faultName) {
		this.faultName = faultName;
	}

	public java.lang.String getCaseDesc() {
		return caseDesc;
	}

	public void setCaseDesc(java.lang.String caseDesc) {
		this.caseDesc = caseDesc;
	}

	public java.lang.String getAdvice() {
		return advice;
	}

	public void setAdvice(java.lang.String advice) {
		this.advice = advice;
	}

	public java.lang.String getDealDepartId() {
		return dealDepartId;
	}

	public void setDealDepartId(java.lang.String dealDepartId) {
		this.dealDepartId = dealDepartId;
	}

	public java.lang.String getDealDepartName() {
		return dealDepartName;
	}

	public void setDealDepartName(java.lang.String dealDepartName) {
		this.dealDepartName = dealDepartName;
	}

	public java.lang.String getDealUserId() {
		return dealUserId;
	}

	public void setDealUserId(java.lang.String dealUserId) {
		this.dealUserId = dealUserId;
	}

	public java.lang.String getDealUserName() {
		return dealUserName;
	}

	public void setDealUserName(java.lang.String dealUserName) {
		this.dealUserName = dealUserName;
	}

	public java.lang.String getDealSolution() {
		return dealSolution;
	}

	public void setDealSolution(java.lang.String dealSolution) {
		this.dealSolution = dealSolution;
	}

	public java.util.Date getKfForwardTime() {
		return kfForwardTime;
	}

	public void setKfForwardTime(java.util.Date kfForwardTime) {
		this.kfForwardTime = kfForwardTime;
	}

	public java.util.Date getKfForwardTimeBegin() {
		return kfForwardTimeBegin;
	}

	public void setKfForwardTimeBegin(java.util.Date kfForwardTimeBegin) {
		this.kfForwardTimeBegin = kfForwardTimeBegin;
	}

	public java.util.Date getKfForwardTimeEnd() {
		return kfForwardTimeEnd;
	}

	public void setKfForwardTimeEnd(java.util.Date kfForwardTimeEnd) {
		this.kfForwardTimeEnd = kfForwardTimeEnd;
	}

	public java.util.Date getDoneTime() {
		return doneTime;
	}

	public void setDoneTime(java.util.Date doneTime) {
		this.doneTime = doneTime;
	}

	public java.util.Date getDoneTimeBegin() {
		return doneTimeBegin;
	}

	public void setDoneTimeBegin(java.util.Date doneTimeBegin) {
		this.doneTimeBegin = doneTimeBegin;
	}

	public java.util.Date getDoneTimeEnd() {
		return doneTimeEnd;
	}

	public void setDoneTimeEnd(java.util.Date doneTimeEnd) {
		this.doneTimeEnd = doneTimeEnd;
	}

	public java.util.Date getSendtoKfTime() {
		return sendtoKfTime;
	}

	public void setSendtoKfTime(java.util.Date sendtoKfTime) {
		this.sendtoKfTime = sendtoKfTime;
	}

	public java.util.Date getSendtoKfTimeBegin() {
		return sendtoKfTimeBegin;
	}

	public void setSendtoKfTimeBegin(java.util.Date sendtoKfTimeBegin) {
		this.sendtoKfTimeBegin = sendtoKfTimeBegin;
	}

	public java.util.Date getSendtoKfTimeEnd() {
		return sendtoKfTimeEnd;
	}

	public void setSendtoKfTimeEnd(java.util.Date sendtoKfTimeEnd) {
		this.sendtoKfTimeEnd = sendtoKfTimeEnd;
	}

	public java.lang.String getAttribute01() {
		return attribute01;
	}

	public void setAttribute01(java.lang.String attribute01) {
		this.attribute01 = attribute01;
	}

	public java.lang.String getAttribute02() {
		return attribute02;
	}

	public void setAttribute02(java.lang.String attribute02) {
		this.attribute02 = attribute02;
	}

	public java.lang.String getAttribute03() {
		return attribute03;
	}

	public void setAttribute03(java.lang.String attribute03) {
		this.attribute03 = attribute03;
	}

	public java.lang.String getAttribute04() {
		return attribute04;
	}

	public void setAttribute04(java.lang.String attribute04) {
		this.attribute04 = attribute04;
	}

	public java.lang.String getAttribute05() {
		return attribute05;
	}

	public void setAttribute05(java.lang.String attribute05) {
		this.attribute05 = attribute05;
	}

	public java.lang.String getAttribute06() {
		return attribute06;
	}

	public void setAttribute06(java.lang.String attribute06) {
		this.attribute06 = attribute06;
	}

	public java.lang.String getAttribute07() {
		return attribute07;
	}

	public void setAttribute07(java.lang.String attribute07) {
		this.attribute07 = attribute07;
	}

	public java.lang.String getAttribute08() {
		return attribute08;
	}

	public void setAttribute08(java.lang.String attribute08) {
		this.attribute08 = attribute08;
	}

	public java.lang.String getAttribute09() {
		return attribute09;
	}

	public void setAttribute09(java.lang.String attribute09) {
		this.attribute09 = attribute09;
	}

	public java.lang.String getAttribute10() {
		return attribute10;
	}

	public void setAttribute10(java.lang.String attribute10) {
		this.attribute10 = attribute10;
	}

	public long getAttribute11() {
		return attribute11;
	}

	public void setAttribute11(long attribute11) {
		this.attribute11 = attribute11;
	}

	public long getAttribute12() {
		return attribute12;
	}

	public void setAttribute12(long attribute12) {
		this.attribute12 = attribute12;
	}

	public java.util.Date getAttribute13() {
		return attribute13;
	}

	public void setAttribute13(java.util.Date attribute13) {
		this.attribute13 = attribute13;
	}

	public java.util.Date getAttribute13Begin() {
		return attribute13Begin;
	}

	public void setAttribute13Begin(java.util.Date attribute13Begin) {
		this.attribute13Begin = attribute13Begin;
	}

	public java.util.Date getAttribute13End() {
		return attribute13End;
	}

	public void setAttribute13End(java.util.Date attribute13End) {
		this.attribute13End = attribute13End;
	}

	public java.util.Date getAttribute14() {
		return attribute14;
	}

	public void setAttribute14(java.util.Date attribute14) {
		this.attribute14 = attribute14;
	}

	public java.util.Date getAttribute14Begin() {
		return attribute14Begin;
	}

	public void setAttribute14Begin(java.util.Date attribute14Begin) {
		this.attribute14Begin = attribute14Begin;
	}

	public java.util.Date getAttribute14End() {
		return attribute14End;
	}

	public void setAttribute14End(java.util.Date attribute14End) {
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
		if (super.logFormName == null || super.logFormName.equals("")) {
			return "HDKF_SUPPORT_OUTFIELD_CARD";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "HDKF_SUPPORT_OUTFIELD_CARD";
		} else {
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