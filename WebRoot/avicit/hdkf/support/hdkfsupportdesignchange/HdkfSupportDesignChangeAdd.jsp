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
<!-- ControllerPath = "hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController/operation/Add/null" -->
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



					<th width="10%">外场信息处理卡编号:</th>
					<td width="40%">
					<input type="hidden" id="attribute01" name="attribute01" value="${outCardId}"></input>
					
					<input title="外场信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[40]'" style="width: 180px;"
						type="text" name="infoCardNo" id="infoCardNo" value="${infoCardNo}" readOnly/></td>

					<th width="10%">是否更改单标志:</th>
					<td width="40%"><pt6:syslookup name="beforeFlag" isNull="true"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="disabled:true,width:180,editable:false,panelHeight:'auto'" >
						</pt6:syslookup></td>
				</tr>
				<tr>

					<th width="10%">更改之后标志:</th>
					<td width="40%"><pt6:syslookup name="afterFlag" isNull="true"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="disabled:true,width:180,editable:false,panelHeight:'auto'" >
						</pt6:syslookup></td>

					<th width="10%">操作人</th>
					<td width="40%"><input title="操作人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="operateUserId" id="operateUserId" value="${userId}"  readOnly/>
						<input title="操作人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="operateUserName" id="operateUserName"  value="${CURRENT_LOGINUSER.name}"  readOnly/>
						</td>
				</tr>
				<tr>

					<th width="10%"><remind>*</remind>变更时间:</th>
					<td width="40%"><input title="变更时间" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="changeTime" id="changeTime"  required="true" /></td>
				</tr>
				<tr>

					<th width="10%"><remind>*</remind>变更理由:</th>
					<td  colspan="5" align="left" style="padding-left: 3px">
					<textarea rows="6"
						data-options="required:true,validType:'maxLength[1000]'" 
						class="textareabox" name="changeReason" id="changeReason"  
						style="resize:none" required="true"></textarea>
						
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
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		$(function() {
			
			var beforeFlag="${designFlag}";
			var afterFlag="${afterChangeFlag}";
			$("#beforeFlag").combobox('setValue',beforeFlag);
			$("#afterFlag").combobox('setValue',afterFlag); 
			
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
		function closeForm() {
			parent.hdkfSupportOutfieldCard.closeDialog("#changeDesign");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				alert("请检查必填项！");
				return;
			}
			if($("#changeReason").val()==''){
				alert("变更理由，不能为空！");
				return;
			}
			if($("#changeReason").val().length>1000){
				alert("变更理由长度，不能大于1000！");
				return;
			}
			$('#saveButton').linkbutton('disable').unbind("click");
			saveChange(serializeObject($('#form')),
					"#change");
		}
		//保存功能
		function saveChange(form,id){
			//var _self = this;
			var curUrl = "platform/hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController/operation/";
			$.ajax({
				 url:curUrl+"save",
				 data : {data :JSON.stringify(form)},
				 type : 'post',
				 
				 dataType : 'json',
				 success : function(r){
					 if (r.flag == "success"){
						
						// $(id).dialog('close');
					//	alert("close");
					
						parent.hdkfSupportOutfieldCard.reLoad();
					    parent.hdkfSupportOutfieldCard._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
						parent.hdkfSupportOutfieldCard.closeDialog("#changeDesign");
						//alert("close end");
						$.messager.show({
							 title : '提示',
							 msg : '保存成功！'
						 });
					 }else{
						 $.messager.show({
							 title : '提示',
							 msg : r.error
						});
					 } 
				 }
			 });
		}
		
	</script>
</body>
</html>