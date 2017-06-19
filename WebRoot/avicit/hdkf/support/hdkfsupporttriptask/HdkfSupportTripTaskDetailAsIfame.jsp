<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
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
<!-- ControllerPath = "hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/Detail/id" -->
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
		if (!"${hdkfSupportTripTaskDTO.startDate}" == "") {
			$('#startDate').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.startDate}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportTripTaskDTO.endDate}" == "") {
			$('#endDate').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.endDate}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportTripTaskDTO.noticeTime}" == "") {
			$('#noticeTime').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.noticeTime}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportTripTaskDTO.tripStartTime}" == "") {
			$('#tripStartTime').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.tripStartTime}")
							.format("yyyy-MM-dd"));
		}
	})

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/toDetailJsp.json',
					data : {
						id : formId
					},
					async : false,
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportTripTask.startDate = formatDatebox(result.hdkfSupportTripTask.startDate);
							result.hdkfSupportTripTask.endDate = formatDatebox(result.hdkfSupportTripTask.endDate);
							result.hdkfSupportTripTask.noticeTime = formatDatebox(result.hdkfSupportTripTask.noticeTime);
							result.hdkfSupportTripTask.tripStartTime = formatDatebox(result.hdkfSupportTripTask.tripStartTime);
							$("#formDetail").form('load',
									result.hdkfSupportTripTask);
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
					url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/save',
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
	function toRequestDetail() {

		if ($("#onOffBtn").html() == '展开信息卡求援详情') {
			//alert("here");
			var id = $("#requestId").val();
			var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			var url = "avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId1").css('display', 'block');
			$("#iframeId1").attr("src", url);
			$("#onOffBtn").html('收起信息卡求援详情');
		} else {
			$("#iframeId1").css('display', 'none');
			$("#onOffBtn").html('展开信息卡求援详情');
		}
	}
	function toRequestDetail2() {

		if ($("#onOffBtn2").html() == '展开客服部处理单详情') {
			//alert("here");
			var id = $("#kfDealId").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			var url = "avicit/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId2").css('display', 'block');
			$("#iframeId2").attr("src", url);
			$("#onOffBtn2").html('收起客服部处理单详情');
		} else {
			$("#iframeId2").css('display', 'none');
			$("#onOffBtn2").html('展开客服部处理单详情');
		}
	}
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);

		var isNeedEquipment = $("#isNeedEquipment").val();

		if (isNeedEquipment == 'Y') {

			var taskId = formId;
			//alert(taskId);
			var taskNo = $("#taskNo").val();
			//alert(taskNo);
			var url = "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo2?taskId="
					+ taskId + "&taskNo=" + taskNo;

			//alert(validFlag);
			$("#iframeId").css('display', 'block');
			$("#iframeId").attr("src", url);

		}

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
		</div>

		

		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
				<tr>
						<th align="right"><label>任务书编号</label></th>
						<td><input title="任务书编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="taskNo" id="taskNo"
							disabled /></td>
						<th align="right"><label>任务书名称</label></th>
						<td><input title="任务书名称" class="easyui-validatebox"
							style="width: 180px;" type="text" name="taskName" id="taskName"
							disabled /></td>

					</tr>
					<tr>
<!-- 						<th width="10%"><label>请求处理ID</label></th> -->
<!-- 						<td width="40%"></td> -->
						<th width="10%"><label>信息处理卡编号</label></th>
						<td width="40%"><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId"
							id="requestId" disabled /> <input title="信息处理卡编号"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="requestNo" id="requestNo" disabled /></td>
						  
						  <th align="right"><label>排故所去部队</label></th>
						<td><input title="排故所去部队" class="easyui-validatebox"
							style="width: 180px;" type="text" name="toArmyName"
							id="toArmyName" disabled />
							<input title="请求处理ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="kfDealId" id="kfDealId"
							disabled />
							</td>


					</tr>
					
					<tr>
						<!-- 						<th align="right"><label>需要的器材</label></th> -->
						<!-- 						<td><input title="需要的器材" class="easyui-validatebox" -->
						<!-- 							style="width: 180px;" type="text" name="needEquipment" -->
						<!-- 							id="needEquipment" disabled /></td> -->

						<th align="right"><label>是否需要器材</label></th>
						<td><pt6:syslookup name="isNeedEquipment"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:180,editable:false,panelHeight:'auto',disabled:true">
						</pt6:syslookup></td>


						<th align="right"><label>是否借人</label></th>
						<td><pt6:syslookup name="isBorrowSomeone"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:180,editable:false,panelHeight:'auto',disabled:true">
						</pt6:syslookup></td>
					</tr>
					<tr>


						<th align="right"><label>费用编号</label></th>
						<td><input title="费用编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="feeNo" id="feeNo"
							disabled /></td>

						<th align="right"><label>填写人</label></th>
						<td><input title="填写人ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="writeManId"
							id="writeManId" disabled /><input title="填写人姓名"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="writeManName" id="writeManName" disabled /></td>

					</tr>
					<!-- 					<tr> -->
					<!-- 						<th align="right"><label>任务内容与要求</label></th> -->
					<!-- 						<td><input title="任务内容与要求" class="easyui-validatebox" -->
					<!-- 							style="width: 180px;" type="text" name="contentDemand" -->
					<!-- 							id="contentDemand" disabled /></td> -->

					<!-- 					</tr> -->
					<tr>
					
