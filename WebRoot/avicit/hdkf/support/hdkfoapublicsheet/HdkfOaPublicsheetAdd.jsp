<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
	java.util.Date currentTime = new java.util.Date();
	String time = simpleDateFormat.format(currentTime).toString();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/Add/null" -->
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

					<th width="10%"><span class="remind">*</span> 公用笺编号:</th>
					<td width="40%"><input title="公用笺编号"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="sheetno" id="sheetno" /></td>
					<th width="10%"><span class="remind">*</span> 发文单位:</th>
					<td width="40%"><input title="{param.field.comment}"
						class="inputbox" style="width: 180px;" type="hidden"
						name="sendDep" id="sendDep" />
						<div class="">
							<input class="easyui-validatebox" data-options="required:true"
								name="sendDepAlias" id="sendDepAlias" readOnly="readOnly"
								style="width: 179px;"></input>
						</div></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span> 发文日期:</th>
					<td width="40%"><input title="发文日期" class="easyui-datebox"
						data-options="required:true" editable="false"
						style="width: 182px;" type="text" name="sentdate" id="sentdate"
						value="<%=time%>" /></td>
					<th width="10%"><span class="remind">*</span> 分发单位:</th>
					<td width="40%"><input title="{param.field.comment}"
						class="inputbox" style="width: 180px;" type="hidden"
						name="receiveDep" id="receiveDep" />
						<div class="">
							<input class="easyui-validatebox" data-options="required:true"
								name="receiveDepAlias" id="receiveDepAlias" readOnly="readOnly"
								style="width: 179px;"></input>
						</div></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span> 机型:</th>
					<td width="40%"><input title="机型"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="planetype" id="planetype"
						onfocus="openDialog();" /></td>
					<th width="10%"><span class="remind">*</span> 批次:</th>
					<td width="40%"><input title="批次"
						class="easyui-numberbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="batchNo" id="batchNo" /></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span> 架次:</th>
					<td width="40%"><input title="架次"
						class="easyui-numberbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="sortieNo" id="sortieNo" />
					</td>
					<!-- 
																																								<th width="10%">
																					公用笺内容:</th>
							<td width="40%">
																								<input title="公用笺内容" class="inputbox easyui-validatebox" data-options="validType:'maxLength[2000]'" style="width: 180px;" type="text" name="sheetcontent" id="sheetcontent"/>
																						</td>
															</tr>
								<tr>
																																								<th width="10%">
																					发笺原因:</th>
							<td width="40%">
																								<input title="发笺原因" class="inputbox easyui-validatebox" data-options="validType:'maxLength[500]'" style="width: 180px;" type="text" name="sendreason" id="sendreason"/>
																						</td> -->
					<th width="10%"><span class="remind">*</span> 编写人:</th>
					<td width="40%"><input title="编写人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="recorder" id="recorder" readOnly="readOnly"
						value="${CURRENT_LOGINUSER.name}" /></td>
				</tr>

				<tr>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="attribute01" id="attribute01" /> <input
						title="信息处理卡编号" class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="attribute02" id="attribute02"
						onfocus="openRequestDialog();" /></td>

					<th width="10%">是否备件:</th>
					<td width="40%"><pt6:syslookup name="attribute03"
							lookupCode="PLATFORM_YES_NO_FLAG" isNull="true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>



				</tr>
				<!-- 
								<tr>
																																								<th width="10%">
																					校对人:</th>
							<td width="40%">
																								<input title="校对人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" 
																								style="width: 180px;" type="text" name="proofreader" id="proofreader" readOnly="readOnly"/>
																						</td>
																						<th width="10%">审核人:</th>
																						<td width="40%">
																					<input title="审核人" class="inputbox easyui-validatebox" 
																					data-options="validType:'maxLength[50]'" style="width: 180px;" 
																					type="text" name="reviewer" id="reviewer" readOnly="readOnly"/>
																						</td>
															</tr>
								<tr>
																																								<th width="10%">
																					审定人:</th>
							<td width="40%">
																								<input title="审定人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="approver" id="approver" readOnly="readOnly"/>
																						</td> -->

				<tr>
					<th width="10%"><span class="remind">*</span>公用笺原因:</th>
					<td colspan="3" align="left" style="padding-left: 3px"><textarea
							rows="4" data-options="required:true,validType:'maxLength[1000]'"
							class="textareabox" name="sendreason" id="sendreason"
							style="resize: none"></textarea></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span>公用笺内容:</th>
					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="12"
							data-options="required:true,validType:'maxLength[1000]'"
							class="textareabox" name="sheetcontent" id="sheetcontent"
							style="resize: none"></textarea></td>
				</tr>
				<tr>
					<th width="10%">备注:</th>
					<td colspan="3" align="left" style="padding-left: 3px"><textarea
							rows="4" data-options="required:true,validType:'maxLength[1000]'"
							class="textareabox" name="remarks" id="remarks"
							style="resize: none"></textarea></td>
				</tr>
				<tr>


				</tr>
			</table>
			<input type="hidden" value="${id}" name="id" id="id" />
		</form>
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
			<jsp:param name="file_size_limit" value="5000MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="${id}" />
			<jsp:param name="form_code" value="hdkfOaPublicsheet" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>

	</div>



	<div data-options="region:'south',border:false" style="height: 40px">
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

		$(function() {

			var sendDepDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "sendDep", "sendDepAlias");
			sendDepDeptCommonSelector.init();
			var receiveDepDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "receiveDep", "receiveDepAlias",
					"", "", "", -1);
			receiveDepDeptCommonSelector.init();
		});
		function closeForm() {
			parent.hdkfOaPublicsheet.closeDialog("#insert");
		}
		function saveForm() {

			if ($('#form').form('validate') == false) {
				return;
			}

			if ($("#sheetno").val() == '') {
				alert("请填写公用笺编号!");
				return;
			}

			if ($("#sendDepAlias").val() == '') {
				alert("请选择发文单位!");
				return;
			}

			if ($("#planetype").val() == '') {
				alert("请选择机型!");
				return;
			}

			if ($("#receiveDepAlias").val() == '') {
				alert("请选择分发单位!");
				return;
			}

			if ($("#sortieNo").val() == '') {
				alert("请填写架次!");
				return;
			}

			if ($("#batchNo").val() == '') {
				alert("请填写批次!");
				return;
			}
			if ($("#sendreason").val() == '') {
				alert("请填写公用笺原因!");
				return;
			}
			if ($("#sheetcontent").val() == '') {
				alert("请填写公用笺内容!");
				return;
			}

			if ($("#sendreason").val().length > 1000) {
				alert("公用笺原因的长度不能超过1000！");
				return;
			}
			if ($("#sheetcontent").val().length > 1000) {
				alert("公用笺内容的长度不能超过1000！");
				return;
			}
			if ($("#remarks").val().length > 1000) {
				alert("备注的长度不能超过1000！");
				return;
			}
			$('#saveButton').linkbutton('disable').unbind("click");
			parent.hdkfOaPublicsheet.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
		}

		function openDialog() {
			this.nData = new CommonDialog(
					"model1",
					"790",
					"600",
					"hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/HdkfBdAircraftinfoInfo",
					"机型名称选择", false, true, false);
			this.nData.show();
		}

		function callBackDataConpany(data) {
			$("#model1").dialog("close");
			$("#planetype").val(data.modelName);

		}
		function openRequestDialog() {
			this.nData = new CommonDialog(
					"model12",
					"850",
					"500",
					"hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/HdkfSupportRequestInfoSelect",
					"信息卡信息选择", false, true, false);
			this.nData.show();
		}

		function setSparePartTextAndChapter(data) {
			$("#model12").dialog("close");
			$("#attribute01").val(data.id);
			$("#attribute02").val(data.requestNo);

		}
	</script>
</body>
</html>