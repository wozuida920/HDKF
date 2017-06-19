<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController/CsmpBdAtachapterInfo" -->
<title>tree</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>

<body class="easyui-layout" fit="true">
<div data-options="region:'west',split:true,title:''" style="width:250px;padding:0px;" >
	 <div id="toolbar" class="datagrid-toolbar">
	 	<table width="100%">
	 		<tr>
	 			<td width="100%"><input  type="text"  name="searchWord" id="searchWord" class="easyui-searchbox"></input></td>
	 		</tr>
	 	</table>
	 </div>
	<ul id="tree">正在加载数据...</ul>
</div>
<div data-options="region:'center',split:true,title:'操作'" style="padding:0px;overflow:auto;">
	<div id="toolbarImportResult" class='datagrid-toolbar'>
			<table>
			<tr>
				<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdAtachapter_button_add" permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="csmpBdAtachapter.insertsub();" href="javascript:void(0);">添加</a></td>
				</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdAtachapter_button_edit" permissionDes="编辑">
						<td><a class="easyui-linkbutton" id="modifyButton" iconCls="icon-edit" plain="true" onclick="csmpBdAtachapter.modify();" href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdAtachapter_button_delete" permissionDes="保存">
						<td><a id="saveButton" class="easyui-linkbutton" iconCls="icon-save" disabled="true" plain="true" onclick="saveFormm();" href="javascript:void(0);">保存</a></td>
					</sec:accesscontrollist>
					<!-- <sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdAtachapter_button_delete" permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="csmpBdAtachapter.del();" href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist> -->
			</tr>
		</table>
	</div>
		<form id='treeDetailForm' border="1" style="width:900px;padding:0px;align:center;"align="center">
			<input type="hidden" name="id" value='${csmpBdAtachapterDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="18%"><span class="remind">*</span> 章节号:</th>
					<td width="32%"><input title="章节号" class="easyui-validatebox"  
						data-options="required:true,validType:'maxLength[100]'" readonly="readonly"
						style="width: 180px;" type="text" name="chapter" id="chapter">${csmpBdAtachapterDTO.chapter}</input></td>

					<th width="15%"><span class="remind">*</span> 章节名称:</th>
					<td width="35%"><input title="章节名称" class="easyui-validatebox"  
						data-options="required:true,validType:'maxLength[200]'" readonly="readonly"
						style="width: 180px;" type="text" name="ataName" id="ataName">${csmpBdAtachapterDTO.ataName}</input></td>
				</tr>
				<tr>
					<th width="15%"><span class="remind">*</span> 英文章节名:</th>
					<td width="35%"><input title="英文章节名称" class="easyui-validatebox"  
						data-options="required:true,validType:'maxLength[200]'" readonly="readonly"
						style="width: 180px;" type="text" name="nameEn" id="nameEn"
						value='<c:out value='${csmpBdAtachapterDTO.nameEn}'/>' /></td>

					<th width="10%">类别排序:</th>
					<td width="40%"><input title="类别排序"   readonly="readonly"
						class="easyui-numberbox easyui-validatebox" data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="classOrder" id="classOrder" value='${csmpBdAtachapterDTO.classOrder}' /></td>
					<%-- <th width="10%">有效标识:</th>
					<td width="35%">
					<input title="有效标识" type="radio" value="1"   readonly="readonly" checked="checked"
						name="validFlag" id="validFlag1" checked="checked " <c:if test="${csmpBdAtachapterDTO.validFlag=='1'}">checked='checked'</c:if>>有效</input>
						&nbsp;&nbsp;&nbsp;<input title="有效标识" type="radio" value="0"   readonly="readonly"
						name="validFlag" id="validFlag2" <c:if test="${csmpBdAtachapterDTO.validFlag=='0'}">checked='checked'</c:if>>无效</input></td> --%>
				</tr>
				<%-- <tr>
					<th width="10%">类别排序:</th>
					<td width="40%"><input title="类别排序"   readonly="readonly"
						class="easyui-numberbox easyui-validatebox" data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="classOrder" id="classOrder" value='${csmpBdAtachapterDTO.classOrder}' /></td>


					<th width="10%">是否明细:</th>
					<td width="40%">
						<input title="是否明细" type="radio" value="1"   readonly="readonly" checked="checked"name="isDetailed" id="isDetailed1"
					 		<c:if test="${csmpBdAtachapterDTO.isDetailed=='1'}">checked='checked'</c:if> ></input>是&nbsp;&nbsp;&nbsp;&nbsp;
						<input title="是否明细" type="radio" value="2"   readonly="readonly" name="isDetailed" id="isDetailed2" checked="checked" 
							<c:if test="${csmpBdAtachapterDTO.isDetailed=='2'}">checked='checked'</c:if>  ></input>否</td>
				</tr> --%>
				<tr>
					<th width="10%"> 备注:</th>
					<td width="40%" colspan="3">
					<textarea title="备注"  id="remarkAdd"  class="textareabox" max="1000" name="remark" rows="5" cols="30"  type="text"  id="remark" readonly="readonly"
							data-options="validType:'maxLength[1024]',tipPosition:'bottom'">${csmpBdAtachapterDTO.remark}</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
<script src="avicit/csmp/basicData/csmpbdatachapter/js/CsmpBdAtachapter.js" type="text/javascript"></script>
<script type="text/javascript">
	var csmpBdAtachapter;
	$(function(){
		csmpBdAtachapter = new CsmpBdAtachapter('tree','${url}','searchWord');
		csmpBdAtachapter.setOnLoadSuccess(function(){
		});
		csmpBdAtachapter.setOnSelect(function(_tree,node){
			toLoadData(node);
			$("#saveButton").linkbutton('disable');
		});
		
		csmpBdAtachapter.init();
	});
	
	//加载选中节点数据
	function toLoadData(node) {
		var id = node.id;
		var  urls = '${url}';
		$("#treeDetailForm input").attr("readonly","true");
		 $.ajax({
			    url:urls+'/getCsmpBdAtachapterNodeInfo/'+id,
			    contentType : 'application/json',
				 dataType : 'json',
				type : 'post',
				success: function(result) {
					$('#treeDetailForm').form('load', result.csmpBdAtachapterDTO);
				}
		 });
		
	}
	/* 保存 */
	function saveFormm() {
		var currentNode = $("#tree").tree('getSelected');
		if ($('#treeDetailForm').form('validate') == false) {
			return;
		}
		csmpBdAtachapter.save(serializeObject($('#treeDetailForm')), '${url}/saveCsmpBdAtachapter/'+currentNode.id, null,null);
	}
	
</script>
</body>
</html>