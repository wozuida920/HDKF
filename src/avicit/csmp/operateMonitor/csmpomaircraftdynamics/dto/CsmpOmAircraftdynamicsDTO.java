package avicit.csmp.operateMonitor.csmpomaircraftdynamics.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;

/**
 * bean CsmpOmAircraftdynamics Title: 表CSMP_OM_AIRCRAFTDYNAMICS的PoJo类，也就是数据库映射类
 * Description: 飞机动态维护表 Copyriht: Copyright (c) 2012 Company: AVICIT Co., Ltd
 * 
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-07-02 14:39
 * 
 */
@PojoRemark(table = "csmp_om_aircraftdynamics", object = "CsmpOmAircraftdynamicsDTO", name = "飞机动态维护表")
public class CsmpOmAircraftdynamicsDTO extends BeanDTO {
	private static final long serialVersionUID = 1L;

	@Id
	@LogField
	@FieldRemark(column = "id", field = "id", name = "主键ID")
	private java.lang.String id;
	@LogField
	@FieldRemark(column = "aric_id", field = "aricId", name = "飞机ID")
	private java.lang.String aricId;
	@LogField
	@FieldRemark(column = "aric_num", field = "aricNum", name = "飞机编号")
	private java.lang.String aricNum;
	@LogField
	@FieldRemark(column = "aric_model", field = "aricModel", name = "机型")
	private java.lang.String aricModel;

	@FieldRemark(column = "custumer_id", field = "custumerId", name = "客户ID，管理客户表")
	private java.lang.String custumerId;

	@FieldRemark(column = "flight_hour", field = "flightHour", name = "飞行小时")
	private long flightHour;

	@FieldRemark(column = "flight_hour_dev", field = "flightHourDev", name = "飞行小时偏差")
	private long flightHourDev;

	@FieldRemark(column = "takeoff_land", field = "takeoffLand", name = "起落次数")
	private long takeoffLand;

	@FieldRemark(column = "takeoff_land_dev", field = "takeoffLandDev", name = "起落次数偏差")
	private long takeoffLandDev;

	@FieldRemark(column = "date_type", field = "dateType", name = "数据类型")
	private java.lang.String dateType;

	@FieldRemark(column = "flt_days", field = "fltDays", name = "飞行天数")
	private long fltDays;

	@FieldRemark(column = "engine_work_time", field = "engineWorkTime", name = "发动机工作时间")
	private long engineWorkTime;

	@FieldRemark(column = "apu_work_time", field = "apuWorkTime", name = "APU工作小时")
	private long apuWorkTime;

	@FieldRemark(column = "start_time", field = "startTime", name = "开始时间")
	private java.util.Date startTime;

	private java.util.Date startTimeBegin;

	private java.util.Date startTimeEnd;

	@FieldRemark(column = "end_time", field = "endTime", name = "结束时间")
	private java.util.Date endTime;

	private java.util.Date endTimeBegin;

	private java.util.Date endTimeEnd;

	@FieldRemark(column = "aircratf_status", field = "aircratfStatus", name = "飞机状态")
	private java.lang.String aircratfStatus;

	@FieldRemark(column = "grounded_reason", field = "groundedReason", name = "停飞原因")
	private java.lang.String groundedReason;

	@FieldRemark(column = "cut_off_time", field = "cutOffTime", name = "统计截止时间")
	private java.util.Date cutOffTime;

	private java.util.Date cutOffTimeBegin;

	private java.util.Date cutOffTimeEnd;

	@FieldRemark(column = "update_date", field = "updateDate", name = "更新时间")
	private java.util.Date updateDate;

	private java.util.Date updateDateBegin;

	private java.util.Date updateDateEnd;

	@FieldRemark(column = "update_by", field = "updateBy", name = "更新人")
	private java.lang.String updateBy;
	@LogField
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

	//用来显示机型的名字
	private java.lang.String modelName;
	
	//按飞机批架次来显示
	private java.lang.String ariNum;
	
	public java.lang.String getAriNum() {
		return ariNum;
	}
	public void setAriNum(java.lang.String ariNum) {
		this.ariNum = ariNum;
	}
	//用来客户的名字
	private java.lang.String custumerName;
	
	public java.lang.String getCustumerName() {
		return custumerName;
	}
	public void setCustumerName(java.lang.String custumerName) {
		this.custumerName = custumerName;
	}
	//用来显示总条数totl
	private long totl;
	public long getTotl() {
		return totl;
	}
	public void setTotl(long totl) {
		this.totl = totl;
	}
	//用来显示正常的飞机数量
	private double normalNo;

	public double getNormalNo() {
		return normalNo;
	}
	public void setNormalNo(double normalNo) {
		this.normalNo = normalNo;
	}
	//用来显示飞机的正常率
	private double baifenbi;
	public double getBaifenbi() {
		return baifenbi;
	}
	public void setBaifenbi(double baifenbi) {
		this.baifenbi = baifenbi;
	}
	//用来显示飞行总时间
	private java.lang.String  flightNum ;
	
	//用来显示飞行历史起落次数
		private java.lang.String numberOfFlight ;
		
	//用来显示飞行统计截止日期
	private java.lang.String  dateOut ;
		
