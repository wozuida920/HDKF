<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "platform6/msecure/mobiledevice/MobileDeviceController/operation/sub/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${mobileUseDeviceBindDTO.id}' /> <input type="hidden" name="deviceId" value='${mobileUseDeviceBindDTO.deviceId}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%">用户ID:</th>
					<td width="40%"><input title="{param.field.comment}" class="inputbox" style="width: 180px;" type="hidden" name="userId" id="userId" value='${mobileUseDeviceBindDTO.userId}' />
						<div class="">
							<input class="easyui-validatebox" name="userIdAlias" id="userIdAlias" value='<c:out  value='${mobileUseDeviceBindDTO.userIdAlias}'/>' readOnly="readOnly" style="width:179px;" required="true" />
						</div></td>
				</tr>
				<tr>
					<th width="10%">appId:</th>
					<td width="40%"><select class="easyui-combobox" name="appId" id="appId" data-options="panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
							<c:forEach var="item" items="${apps }">
								<option <c:if test="${mobileUseDeviceBindDTO.appId == item.id }">selected</c:if> value="${item.id }">${item.appName }</option>
							</c:forEach>
					</select></td>
					<th width="10%">状态：</th>
					<td width="40%"><select class="easyui-combobox" name="bindStatus" id="bindStatus" data-options="panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
							<option value="1" <c:if test="${mobileUseDeviceBindDTO.bindStatus == '1' }">selected</c:if>>正常</option>
							<option value="0" <c:if test="${mobileUseDeviceBindDTO.bindStatus == '0' }">selected</c:if>>禁用</option>
					</select></td>
				</tr>
			</table>
		</form>
		<div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="保存" id="saveButton" class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a> <a title="返回" id="returnButton" class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a></td>
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
			var userIdUserCommonSelector = new CommonSelector("user", "userSelectCommonDialog", "userId", "userIdAlias");
			userIdUserCommonSelector.init();
		})
		function closeForm() {
			parent.mobileUseDeviceBind.closeDialog("#edit");
		};
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.mobileUseDeviceBind.save(serializeObject($('#form')), "#edit");
		};
	</script>
</body>
</html>