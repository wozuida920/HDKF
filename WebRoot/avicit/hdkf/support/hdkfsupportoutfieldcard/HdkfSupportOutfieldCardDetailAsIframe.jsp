<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/Detail/id" -->
<title>详细</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var entryId = "<%=entryId%>";
	var executionId = "<%=executionId%>";
	var taskId = "<%=taskId%>";
	var formId = "<%=formId%>";

	$(function() {
	//	alert("全局。。。。");
// 		var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
// 				"deptSelectCommonDialog", "dealDepartId", "dealDepartName");
// 		dealDepartIdDeptCommonSelector.init();
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
					parserColumnTime("${hdkfSupportOutfieldCardDTO.doneTime}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportOutfieldCardDTO.sendtoKfTime}" == "") {
			$('#sendtoKfTime').datebox(
					'setValue',
					parserColumnTime(
							"${hdkfSupportOutfieldCardDTO.sendtoKfTime}")
							.format("yyyy-MM-dd"));
		}
	});

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportOutfieldCard.factoryTime = formatDatebox(result.hdkfSupportOutfieldCard.factoryTime);
							result.hdkfSupportOutfieldCard.kfForwardTime = formatDatebox(result.hdkfSupportOutfieldCard.kfForwardTime);
							result.hdkfSupportOutfieldCard.doneTime = formatDatebox(result.hdkfSupportOutfieldCard.doneTime);
							result.hdkfSupportOutfieldCard.sendtoKfTime = formatDatebox(result.hdkfSupportOutfieldCard.sendtoKfTime);
							$("#formDetail").form('load', result.hdkfSupportOutfieldCard);
							var requestMethodList = JSON.parse(result.requestMethodList);
							$("#requestMethod").combobox("loadData", requestMethodList);
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/save',
					data : {
						data : dataVo
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							initFormData();
							$.messager.show({
								title : '提示',
								msg : "操作成功。"
							});
						} else {
							$.messager.show({
								title : '提示',
								msg : "操作失败。"
							});
						}
					}
				});
	};

	//返回
	function doBack() {
		if (parent != null && parent.$('#tabs') != null) {
			var currTab = parent.$('#tabs').tabs('getSelected');
			var currTitle = currTab.panel('options').title;
			parent.$('#tabs').tabs('close', currTitle);
		}
	}
	
	


	
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
	});
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

		<!-- 流程按钮区域开始 -->
		<div class=datagrid-toolbar style="display:none">
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
			<a class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="downloadPdf();" href="javascript:void(0);">生成PDF</a>
		</div>
	

		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId"
							id="requestId" disabled /><input title="信息处理卡编号"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="requestNo" id="requestNo" disabled /></td>
						<th align="right"><label>外场信息处理卡编号</label></th>
						<td><input title="外场信息处理卡编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="infoCardNo"
							id="infoCardNo" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>处理单名称</label></th>
						<td><input title="处理单名称" class="easyui-validatebox"
							style="width: 180px;" type="text" name="dealName" id="dealName"
							disabled /></td>
						<th align="right"><label>客服部经办人</label></th>
						<td><input title="客服部经办人" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="kfUserId" id="kfUserId"
							disabled /><input title="客服部经办人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="kfUserName"
							id="kfUserName" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>求援单位</label></th>
						<td><input title="求援单位" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestUnit"
							id="requestUnit" disabled /></td>
						<th align="right"><label>求援方式</label></th>
						<td>
							<!-- <input title="求援方式" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestMethod"
							id="requestMethod" disabled /> -->
							<select id="requestMethod"
							class="easyui-combobox"
							data-options="valueField:'lookupCode',textField:'lookupName',fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
							name="requestMethod" disabled>
							</select>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>批架次</label></th> -->
<!-- 						<td><input title="批架次" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="batchNo" id="batchNo" -->
<!-- 							disabled /></td> -->
<!-- 						<th align="right"><label>机型</label></th> -->
<!-- 						<td><input title="机型" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="modelId" id="modelId" -->
<!-- 							disabled /></td> -->
<!-- 					</tr> -->
					<tr>
						<th align="right"><label>生产单位</label></th>
						<td><input title="生产单位" class="easyui-validatebox"
							style="width: 180px;" type="text" name="productionUnit"
							id="productionUnit" disabled /></td>
						<th align="right"><label>出厂时间</label></th>
						<td><input title="出厂时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="factoryTime"
							id="factoryTime" disabled /></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>飞行小时</label></th> -->
<!-- 						<td><input title="飞行小时" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" name="flightHours" -->
<!-- 							id="flightHours" disabled /></td> -->
<!-- 						<th align="right"><label>飞机起落</label></th> -->
<!-- 						<td><input title="飞机起落" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" name="flightLanding" -->
<!-- 							id="flightLanding" disabled /></td> -->
<!-- 					</tr> -->
					<tr>
						<th align="right"><label>问题故障名称</label></th>
						<td><input title="问题故障名称" class="easyui-validatebox"
							style="width: 180px;" type="text" name="faultName" id="faultName"
							disabled /></td>
						<th align="right"><label>客服转发时间</label></th>
						<td><input title="客服转发时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="kfForwardTime"
							id="kfForwardTime" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>情况简介</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="情况简介" rows="5" class="textareabox"
									name="caseDesc" id="caseDesc" style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th align="right"><label>建议或要求</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="建议或要求" rows="5" class="textareabox"
									name="advice" id="advice" style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th align="right"><label>方案形成时间</label></th>
						<td><input title="方案形成时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="doneTime" id="doneTime"
							disabled /></td>
						<th align="right"><label>方案送达客服部时间</label></th>
						<td><input title="方案送达客服部时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="sendtoKfTime"
							id="sendtoKfTime" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>承办部门</label></th>
						<td><input title="承办部门" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="dealDepartId"
							id="dealDepartId" disabled /><input title="承办部门"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="dealDepartName" id="dealDepartName" disabled /></td>
<!-- 						<th align="right"><label>承办单位处理人</label></th> -->
<!-- 						<td><input title="承办单位处理人" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="hidden" name="dealUserId" -->
<!-- 							id="dealUserId" disabled /><input title="承办单位处理人" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="dealUserName" -->
<!-- 							id="dealUserName" disabled /></td> -->
                         <th align="right"><label>承办单位处理人</label></th>
						<td><input title="承办单位处理人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="dealUserId"
							id="dealUserId" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>承办单位处理结论</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="承办单位处理结论" rows="5"
									data-options="required:true,validType:'maxLength[1024]'"
									class="textareabox" name="dealSolution" id="dealSolution"
									style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
		<div style="width: 98%; margin-left: 1%; margin-right: 18%">
			<fieldset>
				<legend>附件</legend>
				<div class="formExtendBase" style="margin-left: 10%">
					<div class="column" style="height: 130px;">
						<jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfViewInclude.jsp">
							<jsp:param name="form_id" value="<%=formId%>" />
							<jsp:param name="save_type" value="true" />
							<jsp:param name="file_category" value="PLATFORM_SEX" />
							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
						</jsp:include>
					</div>
				</div>
			</fieldset>
		</div>
		<div id="idea"></div>
	</div>
</body>
</html>