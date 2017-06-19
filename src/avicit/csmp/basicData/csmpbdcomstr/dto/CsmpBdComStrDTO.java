package avicit.csmp.basicData.csmpbdcomstr.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpBdComStr Title: 表CSMP_BD_COM_STR的PoJo类，也就是数据库映射类 Description:
 * 单位结构关系表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-06-18 13:40
 * 
 */
@PojoRemark(table = "csmp_bd_com_str", object = "CsmpBdComStrDTO", name = "单位结构关系表")
public class CsmpBdComStrDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;

	@FieldRemark(column = "str_id", field = "strId", name = "单位结构ID")
	private java.lang.String strId;

	@FieldRemark(column = "com_id", field = "comId", name = "单位ID")
	private java.lang.String comId;

	@FieldRemark(column = "com_type", field = "comType", name = "单位类型")
	private java.lang.String comType;

	@FieldRemark(column = "remark", field = "remark", name = "备注")
	private java.lang.String remark;

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getStrId() {
		return strId;
	}

	public void setStrId(java.lang.String strId) {
		this.strId = strId;
	}

	public java.lang.String getComId() {
		return comId;
	}

	public void setComId(java.lang.String comId) {
		this.comId = comId;
	}

	public java.lang.String getComType() {
		return comType;
	}

	public void setComType(java.lang.String comType) {
		this.comType = comType;
	}

	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	public String getLogFormName() {
		if (super.logFormName == null || super.logFormName.equals("")) {
			return "单位结构关系表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "单位结构关系表";
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