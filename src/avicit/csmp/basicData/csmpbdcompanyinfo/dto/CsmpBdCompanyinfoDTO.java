package avicit.csmp.basicData.csmpbdcompanyinfo.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpBdCompanyinfo Title: 表CSMP_BD_COMPANYINFO的PoJo类，也就是数据库映射类
 * Description: 单位信息表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-06-15 15:23
 * 
 */
@PojoRemark(table = "csmp_bd_companyinfo", object = "CsmpBdCompanyinfoDTO", name = "单位信息表")
public class CsmpBdCompanyinfoDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "node_id", field = "nodeId", name = "结构ID")
	private java.lang.String nodeId;

	@FieldRemark(column = "dept_id", field = "deptId", name = "所属部门")
	private java.lang.String deptId;
	@LogField
	@FieldRemark(column = "company_code", field = "companyCode", name = "单位编码")
	private java.lang.String companyCode;
	@LogField
	@FieldRemark(column = "company_name", field = "companyName", name = "单位名称")
	private java.lang.String companyName;

	@FieldRemark(column = "name_en", field = "nameEn", name = "英文名称")
	private java.lang.String nameEn;
	@LogField
	@FieldRemark(column = "short_name", field = "shortName", name = "简称")
	private java.lang.String shortName;

	@FieldRemark(column = "short_name_en", field = "shortNameEn", name = "英文简称")
	private java.lang.String shortNameEn;
	@LogField
	@FieldRemark(column = "address", field = "address", name = "地址")
	private java.lang.String address;

	@FieldRemark(column = "receive_address", field = "receiveAddress", name = "收货地址")
	private java.lang.String receiveAddress;

	@FieldRemark(column = "company_type", field = "companyType", name = "类别")
	private java.lang.String companyType;

	@FieldRemark(column = "company_level", field = "companyLevel", name = "等级")
	private java.lang.String companyLevel;
	@LogField
	@FieldRemark(column = "country", field = "country", name = "国家")
	private java.lang.String country;
	private java.lang.String countryAlias;

	@FieldRemark(column = "province", field = "province", name = "省份")
	private java.lang.String province;

	@FieldRemark(column = "setupdate", field = "setupdate", name = "成立时间")
	private java.util.Date setupdate;

	private java.util.Date setupdateBegin;

	private java.util.Date setupdateEnd;

	@FieldRemark(column = "business_nature", field = "businessNature", name = "营业性质")
	private java.lang.String businessNature;
	@LogField
	@FieldRemark(column = "operating_status", field = "operatingStatus", name = "营业状态")
	private java.lang.String operatingStatus;

	@FieldRemark(column = "language", field = "language", name = "语言")
	private java.lang.String language;

	@FieldRemark(column = "telephone", field = "telephone", name = "电话")
	private java.lang.String telephone;

	@FieldRemark(column = "fax", field = "fax", name = "传真")
	private java.lang.String fax;

	@FieldRemark(column = "mail", field = "mail", name = "邮件")
	private java.lang.String mail;

	@FieldRemark(column = "account_name", field = "accountName", name = "账户名称")
	private java.lang.String accountName;

	@FieldRemark(column = "account_id", field = "accountId", name = "税务等级证号")
	private java.lang.String accountId;

	@FieldRemark(column = "account_address", field = "accountAddress", name = "开户地址")
	private java.lang.String accountAddress;

	@FieldRemark(column = "account_tel", field = "accountTel", name = "开户电话")
	private java.lang.String accountTel;

	@FieldRemark(column = "account_bank_name", field = "accountBankName", name = "开户行")
	private java.lang.String accountBankName;

	@FieldRemark(column = "account_no", field = "accountNo", name = "账号")
	private java.lang.String accountNo;

	@FieldRemark(column = "describe", field = "describe", name = "描述")
	private java.lang.String describe;

	@FieldRemark(column = "contacts", field = "contacts", name = "联系人")
	private java.lang.String contacts;
	private java.lang.String contactsAlias;

	@FieldRemark(column = "service_representative", field = "serviceRepresentative", name = "服务代表")
	private java.lang.String serviceRepresentative;
	private java.lang.String serviceRepresentativeAlias;

	@FieldRemark(column = "legal_person", field = "legalPerson", name = "法人")
	private java.lang.String legalPerson;
	private java.lang.String legalPersonAlias;

	@FieldRemark(column = "cl_client_code", field = "clClientCode", name = "CL单客户代码")
	private java.lang.String clClientCode;

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
	@FieldRemark(column = "heat_sort", field = "heatSort", name = "排序")
	private long heatSort;
	@FieldRemark(column = "attribute_10", field = "attribute10", name = "扩展字段10")
	private java.lang.String attribute10;
	
	private java.lang.String aricarftId;
	private java.lang.String batchNoName;
	private java.lang.String aricarftmodelId;
	private java.lang.String modelName;
	
	
	

	public long getHeatSort() {
		return heatSort;
	}

	public void setHeatSort(long heatSort) {
		this.heatSort = heatSort;
	}

	public java.lang.String getCountryAlias() {
		return countryAlias;
	}

	public void setCountryAlias(java.lang.String countryAlias) {
		this.countryAlias = countryAlias;
	}

	public java.lang.String getAricarftId() {
		return aricarftId;
	}

	public void setAricarftId(java.lang.String aricarftId) {
		this.aricarftId = aricarftId;
	}

	public java.lang.String getBatchNoName() {
		return batchNoName;
	}

	public void setBatchNoName(java.lang.String batchNoName) {
		this.batchNoName = batchNoName;
	}

	public java.lang.String getAricarftmodelId() {
		return aricarftmodelId;
	}

	public void setAricarftmodelId(java.lang.String aricarftmodelId) {
		this.aricarftmodelId = aricarftmodelId;
	}

	public java.lang.String getModelName() {
		return modelName;
	}

	public void setModelName(java.lang.String modelName) {
		this.modelName = modelName;
	}

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getNodeId() {
		return nodeId;
	}

	public void setNodeId(java.lang.String nodeId) {
		this.nodeId = nodeId;
	}

	public java.lang.String getDeptId() {
		return deptId;
	}

	public void setDeptId(java.lang.String deptId) {
		this.deptId = deptId;
	}

	public java.lang.String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(java.lang.String companyCode) {
		this.companyCode = companyCode;
	}

	public java.lang.String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(java.lang.String companyName) {
		this.companyName = companyName;
	}

	public java.lang.String getNameEn() {
		return nameEn;
	}

	public void setNameEn(java.lang.String nameEn) {
		this.nameEn = nameEn;
	}

	public java.lang.String getShortName() {
		return shortName;
	}

	public void setShortName(java.lang.String shortName) {
		this.shortName = shortName;
	}

	public java.lang.String getShortNameEn() {
		return shortNameEn;
	}

	public void setShortNameEn(java.lang.String shortNameEn) {
		this.shortNameEn = shortNameEn;
	}

	public java.lang.String getAddress() {
		return address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	public java.lang.String getReceiveAddress() {
		return receiveAddress;
	}

	public void setReceiveAddress(java.lang.String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}

	public java.lang.String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(java.lang.String companyType) {
		this.companyType = companyType;
	}

	public java.lang.String getCompanyLevel() {
		return companyLevel;
	}

	public void setCompanyLevel(java.lang.String companyLevel) {
		this.companyLevel = companyLevel;
	}

	public java.lang.String getCountry() {
		return country;
	}

	public void setCountry(java.lang.String country) {
		this.country = country;
	}

	public java.lang.String getProvince() {
		return province;
	}

	public void setProvince(java.lang.String province) {
		this.province = province;
	}

	public java.util.Date getSetupdate() {
		return setupdate;
	}

	public void setSetupdate(java.util.Date setupdate) {
		this.setupdate = setupdate;
	}

	public java.util.Date getSetupdateBegin() {
		return setupdateBegin;
	}

	public void setSetupdateBegin(java.util.Date setupdateBegin) {
		this.setupdateBegin = setupdateBegin;
	}

	public java.util.Date getSetupdateEnd() {
		return setupdateEnd;
	}

	public void setSetupdateEnd(java.util.Date setupdateEnd) {
		this.setupdateEnd = setupdateEnd;
	}

	public java.lang.String getBusinessNature() {
		return businessNature;
	}

	public void setBusinessNature(java.lang.String businessNature) {
		this.businessNature = businessNature;
	}

	public java.lang.String getOperatingStatus() {
		return operatingStatus;
	}

	public void setOperatingStatus(java.lang.String operatingStatus) {
		this.operatingStatus = operatingStatus;
	}

	public java.lang.String getLanguage() {
		return language;
	}

	public void setLanguage(java.lang.String language) {
		this.language = language;
	}

	public java.lang.String getTelephone() {
		return telephone;
	}

	public void setTelephone(java.lang.String telephone) {
		this.telephone = telephone;
	}

	public java.lang.String getFax() {
		return fax;
	}

	public void setFax(java.lang.String fax) {
		this.fax = fax;
	}

	public java.lang.String getMail() {
		return mail;
	}

	public void setMail(java.lang.String mail) {
		this.mail = mail;
	}

	public java.lang.String getAccountName() {
		return accountName;
	}

	public void setAccountName(java.lang.String accountName) {
		this.accountName = accountName;
	}

	public java.lang.String getAccountId() {
		return accountId;
	}

	public void setAccountId(java.lang.String accountId) {
		this.accountId = accountId;
	}

	public java.lang.String getAccountAddress() {
		return accountAddress;
	}

	public void setAccountAddress(java.lang.String accountAddress) {
		this.accountAddress = accountAddress;
	}

	public java.lang.String getAccountTel() {
		return accountTel;
	}

	public void setAccountTel(java.lang.String accountTel) {
		this.accountTel = accountTel;
	}

	public java.lang.String getAccountBankName() {
		return accountBankName;
	}

	public void setAccountBankName(java.lang.String accountBankName) {
		this.accountBankName = accountBankName;
	}

	public java.lang.String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(java.lang.String accountNo) {
		this.accountNo = accountNo;
	}

	public java.lang.String getDescribe() {
		return describe;
	}

	public void setDescribe(java.lang.String describe) {
		this.describe = describe;
	}

	public java.lang.String getContacts() {
		return contacts;
	}

	public void setContacts(java.lang.String contacts) {
		this.contacts = contacts;
	}

	public java.lang.String getContactsAlias() {
		return contactsAlias;
	}

	public void setContactsAlias(java.lang.String contactsAlias) {
		this.contactsAlias = contactsAlias;
	}

	public java.lang.String getServiceRepresentative() {
		return serviceRepresentative;
	}

	public void setServiceRepresentative(java.lang.String serviceRepresentative) {
		this.serviceRepresentative = serviceRepresentative;
	}

	public java.lang.String getServiceRepresentativeAlias() {
		return serviceRepresentativeAlias;
	}

	public void setServiceRepresentativeAlias(
			java.lang.String serviceRepresentativeAlias) {
		this.serviceRepresentativeAlias = serviceRepresentativeAlias;
	}

	public java.lang.String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(java.lang.String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public java.lang.String getLegalPersonAlias() {
		return legalPersonAlias;
	}

	public void setLegalPersonAlias(java.lang.String legalPersonAlias) {
		this.legalPersonAlias = legalPersonAlias;
	}

	public java.lang.String getClClientCode() {
		return clClientCode;
	}

	public void setClClientCode(java.lang.String clClientCode) {
		this.clClientCode = clClientCode;
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
			return "单位信息表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "单位信息表";
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