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
<!-- ControllerPath = "hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/Edit/id" -->
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
				value='${hdkfSupportResponseInfoDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%">请求处理ID:</th>
					<td width="40%"><input title="请求处理ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestDealId" id="requestDealId"
						value='<c:out value='${hdkfSupportResponseInfoDTO.requestDealId}'/>' />
					</td>
					<th width="10%">处理信息编号:</th>
					<td width="40%"><input title="处理信息编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="dealNo" id="dealNo"
						value='<c:out value='${hdkfSupportResponseInfoDTO.dealNo}'/>' /></td>
				</tr>
				<tr>
					<th width="10%">答复名称:</th>
					<td width="40%"><input title="答复名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="respName" id="respName"
						value='<c:out value='${hdkfSupportResponseInfoDTO.respName}'/>' />
					</td>
					<th width="10%">最终处理意见:</th>
					<td width="40%"><input title="最终处理意见"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[2000]'" style="width: 180px;"
						type="text" name="finalDecision" id="finalDecision"
						value='<c:out value='${hdkfSupportResponseInfoDTO.finalDecision}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">经办人ID:</th>
					<td width="40%"><input title="经办人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="respUserId" id="respUserId"
						value='<c:out value='${hdkfSupportResponseInfoDTO.respUserId}'/>' />
					</td>
					<th width="10%">经办人姓名:</th>
					<td width="40%"><input title="经办人姓名"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="respUserName" id="respUserName"
						value='<c:out value='${hdkfSupportResponseInfoDTO.respUserName}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">答复时间:</th>
					<td width="40%"><input title="答复时间" class="easyui-datebox"
						style="width: 182px;" type="text" name="actualTime"
						id="actualTime" value='${hdkfSupportResponseInfoDTO.actualTime}' />
					</td>
					<th width="10%">答复方式:</th>
					<td width="40%"><pt6:syslookup name="respBy"
							lookupCode="SUPPORT_RESPONSE_TYPE"
							defaultValue='${hdkfSupportResponseInfoDTO.respBy}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					<th width="10%">答复文号:</th>
					<td width="40%"><input title="答复文号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[30]'" style="width: 180px;"
						type="text" name="respNo" id="respNo"
						value='<c:out value='${hdkfSupportResponseInfoDTO.respNo}'/>' /></td>
					<th width="10%"><span style="color: red;">*</span> 求援请求ID:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="requestId" id="requestId"
						value='<c:out value='${hdkfSupportResponseInfoDTO.requestId}'/>' />

					</td>
				</tr>
				<tr>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo"
						value='<c:out value='${hdkfSupportResponseInfoDTO.requestNo}'/>' />
					</td>
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
			if (!"${hdkfSupportResponseInfoDTO.actualTime}" == "") {
				$('#actualTime').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportResponseInfoDTO.actualTime}")
								.format("yyyy-MM-dd"));
			}
		})
		function closeForm() {
			parent.hdkfSupportResponseInfo.closeDialog("#edit");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.hdkfSupportResponseInfo.save(serializeObject($('#form')),
					"#edit");
		}
	</script>
</body>
</html>