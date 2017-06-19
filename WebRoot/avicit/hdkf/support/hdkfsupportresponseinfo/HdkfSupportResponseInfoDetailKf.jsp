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
	String parameter = request.getParameter("parameter");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/Detail/id" -->
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
	var parameter = <%=parameter%>;
	//parameter为1时，代表客服部信息员，2代表客服部技术员
	if (parameter == 1) {
		$("#respNo").removeAttr("disabled");
		$("#actualTime").removeAttr("disabled");
		$("#respUserName").removeAttr("disabled");
		$("#respUserId").removeAttr("disabled");
	}

	$(function() {
		if (!"${hdkfSupportResponseInfoDTO.actualTime}" == "") {
			$('#actualTime')
					.datebox(
							'setValue',
							parserColumnTime(
									"${hdkfSupportResponseInfoDTO.actualTime}")
									.format("yyyy-MM-dd"));
		}
	});

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
			var id = $("#requestDealId").val();
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

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportResponseInfo.actualTime = formatDatebox(result.hdkfSupportResponseInfo.actualTime);
							$("#formDetail").form('load',
									result.hdkfSupportResponseInfo);
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}

	window.beforeSubmit = function(_entryId, _executionId,
			_currentActivityName, _targetActivityName, _formId) {
		if(validateData()){
			var respNo ;
			$
			.ajax({
				url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/toDetailJsp.json',
				data : {
					id : formId
				},
				async:false,
				type : 'post',
				dataType : 'json',
				success : function(result) {
					if (result.flag == "success") {
						//进行时间转化
						/* result.hdkfSupportRequestInfo.requestDate = formatDatebox(result.hdkfSupportRequestInfo.requestDate);
						result.hdkfSupportRequestInfo.repairTime = formatDatebox(result.hdkfSupportRequestInfo.repairTime);
						result.hdkfSupportRequestInfo.occurrenceDate = formatDatebox(result.hdkfSupportRequestInfo.occurrenceDate);
					 distributionType=result.hdkfSupportRequestInfo.distributionType; */
					 respNo = result.hdkfSupportResponseInfo.respNo;
						
					} else {
						$.messager.show({
							title : '提示',
							msg : "数据加载失败。"
						});
					}
				}
			});
			if(!respNo)
			{
				alert("请先点击保存表单按钮，再提交流程");
				return false;
			}
		}
		return true;
		
	}

	function validateData() {
		var flag = true;
		if ($("#respNo").val() == "") {
			flag = false;
			alert("答复文号不能为空！");
			return flag;
		}
		if (flag && $("#actualTime").combobox("getValue") == "") {
			flag = false;
			alert("答复时间不能为空！");
			return flag;
		}
		return flag;
	}

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		if (validateData()) {
			var dataVo = $('#formDetail').serializeArray();
			var dataJson = convertToJson(dataVo);
			dataVo = JSON.stringify(dataJson);
			$
					.ajax({
						url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/save',
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
		}
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
		<div class=datagrid-toolbar>
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
		</div>

		<div style="margin: 10px 5px 20px 10px">
			<span><a id="onOffBtn" onclick="toRequestDetail();"
				href="javascript:void(0)">展开信息卡求援详情</a></span>

			<iframe id="iframeId1" width="99%" height="870" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>
		<div style="margin: 10px 5px 20px 10px">
			<span><a id="onOffBtn2" onclick="toRequestDetail2();"
				href="javascript:void(0)">展开客服部处理单详情</a></span>

			<iframe id="iframeId2" width="99%" height="570" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>处理单名称</label></th>
						<td><input title="请求处理ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestDealId"
							id="requestDealId" disabled /><input title="处理单名称"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="dealNo" id="dealNo" disabled /></td>
						<th align="right"><label>答复文号</label></th>
						<td><input title="答复文号" class="easyui-validatebox"
							data-options="required:true" style="width: 180px;" type="text"
							name="respNo" id="respNo" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>答复名称</label></th>
						<td colspan="3"><input title="答复名称"
							class="easyui-validatebox" style="width: 100%;" type="text"
							name="respName" id="respName" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>最终处理意见</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea rows="5" title="最终处理意见" class="textareabox"
									data-options="validType:'maxLength[2000]'" name="finalDecision"
									id="finalDecision" disabled /></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th align="right"><label>经办人姓名</label></th>
						<td><input title="经办人ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="respUserId"
							id="respUserId" readonly="readonly" disabled /><input
							title="经办人姓名" class="easyui-validatebox" style="width: 180px;"
							type="text" name="respUserName" readonly="readonly"
							id="respUserName" disabled /></td>
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId"
							id="requestId" disabled /><input title="信息处理卡编号"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="requestNo" id="requestNo" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>答复时间</label></th>
						<td><input title="答复时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="actualTime"
							id="actualTime" disabled /></td>
						<th align="right"><label>答复方式</label></th>
						<td><pt6:syslookup name="respBy"
								lookupCode="SUPPORT_RESPONSE_TYPE"
								dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
							</pt6:syslookup></td>
					</tr>
					<tr>
						<th width="10%">填写人</th>
						<td width="40%"><input title="填写人ID"
							class="easyui-validatebox" style="width: 180px;" type="hidden"
							data-options="required:true" name="attribute01" id="attribute01"
							disabled /> <input title="填写人姓名" class="easyui-validatebox"
							data-options="required:true" style="width: 180px;" type="text"
							type="text" name="attribute02" id="attribute02" disabled /></td>
					</tr>
				</table>
			</form>
		</fieldset>
		<fieldset>
			<legend>附件</legend>
			<div class="formExtendBase">
				<div class="column" style="height: 130px;">
					<jsp:include
						page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
						<jsp:param value="1024MB" name="file_size_limit" />
						<jsp:param value="*.*" name="file_types" />
						<jsp:param value="10" name="file_upload_limit" />
						<jsp:param value="false" name="save_type" />
						<jsp:param value="<%=formId%>" name="form_id" />
						<jsp:param value="<%=entryId%>" name="entryId" />
						<jsp:param value="<%=executionId%>" name="executionId" />
						<jsp:param value="pm_project" name="form_code" />
						<jsp:param value="id" name="form_field" />
						<jsp:param value="process" name="allowAdd" />
						<jsp:param value="true" name="allowDel" />
						<jsp:param value="true" name="cleanOnExit" />
						<jsp:param value="PLATFORM_FILE_SECRET_LEVEL" name="secret_level" />
					</jsp:include>
				</div>
			</div>
		</fieldset>
		<div id="idea"></div>
	</div>
</body>
</html>