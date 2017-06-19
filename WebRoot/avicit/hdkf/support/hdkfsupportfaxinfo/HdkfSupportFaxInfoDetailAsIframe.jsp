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
	String parameter = request.getParameter("parameter");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/operation/Detail/id" -->
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
	//parameter为1时，代表拟稿人，2代表其他审批人员
	if (parameter == 1) {
		$("#dealName").removeAttr("disabled");
		$("#faxContent").removeAttr("disabled");
	} else {
		$("#dealName").removeAttr("onclick");
	}

	$(function() {
		if (!"${hdkfSupportFaxInfoDTO.sendDate}" == "") {
			$('#sendDate').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportFaxInfoDTO.sendDate}")
							.format("yyyy-MM-dd"));
		}
		var fromUserUserCommonSelector = new CommonSelector("user",
				"userSelectCommonDialog", "fromUser", "fromUserAlias");
		fromUserUserCommonSelector.init();
	});

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportFaxInfo.sendDate = formatDatebox(result.hdkfSupportFaxInfo.sendDate);
							$("#formDetail").form('load',
									result.hdkfSupportFaxInfo);
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}

	//是否含有中文（也包含日文和韩文）
	function isChineseChar(str) {
		var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
		return reg.test(str);
	}
	//同理，是否含有全角符号的函数
	function isFullwidthChar(str) {
		var reg = /[\uFF00-\uFFEF]/;
		return reg.test(str);
	}
	//验证邮编格式
	function validateZipCode(str) {
		var re = /^[1-9][0-9]{5}$/;
		return re.test(str);
	}

	window.beforeSubmit = function(_entryId, _executionId,
			_currentActivityName, _targetActivityName, _formId) {
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项！");
			return false;
		}
		if ($("#fromZipcode").val() != '') {
			var fromZipcodeVal = $("#fromZipcode").val();
			if (isChineseChar(fromZipcodeVal)
					|| isFullwidthChar(fromZipcodeVal)
					|| !validateZipCode(fromZipcodeVal)) {
				alert("邮编格式不正确！");
				return false;
			}
		}
		if ($("#fromEnAddr").val() != '') {
			var fromEnAddrVal = $("#fromEnAddr").val();

			if (isChineseChar(fromEnAddrVal) || isFullwidthChar(fromEnAddrVal)) {
				alert("英语地址不能包含中文或者全角符号，请检查！");
				return false;
			}
		}
		if ($('#fromTel').val() != '') {
			var fromTelVal = $('#fromTel').val();
			if (isChineseChar(fromTelVal) || isFullwidthChar(fromTelVal)) {
				alert("电话号码不能包含中文或者全角符号，请检查！");
				return false;
			}
		}
		if ($("#fromFax").val() != '') {
			var fromFaxVal = $("#fromFax").val();

			if (isChineseChar(fromFaxVal) || isFullwidthChar(fromFaxVal)) {
				alert("传真号码不能包含中文或者全角符号，请检查！");
				return false;
			}
		}
		if ($("#toFax").val() != '') {
			var toFaxVal = $("#toFax").val();

			if (isChineseChar(toFaxVal) || isFullwidthChar(toFaxVal)) {
				alert("传真号码不能包含中文或者全角符号，请检查！");
				return false;
			}
		}
		if ($("#faxContent").val() == '') {
			alert("传真内容不能为空！");
			return false;
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
			alert("请检查必填项！");
			return;
		}
		if ($("#fromZipcode").val() != '') {
			var fromZipcodeVal = $("#fromZipcode").val();
			if (isChineseChar(fromZipcodeVal)
					|| isFullwidthChar(fromZipcodeVal)
					|| !validateZipCode(fromZipcodeVal)) {
				alert("邮编格式不正确！");
				return;
			}
		}
		if ($("#fromEnAddr").val() != '') {
			var fromEnAddrVal = $("#fromEnAddr").val();

			if (isChineseChar(fromEnAddrVal) || isFullwidthChar(fromEnAddrVal)) {
				alert("英语地址不能包含中文或者全角符号，请检查！");
				return;
			}
		}
		if ($('#fromTel').val() != '') {
			var fromTelVal = $('#fromTel').val();
			if (isChineseChar(fromTelVal) || isFullwidthChar(fromTelVal)) {
				alert("电话号码不能包含中文或者全角符号，请检查！");
				return;
			}
		}
		if ($("#fromFax").val() != '') {
			var fromFaxVal = $("#fromFax").val();

			if (isChineseChar(fromFaxVal) || isFullwidthChar(fromFaxVal)) {
				alert("传真号码不能包含中文或者全角符号，请检查！");
				return;
			}
		}
		if ($("#toFax").val() != '') {
			var toFaxVal = $("#toFax").val();

			if (isChineseChar(toFaxVal) || isFullwidthChar(toFaxVal)) {
				alert("传真号码不能包含中文或者全角符号，请检查！");
				return;
			}
		}
		if ($("#faxContent").val() == '') {
			alert("传真内容不能为空！");
			return;
		}
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/operation/save',
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
	//打开客服部处理选择页面
	function openDealByKfDialog() {
		this.nData = new CommonDialog(
				"model4",
				"790",
				"600",
				"hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/HdkfSupportDealByKfSelect",
				"信息卡处理信息选择", false, true, false);
		this.nData.show();
	};
	function setDealByKfData(data) {
		$("#model4").dialog("close");

		$("#requestDealId").val(data.id);
		$("#dealName").val(data.dealName);
		$("#requestId").val(data.requestId);
		$("#requestNo").val(data.requestNo);

		getStringRuleCode(data.requestId);
	};

	function getStringRuleCode(requestId, modelId) {
		$
				.ajax({
					url : "platform/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/getStringRuleCode.json",
					data : {
						type : "D",
						requestId : requestId
					},
					type : "post",
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							$("#faxNo").val(result.ruleCode);
						}
					}
				});
	}
	function downloadPdf() {
		/* var pdfId = formId;
		alert(pdfId);
		var pdfUrl = "/HDKF/platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/downloadPdf?id="+pdfId;
		window.open(pdfUrl); */
	}
	function toRequestDetail2() {

		if ($("#onOffBtn2").html() == '展开客服部处理单详情') {
			var id = $("#requestDealId").val();
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
	});
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

	

		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>处理单名称</label></th>
						<td><input title="请求处理ID" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="hidden" name="requestDealId"
							id="requestDealId" /><input title="处理单名称"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="dealName" id="dealName"
							data-options="required:true,validType:'maxLength[100]'"
							onclick="openDealByKfDialog();" readonly="readonly" disabled /></td>
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="hidden" name="requestId"
							id="requestId" disabled /><input title="信息处理卡编号"
							class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="requestNo" id="requestNo"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<th align="right"><label>传真编号</label></th>
						<td><input title="传真编号" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="faxNo" id="faxNo"
							readonly="readonly" disabled /></td>
						<th align="right"><label>我方地址</label></th>
						<td><input title="我方地址" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="fromAddr" id="fromAddr"
							disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>我方邮编</label></th>
						<td><input title="我方邮编" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="fromZipcode"
							id="fromZipcode" disabled /></td>
						<th align="right"><label>我方英语地址</label></th>
						<td><input title="我方英语地址" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="fromEnAddr"
							id="fromEnAddr" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>我方电话</label></th>
						<td><input title="我方电话" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="fromTel" id="fromTel"
							disabled /></td>
						<th align="right"><label>我方传真</label></th>
						<td><input title="我方传真" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="fromFax" id="fromFax"
							disabled /></td>
					</tr>
					<tr>
						<th width="10%"><label>发送人</label></th>
						<td width="40%"><input title="{param.field.comment}"
							class="inputbox" style="width: 180px;" type="hidden"
							name="fromUser" id="fromUser" />
							<div class="">
								<input class="easyui-validatebox" name="fromUserAlias"
									data-options="required:true,validType:'maxLength[50]'"
									id="fromUserAlias" readOnly="readOnly" style="width: 179px;"></input>
							</div></td>
						<th align="right"><label>发送日期</label></th>
						<td><input title="发送日期" class="easyui-datebox"
							data-options="required:true" style="width: 180px;" type="text"
							name="sendDate" id="sendDate" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>传真页数</label></th>
						<td><input title="传真页数"
							class="easyui-numberbox easyui-validatebox"
							data-options="required:true,validType:'maxLength[22]'"
							style="width: 180px;" type="text" name="faxPages" id="faxPages"
							disabled /></td>
						<th align="right"><label>发往单位</label></th>
						<td><input title="发往单位" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'"
							style="width: 180px;" type="text" name="toUuit" id="toUuit"
							disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>发往单位传真号</label></th>
						<td><input title="发往单位传真号" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="toFax" id="toFax"
							disabled /></td>
						<th align="right"><label>接收人</label></th>
						<td><input title="接收人" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="toUser" id="toUser"
							disabled /></td>
					</tr>
<!-- 					<tr>
						<th align="right"><label>传真内容</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="传真内容" rows="5"
									data-options="required:true,validType:'maxLength[4000]'"
									class="textareabox" name="faxContent" id="faxContent"
									style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr> -->
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