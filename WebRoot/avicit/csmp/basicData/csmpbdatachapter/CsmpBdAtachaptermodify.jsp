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
				value='${csmpBdAtachapterDTO.id}' />

			<table class="form_commonTable">
				<tr>
					<th width="16%"><span class="remind">*</span> 章节号:</th>
					<td width="34%"><input title="章节号" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[100]'"
						style="width: 180px;" type="text" name="chapter" id="chapter"
						value='<c:out value='${csmpBdAtachapterDTO.chapter}'/>' /></td>
					<th width="16%"><span class="remind">*</span> 章节名称:</th>
					<td width="34%"><input title="章节名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'"
						style="width: 180px;" type="text" name="ataName" id="ataName"
						value='<c:out value='${csmpBdAtachapterDTO.ataName}'/>' /></td>
				</tr>
				<tr>
					<th width="16%"><span class="remind">*</span> 英文章节名:</th>
					<td width="34%"><input title="英文章节名称"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'"
						style="width: 180px;" type="text" name="nameEn" id="nameEn"
						value='<c:out value='${csmpBdAtachapterDTO.nameEn}'/>' /></td>
						
				<th width="16%">有效标识:</th>
					<td width="34%">
					<%-- <pt6:syslookup name="validFlag" lookupCode="PLATFORM_VALID_FLAG" defaultValue='${csmpBdAtachapterDTO.validFlag}' dataOptions="width:182,editable:false,panelHeight:'auto'"></pt6:syslookup> --%>
						<input title="有效标识" type="radio" value="1"  name="validFlag" id="validFlag"  
							<c:if test="${csmpBdAtachapterDTO.validFlag=='1'}">checked='checked'</c:if>>有效</input>&nbsp;&nbsp;&nbsp;
						<input title="有效标识" type="radio" value="0" name="validFlag" id="validFlag" 
							<c:if test="${csmpBdAtachapterDTO.validFlag=='0'}">checked='checked'</c:if>>无效</input>
					</td>
					<%-- <th width="16%"><span class="remind">*</span> 父类ID:</th>
					<td width="34%"><input title="父类ID" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="parentClassId"
						id="parentClassId"
						value='<c:out value='${csmpBdAtachapterDTO.parentClassId}'/>' /></td> --%>
				</tr>
				<tr>
						<th width="16%">类别排序:</th>
					<td width="34%"><input title="类别排序"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="classOrder" id="classOrder"
						value='${csmpBdAtachapterDTO.classOrder}' /></td>
					
					<th width="16%">是否明细:</th>
					<td width="34%">
					<%-- <input title="是否明细" class="inputbox easyui-validatebox" data-options="validType:'maxLength[1]'" style="width: 180px;" type="text" name="isDetailed" id="isDetailed" value='<c:out value='${csmpBdAtachapterDTO.isDetailed}'/>' /> --%>
						<input title="是否明细" type="radio" value="1" name="isDetailed" id="isDetailed" 
							<c:if test="${csmpBdAtachapterDTO.isDetailed=='1'}">checked='checked'</c:if> ></input>是&nbsp;&nbsp;&nbsp;&nbsp;
						<input title="是否明细" type="radio" value="2" name="isDetailed" id="isDetailed" 
							<c:if test="${csmpBdAtachapterDTO.isDetailed=='2'}">checked='checked'</c:if> ></input>否
					</td>
				</tr>
				<tr>
					
					<th width="16%"><span class="remind">*</span> 备注:</th>
					 <td width="34%" colspan="3">
						<textarea title="备注"  class="textareabox" max="1000" name="remark" rows="5" cols="30"  type="text"  id="remark"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'">${csmpBdAtachapterDTO.remark}</textarea>
						</td>
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
			parent.csmpBdAtachapter.closeDialog("#modify");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.csmpBdAtachapter.save(serializeObject($('#form')), '${url}',
					'#modify', '${id}');
		}
	</script>
</body>
</html>