<!-- 						<th align="right"><label>执行者</label></th> -->
<!-- 						<td><input title="执行者" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="executors" id="executors" -->
<!-- 							disabled /></td> -->
					</tr>
					<tr>
						<th align="right"><label>通知客户时间</label></th>
						<td><input title="通知客户时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="noticeTime"
							id="noticeTime" disabled /></td>
						<th align="right"><label>赴外场出发时间</label></th>
						<td><input title="赴外场出发时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="tripStartTime"
							id="tripStartTime" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>部队技术室主任</label></th>
						<td><input title="部队技术室主任" class="easyui-validatebox"
							style="width: 180px;" type="text" name="director" id="director"
							disabled /></td>
						<th align="right"><label>部队技术室部长</label></th>
						<td><input title="部队技术室部长" class="easyui-validatebox"
							style="width: 180px;" type="text" name="head" id="head" disabled />
						</td>
					</tr>
					
					<tr>
						
						<th align="right"><label>任务实际开始时间</label></th>
						<td><input title="任务实际开始时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="startDate" id="startDate"
							disabled /></td>
						<th align="right"><label>任务实际完成时间</label></th>
						<td><input title="任务实际完成时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="endDate" id="endDate"
							disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>总任务完成天数</label></th>
						<td><input title="总任务完成天数" class="easyui-validatebox"
							style="width: 180px;" type="text" name="totalHours"
							id="totalHours" disabled /></td>
<!-- 						<th align="right"><label>任务完成详细说明</label></th> -->
<!-- 						<td><input title="任务完成详细说明" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="taskDetails" -->
<!-- 							id="taskDetails" disabled /></td> -->
                       
					</tr>
					
					<tr>
				     <th align="right">执行者:</th>
					<td   colspan="5"  style="padding-left: 3px"><input title="故障标题"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[300]'" style="width: 180px;"
						type="text" name="executors" id="executors" disabled /></td>
				
				   </tr>
					<tr>
						<th align="right"><label>任务内容与要求:</label></th>

						<td colspan="5" align="left" style="padding-left: 3px"><textarea
								rows="12"
								data-options="required:true,validType:'maxLength[4000]'"
								class="textareabox" name="contentDemand" id="contentDemand"
								style="resize: none" required="true" disabled></textarea></td>
					</tr>

					<tr>
						<th align="right"><label>需要的器材:</label></th>

						<td colspan="5" align="left" style="padding-left: 3px"><textarea
								rows="12"
								data-options="required:true,validType:'maxLength[4000]'"
								class="textareabox" name="needEquipment" id="needEquipment"
								style="resize: none" disabled></textarea></td>
					</tr>
					<tr>
						<th align="right"><label>任务完成详细说明</label></th>

						<td colspan="5" align="left" style="padding-left: 3px"><textarea
								rows="12"
								data-options="required:true,validType:'maxLength[4000]'"
								class="textareabox" name="taskDetails"
								id="taskDetails" style="resize: none" disabled></textarea></td>
					</tr>
					<tr>
						<th align="right"><label>部队领导意见及要求</label></th>

						<td colspan="5" align="left" style="padding-left: 3px"><textarea
								rows="12"
								data-options="required:true,validType:'maxLength[4000]'"
								class="textareabox" name="suggestionDemand"
								id="suggestionDemand" style="resize: none" disabled></textarea></td>
					</tr>
<!-- 					<tr> -->

<!-- 						<th align="right"><label>任务评价</label></th> -->
<!-- 						<td colspan="5" align="left" style="padding-left: 3px"><textarea -->
<!-- 								rows="12" -->
<!-- 								data-options="required:true,validType:'maxLength[4000]'" -->
<!-- 								class="textareabox" name="evaluate" id="evaluate" -->
<!-- 								style="resize: none" disabled></textarea></td> -->
<!-- 					</tr> -->




					<tr>
					</tr>
				</table>
			</form>
		</fieldset>
		<iframe id="iframeId" width="100%" height="600" frameborder="0"
			style="display: none;"> </iframe>
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