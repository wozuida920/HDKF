<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>edittree</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" />
			<table class="form_commonTable">
				<tr>


					<th width="10%"><span class="remind">*</span> 父ID:</th>
					<td width="40%"><input title="父ID" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="pid" id="pid" /></td>

					<th width="10%"><span class="remind">*</span> 目录编码:</th>
					<td width="40%"><input title="目录编码" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="catalogCode"
						id="catalogCode" /></td>
				</tr>
				<tr>

					<th width="10%"><span class="remind">*</span> 目录名称:</th>
					<td width="40%"><input title="目录名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="catalogName"
						id="catalogName" /></td>

					<th width="10%">顺序号:</th>
					<td width="40%"><input title="顺序号"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="sequenceNum" id="sequenceNum" /></td>
				</tr>
				<tr>

					<th width="10%">是否有效:</th>
					<td width="40%"><pt6:syslookup name="isValid"
							lookupCode="PLATFORM_VALID_FLAG"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>

					<th width="10%">目录级别:</th>
					<td width="40%"><input title="目录级别" class="easyui-validatebox"
						data-options="validType:'maxLength[1]'" style="width: 180px;"
						type="text" name="catalogLevel" id="catalogLevel" /></td>
				</tr>
				<tr>

					<th width="10%">单位类别:</th>
					<td width="40%"><pt6:syslookup name="catalogType"
							lookupCode="CSMP_BD_COMPANY_TYPE"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>

					<th width="10%">备注:</th>
					<td width="40%"><input title="备注" class="easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="remark" id="remark" /></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			
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
			parent.csmpBdCompanystructure.closeDialog("#insert");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
		csmpBdCompanystructure.save(serializeObject($('#form')),
					'${url}', '#insert', '${id}');
		}
	</script>
</body>
</html>