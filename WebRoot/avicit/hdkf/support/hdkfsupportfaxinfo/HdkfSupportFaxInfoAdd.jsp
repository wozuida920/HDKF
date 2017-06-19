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
<!-- ControllerPath = "hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/operation/Add/null" -->
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
					<th width="10%">处理单名称:</th>
					<td width="40%"><input title="请求处理ID"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="requestDealId" id="requestDealId" /><input
						title="处理单名称" class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="dealName" id="dealName"
						onclick="openDealByKfDialog()" readonly="readonly" /></td>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="requestId" id="requestId" /><input
						title="信息处理卡编号" class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo" readonly="readonly" /></td>
				</tr>
				<tr>
					<th width="10%">传真编号:</th>
					<td width="40%"><input title="传真编号"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="faxNo" id="faxNo" readonly="readonly" /></td>
					<th width="10%">我方地址:</th>
					<td width="40%"><input title="我方地址"
						class="inputbox easyui-validatebox" value="中国南昌新溪桥"
						data-options="required:true,validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="fromAddr" id="fromAddr" /></td>
				</tr>
				<tr>
					<th width="10%">我方邮编:</th>
					<td width="40%"><input title="我方邮编"
						class="inputbox easyui-validatebox" value="330024"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="fromZipcode" id="fromZipcode" /></td>
					<th width="10%">我方英语地址:</th>
					<td width="40%"><input title="我方英语地址"
						class="inputbox easyui-validatebox" value="ADD.Xinxiqiao,330024Nanchang,P.R.China"
						data-options="required:true,validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="fromEnAddr" id="fromEnAddr" /></td>
				</tr>
				<tr>
					<th width="10%">我方电话（86-0791）:</th>
					<td width="40%"><input title="请输入我方电话，格式为：XXXXXXXX"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" missingMessage="请输入我方电话，格式为：XXXXXXXX" style="width: 180px;"
						type="text" name="fromTel" id="fromTel" /></td>
					<th width="10%">我方传真（86-0791）:</th>
					<td width="40%"><input title="请输入我方传真，格式为：XXXXXXXX"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" missingMessage="请输入我方传真，格式为：XXXXXXXX" style="width: 180px;"
						type="text" name="fromFax" id="fromFax" /></td>
				</tr>
				<tr>
					<th width="10%">发送人:</th>
					<td width="40%"><input title="{param.field.comment}"
						class="inputbox" style="width: 180px;" type="hidden"
						name="fromUser" id="fromUser" />
						<div class="">
							<input class="easyui-validatebox" name="fromUserAlias"
								data-options="required:true,validType:'maxLength[50]'"
								id="fromUserAlias" readOnly="readOnly" style="width: 179px;"></input>
						</div></td>
					<th width="10%">发送日期:</th>
					<td width="40%"><input title="发送日期" class="easyui-datebox"
						data-options="required:true,editable:false" style="width: 182px;" type="text" name="sendDate"
						id="sendDate" /></td>
				</tr>
				<tr>
					<th width="10%">传真页数:</th>
					<td width="40%"><input title="传真页数"
						class="easyui-numberbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="faxPages" id="faxPages" /></td>
					<th width="10%">发往单位:</th>
					<td width="40%"><input title="发往单位"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="toUuit" id="toUuit" /></td>
				</tr>
				<tr>
					<th width="10%">发往单位传真号:</th>
					<td width="40%"><input title="发往单位传真号"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="toFax" id="toFax" /></td>
					<th width="10%">接收人:</th>
					<td width="40%"><input title="接收人"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[25]'" style="width: 180px;"
						type="text" name="toUser" id="toUser" /></td>
				</tr>
<!-- 				<tr>
					<th width="10%">传真内容:</th>
					<td width="40%" colspan="3">
						<div style="width: 99%;">
							<textarea title="传真内容" rows="5"
								data-options="required:true,validType:'maxLength[250]'" class="textareabox"
								name="faxContent" id="faxContent" style="resize: none"></textarea>
						</div>
					</td>
				</tr> -->
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
			<jsp:param name="form_code" value="hdkfsupportoutfieldcard" />
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
			var fromUserUserCommonSelector = new CommonSelector("user",
					"userSelectCommonDialog", "fromUser", "fromUserAlias");
			fromUserUserCommonSelector.init();
		});
		function closeForm() {
			parent.hdkfSupportFaxInfo.closeDialog("#insert");
		}
		//是否含有中文（也包含日文和韩文）
		function isChineseChar(str){   
		   var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
		   return reg.test(str);
		}
		//同理，是否含有全角符号的函数
		function isFullwidthChar(str){
		   var reg = /[\uFF00-\uFFEF]/;
		   return reg.test(str);
		}
		//验证邮编格式
		function validateZipCode(str){
			var reg = /^[1-9][0-9]{5}$/;
			return reg.test(str);
		}
		function validateFromTel(str){
			var reg = /^\d{8}$/;
			return reg.test(str);
		}
		function saveForm() {

			if ($('#form').form('validate') == false) {
				return;
			}
			if($("#fromZipcode").val() != ''){
				var fromZipcodeVal = $("#fromZipcode").val().trim();
				if(isChineseChar(fromZipcodeVal) || isFullwidthChar(fromZipcodeVal) || !validateZipCode(fromZipcodeVal)){
					alert("邮编格式不正确！");
					return;
				}
			}
			if($("#fromEnAddr").val() != ''){
				var fromEnAddrVal = $("#fromEnAddr").val().trim();
				
			    if(isChineseChar(fromEnAddrVal) || isFullwidthChar(fromEnAddrVal)){
              	  alert("英语地址不能包含中文或者全角符号，请检查！");
              	  return;
                }
			}
			if($('#fromTel').val() != ''){
				var fromTelVal = $('#fromTel').val().trim();
				if(isChineseChar(fromTelVal) || isFullwidthChar(fromTelVal)){
              	  alert("电话号码不能包含中文或者全角符号，请检查！");
              	  return;
                }else if(!validateFromTel(fromTelVal)){
                	alert("电话号码格式不正确！");
                	  return;
                }
			}
			if($("#fromFax").val() !=''){
				var fromFaxVal = $("#fromFax").val().trim();
				
			    if(isChineseChar(fromFaxVal) || isFullwidthChar(fromFaxVal)){
              	  alert("传真号码不能包含中文或者全角符号，请检查！");
              	  return;
                }else if(!validateFromTel(fromFaxVal)){
                	alert("传真号码格式不正确！");
              	  return;
              }
			}
			if($("#toFax").val() !=''){
				var toFaxVal = $("#toFax").val().trim();
				
			    if(isChineseChar(toFaxVal) || isFullwidthChar(toFaxVal)){
              	  alert("传真号码不能包含中文或者全角符号，请检查！");
              	  return;
                }
			}
// 			if ($("#faxContent").val() == '') {
// 				alert("传真内容不能为空！");
// 				return;
// 			}
			
			if ($("#toUuit").val().length>50) {
				alert("发往单位的长度不能超过50！");
				return;
			}
			if ($("#toFax").val().length>50) {
				alert("发往单位传真号的长度不能超过50！");
				return;
			}
			if ($("#toUser").val().length>25) {
				alert("接收人的长度不能超过25！");
				return;
			}
// 			if ($("#faxContent").val().length>250) {
// 				alert("传真内容的长度不能超过250！");
// 				return;
// 			}
			
			
			$('#saveButton').linkbutton('disable').unbind("click");
			parent.hdkfSupportFaxInfo.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
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
			$.ajax({
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
	</script>
</body>
</html>