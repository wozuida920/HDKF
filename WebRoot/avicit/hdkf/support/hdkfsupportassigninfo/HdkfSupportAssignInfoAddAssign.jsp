<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
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
				<th width="10%"><span class="remind">*</span>委托状态:</th>
				<td width="40%"><pt6:syslookup name="suspendFlag"
				defaultValue='Y' lookupCode="SUPPORT_ASSIGN_STATUS"
				dataOptions="width:180,editable:false,disabled:true,panelHeight:'auto'">
				</pt6:syslookup></td>
				</tr>
				<tr>



<!-- 					<th width="10%">委托人ID:</th>
					<td width="40%"><input title="委托人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="assignUserId" id="assignUserId" /></td> -->

					<th width="10%"><span class="remind">*</span>委托人:</th>
					<td width="40%"><input title="委托人"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="assignUserName" id="assignUserName" value="${CURRENT_LOGINUSER.name}" /></td>
<!-- 				</tr>
				<tr> -->

<!-- 					<th width="10%">受托人ID:</th>
					<td width="40%"><input title="受托人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="assignedUserId" id="assignedUserId" /></td> -->

					<th width="10%"><span class="remind">*</span>受托人:</th>
					<td width="40%"><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="assignedUser" id="assignedUser" />
						<div class="">
							<input class="easyui-validatebox" name="assignedUserName"
								id="assignedUserName" readOnly="readOnly" style="width: 179px;"></input>
						</div></td>
<!-- 					
					<td width="40%"><input title="受托人"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="assignedUserName" id="assignedUserName" /></td> -->
				</tr>
				<tr>

					<th width="10%"><span class="remind">*</span>委托开始时间:</th>
					<td width="40%"><input title="委托开始日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="assignStartDate" id="assignStartDate" required="true" value="<%=time%>"/></td>

					<th width="10%"><span class="remind">*</span>委托结束时间:</th>
					<td width="40%"><input title="委托结束日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="assignEndDate" id="assignEndDate" required="true" /></td>
				</tr>
				<tr>

					<th width="10%"><span class="remind">*</span>委托理由:</th>
					<td colspan="5" style="padding-left: 3px">
					<textarea		
					data-options="required:true,validType:'maxLength[4000]'"
					name="assignReason" id="assignReason" rows="7" class="textareabox"
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
					<td width="50%" align="right"><a title="确认委托" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">确认委托</a> <a title="返回" id="returnButton"
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
/* 		var contactsUserCommonSelector = new CommonSelector("user",
				"userSelectCommonDialog", "contacts", "contactsAlias");
		contactsUserCommonSelector.init(); */
		var assignedUserNameCommonSelector = new CommonSelector("user","userSelectCommonDialog","assignedUserName","assignedUserName");
		assignedUserNameCommonSelector.init();
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
	    	alert("请检查表单相关项，输入是否为空！");
            return;
        }
		if ($("#assignedUserName").val() =='') {
			alert("受托人不能为空！");
			return;
		}
      	if($("#assignEndDate").datebox('getValue')<$("#assignStartDate").datebox('getValue'))
    	{
   	    	alert("委托结束时间不能小于委托开始时间，请检查！");
			return;
    	}
		
		
		if ($("#assignReason").val() =='') {
			alert("委托理由不能为空！");
			return;
		}
		if ($("#assignReason").val().length>2000) {
			alert("委托理由长度不能超过2000！");
			return;
		}
	    
	$('#saveButton').linkbutton('disable').unbind("click");
		parent.hdkfSupportAssignInfo.save(serializeObject($('#form')),"#insert");
	}
	</script>
</body>
</html>