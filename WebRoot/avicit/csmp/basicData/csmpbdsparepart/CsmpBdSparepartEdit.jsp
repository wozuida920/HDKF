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
<!-- ControllerPath = "csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/operation/Edit/id" -->
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
		<div style="width:100%;height:100%;padding-left: -1">
			<input type="hidden" name="id" value='${csmpBdSparepartDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="15%"><span class="remind">*</span> 产品名称:</th>
					<td width="35%"><input title="产品名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'"
						style="width: 180px;" type="text" name="productName"
						id="productName"
						value='<c:out value='${csmpBdSparepartDTO.productName}'/>' /></td>
					<th width="15%"><span class="remind">*</span> 图号:</th>
					<td width="35%"><input title="图号" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[100]'"
						style="width: 180px;" type="text" name="drawingNo" id="drawingNo"
						value='<c:out value='${csmpBdSparepartDTO.drawingNo}'/>' /></td>
				</tr>
				<tr>
					<th width="15%"><span class="remind">*</span> 单位:</th>
					<td width="35%">
					<%-- <input title="单位" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[16]'"
						style="width: 180px;" type="text" name="unit" id="unit"
						value='<c:out value='${csmpBdSparepartDTO.unit}'/>' /> --%>
						<select id="unit" class="easyui-combobox"
				      data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
					  name="unit"   >
							<c:forEach items="${danwei}" var="age">
								<option value="${age.lookupCode }"  <c:if test="${age.lookupCode==csmpBdSparepartDTO.unit }">selected='selected'</c:if> >${age.lookupName}</option>
							</c:forEach>
					</select> 
						</td>
					<th width="15%">数量:</th>
					<td width="35%"><input title="数量"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="quantity" id="quantity"
						value='${csmpBdSparepartDTO.quantity}' /></td>
				</tr>
				<tr>
					<th width="15%">规格:</th>
					<td width="35%"><input title="规格"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="specification" id="specification"
						value='<c:out value='${csmpBdSparepartDTO.specification}'/>' /></td>
					<th width="13%">免税单价:</th>
					<td width="35%"><input title="免税单价"
						class="easyui-numberbox easyui-validatebox" precision="2"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="dutyFreePrice" id="dutyFreePrice"
						value='${csmpBdSparepartDTO.dutyFreePrice}' /></td>
				</tr>
				<tr>
					<th width="15%">含税单价:</th>
					<td width="35%"><input title="含税单价"
						class="easyui-numberbox easyui-validatebox" precision="2"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="taxPrice" id="taxPrice"
						value='${csmpBdSparepartDTO.taxPrice}' /></td>
					<th width="15%">责任单位:</th>
					<td width="35%"><input title="责任单位"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="liabilityUnit" id="liabilityUnit"
						value='<c:out value='${csmpBdSparepartDTO.liabilityUnit}'/>' /></td>
				</tr>
				<tr>
					<th width="15%">有效性:</th>
					<td width="35%">
			<%-- 		<input title="有效性"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1]',onShowPanel:comboboxOnShowPanel" style="width: 180px;"
						type="text" name="validFlag" id="validFlag"
						value='<c:out value='${csmpBdSparepartDTO.validFlag}'/>' /> --%>
						
						 <select id="validFlag" data-options="onShowPanel:comboboxOnShowPanel,panelHeight:'auto'" class="easyui-combobox" name="validFlag">
							<option value="Y" <c:if test="${csmpBdSparepartDTO.validFlag =='Y'}">selected='selected'</c:if> >是</option>
							<option value="N" <c:if test="${csmpBdSparepartDTO.validFlag =='N'}">selected='selected'</c:if> >否</option>
					  </select>
						</td>
					<th width="15%">是否随机件:</th>
					<td width="35%"><pt6:syslookup name="isRandompart"
							lookupCode="CSMP_BD_RANDOMPART" 
							defaultValue='${csmpBdSparepartDTO.isRandompart}'
							dataOptions="width:180,editable:false,onShowPanel:comboboxOnShowPanel,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					<th width="15%">类别:</th>
					<td width="35%">
				 	<select id="category" class="easyui-combobox"
				 data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
					name="category"   >
							<c:forEach items="${type }" var="age">
								<option value="${age.lookupCode}" <c:if test="${age.lookupCode==csmpBdSparepartDTO.category }">selected='selected'</c:if>>${age.lookupName}</option>
							</c:forEach>
					</select> 
					</td>
					<th width="15%">分类单位:</th>
					<td width="35%">
					 <select id="classifyDept" class="easyui-combobox"
				      data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
					  name="classifyDept"   >
							<c:forEach items="${dept }" var="age">
								<option value="${age.lookupCode }"  <c:if test="${age.lookupCode==csmpBdSparepartDTO.classifyDept }">selected='selected'</c:if>>${age.lookupName}</option>
							</c:forEach>
					</select> 
					</td>	
				</tr>
				
					
				
				<tr>
					<th width="15%">备注:</th>
					<td width="35%" colspan="3">
					<%-- <input title="备注"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="remark" id="remark"
						value='<c:out value='${csmpBdSparepartDTO.remark}'/>' /> --%>
					<textarea rows="5" class="textareabox"  data-options="validType:'maxLength[1024]'" style="width: 180px;"
						name="remark" id="remark" >${csmpBdSparepartDTO.remark}</textarea>
						
						</td>
				</tr>
			</table>
		</div>
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
        maxLength: {    
            validator: function(value, param){    
                return param[0] >= value.length;
                
            },    
            message: '请输入最多 {0} 字符.'   
        }    
    });  
	$(function(){
																																																																																																																																																																																																																																																																																																																																																																																																																																																																	})
	function closeForm(){
		parent.csmpBdSparepart.closeDialog("#edit");
	}
	function saveForm(){
	    if ($('#form').form('validate') == false) {
            return;
        }
		parent.csmpBdSparepart.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>