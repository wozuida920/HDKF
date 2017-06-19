package avicit.hdkf.esnotice.hdkfesnoticeinfo.dto;

import java.sql.Date;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean HdkfEsNoticeinfo Title: 表HDKF_ES_NOTICEINFO的PoJo类，也就是数据库映射类 Description:
 * 技术通报详细信息表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-11-02 14:30
 * 
 */
@PojoRemark(table = "hdkf_es_noticeinfo", object = "HdkfEsNoticeinfoDTO", name = "技术通报详细信息表")
public class HdkfEsNoticeinfoDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键")
	private java.lang.String id;
	@FieldRemark(column = "bulletin_no", field = "bulletinNo", name = "通告编号")
	private java.lang.String bulletinNo;
	@FieldRemark(column = "title", field = "title", name = "标题")
	private java.lang.String title;
	@FieldRemark(column = "organ_contact", field = "organContact", name = "机关联系人")
	private java.lang.String organContact;
	@FieldRemark(column = "telephone", field = "telephone", name = "机关联系人电话")
	private java.lang.String telephone;
	@FieldRemark(column = "bulletin_type", field = "bulletinType", name = "通报类型 ")
	private java.lang.String bulletinType;
	@FieldRemark(column = "material_supply", field = "materialSupply", name = "材料提供方式")
	private java.lang.String materialSupply;
	@FieldRemark(column = "implement_company", field = "implementCompany", name = "实施单位")
	private java.lang.String implementCompany;
	@FieldRemark(column = "report_date", field = "reportDate", name = "预计上报日期")
	private java.util.Date reportDate;

	private java.util.Date reportDateBegin;

	private java.util.Date reportDateEnd;
	@FieldRemark(column = "author", field = "author", name = "编者")
	private java.lang.String author;
	@FieldRemark(column = "file_company", field = "fileCompany", name = "编发单位")
	private java.lang.String fileCompany;
	@FieldRemark(column = "company_tel", field = "companyTel", name = "电话")
	private java.lang.String companyTel;
	@FieldRemark(column = "include_mars", field = "includeMars", name = "是否包含器材")
	private java.lang.String includeMars;
	@FieldRemark(column = "publish_date", field = "publishDate", name = "预计发布日期")
	private java.util.Date publishDate;

	private java.util.Date publishDateBegin;

	private java.util.Date publishDateEnd;
	@FieldRemark(column = "complete_date", field = "completeDate", name = "预计应完成日期")
	private java.util.Date completeDate;

	private java.util.Date completeDateBegin;

	private java.util.Date completeDateEnd;
	@FieldRemark(column = "change_no", field = "changeNo", name = "更改单号")
	private java.lang.String changeNo;
	@FieldRemark(column = "perform_requirement", field = "performRequirement", name = "执行要求")
	private java.lang.String performRequirement;
	@FieldRemark(column = "change_comment", field = "changeComment", name = "换版内容")
	private java.lang.String changeComment;
	@FieldRemark(column = "remark", field = "remark", name = "备注")
	private java.lang.String remark;
	@FieldRemark(column = "report_no", field = "reportNo", name = "上报文号")
	private java.lang.String reportNo;
	@FieldRemark(column = "report_time", field = "reportTime", name = "上报时间")
	private java.util.Date reportTime;

	private java.util.Date reportTimeBegin;

	private java.util.Date reportTimeEnd;
	@FieldRemark(column = "reply_no", field = "replyNo", name = "批复文号")
	private java.lang.String replyNo;
	@FieldRemark(column = "reply_time", field = "replyTime", name = "批复时间")
	private java.util.Date replyTime;

	private java.util.Date replyTimeBegin;

	private java.util.Date replyTimeEnd;
	@FieldRemark(column = "complete_time", field = "completeTime", name = "应完成时间")
	private java.util.Date completeTime;

	private java.util.Date completeTimeBegin;

	private java.util.Date completeTimeEnd;
	@FieldRemark(column = "forward_no", field = "forwardNo", name = "转发文号")
	private java.lang.String forwardNo;
	@FieldRemark(column = "forward_time", field = "forwardTime", name = "转发时间")
	private java.util.Date forwardTime;

	private java.util.Date forwardTimeBegin;

	private java.util.Date forwardTimeEnd;
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

	public java.lang.String getBulletinNo() {
		return bulletinNo;
	}

	public void setBulletinNo(java.lang.String bulletinNo) {
		this.bulletinNo = bulletinNo;
	}

	public java.lang.String getTitle() {
		return title;
	}

	public void setTitle(java.lang.String title) {
		this.title = title;
	}

	public java.lang.String getOrganContact() {
		return organContact;
	}

	public void setOrganContact(java.lang.String organContact) {
		this.organContact = organContact;
	}

	public java.lang.String getTelephone() {
		return telephone;
	}

	public void setTelephone(java.lang.String telephone) {
		this.telephone = telephone;
	}

	public java.lang.String getBulletinType() {
		return bulletinType;
	}

	public void setBulletinType(java.lang.String bulletinType) {
		this.bulletinType = bulletinType;
	}

	public java.lang.String getMaterialSupply() {
		return materialSupply;
	}

	public void setMaterialSupply(java.lang.String materialSupply) {
		this.materialSupply = materialSupply;
	}

	public java.lang.String getImplementCompany() {
		return implementCompany;
	}

	public void setImplementCompany(java.lang.String implementCompany) {
		this.implementCompany = implementCompany;
	}

	public java.util.Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(java.util.Date reportDate) {
		this.reportDate = reportDate;
	}

	public java.util.Date getReportDateBegin() {
		return reportDateBegin;
	}

	public void setReportDateBegin(java.util.Date reportDateBegin) {
		this.reportDateBegin = reportDateBegin;
	}

	public java.util.Date getReportDateEnd() {
		return reportDateEnd;
	}

	public void setReportDateEnd(java.util.Date reportDateEnd) {
		this.reportDateEnd = reportDateEnd;
	}

	public java.lang.String getAuthor() {
		return author;
	}

	public void setAuthor(java.lang.String author) {
		this.author = author;
	}

	public java.lang.String getFileCompany() {
		return fileCompany;
	}

	public void setFileCompany(java.lang.String fileCompany) {
		this.fileCompany = fileCompany;
	}

	public java.lang.String getCompanyTel() {
		return companyTel;
	}

	public void setCompanyTel(java.lang.String companyTel) {
		this.companyTel = companyTel;
	}

	public java.lang.String getIncludeMars() {
		return includeMars;
	}

	public void setIncludeMars(java.lang.String includeMars) {
		this.includeMars = includeMars;
	}

	public java.util.Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(java.util.Date publishDate) {
		this.publishDate = publishDate;
	}

	public java.util.Date getPublishDateBegin() {
		return publishDateBegin;
	}

	public void setPublishDateBegin(java.util.Date publishDateBegin) {
		this.publishDateBegin = publishDateBegin;
	}

	public java.util.Date getPublishDateEnd() {
		return publishDateEnd;
	}

	public void setPublishDateEnd(java.util.Date publishDateEnd) {
		this.publishDateEnd = publishDateEnd;
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

	public java.lang.String getChangeNo() {
		return changeNo;
	}

	public void setChangeNo(java.lang.String changeNo) {
		this.changeNo = changeNo;
	}

	public java.lang.String getPerformRequirement() {
		return performRequirement;
	}

	public void setPerformRequirement(java.lang.String performRequirement) {
		this.performRequirement = performRequirement;
	}

	public java.lang.String getChangeComment() {
		return changeComment;
	}

	public void setChangeComment(java.lang.String changeComment) {
		this.changeComment = changeComment;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public java.lang.String getReportNo() {
		return reportNo;
	}

	public void setReportNo(java.lang.String reportNo) {
		this.reportNo = reportNo;
	}

	public java.util.Date getReportTime() {
		return reportTime;
	}

	public void setReportTime(java.util.Date reportTime) {
		this.reportTime = reportTime;
	}

	public java.util.Date getReportTimeBegin() {
		return reportTimeBegin;
	}

	public void setReportTimeBegin(java.util.Date reportTimeBegin) {
		this.reportTimeBegin = reportTimeBegin;
	}

	public java.util.Date getReportTimeEnd() {
		return reportTimeEnd;
	}

	public void setReportTimeEnd(java.util.Date reportTimeEnd) {
		this.reportTimeEnd = reportTimeEnd;
	}

	public java.lang.String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(java.lang.String replyNo) {
		this.replyNo = replyNo;
	}

	public java.util.Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(java.util.Date replyTime) {
		this.replyTime = replyTime;
	}

	public java.util.Date getReplyTimeBegin() {
		return replyTimeBegin;
	}

	public void setReplyTimeBegin(java.util.Date replyTimeBegin) {
		this.replyTimeBegin = replyTimeBegin;
	}

	public java.util.Date getReplyTimeEnd() {
		return replyTimeEnd;
	}

	public void setReplyTimeEnd(java.util.Date replyTimeEnd) {
		this.replyTimeEnd = replyTimeEnd;
	}

	public java.util.Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(java.util.Date completeTime) {
		this.completeTime = completeTime;
	}

	public java.util.Date getCompleteTimeBegin() {
		return completeTimeBegin;
	}

	public void setCompleteTimeBegin(java.util.Date completeTimeBegin) {
		this.completeTimeBegin = completeTimeBegin;
	}

	public java.util.Date getCompleteTimeEnd() {
		return completeTimeEnd;
	}

	public void setCompleteTimeEnd(java.util.Date completeTimeEnd) {
		this.completeTimeEnd = completeTimeEnd;
	}

	public java.lang.String getForwardNo() {
		return forwardNo;
	}

	public void setForwardNo(java.lang.String forwardNo) {
		this.forwardNo = forwardNo;
	}

	public java.util.Date getForwardTime() {
		return forwardTime;
	}

	public void setForwardTime(java.util.Date forwardTime) {
		this.forwardTime = forwardTime;
	}

	public java.util.Date getForwardTimeBegin() {
		return forwardTimeBegin;
	}

	public void setForwardTimeBegin(java.util.Date forwardTimeBegin) {
		this.forwardTimeBegin = forwardTimeBegin;
	}

	public java.util.Date getForwardTimeEnd() {
		return forwardTimeEnd;
	}

	public void setForwardTimeEnd(java.util.Date forwardTimeEnd) {
		this.forwardTimeEnd = forwardTimeEnd;
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
			return "技术通报详细信息表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "技术通报详细信息表";
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

	private String activityalias_;
	private String businessstate_;
	private String bpmType;
	private String bpmState;
	private String currUserId;

	public String getActivityalias_() {
		return activityalias_;
	}

	public void setActivityalias_(String activityalias_) {
		this.activityalias_ = activityalias_;
	}

	public String getBusinessstate_() {
		return businessstate_;
	}

	public void setBusinessstate_(String businessstate_) {
		this.businessstate_ = businessstate_;
	}

	public String getBpmType() {
		return bpmType;
	}

	public void setBpmType(String bpmType) {
		this.bpmType = bpmType;
	}

	public String getBpmState() {
		return bpmState;
	}

	public void setBpmState(String bpmState) {
		this.bpmState = bpmState;
	}

	public String getCurrUserId() {
		return currUserId;
	}

	public void setCurrUserId(String currUserId) {
		this.currUserId = currUserId;
	}

	private String countBatchNo;

	public String getCountBatchNo() {
		return countBatchNo;
	}

	public void setCountBatchNo(String countBatchNo) {
		this.countBatchNo = countBatchNo;
	}

	public String getCountName() {
		return countName;
	}

	public void setCountName(String countName) {
		this.countName = countName;
	}

	private String countName;
	private String countImplement;

	public String getCountImplement() {
		return countImplement;
	}

	public void setCountImplement(String countImplement) {
		this.countImplement = countImplement;
	}
    private String isDone;

	public String getIsDone() {
		return isDone;
	}

	public void setIsDone(String isDone) {
		this.isDone = isDone;
	}
	private java.util.Date effectDate;

	public java.util.Date getEffectDate() {
		return effectDate;
	}

	public void setEffectDate(java.util.Date date) {
		this.effectDate = date;
	}
	
	private String curStatus,curProcess;

	public String getCurStatus() {
		return curStatus;
	}

	public void setCurStatus(String curStatus) {
		this.curStatus = curStatus;
	}

	public String getCurProcess() {
		return curProcess;
	}

	public void setCurProcess(String curProcess) {
		this.curProcess = curProcess;
	}
}