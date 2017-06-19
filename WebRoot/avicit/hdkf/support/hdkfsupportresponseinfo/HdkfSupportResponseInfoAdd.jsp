<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/Add/null" -->
<title>添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" />
			<table class="form_commonTable">
				<tr>
					<th width="10%">处理单名称:</th>
					<td width="40%"><input title="请求处理ID"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="requestDealId" id="requestDealId" /><input
						title="处理单名称" class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" readonly="readonly" style="width: 180px;"
						type="text" name="dealNo" id="dealNo" onfocus="openDealByKfDialog();" /></td>
					<!-- <th width="10%">答复文号:</th>
					<td width="40%"><input title="答复文号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[30]'" style="width: 180px;"
						type="text" name="respNo" id="respNo" /></td> -->
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="hidden" name="requestId"
						id="requestId" /><input title="信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" readonly="readonly" style="width: 180px;"
						type="text" name="requestNo" id="requestNo" /></td>
				</tr>
				<tr>
					<th width="10%">答复名称:</th>
					<td colspan="3">
						<input title="答复名称" class="inputbox easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'" style="width: 100%;"
							type="text" name="respName" id="respName" />
					</td>
				</tr>
				<tr>
					<th width="10%">最终处理意见:</th>
					<td colspan="3">
						<div style="width: 99%">
							<textarea rows="5" title="最终处理意见" class="textareabox"
								data-options="validType:'maxLength[1000]'" name="finalDecision"
								id="finalDecision" style="height: 50px;" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<!-- <th width="10%">经办人姓名:</th>
					<td width="40%"><input title="经办人ID"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="respUserId" id="respUserId" /><input
						title="经办人姓名" class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" readonly="readonly" style="width: 180px;"
						type="text" name="respUserName" id="respUserName" /></td> -->
					<th width="10%">填写人</th>
					<td width="40%"><input title="填写人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="attribute01" id="attribute01" value="${userId}"/> <input
						title="填写人姓名" class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" readonly="readonly" style="width: 180px;"
						type="text" name="attribute02" id="attribute02" value="${CURRENT_LOGINUSER.name}"/></td>
				</tr>
				<%-- <tr>
					<th width="10%">答复时间:</th>
					<td width="40%"><input title="答复时间" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="actualTime" id="actualTime" /></td>
					<th width="10%">答复方式:</th>
					<td width="40%"><pt6:syslookup name="respBy"
							lookupCode="SUPPORT_RESPONSE_TYPE"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr> --%>
			</table>
			<input type="hidden" value="${id}" name="id" />
		</form>
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="${id}" />
			<jsp:param name="form_code" value="hdkfsupportoutfieldcard" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="60%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">保存并启动流程</a> <a title="返回"
						id="returnButton" class="easyui-linkbutton" onclick="closeForm();"
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
		function closeForm() {
			parent.hdkfSupportResponseInfo.closeDialog("#insert");
		}
		function saveForm() {

			if (!$('#form').form('validate')) {
				return;
			}
			if($("#finalDecision").val() == "")
			{
				alert("最终处理意见不能为空！");
			}else{
				parent.hdkfSupportResponseInfo.saveFormAndStartFlow(
						serializeObject($('#form')), "#insert");				
			}
			
			if ($("#respName").val().length>50) {
				alert("答复名称的长度不能超过50！");
				return;
			}
			if ($("#finalDecision").val().length>1000) {
				alert("最终处理意见的长度不能超过1000！");
				return;
			}
			
		}
		
		//打开客服部处理选择页面
		function openDealByKfDialog() {
			this.nData = new CommonDialog(
					"HdkfSupportDealByKfManage",
					"790",
					"600",
					"hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/HdkfSupportDealByKfSelect",
					"产品选择", false, true, false);
			this.nData.show();
		};
		function callBackDataRequest(data) {
			$("#HdkfSupportDealByKfManage").dialog("close");
			$("#requestDealId").val(data.id);
			$("#dealNo").val(data.dealName);
			/* $("#respUserId").val(data.dealUserId);
			$("#respUserName").val(data.dealUserName); */
			$("#requestId").val(data.requestId);
			$("#requestNo").val(data.requestNo);
		};
	</script>
</body>
</html>