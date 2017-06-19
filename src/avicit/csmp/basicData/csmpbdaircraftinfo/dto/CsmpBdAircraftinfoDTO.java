package avicit.csmp.basicData.csmpbdaircraftinfo.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpBdAircraftinfo Title: 表CSMP_BD_AIRCRAFTINFO的PoJo类，也就是数据库映射类
 * Description: 飞机信息表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-06-14 16:56
 * 
 */
@PojoRemark(table = "csmp_bd_aircraftinfo", object = "CsmpBdAircraftinfoDTO", name = "飞机信息表")
public class CsmpBdAircraftinfoDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "model_id", field = "modelId", name = "机型")
	private java.lang.String modelId;
	private java.lang.String modelIdAlias;//飞机的名字
	

	public java.lang.String getModelIdAlias() {
		return modelIdAlias;
	}

	public void setModelIdAlias(java.lang.String modelIdAlias) {
		this.modelIdAlias = modelIdAlias;
	}

	@LogField
	@FieldRemark(column = "batch_no", field = "batchNo", name = "批架次")
	private java.lang.String batchNo;

	@FieldRemark(column = "sub_type", field = "subType", name = "子型号")
	private java.lang.String subType;

	@FieldRemark(column = "desige_by", field = "desigeBy", name = "设计单位")
	private java.lang.String desigeBy;

	@FieldRemark(column = "product_by", field = "productBy", name = "生产单位")
	private java.lang.String productBy;
	@LogField
	@FieldRemark(column = "contract_no", field = "contractNo", name = "合同号")
	private java.lang.String contractNo;
	@LogField
	@FieldRemark(column = "registrater_no", field = "registraterNo", name = "注册号")
	private java.lang.String registraterNo;

	@FieldRemark(column = "registrater_date", field = "registraterDate", name = "注册日期")
	private java.util.Date registraterDate;

	private java.util.Date registraterDateBegin;

	private java.util.Date registraterDateEnd;

	@FieldRemark(column = "finished_date", field = "finishedDate", name = "交付日期")
	private java.util.Date finishedDate;

	private java.util.Date finishedDateBegin;

	private java.util.Date finishedDateEnd;

	@FieldRemark(column = "business_period_year", field = "businessPeriodYear", name = "规定商保期(年)")
	private long businessPeriodYear;

	@FieldRemark(column = "business_period_hour", field = "businessPeriodHour", name = "规定商报期(小时)")
	private long businessPeriodHour;

	@FieldRemark(column = "is_business_period", field = "isBusinessPeriod", name = "是否商报期内")
	private java.lang.String isBusinessPeriod;

	@FieldRemark(column = "start_operate_date", field = "startOperateDate", name = "开始运营日期")
	private java.util.Date startOperateDate;

	private java.util.Date startOperateDateBegin;

	private java.util.Date startOperateDateEnd;
	@LogField
	@FieldRemark(column = "operate_status", field = "operateStatus", name = "运营状态")
	private java.lang.String operateStatus;

	@FieldRemark(column = "engine1", field = "engine1", name = "一发")
	private java.lang.String engine1;

	@FieldRemark(column = "engine2", field = "engine2", name = "二发")
	private java.lang.String engine2;

	@FieldRemark(column = "number_of_flight", field = "numberOfFlight", name = "飞行架次数")
	private long numberOfFlight;

	@FieldRemark(column = "flight_num", field = "flightNum", name = "总飞行时间")
	private double flightNum;

	public double getFlightNum() {
		return flightNum;
	}

	public void setFlightNum(double flightNum) {
		this.flightNum = flightNum;
	}

	@FieldRemark(column = "takeoff_landing_num", field = "takeoffLandingNum", name = "总起落架次")
	private double takeoffLandingNum;
	@LogField
	@FieldRemark(column = "custumer_name", field = "custumerName", name = "客户名称")
	private java.lang.String custumerName;
	public double getTakeoffLandingNum() {
		return takeoffLandingNum;
	}

	public void setTakeoffLandingNum(double takeoffLandingNum) {
		this.takeoffLandingNum = takeoffLandingNum;
	}

	@LogField
	@FieldRemark(column = "operator", field = "operator", name = "运营商")
	private java.lang.String operator;

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

	@FieldRemark(column = "company_id", field = "companyId", name = "单位ID")
	private java.lang.String companyId;
	
	@FieldRemark(column = "total_flight_days", field = "totalFlightDays", name = "飞行总天数")
	private  double totalFlightDays ;
	
	@FieldRemark(column = "statistical_date", field = "statisticalDate", name = "统计截止日期")
	private java.util.Date statisticalDate;
	
	@FieldRemark(column = "statistical_person", field = "statisticalPerson", name = "统计人")
	private java.lang.String statisticalPerson ;

	
	
	public double getTotalFlightDays() {
		return totalFlightDays;
	}

	public void setTotalFlightDays(double totalFlightDays) {
		this.totalFlightDays = totalFlightDays;
	}

	public double getAvgNum() {
		return avgNum;
	}

	public void setAvgNum(double avgNum) {
		this.avgNum = avgNum;
	}

	public double getAvgHoures() {
		return avgHoures;
	}

	public void setAvgHoures(double avgHoures) {
		this.avgHoures = avgHoures;
	}

	public  double  avgNum;//平均起落次数
	private double  avgHoures;//平均飞行小时

	private  long faultNum;//该字段用来显示故障次数
	public long getFaultNum() {
		return faultNum;
	}
	public void setFaultNum(long faultNum) {
		this.faultNum = faultNum;
	}

	public java.util.Date getStatisticalDate() {
		return statisticalDate;
	}

	public void setStatisticalDate(java.util.Date statisticalDate) {
		this.statisticalDate = statisticalDate;
	}

	public java.lang.String getStatisticalPerson() {
		return statisticalPerson;
	}

	public void setStatisticalPerson(java.lang.String statisticalPerson) {
		this.statisticalPerson = statisticalPerson;
	}

	public java.lang.String getId() {
		return id;
	}

	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getModelId() {
		return modelId;
	}

	public void setModelId(java.lang.String modelId) {
		this.modelId = modelId;
	}

	public java.lang.String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(java.lang.String batchNo) {
		this.batchNo = batchNo;
	}

	public java.lang.String getSubType() {
		return subType;
	}

	public void setSubType(java.lang.String subType) {
		this.subType = subType;
	}

	public java.lang.String getDesigeBy() {
		return desigeBy;
	}

	public void setDesigeBy(java.lang.String desigeBy) {
		this.desigeBy = desigeBy;
	}

	public java.lang.String getProductBy() {
		return productBy;
	}

	public void setProductBy(java.lang.String productBy) {
		this.productBy = productBy;
	}

	public java.lang.String getContractNo() {
		return contractNo;
	}

	public void setContractNo(java.lang.String contractNo) {
		this.contractNo = contractNo;
	}

	public java.lang.String getRegistraterNo() {
		return registraterNo;
	}

	public void setRegistraterNo(java.lang.String registraterNo) {
		this.registraterNo = registraterNo;
	}

	public java.util.Date getRegistraterDate() {
		return registraterDate;
	}

	public void setRegistraterDate(java.util.Date registraterDate) {
		this.registraterDate = registraterDate;
	}

	public java.util.Date getRegistraterDateBegin() {
		return registraterDateBegin;
	}

	public void setRegistraterDateBegin(java.util.Date registraterDateBegin) {
		this.registraterDateBegin = registraterDateBegin;
	}

	public java.util.Date getRegistraterDateEnd() {
		return registraterDateEnd;
	}

	public void setRegistraterDateEnd(java.util.Date registraterDateEnd) {
		this.registraterDateEnd = registraterDateEnd;
	}

	public java.util.Date getFinishedDate() {
		return finishedDate;
	}

	public void setFinishedDate(java.util.Date finishedDate) {
		this.finishedDate = finishedDate;
	}

	public java.util.Date getFinishedDateBegin() {
		return finishedDateBegin;
	}

	public void setFinishedDateBegin(java.util.Date finishedDateBegin) {
		this.finishedDateBegin = finishedDateBegin;
	}

	public java.util.Date getFinishedDateEnd() {
		return finishedDateEnd;
	}

	public void setFinishedDateEnd(java.util.Date finishedDateEnd) {
		this.finishedDateEnd = finishedDateEnd;
	}

	public long getBusinessPeriodYear() {
		return businessPeriodYear;
	}

	public void setBusinessPeriodYear(long businessPeriodYear) {
		this.businessPeriodYear = businessPeriodYear;
	}

	public long getBusinessPeriodHour() {
		return businessPeriodHour;
	}

	public void setBusinessPeriodHour(long businessPeriodHour) {
		this.businessPeriodHour = businessPeriodHour;
	}

	public java.lang.String getIsBusinessPeriod() {
		return isBusinessPeriod;
	}

	public void setIsBusinessPeriod(java.lang.String isBusinessPeriod) {
		this.isBusinessPeriod = isBusinessPeriod;
	}

	public java.util.Date getStartOperateDate() {
		return startOperateDate;
	}

	public void setStartOperateDate(java.util.Date startOperateDate) {
		this.startOperateDate = startOperateDate;
	}

	public java.util.Date getStartOperateDateBegin() {
		return startOperateDateBegin;
	}

	public void setStartOperateDateBegin(java.util.Date startOperateDateBegin) {
		this.startOperateDateBegin = startOperateDateBegin;
	}

	public java.util.Date getStartOperateDateEnd() {
		return startOperateDateEnd;
	}

	public void setStartOperateDateEnd(java.util.Date startOperateDateEnd) {
		this.startOperateDateEnd = startOperateDateEnd;
	}

	public java.lang.String getOperateStatus() {
		return operateStatus;
	}

	public void setOperateStatus(java.lang.String operateStatus) {
		this.operateStatus = operateStatus;
	}

	public java.lang.String getEngine1() {
		return engine1;
	}

	public void setEngine1(java.lang.String engine1) {
		this.engine1 = engine1;
	}

	public java.lang.String getEngine2() {
		return engine2;
	}

	public void setEngine2(java.lang.String engine2) {
		this.engine2 = engine2;
	}

	public long getNumberOfFlight() {
		return numberOfFlight;
	}

	public void setNumberOfFlight(long numberOfFlight) {
		this.numberOfFlight = numberOfFlight;
	}






	public java.lang.String getCustumerName() {
		return custumerName;
	}

	public void setCustumerName(java.lang.String custumerName) {
		this.custumerName = custumerName;
	}

	public java.lang.String getOperator() {
		return operator;
	}

	public void setOperator(java.lang.String operator) {
		this.operator = operator;
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

	public java.lang.String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(java.lang.String companyId) {
		this.companyId = companyId;
	}

	public String getLogFormName() {
		if (super.logFormName == null || super.logFormName.equals("")) {
			return "飞机信息表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "飞机信息表";
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