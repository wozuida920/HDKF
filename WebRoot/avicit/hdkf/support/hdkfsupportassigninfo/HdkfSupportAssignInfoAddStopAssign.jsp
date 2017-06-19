<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");
	java.util.Date currentTime = new java.util.Date();
	String time = simpleDateFormat.format(currentTime).toString();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoController/operation/Edit/id" -->
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
			<input type="hidden" name="version"
				value='${hdkfSupportAssignInfoDTO.version}' /> <input type="hidden"
				name="id" value='${hdkfSupportAssignInfoDTO.id}' />
			<table class="form_commonTable">
				<tr>
				<th width="10%"><span class="remind">*</span>委托状态:</th>
				<td width="40%"><pt6:syslookup name="suspendFlag"
				defaultValue='N' lookupCode="SUPPORT_ASSIGN_STATUS"
				dataOptions="width:180,editable:false,disabled:true,panelHeight:'auto'">
				</pt6:syslookup></td>
						
					<th width="10%"><span class="remind">*</span>中止委托日期:</th>
					<td width="30%"><input title="中止委托日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="suspendDate" id="suspendDate" required="true" value="<%=time%>"/></td>
					</tr>
					
					<tr>
				<th width="5%"><span class="remind">*</span>中止委托理由:</th>
					<td colspan="5" style="padding-left: 3px">
					<textarea data-options="required:true,validType:'maxLength[4000]'"
					name="suspendReason" id="suspendReason" rows="12" class="textareabox"
				    style="resize: none"></textarea>
					</td>
	
				</tr>
				<tr>
				</tr>
			</table>
		</form>

	</div>
	<div data-options="region:'south',border:false" style="height: 40px;">
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="确认中止" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">确认中止</a> <a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules, {    
        maxLength: {    
            validator: function(value, param){    
                return param[0] >= value.length;
                
            },    
            message: '请输入最多 {0} 字符.'   
        }    
    });  
	$(function(){
																																				if(!"${hdkfSupportAssignInfoDTO.assignStartDate}"==""){
					$('#assignStartDate').datebox('setValue', parserColumnTime("${hdkfSupportAssignInfoDTO.assignStartDate}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfSupportAssignInfoDTO.assignEndDate}"==""){
					$('#assignEndDate').datebox('setValue', parserColumnTime("${hdkfSupportAssignInfoDTO.assignEndDate}").format("yyyy-MM-dd"));
				}
																											if(!"${hdkfSupportAssignInfoDTO.suspendDate}"==""){
					$('#suspendDate').datebox('setValue', parserColumnTime("${hdkfSupportAssignInfoDTO.suspendDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																																})
	function closeForm(){
		parent.hdkfSupportAssignInfo.closeDialog("#insert");
	}
	function saveForm(){
	    if ($('#form').form('validate') == false) {
            return;
        }
		if ($("#suspendReason").val() =='') {
			alert("中止理由不能为空！");
			return;
		}
		if ($("#suspendReason").val().length>2000) {
			alert("中止理由长度不能超过2000！");
			return;
		}
	    
	    
	$('#saveButton').linkbutton('disable').unbind("click");
		parent.hdkfSupportAssignInfo.save(serializeObject($('#form')),"#insert");
	}
	</script>
</body>
</html>