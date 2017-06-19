<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController/CsmpBdCompanystructureInfo" -->
<title>tree</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>

<body class="easyui-layout" fit="true">
	<div data-options="region:'west',split:true,title:''"
		style="width: 250px; padding: 0px;">
		<div id="toolbar" class="datagrid-toolbar">
			<table width="100%">
				<tr>
					<td width="100%"><input type="text" name="searchWord"
						id="searchWord"></input></td>
				</tr>
			</table>
		</div>
		<ul id="tree">正在加载数据...
		</ul>
	</div>
	<div data-options="region:'center',split:true,title:'操作'"
		style="padding: 0px; overflow: auto;">
		<div id="toolbarImportResult" class='datagrid-toolbar'>
			<table>
				<tr>
					<!-- <td><a class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="csmpBdCompanystructure.insert();" href="javascript:void(0);">添加平级节点</a></td> -->
					<td><a class="easyui-linkbutton" iconCls="icon-add_other"
						plain="true" onclick="csmpBdCompanystructure.insertsub();"
						href="javascript:void(0);">添加</a></td>
					<td><a class="easyui-linkbutton" id="modifyButton"
						iconCls="icon-edit" plain="true"
						onclick="csmpBdCompanystructure.modify();"
						href="javascript:void(0);">编辑</a></td>
					<td><a class="easyui-linkbutton" id="saveButton"
						iconCls="icon-save" plain="true" onclick="saveForm();"
						href="javascript:void(0);">保存</a></td>
					<td><a class="easyui-linkbutton" iconCls="icon-remove"
						plain="true" onclick="csmpBdCompanystructure.del();"
						href="javascript:void(0);">删除</a></td>
				</tr>
			</table>
		</div>
		<form id='treeManageform' class='form'>
			<input type="hidden" name='id' id='id'
				value='${csmpBdCompanystructureDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%"><span class="remind">*</span> 分类编码:</th>
					<td width="40%"><input title="目录编码" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="catalogCode"
						id="catalogCode" value='${csmpBdCompanystructureDTO.catalogCode}' /></td>
					<th width="10%"><span class="remind">*</span> 分类名称:</th>
					<td width="40%"><input title="目录名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="catalogName"
						id="catalogName" value='${csmpBdCompanystructureDTO.catalogName}' /></td>
				</tr>
				<tr>
					<th width="10%">目录排序:</th>
					<td width="40%"><input title="目录排序"
						class="easyui-numberbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="sequenceNum" id="sequenceNum"
						value='${csmpBdCompanystructureDTO.sequenceNum}' /></td>
					<th width="10%">有效标识:</th>
					<td width="40%"><input title="有效标识" type="radio" value="1"
						 checked="checked" name="isValid" id="isValid1"
						checked="checked " disabled
						<c:if test="${csmpBdCompanystructureDTO.isValid=='1'}">checked='checked'</c:if>>有效</input>
						&nbsp;&nbsp;&nbsp; <input title="有效标识" type="radio" value="0"
			            name="isValid" id="isValid2" disabled
						<c:if test="${csmpBdCompanystructureDTO.isValid=='0'}">checked='checked'</c:if>>无效</input>
					</td>
				</tr>
				<tr>
					<th width="10%">单位类别:</th>
					<td width="40%"><pt6:syslookup name="catalogType"
							lookupCode="CSMP_BD_COMPANY_TYPE"
							defaultValue='${csmpBdCompanystructureDTO.catalogType}'
							dataOptions="width:182, onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"></pt6:syslookup>
						</td>
					<th width="10%">节点级别:</th>
					<td width="40%"><input title="节点级别"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1]'" style="width: 180px;"
						type="text" name="catalogLevel" id="catalogLevel"
						value='<c:out value='${csmpBdCompanystructureDTO.catalogLevel}'/>' /></td>
				</tr>
				<tr>

					<th width="10%">备注:</th>
					<td width="40%" colspan="3"><textarea title="备注" 
							 class="textareabox" max="1000" name="remark" rows="5" cols="30"
							type="text" id="remark" readonly="readonly"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'">${csmpBdCompanystructureDTO.remark}</textarea></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
	</div>
	<script
		src=" avicit/csmp/basicData/csmpbdcompanystructure/js/CsmpBdCompanystructure.js"
		type="text/javascript"></script>
			<script src=" avicit/csmp/basicData/csmpbdcompanyinfo/js/CsmpBdCompanyinfo.js" type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdCompanystructure;
		var csmpBdCompanyinfo;
		$(function() {
			
			csmpBdCompanystructure = new CsmpBdCompanystructure('tree','${url}', 'searchWord');
			csmpBdCompanystructure.setOnLoadSuccess(function() {
				//alert("树加载成功事件");
			});
			csmpBdCompanystructure.setOnSelect(function(_tree, node) {
				var pid = node.id;
				csmpBdCompanyinfo = new CsmpBdCompanyinfo('dgCsmpBdCompanyinfo','${url}', 'searchDialog', 'csmpBdCompanyinfo',pid);
				//alert("树节点单击事件");
				
				loadData(node);
				$("#saveButton").linkbutton('disable');

			});
			csmpBdCompanystructure.init();
		});
		//加载选中节点的数据
		function loadData(node) {
			var id = node.id;
			var urls = '${url}';

			$("#treeManageform :input").attr("readonly", "true");

			$.ajax({
				url : urls + '/getcsmpBdCompanystructureNodeinfo/' + id,
				type : 'post',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {
					
					$("#treeManageform").form("load", result.resultData);
				}
			});

		}
		
		/* 保存 */
		
		function saveForm() {
			var currentNode = $("#tree").tree('getSelected');
			//console.info(currentNode);
			//return false;
			if ($('#treeManageform').form('validate') == false) {
				return;
			}
			csmpBdCompanystructure.save(serializeObject($('#treeManageform')),
					'${url}/saveCsmpBdCompanystructure/' + currentNode.id,
					null, null);
		}
	</script>
</body>
</html>