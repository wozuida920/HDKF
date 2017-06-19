package avicit.hdkf.support.hdkfsupportborrowpersoninf.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean HdkfSupportBorrowPersonInf Title:
 * 表HDKF_SUPPORT_BORROW_PERSON_INF的PoJo类，也就是数据库映射类 Description:
 * HDKF_SUPPORT_BORROW_PERSON_INF Copyriht: Copyright (c) 2012 Company: AVICIT
 * Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-08-23 14:04
 * 
 */
@PojoRemark(table = "hdkf_support_borrow_person_inf", object = "HdkfSupportBorrowPersonInfDTO", name = "HDKF_SUPPORT_BORROW_PERSON_INF")
public class HdkfSupportBorrowPersonInfDTO extends BeanDTO {
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

	@FieldRemark(column = "task_id", field = "taskId", name = "任务书ID")
	private java.lang.String taskId;

	@FieldRemark(column = "task_no", field = "taskNo", name = "任务书编号")
	private java.lang.String taskNo;

	@FieldRemark(column = "borrow_name", field = "borrowName", name = "借人单名称")
	private java.lang.String borrowName;

	@FieldRemark(column = "borrow_dept", field = "borrowDept", name = "借用人所在部门")
	private java.lang.String borrowDept;
	private java.lang.String borrowDeptAlias;

	@FieldRemark(column = "borrow_number", field = "borrowNumber", name = "借人数量")
	private long borrowNumber;

	@FieldRemark(column = "address", field = "address", name = "地点")
	private java.lang.String address;

	@FieldRemark(column = "estimate_date", field = "estimateDate", name = "预计时间")
	private java.util.Date estimateDate;

	private java.util.Date estimateDateBegin;

	private java.util.Date estimateDateEnd;

	@FieldRemark(column = "major", field = "major", name = "专业")
	private java.lang.String major;

	@FieldRemark(column = "link_man_kf", field = "linkManKf", name = "客服部经办人")
	private java.lang.String linkManKf;

	@FieldRemark(column = "link_phone_kf", field = "linkPhoneKf", name = "客服部联系电话")
	private java.lang.String linkPhoneKf;

	@FieldRemark(column = "task_demand", field = "taskDemand", name = "任务及要求")
	private java.lang.String taskDemand;

	@FieldRemark(column = "link_man_borrowed", field = "linkManBorrowed", name = "借出部门经办人")
	private java.lang.String linkManBorrowed;

	@FieldRemark(column = "link_phone_borrowed", field = "linkPhoneBorrowed", name = "借出部门经办人电话")
	private java.lang.String linkPhoneBorrowed;

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

	public java.lang.String getTaskId() {
		return taskId;
	}

	public void setTaskId(java.lang.String taskId) {
		this.taskId = taskId;
	}

	public java.lang.String getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(java.lang.String taskNo) {
		this.taskNo = taskNo;
	}

	public java.lang.String getBorrowName() {
		return borrowName;
	}

	public void setBorrowName(java.lang.String borrowName) {
		this.borrowName = borrowName;
	}

	public java.lang.String getBorrowDept() {
		return borrowDept;
	}

	public void setBorrowDept(java.lang.String borrowDept) {
		this.borrowDept = borrowDept;
	}

	public java.lang.String getBorrowDeptAlias() {
		return borrowDeptAlias;
	}

	public void setBorrowDeptAlias(java.lang.String borrowDeptAlias) {
		this.borrowDeptAlias = borrowDeptAlias;
	}

	public long getBorrowNumber() {
		return borrowNumber;
	}

	public void setBorrowNumber(long borrowNumber) {
		this.borrowNumber = borrowNumber;
	}

	public java.lang.String getAddress() {
		return address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	public java.util.Date getEstimateDate() {
		return estimateDate;
	}

	public void setEstimateDate(java.util.Date estimateDate) {
		this.estimateDate = estimateDate;
	}

	public java.util.Date getEstimateDateBegin() {
		return estimateDateBegin;
	}

	public void setEstimateDateBegin(java.util.Date estimateDateBegin) {
		this.estimateDateBegin = estimateDateBegin;
	}

	public java.util.Date getEstimateDateEnd() {
		return estimateDateEnd;
	}

	public void setEstimateDateEnd(java.util.Date estimateDateEnd) {
		this.estimateDateEnd = estimateDateEnd;
	}

	public java.lang.String getMajor() {
		return major;
	}

	public void setMajor(java.lang.String major) {
		this.major = major;
	}

	public java.lang.String getLinkManKf() {
		return linkManKf;
	}

	public void setLinkManKf(java.lang.String linkManKf) {
		this.linkManKf = linkManKf;
	}

	public java.lang.String getLinkPhoneKf() {
		return linkPhoneKf;
	}

	public void setLinkPhoneKf(java.lang.String linkPhoneKf) {
		this.linkPhoneKf = linkPhoneKf;
	}

	public java.lang.String getTaskDemand() {
		return taskDemand;
	}

	public void setTaskDemand(java.lang.String taskDemand) {
		this.taskDemand = taskDemand;
	}

	public java.lang.String getLinkManBorrowed() {
		return linkManBorrowed;
	}

	public void setLinkManBorrowed(java.lang.String linkManBorrowed) {
		this.linkManBorrowed = linkManBorrowed;
	}

	public java.lang.String getLinkPhoneBorrowed() {
		return linkPhoneBorrowed;
	}

	public void setLinkPhoneBorrowed(java.lang.String linkPhoneBorrowed) {
		this.linkPhoneBorrowed = linkPhoneBorrowed;
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
			return "HDKF_SUPPORT_BORROW_PERSON_INF";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "HDKF_SUPPORT_BORROW_PERSON_INF";
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