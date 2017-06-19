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
<!-- ControllerPath = "hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveController/operation/Add/null" -->
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
				  <th width="10%">请求处理ID:</th>
					<td width="40%"><input title="请求处理ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="dealId" id="dealId" onfocus="openDealByKfDialog();"/></td>

					<th width="10%">归档类别:</th>
					<td width="40%"><pt6:syslookup name="archiveType"
							lookupCode="SUPPORT_ARCHIVE_TYPE"
							dataOptions="width:180,editable:false,panelHeight:'auto' ">
						</pt6:syslookup></td>
					
				</tr>
				<tr>
					<th width="10%">答复文号:</th>
					<td width="40%"><input title="答复文号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="respId" id="respId" /><input title="答复文号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="respNo" id="respNo" readonly /></td>
					<th width="10%">任务书编号:</th>
					<td width="40%"><input title="任务书ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="attribute01" id="attribute01" />
						<input title="任务书编号" class="inputbox easyui-validatebox"
						editable="false" style="width: 182px;" type="text"
						name="attribute02" id="attribute02" readonly /></td>
					
				</tr>
				<tr><th width="10%">求援信息编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="requestId" id="requestId" /><input title="求援信息编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo" readonly/></td>
						
					<th width="10%">赴外场出发时间:</th>	
						<td width="40%"><input title="赴外场出发时间" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="tripStartTime" id="tripStartTime"  /></td>
					
				
				</tr>
<!-- 				<tr> -->
					
<!-- 					<th width="10%">归档编号:</th> -->
<!-- 					<td width="40%"><input title="归档编号" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="text" name="archiveNo" id="archiveNo" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">归档时间:</th> -->
<!-- 					<td width="40%"><input title="归档时间" class="easyui-datebox" -->
<!-- 						editable="false" style="width: 182px;" type="text" -->
<!-- 						name="archiveTime" id="archiveTime" /></td> -->
<!-- 				</tr> -->
			</table>
				<input type="hidden" value="${id}" name="id" id="id"/>
		</form>
<!-- 		swfBpmEditInclude.jsp -->
<%-- 			<jsp:param name="hiddenUploadBtn" value="true" /> --%>
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="${id}" />
			<jsp:param name="form_code" value="hdkfSupportCardArchive" />
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
		$(function() {
		});
		function closeForm() {
			parent.hdkfSupportCardArchive.closeDialog("#insert");
		}
		
		
		function getTripTaskDTOByrequestId(requestId) {
		//	alert("alert in trip--->"+requestId);
			$
					.ajax({
						url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/getTripTaskDTOByrequestId.json',
						data : {
							requestId : requestId
						},
						async : false,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if (result.flag == "success") {
								//进行时间转化
// 								result.hdkfSupportTripTask.startDate = formatDatebox(result.hdkfSupportTripTask.startDate);
// 								result.hdkfSupportTripTask.endDate = formatDatebox(result.hdkfSupportTripTask.endDate);
// 								result.hdkfSupportTripTask.noticeTime = formatDatebox(result.hdkfSupportTripTask.noticeTime);
// 								result.hdkfSupportTripTask.tripStartTime = formatDatebox(result.hdkfSupportTripTask.tripStartTime);
                                //alert("here...");
                                $("#attribute01").val(result.hdkfSupportTripTask.id);
                                //alert(result.hdkfSupportTripTask.id);
                                $("#attribute02").val(result.hdkfSupportTripTask.taskNo);
                                //alert(result.hdkfSupportTripTask.taskNo);
                                $("#tripStartTime").val(formatDatebox(result.hdkfSupportTripTask.tripStartTime));
                                var  startTimesdf = formatDatebox(result.hdkfSupportTripTask.tripStartTime);
                                $("#tripStartTime").datebox('setValue', startTimesdf);
								//alert(startTimesdf);
							} else {
// 								$.messager.show({
// 									title : '提示',
// 									msg : "数据加载失败。"
// 								});
							}
						}
					});
		}
		function getResponseInfoDTOByrequestId(requestId) {
		//	alert("in response111111111111...--->"+requestId);
			$
					.ajax({
						url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/getResponseInfoDTOByrequestId.json',
						data : {
							requestId : requestId
						},
						async:false,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if (result.flag == "success") {
								//进行时间转化
								//result.hdkfSupportResponseInfo.actualTime = formatDatebox(result.hdkfSupportResponseInfo.actualTime);
								//alert("success");
								$("#respId").val(result.hdkfSupportResponseInfo.id);
								//alert("success.....id--->"+result.hdkfSupportResponseInfo.id);
								$("#respNo").val(result.hdkfSupportResponseInfo.respNo);
								//alert("success....."+result.hdkfSupportResponseInfo.respNo);
							} else {
								//alert("failure");
// 								$.messager.show({
// 									title : '提示',
// 									msg : "数据加载失败。"
// 								});
							}
						}
					});
		}
		
		
		//openDealByKfDialog
		//打开客服部处理选择页面
		function openDealByKfDialog() {
			//alert("open dialog...");
			this.nData = new CommonDialog(
					"model4",
					"790",
					"600",
					"hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/HdkfSupportDealByKfSelect",
					"信息卡处理信息选择", false, true, false);
			this.nData.show();
		}
		function setDealByKfData(data) {
			$("#model4").dialog("close");

			$("#dealId").val(data.id);
			$("#requestId").val(data.requestId);
			$("#requestNo").val(data.requestNo);
			//alert(1);
			getResponseInfoDTOByrequestId(data.requestId);
			//alert(2);
			getTripTaskDTOByrequestId(data.requestId);

		}
		function saveForm() {

			if ($('#form').form('validate') == false) {
				return;
			}
			parent.hdkfSupportCardArchive.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
		}
	</script>
</body>
</html>