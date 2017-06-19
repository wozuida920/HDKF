<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>treedemo</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>

<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form' class='form'>
			<input type="hidden" name='id' id='id'
				value='${csmpBdCompanystructureDTO.id}' />

			<table class="form_commonTable">
				<tr>
					<th width="10%"><span class="remind">*</span> 父ID:</th>
					<td width="40%"><input title="父ID" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="pid" id="pid"
						value='<c:out value='${csmpBdCompanystructureDTO.pid}'/>' /></td>
					<th width="10%"><span class="remind">*</span> 目录编码:</th>
					<td width="40%"><input title="目录编码" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="catalogCode"
						id="catalogCode"
						value='<c:out value='${csmpBdCompanystructureDTO.catalogCode}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span> 目录名称:</th>
					<td width="40%"><input title="目录名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="catalogName"
						id="catalogName"
						value='<c:out value='${csmpBdCompanystructureDTO.catalogName}'/>' />
					</td>
					<th width="10%">顺序号:</th>
					<td width="40%"><input title="顺序号"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="sequenceNum" id="sequenceNum"
						value='${csmpBdCompanystructureDTO.sequenceNum}' /></td>
				</tr>
				<tr>
					<th width="10%">是否有效:</th>
					<td width="40%"><pt6:syslookup name="isValid"
							lookupCode="PLATFORM_VALID_FLAG"
							defaultValue='${csmpBdCompanystructureDTO.isValid}'
							dataOptions="width:182,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">目录级别:</th>
					<td width="40%"><input title="目录级别"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1]'" style="width: 180px;"
						type="text" name="catalogLevel" id="catalogLevel"
						value='<c:out value='${csmpBdCompanystructureDTO.catalogLevel}'/>' />
					</td>
				</tr>
				<tr>
					<th width="10%">目录类型:</th>
					<td width="40%"><pt6:syslookup name="catalogType"
							lookupCode="CSMP_BD_COMPANY_TYPE"
							defaultValue='${csmpBdCompanystructureDTO.catalogType}'
							dataOptions="width:182,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">备注:</th>
					<td width="40%"><input title="备注"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="remark" id="remark"
						value='<c:out value='${csmpBdCompanystructureDTO.remark}'/>' /></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="60%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" plain="false"
						onclick="saveForm();" href="javascript:void(0);">保存</a> <a
						title="返回" id="returnButton" class="easyui-linkbutton"
						plain="false" onclick="closeForm();" href="javascript:void(0);">返回</a>
					</td>
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
			parent.csmpBdCompanystructure.closeDialog("#modify");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.csmpBdCompanystructure.save(serializeObject($('#form')),'${url}', '#modify', '${id}');
		}
	</script>
</body>
</html>