	public java.lang.String getFlightNum() {
		return flightNum;
	}
	public void setFlightNum(java.lang.String flightNum) {
		this.flightNum = flightNum;
	}
	public java.lang.String getNumberOfFlight() {
		return numberOfFlight;
	}
	public void setNumberOfFlight(java.lang.String numberOfFlight) {
		this.numberOfFlight = numberOfFlight;
	}
	public java.lang.String getDateOut() {
		return dateOut;
	}
	public void setDateOut(java.lang.String dateOut) {
		this.dateOut = dateOut;
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

	public java.lang.String getAricId() {
		return aricId;
	}

	public void setAricId(java.lang.String aricId) {
		this.aricId = aricId;
	}

	public java.lang.String getAricNum() {
		return aricNum;
	}

	public void setAricNum(java.lang.String aricNum) {
		this.aricNum = aricNum;
	}

	public java.lang.String getAricModel() {
		return aricModel;
	}

	public void setAricModel(java.lang.String aricModel) {
		this.aricModel = aricModel;
	}

	public java.lang.String getCustumerId() {
		return custumerId;
	}

	public void setCustumerId(java.lang.String custumerId) {
		this.custumerId = custumerId;
	}

	public long getFlightHour() {
		return flightHour;
	}

	public void setFlightHour(long flightHour) {
		this.flightHour = flightHour;
	}

	public long getFlightHourDev() {
		return flightHourDev;
	}

	public void setFlightHourDev(long flightHourDev) {
		this.flightHourDev = flightHourDev;
	}

	public long getTakeoffLand() {
		return takeoffLand;
	}

	public void setTakeoffLand(long takeoffLand) {
		this.takeoffLand = takeoffLand;
	}

	public long getTakeoffLandDev() {
		return takeoffLandDev;
	}

	public void setTakeoffLandDev(long takeoffLandDev) {
		this.takeoffLandDev = takeoffLandDev;
	}

	public java.lang.String getDateType() {
		return dateType;
	}

	public void setDateType(java.lang.String dateType) {
		this.dateType = dateType;
	}

	public long getFltDays() {
		return fltDays;
	}

	public void setFltDays(long fltDays) {
		this.fltDays = fltDays;
	}

	public long getEngineWorkTime() {
		return engineWorkTime;
	}

	public void setEngineWorkTime(long engineWorkTime) {
		this.engineWorkTime = engineWorkTime;
	}

	public long getApuWorkTime() {
		return apuWorkTime;
	}

	public void setApuWorkTime(long apuWorkTime) {
		this.apuWorkTime = apuWorkTime;
	}

	public java.util.Date getStartTime() {
		return startTime;
	}

	public void setStartTime(java.util.Date startTime) {
		this.startTime = startTime;
	}

	public java.util.Date getStartTimeBegin() {
		return startTimeBegin;
	}

	public void setStartTimeBegin(java.util.Date startTimeBegin) {
		this.startTimeBegin = startTimeBegin;
	}

	public java.util.Date getStartTimeEnd() {
		return startTimeEnd;
	}

	public void setStartTimeEnd(java.util.Date startTimeEnd) {
		this.startTimeEnd = startTimeEnd;
	}

	public java.util.Date getEndTime() {
		return endTime;
	}

	public void setEndTime(java.util.Date endTime) {
		this.endTime = endTime;
	}

	public java.util.Date getEndTimeBegin() {
		return endTimeBegin;
	}

	public void setEndTimeBegin(java.util.Date endTimeBegin) {
		this.endTimeBegin = endTimeBegin;
	}

	public java.util.Date getEndTimeEnd() {
		return endTimeEnd;
	}

	public void setEndTimeEnd(java.util.Date endTimeEnd) {
		this.endTimeEnd = endTimeEnd;
	}

	public java.lang.String getAircratfStatus() {
		return aircratfStatus;
	}

	public void setAircratfStatus(java.lang.String aircratfStatus) {
		this.aircratfStatus = aircratfStatus;
	}

	public java.lang.String getGroundedReason() {
		return groundedReason;
	}

	public void setGroundedReason(java.lang.String groundedReason) {
		this.groundedReason = groundedReason;
	}

	public java.util.Date getCutOffTime() {
		return cutOffTime;
	}

	public void setCutOffTime(java.util.Date cutOffTime) {
		this.cutOffTime = cutOffTime;
	}

	public java.util.Date getCutOffTimeBegin() {
		return cutOffTimeBegin;
	}

	public void setCutOffTimeBegin(java.util.Date cutOffTimeBegin) {
		this.cutOffTimeBegin = cutOffTimeBegin;
	}

	public java.util.Date getCutOffTimeEnd() {
		return cutOffTimeEnd;
	}

	public void setCutOffTimeEnd(java.util.Date cutOffTimeEnd) {
		this.cutOffTimeEnd = cutOffTimeEnd;
	}

	public java.util.Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(java.util.Date updateDate) {
		this.updateDate = updateDate;
	}

	public java.util.Date getUpdateDateBegin() {
		return updateDateBegin;
	}

	public void setUpdateDateBegin(java.util.Date updateDateBegin) {
		this.updateDateBegin = updateDateBegin;
	}

	public java.util.Date getUpdateDateEnd() {
		return updateDateEnd;
	}

	public void setUpdateDateEnd(java.util.Date updateDateEnd) {
		this.updateDateEnd = updateDateEnd;
	}

	public java.lang.String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(java.lang.String updateBy) {
		this.updateBy = updateBy;
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
			return "飞机动态维护表";
		} else {
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if (super.logTitle == null || super.logTitle.equals("")) {
			return "飞机动态维护表";
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