<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div id="ttt" data-options="region:'center',split:true,border:false"
		style="overflow: hidden; padding-bottom: 35px;">
		<form id='form'>
			<input type="hidden" name="id" value='${csmpBdAricarftmodelDTO.id}' />
			<input type="hidden" name="id" value='${csmpBdAricarftmodelDTO.id}' />
			<table width="100%" style="padding-top: 10px;">
				<tr>
					<th align="right"><span style="color: red;">*</span> 机型编号:</th>
					<td><input title="机型编号" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="text"
						name="modelNum" id="modelNum" readonly="readonly"
						value='${csmpBdAricarftmodelDTO.modelNum}' /></td>
					<th align="right"><span style="color: red;">*</span> 机型名称:</th>
					<td><input title="机型名称" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="text"
						name="modelName" id="modelName" readonly="readonly"
						value='${csmpBdAricarftmodelDTO.modelName}' /></td>
				</tr>
				<tr>
					<th align="right"><span style="color: red;">*</span> 类型:</th>
					<td><input title="类型" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="text"
						name="modelType" id="modelType" readonly="readonly"
						value='${csmpBdAricarftmodelDTO.modelType}' /></td>
					<th align="right">有效标识:</th>
					<td>
					<input type="radio" name="validFlag" id="validFlag" value="0" readonly="readonly"
					<c:if test="${csmpBdAricarftmodelDTO.validFlag=='0'}">checked='checked'</c:if>
					>无效</input>
					<input type="radio"  name="validFlag" id="validFlag" value="1"  readonly="readonly"
					<c:if test="${csmpBdAricarftmodelDTO.validFlag=='1'}">checked='checked'</c:if>
					>有效</input>
					<!-- 
					<input title="有效标识" class="inputbox" style="width: 180px;"
						type="text" name="validFlag" id="validFlag" readonly="readonly"
						value='${csmpBdAricarftmodelDTO.validFlag}' />-->
						
						</td>
				</tr>
				<tr>
					<th  align="right">描述:</th>
					<td  colspan="3">
					<textarea data-options="validType:'maxLength[255]'" style="width: 580px;height: 60px"   type="text"  class="textareabox" name="describe" id="describe"  readonly="readonly" >${csmpBdAricarftmodelDTO.describe }</textarea>
					
					<%-- <input title="描述" class="inputbox" style="width: 180px;"
						type="text" name="describe" id="describe" readonly="readonly"
						value='${csmpBdAricarftmodelDTO.describe}' /> --%></td>
					<%-- <th align="right">备注:</th>
					<td><input title="备注" class="inputbox" style="width: 180px;"
						type="text" name="remark" id="remark" readonly="readonly"
						value='${csmpBdAricarftmodelDTO.remark}' /></td> --%>
				</tr>
				
				
			</table>
		</form>
			<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right">
					 <a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm1();"
						href="javascript:void(0);">返回</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	function closeForm1(){
			parent.closeDialog("#detail");
	}
	$(function(){
		
});
	</script>
</body>
</html>