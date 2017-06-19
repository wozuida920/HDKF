package avicit.csmp.basicData.csmpbdatachapter.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpBdAtachapter Title: 表CSMP_BD_ATACHAPTER的PoJo类，也就是数据库映射类 Description:
 * ATM章节号管理 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-06-13 11:50
 * 
 */
@PojoRemark(table = "csmp_bd_atachapter", object = "CsmpBdAtachapterDTO", name = "ATM章节号管理")
public class CsmpBdAtachapterDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "chapter", field = "chapter", name = "章节号")
	private java.lang.String chapter;
	@LogField
	@FieldRemark(column = "ata_name", field = "ataName", name = "章节名称")
	private java.lang.String ataName;
	@LogField
	@FieldRemark(column = "name_en", field = "nameEn", name = "英文章节名称")
	private java.lang.String nameEn;
	@LogField
	@FieldRemark(column = "parent_class_id", field = "parentClassId", name = "父类ID")
	private java.lang.String parentClassId;

	@FieldRemark(column = "class_order", field = "classOrder", name = "类别排序")
	private long classOrder;

	@FieldRemark(column = "valid_flag", field = "validFlag", name = "有效标识")
	private java.lang.String validFlag;

	@FieldRemark(column = "is_detailed", field = "isDetailed", name = "是否明细")
	private java.lang.String isDetailed;
	@LogField
	@FieldRemark(column = "remark", field = "remark", name = "备注")
	private java.lang.String remark;

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

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getChapter() {
		return chapter;
	}

	public void setChapter(java.lang.String chapter) {
		this.chapter = chapter;
	}

	public java.lang.String getAtaName() {
		return ataName;
	}

	public void setAtaName(java.lang.String ataName) {
		this.ataName = ataName;
	}

	public java.lang.String getNameEn() {
		return nameEn;
	}

	public void setNameEn(java.lang.String nameEn) {
		this.nameEn = nameEn;
	}

	public java.lang.String getParentClassId() {
		return parentClassId;
	}

	public void setParentClassId(java.lang.String parentClassId) {
		this.parentClassId = parentClassId;
	}

	public long getClassOrder() {
		return classOrder;
	}

	public void setClassOrder(long classOrder) {
		this.classOrder = classOrder;
	}

	public java.lang.String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(java.lang.String validFlag) {
		this.validFlag = validFlag;
	}

	public java.lang.String getIsDetailed() {
		return isDetailed;
	}

	public void setIsDetailed(java.lang.String isDetailed) {
		this.isDetailed = isDetailed;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
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

	public String getLogFormName() {
		if (super.logFormName == null || super.logFormName.equals("")) {
			return "ATM章节号管理";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "ATM章节号管理";
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

}