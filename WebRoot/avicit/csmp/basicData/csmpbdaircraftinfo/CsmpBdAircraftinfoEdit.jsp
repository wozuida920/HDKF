<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<div style="width: 100%; height: 100%;">
				<input type="hidden" name="id" value='${csmpBdAircraftinfoDTO.id}' />
				<table class="form_commonTable">
					<tr>
						<th width="15%"><span class="remind">*</span> 机型:</th>
						<td width="35%"><input title="机型" class="easyui-validatebox"
							type="hidden"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="modelId" id="modelId"
							value='<c:out value='${csmpBdAircraftinfoDTO.modelId}'/>' />
							 <input
							title="机型" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="modelIdAlias"
							id="modelIdAlias"
							value='<c:out value='${csmpBdAircraftinfoDTO.modelIdAlias}'/>' />

						</td>
						<th width="15%"><span class="remind">*</span> 批架次:</th>
						<td width="35%"><input title="批架次" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="batchNo" id="batchNo"
							value='<c:out value='${csmpBdAircraftinfoDTO.batchNo}'/>' /></td>
					</tr>
					<tr>
						<th width="15%">子型号:</th>
						<td width="35%"><input title="子型号"
							class="inputbox easyui-validatebox"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="subType" id="subType"
							value='<c:out value='${csmpBdAircraftinfoDTO.subType}'/>' /></td>
						<th width="15%">设计单位:</th>
						<td width="35%"><input title="设计单位"
							class="inputbox easyui-validatebox"
							data-options="validType:'maxLength[50]'" style="width: 180px;"
							type="text" name="desigeBy" id="desigeBy"
							value='<c:out value='${csmpBdAircraftinfoDTO.desigeBy}'/>' /></td>
					</tr>
					<tr>
						<th width="15%">生产单位:</th>
						<td width="35%"><input title="生产单位"
							class="inputbox easyui-validatebox"
							data-options="validType:'maxLength[50]'" style="width: 180px;"
							type="text" name="productBy" id="productBy"
							value='<c:out value='${csmpBdAircraftinfoDTO.productBy}'/>' /></td>
						<th width="15%"><span class="remind">*</span> 合同号:</th>
						<td width="35%"><input title="合同号" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="contractNo"
							id="contractNo"
							value='<c:out value='${csmpBdAircraftinfoDTO.contractNo}'/>' /></td>
					</tr>
					<tr>
						<th width="15%"><span class="remind">*</span> 注册号:</th>
						<td width="35%"><input title="注册号" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="registraterNo"
							id="registraterNo"
							value='<c:out value='${csmpBdAircraftinfoDTO.registraterNo}'/>' />
						</td>
						<th width="15%">注册日期:</th>
						<td width="35%"><input title="注册日期" class="easyui-datebox" editable="false"
							style="width: 182px;" type="text" editable="false" data-options="required:true" name="registraterDate"
							id="registraterDate"
							value='${csmpBdAircraftinfoDTO.registraterDate}' /></td>
					</tr>
					<tr>
						<th width="15%"><span class="remind">*</span>交付日期:</th>
						<td width="35%"><input title="交付日期" class="easyui-datebox" editable="false" data-options="required:true"
							style="width: 182px;" type="text" name="finishedDate"
							id="finishedDate" value='${csmpBdAircraftinfoDTO.finishedDate}' />
						</td>
						<th width="15%">是否商报期内:</th>
						<td width="35%"><pt6:syslookup name="isBusinessPeriod"
								lookupCode="CSMP_BD_ISPERIOD"
								defaultValue='${csmpBdAircraftinfoDTO.isBusinessPeriod}'
								dataOptions="width:180,editable:false,onShowPanel:comboboxOnShowPanel,panelHeight:'auto'">
							</pt6:syslookup></td>
						<%-- <th width="10%">规定商保期(年):</th>
					<td width="40%"><input title="规定商保期(年)"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="businessPeriodYear" id="businessPeriodYear"
						value='${csmpBdAircraftinfoDTO.businessPeriodYear}' /></td> --%>
					</tr>
					<%-- 	<tr>
					<th width="10%">规定商报期(小时):</th>
					<td width="40%"><input title="规定商报期(小时)"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="businessPeriodHour" id="businessPeriodHour"
						value='${csmpBdAircraftinfoDTO.businessPeriodHour}' /></td>
					
				</tr> --%>
					<tr>
						<th width="15%"><span class="remind">*</span>开始运营日期:</th>
						<td width="35%"><input title="开始运营日期" class="easyui-datebox" editable="false"
							style="width: 182px;" type="text" name="startOperateDate"  data-options="required:true"
							id="startOperateDate"
							value='${csmpBdAircraftinfoDTO.startOperateDate}' /></td>
						<th width="10%"><span class="remind">*</span> 运营状态:</th>
						<td width="40%">
						
	<%-- 					<pt6:syslookup name="operateStatus"
								lookupCode="CSMP_BD_OPERATIONSTATUS"
								defaultValue='${csmpBdAircraftinfoDTO.operateStatus}'
								dataOptions="width:180,editable:false,panelHeight:'auto'">
							</pt6:syslookup> --%>
						<select id="operateStatus" name="operateStatus" class="easyui-combobox"  
						data-options="fit:true, editable:false,onShowPanel:comboboxOnShowPanel, panelHeight:'auto'">
							<c:forEach items="${type }" var="age">
								<option value="${age.lookupCode }" <c:if test='${age.lookupCode==csmpBdAircraftinfoDTO.operateStatus }'>selected='selected'</c:if> >${age.lookupName}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<th width="15%">一发:</th>
						<td width="35%"><input title="一发"
							class="inputbox easyui-validatebox"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="engine1" id="engine1"
							value='<c:out value='${csmpBdAircraftinfoDTO.engine1}'/>' /></td>
						<th width="15%">二发:</th>
						<td width="35%"><input title="二发"
							class="inputbox easyui-validatebox"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="engine2" id="engine2"
							value='<c:out value='${csmpBdAircraftinfoDTO.engine2}'/>' /></td>
					</tr>
					<tr>
						
							<th width="15%">飞行总次数:</th>
							<td width="35%"><input title="飞行总数" class="easyui-numberbox easyui-validatebox"
							 data-options="validType:'maxLength[22]'" style="width: 180px;" type="text" 
							 name="takeoffLandingNum" id="takeoffLandingNum" value='${csmpBdAircraftinfoDTO.takeoffLandingNum}' /></td>
							
						<th width="15%">总飞行时间:</th>
						<td width="35%"><input title="总飞行时间"
							class="easyui-numberbox easyui-validatebox"
							data-options="validType:'maxLength[22]'" style="width: 180px;"
							type="text" name="flightNum" id="flightNum"
							value='${csmpBdAircraftinfoDTO.flightNum}' /></td>
					</tr>
								<%-- <th width="15%">飞行总天数:</th>
								<td width="35%"><input title="飞行总天数" class="easyui-numberbox easyui-validatebox"
								 data-options="validType:'maxLength[22]'" style="width: 180px;" type="text" 
								 name="totalFlightDays" id="totalFlightDays" value='${csmpBdAircraftinfoDTO.totalFlightDays}' /></td> --%>
								
							<%-- <th width="15%">统计截止日期:</th>
							<td width="35%">
							<input title="统计截止日期"
							class="easyui-datebox" 
								data-options="validType:'maxLength[22]'" style="width: 180px;" editable="false"
								type="text" name="statisticalDate" id="statisticalDate"
								value='${csmpBdAircraftinfoDTO.statisticalDate}' /></td>
						</tr> --%>
				
						<%-- <th width="10%">总起落架次:</th>
					<td width="40%"><input title="总起落架次"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="takeoffLandingNum" id="takeoffLandingNum"
						value='${csmpBdAircraftinfoDTO.takeoffLandingNum}' /></td> --%>
						<th width="15%">客户名称:</th>
						<td width="35%">
							<%-- <input title="客户名称" class="easyui-validatebox"
						data-options="validType:'maxLength[200]'"
						style="width: 180px;" type="text" name="custumerName"
						id="custumerName"
						value='<c:out value='${csmpBdAircraftinfoDTO.custumerName}'/>' /> --%>
							<input title="客户名称" class="easyui-combobox" editable="false"
							data-options="valueField:'id',textField:'companyName'"
							id="custumerName" name="custumerName" style="width: 180px;"
							type="text"
							value='<c:out value='${csmpBdAircraftinfoDTO.custumerName}'/>' />
						</td>
						<th width="15%">运营商:</th>
						<td width="35%"><input title="运营商" class="easyui-validatebox"
							data-options="validType:'maxLength[32]'" style="width: 180px;" panelHeight="auto"
							type="text" name="operator" id="operator"
							value='<c:out value='${csmpBdAircraftinfoDTO.operator}'/>' /></td>

						
