<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>

<script src="avicit/common/js/ValidationContent.js"
	type="text/javascript">
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<!-- 流程按钮区域开始 -->
 		<div class=datagrid-toolbar>
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
		</div>
		<fieldset>
			<form id='form'>
				<input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th width="10%"><label for="bulletinNo"> 通告编号:</label></th>


						<td width="40%"><input title="通告编号"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="bulletinNo" id="bulletinNo" /></td>
						<th width="10%"><label for="title"> 标题:</label></th>


						<td width="40%"><input title="标题"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="title" id="title" /></td>
					</tr>
					<tr>
					<th width="10%"><label for="reportNo">上报文号:</label></th>
					<td width="40%"><input title="上报文号"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="reportNo" id="reportNo" /></td>
							
					<th width="10%"><label for="reportTime">上报时间:</label></th>
					<td width="40%"><input title="上报时间"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="reportTime" id="reportTime" /></td>
					</tr>
					
					
					<tr>
					<th width="10%"><label for="replyNo">批复文号:</label></th>
					<td width="40%"><input title="批复文号"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="replyNo" id="replyNo" /></td>
							
					<th width="10%"><label for="replyTime">批复时间:</label></th>
					<td width="40%"><input title="批复时间"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="replyTime" id="replyTime" /></td>
					
					</tr>
					
					
					<tr>
					
					<th width="10%"><label for="completeTime">完成时间:</label></th>
					<td width="40%"><input title="完成时间"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="completeTime" id="completeTime" /></td>								
					</tr>
					
					<tr>
					
					<th width="10%"><label for="forwardNo">转发文号:</label></th>
					<td width="40%"><input title="转发文号"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="forwardNo" id="forwardNo" /></td>
							
					<th width="10%"><label for="forwardTime">转发时间:</label></th>
					<td width="40%"><input title="转发时间"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="forwardTime" id="forwardTime" /></td>
					
					
					</tr>
				</table>
			</form>
		</fieldset>
		<%-- <jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="5000MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value='<%=formId%>' />
			<jsp:param name="form_code" value="hdkfEsNoticeinfo" />
			<jsp:param name="allowAdd" value="process" />
			<jsp:param name="allowDel" value="false" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="hiddenUploadBtn" value="false" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include> --%>
	</div>
	<script type="text/javascript">
		//返回
		function doBack(){
			if(parent!=null&&parent.$('#tabs')!=null){
				var currTab = parent.$('#tabs').tabs('getSelected');
				var currTitle = currTab.panel('options').title; 
				parent.$('#tabs').tabs('close',currTitle);
			}
		}
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;
				},
				message : '请输入最多 {0} 字符.'
			}
		});

		var entryId = "<%=entryId%>";
		var executionId = "<%=executionId%>";
		var taskId = "<%=taskId%>";
		var formId = "<%=formId%>";
		$(function() {
			if (!"${hdkfEsNoticeinfoDTO.reportDate}" == "") {
				$('#reportDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsNoticeinfoDTO.reportDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfEsNoticeinfoDTO.publishDate}" == "") {
				$('#publishDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsNoticeinfoDTO.publishDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfEsNoticeinfoDTO.completeDate}" == "") {
				$('#completeDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsNoticeinfoDTO.completeDate}")
								.format("yyyy-MM-dd"));
			}
		
			//初始化页面值
			$
					.ajax({
						url : 'platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController//operation/toDetailJsp.json',
						data : {
							id : formId
						},
						async:false,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if (result.flag == "success") {
								result.datas.reportDate = formatDatebox(result.datas.reportDate);
								result.datas.publishDate = formatDatebox(result.datas.publishDate);
								result.datas.completeDate = formatDatebox(result.datas.completeDate);
								result.datas.reportTime = formatDatebox(result.datas.reportTime);
								result.datas.replyTime = formatDatebox(result.datas.replyTime);
								result.datas.completeTime = formatDatebox(result.datas.completeTime);
								result.datas.forwardTime = formatDatebox(result.datas.forwardTime);
								result.datas.creationDate = formatDatebox(result.datas.creationDate);
								result.datas.lastUpdateDate = formatDatebox(result.datas.lastUpdateDate);
								result.datas.attribute13 = formatDatebox(result.datas.attribute13);
								result.datas.attribute14 = formatDatebox(result.datas.attribute14);
								$("#form").form('load', result.datas);
							} else {
								$.messager.show({
									title : '提示',
									msg : "数据加载失败。"
								});
							}
						}
					});

			//控制表单权限用这个
			initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
			
			
			
			var bulletinNo = $("#bulletinNo").val();
			var bulletinId = formId;
			var url = "hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/HdkfEsNoticeinfoEffectiveInfo11?bulletinId="+bulletinId+"&bulletinNo="+bulletinNo;
			$("#iframeIdR").css('display','block');
			$("#iframeIdR").attr("src",url);
			
			var includeMars =    $("#includeMars").combobox('getValue');
		
			var url = "hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/HdkfEsNoticeinfoMaterialInfo1?bulletinId="+bulletinId+"&bulletinNo="+bulletinNo;
			if(includeMars=='Y'){
				//alert(validFlag);
			$("#iframeIdR1").css('display','block');
			$("#iframeIdR1").attr("src",url);
			}
			else{
				$("#iframeIdR1").css('display','none');
			}
			
		})

		/**
		 * 保存表单方法
		 * @param processInstanceId
		 * @param executionId
		 */
		var _callback;
		window.saveFormDataSyn = function(processInstanceId, executionId,
				callback) {
			_callback = callback;
			if ($('#form').form('validate') == false) {
				return;
			}
			var dataVo = $('#form').serializeArray();
			var dataJson = convertToJson(dataVo);
			dataVo = JSON.stringify(dataJson);
			$
					.ajax({
						url : "platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/save",
						data : {
							data : dataVo
						},
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if (result.flag == "success") {
								var flag = 0;
								try {
									flag = upload();
								} catch (e) {
								}
								if (flag == 0) {
									$.messager.show({
										title : '提示',
										msg : "保存完成."
									});
									if (_callback != null) {
										_callback();
									}
								}
							} else {
								$.messager.show({
									title : '提示',
									msg : "操作失败。"
								});
							}
						}
					});
		};

		function afterUploadEvent() {
			$.messager.show({
				title : '提示',
				msg : "保存完成."
			});
			if (_callback != null) {
				_callback();
			}
		}
		
		$("#includeMars").combobox({onSelect:function(r){		
			var bulletinNo = $("#bulletinNo").val();
			var bulletinId = formId;
			var url = "hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/HdkfEsNoticeinfoMaterialInfo?bulletinId="+bulletinId+"&bulletinNo="+bulletinNo;
			if(r.value=='Y'){
				//alert(validFlag);
			$("#iframeIdR1").css('display','block');
			$("#iframeIdR1").attr("src",url);
			}
			else{
				$("#iframeIdR1").css('display','none');
			}
			}});
	</script>
</body>
<script type="text/javascript">
	$(function() {
		$('.input-right-icon').unbind("click");
	});
</script>
</html>