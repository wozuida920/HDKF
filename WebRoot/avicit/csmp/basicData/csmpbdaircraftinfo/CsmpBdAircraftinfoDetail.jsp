<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false" style="overflow:hidden;padding-bottom:35px;">
		<form id='form'>
									<input type="hidden" name="id" value='${csmpBdAircraftinfoDTO.id}'/>
												<input type="hidden" name="id" value='${csmpBdAircraftinfoDTO.id}'/>
																																																																																																																																																																																																										<table width="100%" style="padding-top: 10px;">
		<tr>
																																<th align="right">
											<span style="color:red;">*</span>
										机型:</th>
					<td>
																		<input title="机型" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="modelId" id="modelId" readonly="readonly" value='${csmpBdAircraftinfoDTO.modelId}'/>
																</td>
																										<th align="right">
											<span style="color:red;">*</span>
										批架次:</th>
					<td>
																		<input title="批架次" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="batchNo" id="batchNo" readonly="readonly" value='${csmpBdAircraftinfoDTO.batchNo}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															子型号:</th>
					<td>
																		<input title="子型号" class="inputbox" style="width: 180px;" type="text" name="subType" id="subType" readonly="readonly" value='${csmpBdAircraftinfoDTO.subType}'/>
																</td>
																										<th align="right">
															设计单位:</th>
					<td>
																		<input title="设计单位" class="inputbox" style="width: 180px;" type="text" name="desigeBy" id="desigeBy" readonly="readonly" value='${csmpBdAircraftinfoDTO.desigeBy}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															生产单位:</th>
					<td>
																		<input title="生产单位" class="inputbox" style="width: 180px;" type="text" name="productBy" id="productBy" readonly="readonly" value='${csmpBdAircraftinfoDTO.productBy}'/>
																</td>
																										<th align="right">
											<span style="color:red;">*</span>
										合同号:</th>
					<td>
																		<input title="合同号" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="contractNo" id="contractNo" readonly="readonly" value='${csmpBdAircraftinfoDTO.contractNo}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
											<span style="color:red;">*</span>
										注册号:</th>
					<td>
																		<input title="注册号" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="registraterNo" id="registraterNo" readonly="readonly" value='${csmpBdAircraftinfoDTO.registraterNo}'/>
																</td>
																										<th align="right">
															注册日期:</th>
					<td>
																  		<input title="注册日期" class="easyui-datebox" style="width: 180px;" type="text" name="registraterDate" id="registraterDate" readonly="readonly" value='${csmpBdAircraftinfoDTO.registraterDate}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															交付日期:</th>
					<td>
																  		<input title="交付日期" class="easyui-datebox" style="width: 180px;" type="text" name="finishedDate" id="finishedDate" readonly="readonly" value='${csmpBdAircraftinfoDTO.finishedDate}'/>
																</td>
																										<th align="right">
															规定商保期(年):</th>
					<td>
																  		<input title="规定商保期(年)" class="easyui-numberbox" style="width: 180px;" type="text" name="businessPeriodYear" id="businessPeriodYear" readonly="readonly" value='${csmpBdAircraftinfoDTO.businessPeriodYear}'/>	
																</td>
											</tr>
						<tr>
																										<th align="right">
															规定商报期(小时):</th>
					<td>
																  		<input title="规定商报期(小时)" class="easyui-numberbox" style="width: 180px;" type="text" name="businessPeriodHour" id="businessPeriodHour" readonly="readonly" value='${csmpBdAircraftinfoDTO.businessPeriodHour}'/>	
																</td>
																										<th align="right">
															是否商报期内:</th>
					<td>
																		<input title="是否商报期内" class="inputbox" style="width: 180px;" type="text" name="isBusinessPeriod" id="isBusinessPeriod" readonly="readonly" value='${csmpBdAircraftinfoDTO.isBusinessPeriod}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															开始运营日期:</th>
					<td>
																  		<input title="开始运营日期" class="easyui-datebox" style="width: 180px;" type="text" name="startOperateDate" id="startOperateDate" readonly="readonly" value='${csmpBdAircraftinfoDTO.startOperateDate}'/>
																</td>
																										<th align="right">
											<span style="color:red;">*</span>
										运营状态:</th>
					<td>
																		<input title="运营状态" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="operateStatus" id="operateStatus" readonly="readonly" value='${csmpBdAircraftinfoDTO.operateStatus}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															一发:</th>
					<td>
																		<input title="一发" class="inputbox" style="width: 180px;" type="text" name="engine1" id="engine1" readonly="readonly" value='${csmpBdAircraftinfoDTO.engine1}'/>
																</td>
																										<th align="right">
															二发:</th>
					<td>
																		<input title="二发" class="inputbox" style="width: 180px;" type="text" name="engine2" id="engine2" readonly="readonly" value='${csmpBdAircraftinfoDTO.engine2}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															飞行架次数:</th>
					<td>
																  		<input title="飞行架次数" class="easyui-numberbox" style="width: 180px;" type="text" name="numberOfFlight" id="numberOfFlight" readonly="readonly" value='${csmpBdAircraftinfoDTO.numberOfFlight}'/>	
																</td>
																										<th align="right">
															总飞行时间:</th>
					<td>
																  		<input title="总飞行时间" class="easyui-numberbox" style="width: 180px;" type="text" name="flightNum" id="flightNum" readonly="readonly" value='${csmpBdAircraftinfoDTO.flightNum}'/>	
																</td>
											</tr>
						<tr>
																										<th align="right">
															总起落架次:</th>
					<td>
																  		<input title="总起落架次" class="easyui-numberbox" style="width: 180px;" type="text" name="takeoffLandingNum" id="takeoffLandingNum" readonly="readonly" value='${csmpBdAircraftinfoDTO.takeoffLandingNum}'/>	
																</td>
																										<th align="right">
											<span style="color:red;">*</span>
										客户名称:</th>
					<td>
																		<input title="客户名称" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="custumerName" id="custumerName" readonly="readonly" value='${csmpBdAircraftinfoDTO.custumerName}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
											<span style="color:red;">*</span>
										运营商:</th>
					<td>
																		<input title="运营商" class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text" name="operator" id="operator" readonly="readonly" value='${csmpBdAircraftinfoDTO.operator}'/>
																</td>
																										<th align="right">
															备注:</th>
					<td>
																		<input title="备注" class="inputbox" style="width: 180px;" type="text" name="remark" id="remark" readonly="readonly" value='${csmpBdAircraftinfoDTO.remark}'/>
																</td>
											</tr>
						<tr>
																																																																																																										<th align="right">
															单位ID:</th>
					<td>
																		<input title="单位ID" class="inputbox" style="width: 180px;" type="text" name="companyId" id="companyId" readonly="readonly" value='${csmpBdAircraftinfoDTO.companyId}'/>
																</td>
																</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
																																																			if(!"${csmpBdAircraftinfoDTO.registraterDate}"==""){
					$('#registraterDate').datebox('setValue', parserColumnTime("${csmpBdAircraftinfoDTO.registraterDate}").format("yyyy-MM-dd"));
				}
												if(!"${csmpBdAircraftinfoDTO.finishedDate}"==""){
					$('#finishedDate').datebox('setValue', parserColumnTime("${csmpBdAircraftinfoDTO.finishedDate}").format("yyyy-MM-dd"));
				}
																											if(!"${csmpBdAircraftinfoDTO.startOperateDate}"==""){
					$('#startOperateDate').datebox('setValue', parserColumnTime("${csmpBdAircraftinfoDTO.startOperateDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																										});
	</script>
</body>
</html>