<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/operation/Detail/id" -->
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
	<div data-options="region:'center',split:true,border:false" style="overflow: hidden; padding-bottom: 30px;width:100%;height:100%;border: 1px">
		<form id='form'  style="border: 1px">
			<input type="hidden" name="id" value='${csmpBdSparepartDTO.id}' />
			 <inpun type="hidden" name="id" value='${csmpBdSparepartDTO.id}' />
			 <div style="width:100%;height:100%;padding-left: 30px">
			<table  style="width:100%;height:100%" >
				<tr>
					<th align="right"><span style="color: red;">*</span> 产品名称:</th>
					<td><input title="产品名称" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="text"
						name="productName" id="productName" readonly="readonly"
						value='${csmpBdSparepartDTO.productName}' /></td>
					<th align="right"><span style="color: red;">*</span> 图号:</th>
					<td><input title="图号" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="text"
						name="drawingNo" id="drawingNo" readonly="readonly"
						value='${csmpBdSparepartDTO.drawingNo}' /></td>
				</tr>
				<tr>
					<th align="right"><span style="color: red;">*</span> 单位:</th>
					<td><input title="单位" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="text"
						name="unit" id="unit" readonly="readonly"
						value='${csmpBdSparepartDTO.unit}' /></td>
					<th align="right">数量:</th>
					<td><input title="数量" class="easyui-numberbox"
						style="width: 180px;" type="text" name="quantity" id="quantity"
						readonly="readonly" value='${csmpBdSparepartDTO.quantity}' /></td>
				</tr>
				<tr>
					<th align="right">规格:</th>
					<td><input title="规格" class="inputbox" style="width: 180px;"
						type="text" name="specification" id="specification"
						readonly="readonly" value='${csmpBdSparepartDTO.specification}' />
					</td>
					<th align="right">免税单价:</th>
					<td><input title="免税单价" class="easyui-numberbox"
						style="width: 180px;" type="text" name="dutyFreePrice"
						id="dutyFreePrice" readonly="readonly"
						value='${csmpBdSparepartDTO.dutyFreePrice}' /></td>
				</tr>
				<tr>
					<th align="right">含税单价:</th>
					<td><input title="含税单价" class="easyui-numberbox"
						style="width: 180px;" type="text" name="taxPrice" id="taxPrice"
						readonly="readonly" value='${csmpBdSparepartDTO.taxPrice}' /></td>
					<th align="right">责任单位:</th>
					<td><input title="责任单位" class="inputbox" style="width: 180px;"
						type="text" name="liabilityUnit" id="liabilityUnit"
						readonly="readonly" value='${csmpBdSparepartDTO.liabilityUnit}' />
					</td>
				</tr>
				<tr>
					<th align="right">有效性:</th>
					<td>
					<!-- <select id="validFlag" class="easyui-combobox"
						data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
						name="validFlag">
						<option></option>
					
					
					</select> -->
					
					<input title="有效性" class="inputbox" style="width: 180px;"
						type="text" name="validFlag" id="validFlag" readonly="readonly"
						value='${csmpBdSparepartDTO.validFlag}' />
					</td>
					<th align="right">是否随机件:</th>
					<td>
					<input title="是否随机件" class="inputbox" style="width: 180px;" type="text" name="isRandompart"
						id="isRandompart" readonly="readonly"
						value='${csmpBdSparepartDTO.isRandompart}' /></td>
				</tr>
				<tr>
					<%-- <input title="类别" class="inputbox" style="width: 180px;" type="text" name="category"
						id="category" readonly="readonly"
						value='${csmpBdSparepartDTO.category}' /> --%>
					<th align="right">类别:</th>
				 	<td><select id="category" class="easyui-combobox"   readonly="readonly" style="width: 180px;"
				 data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'" 
					name="category"   >
							<c:forEach items="${type }" var="age">
								<option value="${age.lookupCode}" <c:if test="${age.lookupCode==csmpBdSparepartDTO.category }">selected='selected'</c:if>>${age.lookupName}</option>
							</c:forEach>
					</select> 
					</td>	
					<th align="right">分类单位:</th>
						<td ><select id="classifyDept" class="easyui-combobox" style="width: 180px;" readonly="readonly"
				      data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
					  name="classifyDept"   >
							<c:forEach items="${dept }" var="age">
								<option value="${age.lookupCode }"  <c:if test="${age.lookupCode==csmpBdSparepartDTO.classifyDept }">selected='selected'</c:if>>${age.lookupName}</option>
							</c:forEach>
					</select> 
					</td>
				</tr>
				
				<tr>
					<th align="right">备注:</th>
					<td colspan="3"><!-- <textarea
							data-options="validType:'maxLength[255]'" class="textarea"
							style="width: 550px; height: 60px" class="textareabox"
							name="remark" id="remark" readonly="readonly"></textarea> -->
					<textarea data-options="validType:'maxLength[255]'" class="textarea" style="width:577px; height: 60px"
					 name="remark" id="remark" readonly="readonly">${csmpBdSparepartDTO.remark }</textarea>
					</td>
				</tr>
			</table>
			</div>
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
		parent.csmpBdSparepart.closeDialog("#detail");
     }
		$(function() {
		});
	</script>
</body>
</html>