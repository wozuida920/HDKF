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
<!-- ControllerPath = "hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/Add/null" -->
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
					<th width="10%"><span class="remind">*</span> 信息处理卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px; display: none;" type="text" name="requestId"
						id="requestId" /> <input title="信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						readonly="readonly" style="width: 180px;" type="text"
						name="requestNo" id="requestNo" onfocus="openRequestDialog();" /></td>
					<th width="10%">外场信息处理卡编号:</th>
					<td width="40%"><input title="外场信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[40]'"
						readonly="readonly"style="width: 180px;" type="text" name="infoCardNo"
						id="infoCardNo" /></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span>处理单名称:</th>
					<td width="40%"><input title="处理单名称"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="dealName" id="dealName" /></td>
					<th width="10%">客服部经办人:</th>
					<td width="40%"><input title="客服部经办人ID"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="hidden" name="kfUserId" id="kfUserId" />
						<input title="客服部经办人" class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" readonly="readonly"
						name="kfUserName" id="kfUserName" /></td>
					</td>
				</tr>
				<tr>
					<th width="10%">求援单位:</th>
					<td width="40%"><input title="求援单位"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						readonly="readonly" style="width: 180px;" type="text"
						name="requestUnit" id="requestUnit" /></td>
					<th width="10%">求援方式:</th>
					<td width="40%">
						<!-- <input title="求援方式"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						readonly="readonly" style="width: 180px;" type="text"
						name="requestMethod" id="requestMethod" /> --> <select
						id="requestMethod" class="easyui-combobox" readonly="readonly"
						data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
						name="requestMethod">
							<c:forEach items="${requestMethodList}" var="method">
								<option value="${method.lookupCode }">${method.lookupName}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<th width="10%">批架次:</th>
					<td width="40%"><input title="批架次"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[100]'"
						style="width: 180px;" type="text"
						name="batchNo" id="batchNo" /></td>
					<th width="10%">机型:</th>
					<td width="40%">
						<input title="机型"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						readonly="readonly" style="width: 180px;" type="text"
						name="modelId" id="modelId" /></td>
				</tr>
				<tr>
					<th width="10%">生产单位:</th>
					<td width="40%"><input title="生产单位"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'"
						readonly="readonly" style="width: 180px;" type="text"
						name="productionUnit" id="productionUnit" /></td>
					<th width="10%">出厂时间:</th>
					<td width="40%"><input title="出厂时间" class="easyui-datebox"
						 editable="false"
						style="width: 182px;"  type="text"
						name="factoryTime" id="factoryTime" /></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th width="10%">飞行小时:</th> -->
<!-- 					<td width="40%"><input title="飞行小时" -->
<!-- 						class="easyui-validatebox" -->
<!-- 						readonly="readonly" style="width: 180px;" type="text" -->
<!-- 						name="flightHours" id="flightHours" /></td> -->
<!-- 					<th width="10%">飞机起落:</th> -->
<!-- 					<td width="40%"><input title="飞机起落" -->
<!-- 						class="easyui-validatebox" -->
<!-- 						readonly="readonly" style="width: 180px;" type="text" -->
<!-- 						name="flightLanding" id="flightLanding" /></td> -->
<!-- 				</tr> -->
				<tr>
					<th width="10%">问题故障名称:</th>
					<td width="40%"><input title="问题故障名称"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[100]'"
						readonly="readonly" style="width: 180px;" type="text"
						name="faultName" id="faultName" /></td>
					<th width="10%"><span class="remind">*</span>承办部门:</th>
					<td width="40%"><input class="inputbox" style="width: 180px;"
						type="hidden" name="dealDepartId" id="dealDepartId" />
						<div class="">
							<input title="承办部门" class="inputbox easyui-validatebox"
								data-options="required:true,validType:'maxLength[50]'"
								readonly="readonly" style="width: 180px;" type="text"
								name="dealDepartName" id="dealDepartName" />
						</div></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span>情况简介:</th>
					<td width="90%" colspan="3">
						<div style="width: 99%;">
							<textarea title="情况简介" rows="5"
								data-options="validType:'maxLength[1024]'" class="textareabox"
								name="caseDesc" id="caseDesc" style="resize: none"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span>建议或要求:</th>
					<td width="90%" colspan="3">
						<div style="width: 99%;">
							<textarea title="建议或要求" rows="5"
								data-options="validType:'maxLength[1024]'" class="textareabox"
								name="advice" id="advice" style="resize: none"></textarea>
						</div>
					</td>
				</tr>
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
			<jsp:param name="form_code" value="hdkfSupportOutfieldCard" />
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
	var source_batchNo="";
		$(function() {
			var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "dealDepartId", "dealDepartName");
			dealDepartIdDeptCommonSelector.init();
		});
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});

		//求援请求编号回写
		function callBackDataRequest(data) {
			$("#hdkfSupportInfo").dialog("close");
			$("#requestId").val(data.id);
			$("#requestNo").val(data.requestNo);
			$("#kfUserId").val(data.requestManagerId);
			$("#kfUserName").val(data.requestManagerName);
			$("#requestUnit").val(data.requestUnitAlias);
			$("#requestMethod").combobox("select", data.requestMethod);
			$("#batchNo").val(data.batchNo);
			source_batchNo = data.batchNo;
			$("#modelId").val(data.modelIdAlias);
			$("#productionUnit").val(data.productionUnit);
// 			$("#factoryTime").datebox('setValue',
// 					new Date(data.repairTime).format("yyyy-MM-dd"));
			//$("#flightHours").val(data.flightHours);
			//$("#flightLanding").val(data.flightLanding);
			$("#faultName").val(data.requestName);
			getStringRuleCode(data.id, data.modelIdAlias);
		}
		function closeForm() {
			parent.hdkfSupportOutfieldCard.closeDialog("#insert");
		}
		function saveForm() {

			if ($('#form').form('validate') == false) {
				return;
			}
			if (source_batchNo.indexOf($("#batchNo").val())<0 ) {
				alert("批架次填写有误，请排查！");
				return;
			} 
			
			if ($("#caseDesc").val() =='') {
				alert("情况简介不能为空！");
				return;
			} 
			if ($("#advice").val() =='') {
					alert("建议或要求不能为空！");
					return;
			}
			if ($("#caseDesc").val().length>500) {
				alert("情况简介的长度不能超过500！");
				return ;
			}
			if ($("#advice").val().length>500) {
				alert("建议或要求的长度不能超过500！");
				return  ;
			}
			$('#saveButton').linkbutton('disable').unbind("click");
			
			parent.hdkfSupportOutfieldCard.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
		}

		function openRequestDialog() {
			this.nData = new CommonDialog(
					"hdkfSupportInfo",
					"850",
					"500",
					"hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/HdkfSupportRequestInfoSelect",
					"信息卡选择", false, true, false);
			this.nData.show();
		}
		function getStringRuleCode(requestId, modelId) {
			$.ajax({
				url : "platform/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/getStringRuleCode.json",
				data : {
					type : "B",
					requestId : requestId,
					modelId : modelId
				},
				type : "post",
				dataType : 'json',
				success : function(result) {
					if (result.flag == "success")
					{
						$("#infoCardNo").val(result.ruleCode);
					}
				}
			});
		}
	</script>
</body>
</html>