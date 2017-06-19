<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/Edit/id" -->
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
			<input type="hidden" name="id"
				value='${hdkfSupportOutfieldCardDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%"><span style="color: red;">*</span> 求援请求ID:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="requestId" id="requestId"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.requestId}'/>' />

					</td>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.requestNo}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">外场信息处理卡编号:</th>
					<td width="40%"><input title="外场信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[40]'" style="width: 180px;"
						type="text" name="infoCardNo" id="infoCardNo"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.infoCardNo}'/>' />
					</td>
					<th width="10%">处理单名称:</th>
					<td width="40%"><input title="处理单名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="dealName" id="dealName"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.dealName}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">客服部经办人:</th>
					<td width="40%"><input title="客服部经办人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="kfUserId" id="kfUserId"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.kfUserId}'/>' />
					</td>
					<th width="10%">求援单位:</th>
					<td width="40%"><input title="求援单位"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestUnit" id="requestUnit"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.requestUnit}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">批架次:</th>
					<td width="40%"><input title="批架次"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="batchNo" id="batchNo"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.batchNo}'/>' />
					</td>
					<th width="10%">机型:</th>
					<td width="40%"><input title="机型"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="modelId" id="modelId"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.modelId}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">生产单位:</th>
					<td width="40%"><input title="生产单位"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="productionUnit" id="productionUnit"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.productionUnit}'/>' />
					</td>
					<th width="10%">出厂时间:</th>
					<td width="40%"><input title="出厂时间" class="easyui-datebox"
						style="width: 182px;" type="text" name="factoryTime"
						id="factoryTime" value='${hdkfSupportOutfieldCardDTO.factoryTime}' />
					</td>
				</tr>
				<tr>
					<th width="10%">飞行小时:</th>
					<td width="40%"><input title="飞行小时"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="flightHours" id="flightHours"
						value='${hdkfSupportOutfieldCardDTO.flightHours}' /></td>
					<th width="10%">飞机起落:</th>
					<td width="40%"><input title="飞机起落"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="flightLanding" id="flightLanding"
						value='${hdkfSupportOutfieldCardDTO.flightLanding}' /></td>
				</tr>
				<tr>
					<th width="10%">求援方式:</th>
					<td width="40%"><input title="求援方式"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestMethod" id="requestMethod"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.requestMethod}'/>' />
					</td>
					<th width="10%">问题故障名称:</th>
					<td width="40%"><input title="问题故障名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="faultName" id="faultName"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.faultName}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">情况简介:</th>
					<td width="40%"><input title="情况简介"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="caseDesc" id="caseDesc"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.caseDesc}'/>' />
					</td>
					<th width="10%">建议或要求:</th>
					<td width="40%"><input title="建议或要求"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="advice" id="advice"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.advice}'/>' /></td>
				</tr>
				<tr>
					<th width="10%">承办部门:</th>
					<td width="40%"><input title="承办部门"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="dealDepartId" id="dealDepartId"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.dealDepartId}'/>' />
					</td>
					<th width="10%">承办单位处理人:</th>
					<td width="40%"><input title="承办单位处理人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="dealUserId" id="dealUserId"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.dealUserId}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">承办单位处理结论:</th>
					<td width="40%"><input title="承办单位处理结论"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[4000]'" style="width: 180px;"
						type="text" name="dealSolution" id="dealSolution"
						value='<c:out value='${hdkfSupportOutfieldCardDTO.dealSolution}'/>' />
					</td>
					<th width="10%">客服转发时间:</th>
					<td width="40%"><input title="客服转发时间" class="easyui-datebox"
						style="width: 182px;" type="text" name="kfForwardTime"
						id="kfForwardTime"
						value='${hdkfSupportOutfieldCardDTO.kfForwardTime}' /></td>
				</tr>
				<tr>
					<th width="10%">方案形成时间:</th>
					<td width="40%"><input title="方案形成时间" class="easyui-datebox"
						style="width: 182px;" type="text" name="doneTime" id="doneTime"
						value='${hdkfSupportOutfieldCardDTO.doneTime}' /></td>
					<th width="10%">方案送达客服部时间:</th>
					<td width="40%"><input title="方案送达客服部时间"
						class="easyui-datebox" style="width: 182px;" type="text"
						name="sendtoKfTime" id="sendtoKfTime"
						value='${hdkfSupportOutfieldCardDTO.sendtoKfTime}' /></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="60%" align="right"><a title="保存" id="saveButton"
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
		$(function() {
			if (!"${hdkfSupportOutfieldCardDTO.factoryTime}" == "") {
				$('#factoryTime').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportOutfieldCardDTO.factoryTime}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfSupportOutfieldCardDTO.kfForwardTime}" == "") {
				$('#kfForwardTime').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportOutfieldCardDTO.kfForwardTime}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfSupportOutfieldCardDTO.doneTime}" == "") {
				$('#doneTime').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportOutfieldCardDTO.doneTime}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfSupportOutfieldCardDTO.sendtoKfTime}" == "") {
				$('#sendtoKfTime').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportOutfieldCardDTO.sendtoKfTime}")
								.format("yyyy-MM-dd"));
			}
		})
		function closeForm() {
			parent.hdkfSupportOutfieldCard.closeDialog("#edit");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.hdkfSupportOutfieldCard.save(serializeObject($('#form')),
					"#edit");
		}
	</script>
</body>
</html>