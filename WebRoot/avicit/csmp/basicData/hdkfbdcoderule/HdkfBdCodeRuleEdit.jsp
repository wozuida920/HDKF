<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/Edit/id" -->
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
			<input type="hidden" name="id" value='${hdkfBdCodeRuleDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%">编码类型:</th>
					<td width="40%"><pt6:syslookup name="codeType"
							lookupCode="SUPPORT_CODE_TYPE"
							defaultValue='${hdkfBdCodeRuleDTO.codeType}'
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">机型编码:</th>
					<td width="40%"><input title="机型编码"
						class="inputbox easyui-validatebox "
						data-options="required:true,validType:'maxLength[200]'" style="width: 180px;"
						type="text" name="attribute01" id="attribute01"
						value='<c:out value='${hdkfBdCodeRuleDTO.attribute01}'/>'
						onfocus="openDialogModelNum();" /></td>
				</tr>
				<tr>
					<th width="10%">机型代码:</th>
					<td width="40%"><input title="机型代码"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="planeCode" id="planeCode"
						value='<c:out value='${hdkfBdCodeRuleDTO.planeCode}'/>' /></td>
					<th width="10%">当前年份:</th>
					<td width="40%"><input title="当前年份"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[10]'" style="width: 180px;"
						type="text" name="curYear" id="curYear"
						value='<c:out value='${hdkfBdCodeRuleDTO.curYear}'/>' /></td>
				</tr>
				<tr>
					<th width="10%">当前最大编码:</th>
					<td width="40%"><input title="当前最大编码"
						class="easyui-numberbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="maxNo" id="maxNo"
						value='${hdkfBdCodeRuleDTO.maxNo}' /></td>
					<th width="10%">序列号位数:</th>
					<td width="40%"><input title="序列号位数"
						class="easyui-numberbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="serialnoCount" id="serialnoCount"
						value='${hdkfBdCodeRuleDTO.serialnoCount}' /></td>
				</tr>
			</table>
		</form>
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="保存" id="saveButton"
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
		})
		function closeForm() {
			parent.hdkfBdCodeRule.closeDialog("#edit");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.hdkfBdCodeRule.save(serializeObject($('#form')), "#edit");
		}
		
		function openDialogModelNum() {
			this.nData = new CommonDialog(
					"mode120",
					"790",
					"600",
					"csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/HdkfBdCodeRuleSelect",
					"机型编码选择", false, true, false);
			this.nData.show();
		}
		function callBackDataRequest(data) {
			$("#mode120").dialog("close");
			$("#attribute01").val(data.modelNum);

		}
	</script>
</body>
</html>