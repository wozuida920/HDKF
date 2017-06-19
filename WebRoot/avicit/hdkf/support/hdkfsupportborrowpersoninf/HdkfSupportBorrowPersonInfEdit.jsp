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
<!-- ControllerPath = "hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/operation/Edit/id" -->
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
				value='${hdkfSupportBorrowPersonInfDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%">任务书ID:</th>
					<td width="40%"><input title="任务书ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="taskId" id="taskId"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.taskId}'/>'  onclick="openDialogTripTask()"/>
					</td>
					<th width="10%">任务书编号:</th>
					<td width="40%"><input title="任务书编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[30]'" style="width: 180px;"
						type="text" name="taskNo" id="taskNo"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.taskNo}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">借人单名称:</th>
					<td width="40%"><input title="借人单名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="borrowName" id="borrowName"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.borrowName}'/>' />
					</td>
					<th width="10%">借用人所在部门:</th>
					<td width="40%"><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="borrowDept" id="borrowDept"
						value='${hdkfSupportBorrowPersonInfDTO.borrowDept}' />
						<div class="">
							<input class="easyui-validatebox" name="borrowDeptAlias"
								id="borrowDeptAlias" readOnly="readOnly"
								value='<c:out  value='${hdkfSupportBorrowPersonInfDTO.borrowDeptAlias}'/>'
								style="width: 179px;"></input>
						</div></td>
				</tr>
				<tr>
					<th width="10%">借人数量:</th>
					<td width="40%"><input title="借人数量"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="borrowNumber" id="borrowNumber"
						value='${hdkfSupportBorrowPersonInfDTO.borrowNumber}' /></td>
					<th width="10%">地点:</th>
					<td width="40%"><input title="地点"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[80]'" style="width: 180px;"
						type="text" name="address" id="address"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.address}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">预计时间:</th>
					<td width="40%"><input title="预计时间" class="easyui-datebox"
						style="width: 182px;" type="text" name="estimateDate"
						id="estimateDate"
						value='${hdkfSupportBorrowPersonInfDTO.estimateDate}' /></td>
					<th width="10%">专业:</th>
					<td width="40%"><input title="专业"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[80]'" style="width: 180px;"
						type="text" name="major" id="major"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.major}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">客服部经办人:</th>
					<td width="40%"><input title="客服部经办人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="linkManKf" id="linkManKf"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.linkManKf}'/>' />
					</td>
					<th width="10%">客服部联系电话:</th>
					<td width="40%"><input title="客服部联系电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[20]'" style="width: 180px;"
						type="text" name="linkPhoneKf" id="linkPhoneKf"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.linkPhoneKf}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">借出部门经办人:</th>
					<td width="40%"><input title="借出部门经办人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[80]'" style="width: 180px;"
						type="text" name="linkManBorrowed" id="linkManBorrowed"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.linkManBorrowed}'/>' />
					</td>
					<th width="10%">借出部门经办人电话:</th>
					<td width="40%"><input title="借出部门经办人电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[20]'" style="width: 180px;"
						type="text" name="linkPhoneBorrowed" id="linkPhoneBorrowed"
						value='<c:out value='${hdkfSupportBorrowPersonInfDTO.linkPhoneBorrowed}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">任务及要求:</th>
					<td colspan="3" align="left" style="padding-left: 3px"><textarea
							rows="8"
							data-options="required:true,validType:'maxLength[2000]'"
							class="textareabox" name="taskDemand" id="taskDemand"
							style="resize: none"><c:out value='${hdkfSupportBorrowPersonInfDTO.taskDemand}'/></textarea></td>
				</tr>
			</table>
		</form>
		
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="${hdkfSupportBorrowPersonInfDTO.id}" />
			<jsp:param name="form_code" value="hdkfsupportborrowpersoninf" />
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
			if (!"${hdkfSupportBorrowPersonInfDTO.estimateDate}" == "") {
				$('#estimateDate')
						.datebox(
								'setValue',
								parserColumnTime(
										"${hdkfSupportBorrowPersonInfDTO.estimateDate}")
										.format("yyyy-MM-dd"));
			}
			var borrowDeptDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "borrowDept", "borrowDeptAlias");
			borrowDeptDeptCommonSelector.init();
		});
		function closeForm() {
			parent.hdkfSupportBorrowPersonInf.closeDialog("#edit");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.hdkfSupportBorrowPersonInf.save(serializeObject($('#form')),"#edit");
		}

		//打开任务书选择页面
		function openDialogTripTask() {
			this.nData = new CommonDialog("model4", "790", "600", "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportTripTaskSelect", "产品选择", false, true, false);
			this.nData.show();
		};
		function setTripTaskData(data) {
			$("#model4").dialog("close");

		    $("#taskId").val(data.id);
		    
		    $("#taskNo").val(data.taskNo);
		   

		};
	</script>
</body>
</html>