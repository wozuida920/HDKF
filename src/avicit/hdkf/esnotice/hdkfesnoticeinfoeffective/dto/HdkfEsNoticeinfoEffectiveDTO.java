package avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean HdkfEsNoticeinfoEffective Title:
 * 表HDKF_ES_NOTICEINFO_EFFECTIVE的PoJo类，也就是数据库映射类 Description: 技术通报涉及批架次信息表
 * Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-11-02 14:34
 * 
 */
@PojoRemark(table = "hdkf_es_noticeinfo_effective", object = "HdkfEsNoticeinfoEffectiveDTO", name = "技术通报涉及批架次信息表")
public class HdkfEsNoticeinfoEffectiveDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键")
	private java.lang.String id;

	@FieldRemark(column = "aircraftinfo_id", field = "aircraftinfoId", name = "飞机信息表ID")
	private java.lang.String aircraftinfoId;

	@FieldRemark(column = "batch_no", field = "batchNo", name = "批架次")
	private java.lang.String batchNo;

	@FieldRemark(column = "model_name", field = "modelName", name = "机型")
	private java.lang.String modelName;

	@FieldRemark(column = "bulletin_id", field = "bulletinId", name = "技术通报详细表ID")
	private java.lang.String bulletinId;

	@FieldRemark(column = "bulletin_no", field = "bulletinNo", name = "通告编号")
	private java.lang.String bulletinNo;

	@FieldRemark(column = "customer_id", field = "customerId", name = "客户ID")
	private java.lang.String customerId;

	@FieldRemark(column = "customer_name", field = "customerName", name = "客户名称")
	private java.lang.String customerName;

	@FieldRemark(column = "do_flag", field = "doFlag", name = "是否贯彻")
	private java.lang.String doFlag;

	@FieldRemark(column = "plan_time", field = "planTime", name = "计划贯彻时间")
	private java.util.Date planTime;

	private java.util.Date planTimeBegin;

	private java.util.Date planTimeEnd;

	@FieldRemark(column = "do_time", field = "doTime", name = "贯彻完成时间")
	private java.util.Date doTime;

	private java.util.Date doTimeBegin;

	private java.util.Date doTimeEnd;

	@FieldRemark(column = "undo_reason", field = "undoReason", name = "不执行理由")
	private java.lang.String undoReason;

	@FieldRemark(column = "user_comments", field = "userComments", name = "用户意见")
	private java.lang.String userComments;

	@FieldRemark(column = "write_name", field = "writeName", name = "填写人")
	private java.lang.String writeName;

	@FieldRemark(column = "complete_date", field = "completeDate", name = "填写日期")
	private java.util.Date completeDate;

	private java.util.Date completeDateBegin;

	private java.util.Date completeDateEnd;

	@FieldRemark(column = "remarks", field = "remarks", name = "备注")
	private java.lang.String remarks;

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
	private Long attribute11;

	@FieldRemark(column = "attribute_12", field = "attribute12", name = "扩展字段12")
	private Long attribute12;

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

	public java.lang.String getAircraftinfoId() {
		return aircraftinfoId;
	}

	public void setAircraftinfoId(java.lang.String aircraftinfoId) {
		this.aircraftinfoId = aircraftinfoId;
	}

	public java.lang.String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(java.lang.String batchNo) {
		this.batchNo = batchNo;
	}

	public java.lang.String getModelName() {
		return modelName;
	}

	public void setModelName(java.lang.String modelName) {
		this.modelName = modelName;
	}

	public java.lang.String getBulletinId() {
		return bulletinId;
	}

	public void setBulletinId(java.lang.String bulletinId) {
		this.bulletinId = bulletinId;
	}

	public java.lang.String getBulletinNo() {
		return bulletinNo;
	}

	public void setBulletinNo(java.lang.String bulletinNo) {
		this.bulletinNo = bulletinNo;
	}

	public java.lang.String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(java.lang.String customerId) {
		this.customerId = customerId;
	}

	public java.lang.String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(java.lang.String customerName) {
		this.customerName = customerName;
	}

	public java.lang.String getDoFlag() {
		return doFlag;
	}

	public void setDoFlag(java.lang.String doFlag) {
		this.doFlag = doFlag;
	}

	public java.util.Date getPlanTime() {
		return planTime;
	}

	public void setPlanTime(java.util.Date planTime) {
		this.planTime = planTime;
	}

	public java.util.Date getPlanTimeBegin() {
		return planTimeBegin;
	}

	public void setPlanTimeBegin(java.util.Date planTimeBegin) {
		this.planTimeBegin = planTimeBegin;
	}

	public java.util.Date getPlanTimeEnd() {
		return planTimeEnd;
	}

	public void setPlanTimeEnd(java.util.Date planTimeEnd) {
		this.planTimeEnd = planTimeEnd;
	}

	public java.util.Date getDoTime() {
		return doTime;
	}

	public void setDoTime(java.util.Date doTime) {
		this.doTime = doTime;
	}

	public java.util.Date getDoTimeBegin() {
		return doTimeBegin;
	}

	public void setDoTimeBegin(java.util.Date doTimeBegin) {
		this.doTimeBegin = doTimeBegin;
	}

	public java.util.Date getDoTimeEnd() {
		return doTimeEnd;
	}

	public void setDoTimeEnd(java.util.Date doTimeEnd) {
		this.doTimeEnd = doTimeEnd;
	}

	public java.lang.String getUndoReason() {
		return undoReason;
	}

	public void setUndoReason(java.lang.String undoReason) {
		this.undoReason = undoReason;
	}

	public java.lang.String getUserComments() {
		return userComments;
	}

	public void setUserComments(java.lang.String userComments) {
		this.userComments = userComments;
	}

	public java.lang.String getWriteName() {
		return writeName;
	}

	public void setWriteName(java.lang.String writeName) {
		this.writeName = writeName;
	}

	public java.util.Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(java.util.Date completeDate) {
		this.completeDate = completeDate;
	}

	public java.util.Date getCompleteDateBegin() {
		return completeDateBegin;
	}

	public void setCompleteDateBegin(java.util.Date completeDateBegin) {
		this.completeDateBegin = completeDateBegin;
	}

	public java.util.Date getCompleteDateEnd() {
		return completeDateEnd;
	}

	public void setCompleteDateEnd(java.util.Date completeDateEnd) {
		this.completeDateEnd = completeDateEnd;
	}

	public java.lang.String getRemarks() {
		return remarks;
	}

	public void setRemarks(java.lang.String remarks) {
		this.remarks = remarks;
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

	public Long getAttribute11() {
		return attribute11;
	}

	public void setAttribute11(Long attribute11) {
		this.attribute11 = attribute11;
	}

	public Long getAttribute12() {
		return attribute12;
	}

	public void setAttribute12(Long attribute12) {
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

	public String getLogFormName() {
		if (super.logFormName == null || super.logFormName.equals("")) {
			return "技术通报涉及批架次信息表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "技术通报涉及批架次信息表";
		} else {
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
	private  String  countFile;

	public String getCountFile() {
		return countFile;
	}

	public void setCountFile(String countFile) {
		this.countFile = countFile;
	}

}