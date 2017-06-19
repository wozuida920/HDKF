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
<!-- ControllerPath = "hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/Detail/id" -->
<title>详细</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var entryId = "<%=entryId%>";
	var executionId = "<%=executionId%>";
	var taskId = "<%=taskId%>";
	var formId = "<%=formId%>";
	var parameter = <%=parameter %>;//parameter为1时，代表拟稿人，2代表其他审批人员
	$(".input-right-icon").hide();
	if (parameter == 1)
	{
		$("#requestNo").removeAttr("disabled");
	}
	var source_batchNo ="";

	$(function() {
		if (parameter == 1)
		{
		var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
				"deptSelectCommonDialog", "dealDepartId", "dealDepartName");
		dealDepartIdDeptCommonSelector.init();
		}
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
					async:false,
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
							source_batchNo =  result.hdkfSupportOutfieldCard.batchNo;
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}
	
	
	
	
	window.beforeSubmit = function( _entryId,_executionId,_currentActivityName,_targetActivityName,_formId){
		
		
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项！");
			return false;
		}
		if (source_batchNo.indexOf($("#batchNo").val())<0 ) {
			alert("批架次填写有误，请排查！");
			return false;
		} 
		if ($("#caseDesc").val()=='') {
			alert("情况简介不能为空！");
			return false;
		} if ($("#advice").val() =='') {
				alert("建议或要求不能为空！");
				return false;
				
		}if ($("#caseDesc").val().length>500) {
			alert("情况简介的长度不能超过500！");
			return false;
		}
		if ($("#advice").val().length>500) {
			alert("建议或要求的长度不能超过500！");
			return  false;
		}
		
		
	  return true;
	};
	

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		
		
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项，或者查看是否超出要求的长度！");
			return;
		}
		if (source_batchNo.indexOf($("#batchNo").val())<0 ) {
			alert("批架次填写有误，请排查！");
			return;
		} 
		if ($("#caseDesc").val()=='') {
			alert("情况简介不能为空！");
			return;
		} if ($("#advice").val() =='') {
				alert("建议或要求不能为空！");
				return;
				
		}if ($("#caseDesc").val().length>500) {
			alert("情况简介的长度不能超过500！");
			return;
		}
		if ($("#advice").val().length>500) {
			alert("建议或要求的长度不能超过500！");
			return;
		}
		
		
		
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$.ajax({
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
	
	function  downloadPdf(){
		   
	    var  pdfId = formId;
	   // alert(pdfId);
		var pdfUrl = "/HDKF/platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/downloadPdf?id="+pdfId;
		//alert(pdfUrl);
		//window.location.href = pdfUrl;//在原来窗体中打开页面用
		window.open(pdfUrl);
	}
	function downloadPdf(){
		   
	    var  pdfId = formId;
	   // alert(pdfId);platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation
		var pdfUrl = "platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/operation/downloadPdf?id="+pdfId;
		//alert(pdfUrl);
		//window.location.href = pdfUrl;//在原来窗体中打开页面用
		window.open(pdfUrl);
		}
	function openRequestDialog() {
		this.nData = new CommonDialog(
				"hdkfSupportInfo",
				"850",
				"500",
				"hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/HdkfSupportRequestInfoSelect",
				"客户选择", false, true, false);
		this.nData.show();
	}
	//求援请求编号回写
	function callBackDataRequest(data) {
		$("#hdkfSupportInfo").dialog("close");
		$("#requestId").val(data.id);
		$("#requestNo").val(data.requestNo);
		$("#kfUserId").val(data.requestManagerId);
		$("#kfUserName").val(data.requestManagerName);
		$("#requestUnit").val(data.requestUnitAlias);
		$("#requestMethod").combobox("select", data.requestMethod);
		$("#batchNo").val(data.batchNoAlias);
		$("#modelId").val(data.modelIdAlias);
		$("#productionUnit").val(data.productionUnit);
		$("#factoryTime").datebox('setValue',
				new Date(data.repairTime).format("yyyy-MM-dd"));
		$("#flightHours").val(data.flightHours);
		$("#flightLanding").val(data.flightLanding);
		$("#faultName").val(data.requestName);
		getStringRuleCode(data.id, data.modelIdAlias);
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
	
	function toRequestDetail(){
		if($("#onOffBtn").html()=='展开信息卡求援详情'){
		var id = $("#requestId").val();
		var value ="信息卡："+ $("#requestNo").val()+"求援详情";
		var url = "avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoDetailAsIframe.jsp?id=" + id;
		
		$("#iframeId").css('display','block');
		$("#iframeId").attr("src",url);
		$("#onOffBtn").html('收起信息卡求援详情');
		}else{
			$("#iframeId").css('display','none');
			$("#onOffBtn").html('展开信息卡求援详情');
		}
	}
	
	//页面加载完成后入口
	$(function() {
		//alert("kf.....");
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
		
	});
	//////////复制这块，完成长度验证
	$.extend($.fn.validatebox.defaults.rules, {
		maxLength : {
			validator : function(value, param) {
				return param[0] >= value.length;

			},
			message : '请输入最多 {0} 字符.'
		}
	});
	///////////
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

		<!-- 流程按钮区域开始 -->
		<div class=datagrid-toolbar>
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
				<a class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="downloadPdf();" href="javascript:void(0);">生成PDF</a>
		</div>
		
		<div style="margin:10px 5px 20px 10px">
			<span><a id="onOffBtn" onclick="toRequestDetail();"  href="javascript:void(0)" >展开信息卡求援详情</a></span>
			<iframe id="iframeId" width="99%" height="870" frameborder="0" style="display:none;margin-top:10px;">
        	</iframe>
		</div>

		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" readonly="readonly"
							name="requestId" id="requestId" disabled /> <input
							title="信息处理卡编号" class="easyui-validatebox" style="width: 180px;"
							type="text" readonly="readonly" name="requestNo" id="requestNo"
							onfocus="openRequestDialog();" disabled readonly /></td>
						<th align="right"><label>外场信息处理卡编号</label></th>
						<td><input title="外场信息处理卡编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="infoCardNo"
							id="infoCardNo" disabled readonly/></td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>处理单名称</label></th>
						<td><input title="处理单名称" class="easyui-validatebox" data-options="validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="dealName" id="dealName"  required="true"
							disabled /></td>
						<th align="right"><label>客服部经办人</label></th>
						<td><input title="客服部经办人" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="kfUserId" id="kfUserId"
							disabled /><input title="客服部经办人" class="easyui-validatebox"
							style="width: 180px;" type="text" readonly="readonly"
							name="kfUserName" id="kfUserName" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>求援单位</label></th>
						<td><input title="求援单位" class="easyui-validatebox"
							style="width: 180px;" type="text" readonly="readonly"
							name="requestUnit" id="requestUnit" disabled /></td>
						<th align="right"><label>求援方式</label></th>
						<td>
							<select id="requestMethod" readonly="readonly"
							class="easyui-combobox"
							data-options="valueField:'lookupCode',textField:'lookupName',fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
							name="requestMethod" disabled>
							</select>
						</td>
					</tr>
					<tr>
						<th align="right"><label>批架次</label></th>
						<td><input title="批架次" class="easyui-validatebox"
							style="width: 180px;" type="text" readonly="readonly"
							name="batchNo" id="batchNo" disabled /></td>
						<th align="right"><label>机型</label></th>
						<td><input title="机型" class="easyui-validatebox"
							style="width: 180px;" type="text"
							name="modelId" id="modelId" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>生产单位</label></th>
						<td><input title="生产单位" class="easyui-validatebox"
							style="width: 180px;" type="text" readonly="readonly"
							name="productionUnit" id="productionUnit" disabled /></td>
						<th align="right"><label>出厂时间</label></th>
						<td><input title="出厂时间" class="easyui-datebox"
							style="width: 180px;" type="text" readonly="readonly"
							name="factoryTime" id="factoryTime" disabled /></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>飞行小时</label></th> -->
<!-- 						<td><input title="飞行小时" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" readonly="readonly" -->
<!-- 							name="flightHours" id="flightHours" disabled /></td> -->
<!-- 						<th align="right"><label>飞机起落</label></th> -->
<!-- 						<td><input title="飞机起落" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" readonly="readonly" -->
<!-- 							name="flightLanding" id="flightLanding" disabled /></td> -->
<!-- 					</tr> -->
					<tr>
						<th align="right"><label>问题故障名称</label></th>
						<td><input title="问题故障名称" class="easyui-validatebox"
							style="width: 180px;" type="text" readonly="readonly"
							name="faultName" id="faultName" disabled /></td>
						<th align="right"><span class="remind">*</span><label>承办部门</label></th>
						<td><input title="承办部门" class="easyui-validatebox"
							style="width: 180px;" type="hidden" readonly="readonly"
							name="dealDepartId" id="dealDepartId" disabled /> <input
							title="承办部门" class="easyui-validatebox" style="width: 180px;"
							type="text" readonly="readonly" name="dealDepartName"  required="true"
							id="dealDepartName" disabled />
						</td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>情况简介</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="情况简介" rows="5"
									data-options="validType:'maxLength[2000]'"
									class="textareabox" name="caseDesc" id="caseDesc"
									style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>建议或要求</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="建议或要求" rows="5"
									data-options="validType:'maxLength[1024]'"
									class="textareabox" name="advice" id="advice"
									style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
<!-- 		<fieldset> -->
<!-- 			<legend>附件</legend> -->
<!-- 			<div class="formExtendBase"> -->
<!-- 				<div class="column" style="height: 130px;"> -->
<%-- 					<jsp:include --%>
<%-- 						page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp"> --%>
<%-- 						<jsp:param value="1024MB" name="file_size_limit" /> --%>
<%-- 						<jsp:param value="*.*" name="file_types" /> --%>
<%-- 						<jsp:param value="10" name="file_upload_limit" /> --%>
<%-- 						<jsp:param value="false" name="save_type" /> --%>
<%-- 						<jsp:param value="<%=formId%>" name="form_id" /> --%>
<%-- 						<jsp:param value="<%=entryId%>" name="entryId" /> --%>
<%-- 						<jsp:param value="<%=executionId%>" name="executionId" /> --%>
<%-- 						<jsp:param value="pm_project" name="form_code" /> --%>
<%-- 						<jsp:param value="id" name="form_field" /> --%>
<%-- 						<jsp:param value="process" name="allowAdd" /> --%>
<%-- 						<jsp:param value="true" name="allowDel" /> --%>
<%-- 						<jsp:param value="true" name="cleanOnExit" /> --%>
<%-- 						<jsp:param value="PLATFORM_FILE_SECRET_LEVEL" name="secret_level" /> --%>
<%-- 					</jsp:include> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</fieldset> -->
	<div style="width: 98%; margin-left: 10px; margin-right: 20px;margin-top:10px;"> 
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="<%=formId%>" />
			<jsp:param name="form_code" value="hdkfSupportOutfieldCard" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
		</div>
		<div id="idea"></div>
	</div>
</body>
</html>