<!-- 						<th width="15%"><span class="remind">*</span>大修/出厂时间:</th> -->
<!-- 						<td width="35%"><input title="大修/出厂时间" class="easyui-datebox" editable="false" -->
<!-- 							style="width: 182px;" type="text" name="DELIVER_OVERHAUL_TIME"  data-options="required:true" -->
<!-- 							id="DELIVER_OVERHAUL_TIME" -->
<%-- 							value='${csmpBdAircraftinfoDTO.DELIVER_OVERHAUL_TIME}' /></td> --%>

					</tr>
					<tr>

						<th width="15%">备注:</th>
						<td width="35%" colspan="3">
							<%-- <input title="备注"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="remark" id="remark"
						value='<c:out value='${csmpBdAircraftinfoDTO.remark}'/>' /> --%> <textarea
								rows="3" class="textareabox" name="remark" id="remark">${csmpBdAircraftinfoDTO.remark}</textarea>
						</td>
					</tr>
					<%-- <tr>
					<th width="10%">单位ID:</th>
					<td width="40%"><input title="单位ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="companyId" id="companyId"
						value='<c:out value='${csmpBdAircraftinfoDTO.companyId}'/>' /></td>
				</tr> --%>
				</table>
			</div>
		</form>
		
	</div>
		<div data-options="region:'south',border:false" style="height: 40px">
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">保存</a> <a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	
	</div>
	<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});

		//打开选择机型页面
		function openDialog() {
			this.nData = new CommonDialog(
					"model",
					"790",
					"500",
					"csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/toShowAricarfmodel",
					"添加", false, true, false);
			this.nData.show();
		}

		function callBackData(data) {
			$("#model").dialog("close");
			$("#modelId").val(data.id);
			$("#modelIdAlias").val(data.modelNum);

		}

		$(function() {
			var companyId = '${comId}';//该地方传的是公司的id
					$.ajax({
						url : 'platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getLitCompanyinfo',
						data : {
							id : companyId
						},
						dataType : 'json',
						type : 'post',
						success : function(r) {
							$('#custumerName').combobox('loadData', r).combobox('select','${csmpBdAircraftinfoDTO.companyId}');
						}
					});
			if (!"${csmpBdAircraftinfoDTO.registraterDate}" == "") {
				$('#registraterDate').datebox(
						'setValue',
						parserColumnTime(
								"${csmpBdAircraftinfoDTO.registraterDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${csmpBdAircraftinfoDTO.finishedDate}" == "") {
				$('#finishedDate').datebox(
						'setValue',
						parserColumnTime(
								"${csmpBdAircraftinfoDTO.finishedDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${csmpBdAircraftinfoDTO.startOperateDate}" == "") {
				$('#startOperateDate').datebox(
						'setValue',
						parserColumnTime(
								"${csmpBdAircraftinfoDTO.startOperateDate}")
								.format("yyyy-MM-dd"));
			}
		})
		function closeForm() {
			parent.csmpBdAircraftinfo.closeDialog("#edit");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.csmpBdAircraftinfo
					.save(serializeObject($('#form')), "#edit");
		}
	</script>
</body>
</html>