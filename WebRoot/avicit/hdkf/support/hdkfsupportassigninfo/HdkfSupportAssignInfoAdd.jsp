<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoController/operation/Add/null" -->
<title>添加</title>
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
			<input type="hidden" name="id" />
			<table class="form_commonTable">
				<tr>



					<th width="10%">委托人ID:</th>
					<td width="40%"><input title="委托人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="assignUserId" id="assignUserId" /></td>

					<th width="10%">委托人:</th>
					<td width="40%"><input title="委托人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="assignUserName" id="assignUserName" /></td>
				</tr>
				<tr>

					<th width="10%">受托人ID:</th>
					<td width="40%"><input title="受托人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="assignedUserId" id="assignedUserId" /></td>

					<th width="10%">受托人:</th>
					<td width="40%"><input title="受托人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="assignedUserName" id="assignedUserName" /></td>
				</tr>
				<tr>

					<th width="10%">委托开始日期:</th>
					<td width="40%"><input title="委托开始日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="assignStartDate" id="assignStartDate" /></td>

					<th width="10%">委托结束日期:</th>
					<td width="40%"><input title="委托结束日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="assignEndDate" id="assignEndDate" /></td>
				</tr>
				<tr>

					<th width="10%">委托理由:</th>
					<td width="40%"><input title="委托理由"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[4000]'" style="width: 180px;"
						type="text" name="assignReason" id="assignReason" /></td>

					<th width="10%">是否中止委托:</th>
					<td width="40%"><pt6:syslookup name="suspendFlag"
							isNull="true" lookupCode="SUPPORT_ASSIGN_STATUS"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>

					<th width="10%">中止委托理由:</th>
					<td width="40%"><input title="中止委托理由"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[4000]'" style="width: 180px;"
						type="text" name="suspendReason" id="suspendReason" /></td>

					<th width="10%">中止委托日期:</th>
					<td width="40%"><input title="中止委托日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="suspendDate" id="suspendDate" /></td>
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
        maxLength: {    
            validator: function(value, param){    
                return param[0] >= value.length;
                
            },    
            message: '请输入最多 {0} 字符.'   
        }    
    });  
	$(function(){
																																																																																																																																																																																																																																																																																										/* var userCommonSelector = new CommonSelector("user","userSelectCommonDialog","userName","userNameName");
		userCommonSelector.init();  */
		//选择部门
		/* var deptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","userName","userNameName");
	    deptCommonSelector.init();  */
	    //选择角色
	    /* var roleCommonSelector = new CommonSelector("role","roleSelectCommonDialog","userName","userNameName",null,null,null);
	    roleCommonSelector.init();  */ 
	   /*  //选择群组
	    var groupCommonSelector = new CommonSelector("group","groupSelectCommonDialog","userName","userNameName",null,null,null);
	    groupCommonSelector.init(); 
	    //选择岗位
	    var positionCommonSelector = new CommonSelector("position","positionSelectCommonDialog","userName","userNameName");
	    positionCommonSelector.init();  */
	});
	function closeForm(){
		parent.hdkfSupportAssignInfo.closeDialog("#insert");
	}
	function saveForm(){
	    if ($('#form').form('validate') == false) {
            return;
        }
	$('#saveButton').linkbutton('disable').unbind("click");
		parent.hdkfSupportAssignInfo.save(serializeObject($('#form')),"#insert");
	}
	</script>
</body>
</html>