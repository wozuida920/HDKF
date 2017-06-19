package avicit.csmp.basicData.csmpbdsparepart.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpBdSparepart Title: 表CSMP_BD_SPAREPART的PoJo类，也就是数据库映射类 Description:
 * 备件信息表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-06-16 19:13
 * 
 */
@PojoRemark(table = "csmp_bd_sparepart", object = "CsmpBdSparepartDTO", name = "备件信息表")
public class CsmpBdSparepartDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "product_name", field = "productName", name = "产品名称")
	private java.lang.String productName;
	@LogField
	@FieldRemark(column = "drawing_no", field = "drawingNo", name = "图号")
	private java.lang.String drawingNo;

	@FieldRemark(column = "batch_no", field = "batchNo", name = "件号/批次号")
	private java.lang.String batchNo;
	@LogField
	@FieldRemark(column = "unit", field = "unit", name = "单位")
	private java.lang.String unit;

	@FieldRemark(column = "quantity", field = "quantity", name = "数量")
	private long quantity;

	@FieldRemark(column = "specification", field = "specification", name = "规格")
	private java.lang.String specification;

	@FieldRemark(column = "duty_free_price", field = "dutyFreePrice", name = "免税单价")
	private float dutyFreePrice;

	@FieldRemark(column = "tax_price", field = "taxPrice", name = "含税单价")
	private float taxPrice;

	@FieldRemark(column = "liability_unit", field = "liabilityUnit", name = "责任单位")
	private java.lang.String liabilityUnit;

	@FieldRemark(column = "cycle", field = "cycle", name = "生产周期")
	private java.lang.String  cycle;
	
	
	@FieldRemark(column = "category", field = "category", name = "类别（国产成品、进口成品、自制件、标准件、消耗件）")
	private java.lang.String category;

	@FieldRemark(column = "product_type", field = "productType", name = "产品类型（消耗件、周转件）")
	private java.lang.String productType;

	@FieldRemark(column = "valid_flag", field = "validFlag", name = "有效性")
	private java.lang.String validFlag;

	@FieldRemark(column = "is_randompart", field = "isRandompart", name = "是否随机件")
	private java.lang.String isRandompart;

	@FieldRemark(column = "remark", field = "remark", name = "备注")
	private java.lang.String remark;

	@FieldRemark(column = "attribute_01", field = "attribute01", name = "扩展字段_01")
	private java.lang.String attribute01;

	@FieldRemark(column = "attribute_02", field = "attribute02", name = "扩展字段_02")
	private java.lang.String attribute02;

	@FieldRemark(column = "attribute_03", field = "attribute03", name = "扩展字段_03")
	private java.lang.String attribute03;

	@FieldRemark(column = "attribute_04", field = "attribute04", name = "扩展字段_04")
	private java.lang.String attribute04;

	@FieldRemark(column = "attribute_05", field = "attribute05", name = "扩展字段_05")
	private java.lang.String attribute05;

	@FieldRemark(column = "attribute_06", field = "attribute06", name = "扩展字段_06")
	private java.lang.String attribute06;

	@FieldRemark(column = "attribute_07", field = "attribute07", name = "扩展字段_07")
	private java.lang.String attribute07;

	@FieldRemark(column = "attribute_08", field = "attribute08", name = "扩展字段_08")
	private java.lang.String attribute08;

	@FieldRemark(column = "attribute_09", field = "attribute09", name = "扩展字段_09")
	private java.lang.String attribute09;

	@FieldRemark(column = "attribute_10", field = "attribute10", name = "扩展字段_10")
	private java.lang.String attribute10;
	
	@FieldRemark(column = "classify_dept", field = "classifyDept", name = "扩展字段_10")
	private java.lang.String classifyDept;

	public java.lang.String getClassifyDept() {
		return classifyDept;
	}

	public void setClassifyDept(java.lang.String classifyDept) {
		this.classifyDept = classifyDept;
	}

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getProductName() {
		return productName;
	}

	public void setProductName(java.lang.String productName) {
		this.productName = productName;
	}

	public java.lang.String getDrawingNo() {
		return drawingNo;
	}

	public void setDrawingNo(java.lang.String drawingNo) {
		this.drawingNo = drawingNo;
	}

	public java.lang.String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(java.lang.String batchNo) {
		this.batchNo = batchNo;
	}

	public java.lang.String getUnit() {
		return unit;
	}

	public void setUnit(java.lang.String unit) {
		this.unit = unit;
	}

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public java.lang.String getSpecification() {
		return specification;
	}

	public void setSpecification(java.lang.String specification) {
		this.specification = specification;
	}

	public float getDutyFreePrice() {
		return dutyFreePrice;
	}

	public void setDutyFreePrice(float dutyFreePrice) {
		this.dutyFreePrice = dutyFreePrice;
	}

	public float getTaxPrice() {
		return taxPrice;
	}

	public void setTaxPrice(float taxPrice) {
		this.taxPrice = taxPrice;
	}

	public java.lang.String getLiabilityUnit() {
		return liabilityUnit;
	}

	public void setLiabilityUnit(java.lang.String liabilityUnit) {
		this.liabilityUnit = liabilityUnit;
	}

	public java.lang.String getCategory() {
		return category;
	}

	public void setCategory(java.lang.String category) {
		this.category = category;
	}

	public java.lang.String getProductType() {
		return productType;
	}

	public void setProductType(java.lang.String productType) {
		this.productType = productType;
	}

	public java.lang.String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(java.lang.String validFlag) {
		this.validFlag = validFlag;
	}

	public java.lang.String getIsRandompart() {
		return isRandompart;
	}

	public void setIsRandompart(java.lang.String isRandompart) {
		this.isRandompart = isRandompart;
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
			return "备件信息表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "备件信息表";
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

	public java.lang.String getCycle() {
		return cycle;
	}

	public void setCycle(java.lang.String cycle) {
		this.cycle = cycle;
	}

}