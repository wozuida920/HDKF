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
<!-- ControllerPath = "csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/operation/Add/null" -->
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
			<div style="width: 100%; height: 100%;">
				<input type="hidden" name="id" />
				<table class="form_commonTable" style="border: 1px;">
					<tr>



						<th width="15%"><span class="remind">*</span> 产品名称:</th>
						<td width="30%"><input title="产品名称"
							class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[200]'"
							style="width: 180px;" type="text" name="productName"
							id="productName" /></td>

						<th width="15%"><span class="remind">*</span> 图号:</th>
						<td width="35%"><input title="图号" class="easyui-validatebox"
							data-options="required:true,validType:'maxLength[100]'" onblur="checkName();"
							style="width: 180px;" type="text" name="drawingNo" id="drawingNo" />
						</td>
					</tr>
					<tr>

						<th width="15%"><span class="remind">*</span> 单位:</th>
						<td width="35%">
							<!-- <input title="单位" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[16]'"
						style="width: 180px;" type="text" name="unit" id="unit" /> --> <select
							id="unit" class="easyui-combobox"
							data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
							name="unit">
								<c:forEach items="${danwei}" var="age">
									<option value="${age.lookupCode }">${age.lookupName}</option>
								</c:forEach>
						</select>

						</td>

						<th width="15%">数量:</th>
						<td width="35%"><input title="数量"
							class="easyui-numberbox easyui-validatebox"
							data-options="validType:'maxLength[22]'" style="width: 180px;"
							type="text" name="quantity" id="quantity" /></td>
					</tr>
					<tr>

						<th width="15%">规格:</th>
						<td width="35%"><input title="规格"
							class="inputbox easyui-validatebox" 
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="specification" id="specification" /></td>

						<th width="15%">免税单价:</th>
						<td width="35%"><input title="免税单价"
							class="easyui-numberbox easyui-validatebox" precision="2"
							data-options="validType:'maxLength[22]'" style="width: 180px;"
							type="text" name="dutyFreePrice" id="dutyFreePrice" /></td>
					</tr>
					<tr>

						<th width="15%">含税单价:</th>
						<td width="35%"><input title="含税单价"
							class="easyui-numberbox easyui-validatebox" precision="2"
							data-options="validType:'maxLength[22]'" style="width: 180px;"
							type="text" name="taxPrice" id="taxPrice" /></td>

						<th width="15%">责任单位:</th>
						<td width="35%"><input title="责任单位"
							class="inputbox easyui-validatebox"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="liabilityUnit" id="liabilityUnit" /></td>
					</tr>
					<tr>

						<th width="15%">有效性:</th>
						<td width="35%">
							<!-- <input title="有效性" 
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1]'" style="width: 180px;"
						type="text" name="validFlag" id="validFlag" /> --> <select
							id="validFlag" class="easyui-combobox"
							data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
							name="validFlag">
								<option value="Y">是</option>
								<option value="N">否</option>
						</select>
						</td>

						<th width="15%">是否随机件:</th>
						<td width="35%"><pt6:syslookup name="isRandompart" 
								lookupCode="CSMP_BD_RANDOMPART"
								dataOptions="width:180,editable:false,panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
							</pt6:syslookup></td>
					</tr>
					<tr>
						<th width="15%">类别:</th>
						<td width="35%"><select id="category" class="easyui-combobox"
							data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
							name="category">
								<c:forEach items="${type }" var="age">
									<option value="${age.lookupCode }">${age.lookupName}</option>
								</c:forEach>
						</select></td>
						<th width="15%">分类单位:</th>
						<td width="35%"><select id="classifyDept"
							class="easyui-combobox"
							data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
							name="classifyDept">
								<option value="">请选择</option>
								<c:forEach items="${dept}" var="age">
									<option value="${age.lookupCode }">${age.lookupName}</option>
								</c:forEach>
						</select></td>
					</tr>
					
						
					
					<tr>
						<th width="15%">备注:</th>
						<td width="35%" colspan="3">
							<!-- <input title="备注"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="remark" id="remark" /> --> <textarea rows="5"
								class="textareabox" data-options="validType:'maxLength[1024]'"
								style="width: 180px;" name="remark" id="remark"></textarea>
						</td>
					</tr>

				</table>
		</form>
	</div>
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
			parent.csmpBdSparepart.closeDialog("#insert");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.csmpBdSparepart.save(serializeObject($('#form')), "#insert");
		}
		function checkName(){
			var drawingNo1 =$("#drawingNo").val();
			$.ajax({
				url:'platform/csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/checkNameNo',
				data:{drawingNo:drawingNo1},
				dataType:'json',
				type:'post',
				success:function(r){
					if(r=='1'){
						$("#drawingNo").val('');
						$.messager.alert("提示","该名字已占用不能重复");
					}
				}
			});
		}
	</script>
</body>
</html>