package avicit.csmp.basicData.csmpbdcompanystructure.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpBdCompanystructure Title: 表CSMP_BD_COMPANYSTRUCTURE的PoJo类，也就是数据库映射类
 * Description: 单位信息结构表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-06-15 11:17
 * 
 */
@PojoRemark(table = "csmp_bd_companystructure", object = "CsmpBdCompanystructureDTO", name = "单位信息结构表")
public class CsmpBdCompanystructureDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "pid", field = "pid", name = "父ID")
	private java.lang.String pid;
	@LogField
	@FieldRemark(column = "catalog_code", field = "catalogCode", name = "目录编码")
	private java.lang.String catalogCode;
	@LogField
	@FieldRemark(column = "catalog_name", field = "catalogName", name = "目录名称")
	private java.lang.String catalogName;

	@FieldRemark(column = "sequence_num", field = "sequenceNum", name = "顺序号")
	private long sequenceNum;

	@FieldRemark(column = "is_valid", field = "isValid", name = "是否有效")
	private java.lang.String isValid;

	@FieldRemark(column = "catalog_level", field = "catalogLevel", name = "目录级别")
	private java.lang.String catalogLevel;

	@FieldRemark(column = "catalog_type", field = "catalogType", name = "目录类型")
	private java.lang.String catalogType;

	@FieldRemark(column = "remark", field = "remark", name = "备注")
	private java.lang.String remark;

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getPid() {
		return pid;
	}

	public void setPid(java.lang.String pid) {
		this.pid = pid;
	}

	public java.lang.String getCatalogCode() {
		return catalogCode;
	}

	public void setCatalogCode(java.lang.String catalogCode) {
		this.catalogCode = catalogCode;
	}

	public java.lang.String getCatalogName() {
		return catalogName;
	}

	public void setCatalogName(java.lang.String catalogName) {
		this.catalogName = catalogName;
	}

	public long getSequenceNum() {
		return sequenceNum;
	}

	public void setSequenceNum(long sequenceNum) {
		this.sequenceNum = sequenceNum;
	}

	public java.lang.String getIsValid() {
		return isValid;
	}

	public void setIsValid(java.lang.String isValid) {
		this.isValid = isValid;
	}

	public java.lang.String getCatalogLevel() {
		return catalogLevel;
	}

	public void setCatalogLevel(java.lang.String catalogLevel) {
		this.catalogLevel = catalogLevel;
	}

	public java.lang.String getCatalogType() {
		return catalogType;
	}

	public void setCatalogType(java.lang.String catalogType) {
		this.catalogType = catalogType;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public String getLogFormName() {
		if (super.logFormName == null || super.logFormName.equals("")) {
			return "单位信息结构表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "单位信息结构表";
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