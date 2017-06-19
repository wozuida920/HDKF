<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%
String sysCodingPath = request.getContextPath()+"/sysCodingSelectController";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自编代码规则管理</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<style type="text/css">
.search_app_table .searchbox-text,.search_app_table .searchbox{
width: 99%!important;
}
.search_app_table .searchbox span{
	position: absolute;
	right:0px;
	width:26px;
	height:26px;
}
</style>
<script src="avicit/platform6/centralcontrol/sysapp/js/SysAppTree.js" type="text/javascript"></script>
<script type="text/javascript">
/**
 * 查询数据
 */
function searchCoding(){
	var r = $('#formSearch').form('validate');
	if(!r){
		return false;
	}
	var param = {
		searchCodingName : $('#searchCodingName').val(),
		searchCodingValue : $('#searchCodingValue').val(),
		searchModuleName: $('#searchModuleName').val(),
		appId: $appId
	}; 
	$('#datagrid1').datagrid('options').url = 'platform/cc/sysCodingSelect/getUsedCodingData.json';
	$('#datagrid1').datagrid('reload', param);
}

/**
 * 导出查询的数据
 */
 function ExporterExcel() { 
	$('#appId').val($appId);
	document.getElementById("formSearch").submit();
 }
 
 /**
  * 初始化应用列表
  */
 var sysAppTree;
 $(function(){
 	sysAppTree = new SysAppTree('apps','searchApp',APP_.PUBLIC);
 	sysAppTree.setOnLoadSuccess(function(self,node,data){
 		var node = self._tree.tree('find', '${param.appId}');
 		if(node){
 			self._tree.tree('select', node.target);
 			self.selectRootNode = function(){};
 		}
 	});
 	sysAppTree.setOnSelect(function(_sysAppTree,node){
 		loadData(node.id);
 	});
 	
 	sysAppTree.init();
 	
 });

 $appId = '';
 function loadData(appId){
 	$appId = appId;
 	searchCoding();
 }
</script>
</head>
<body class="easyui-layout">
<iframe name="loadFileIframe" style="display: none"></iframe>
<div data-options="region:'west',split:true,title:'应用列表',collapsible:true" style="width:200px;background-color: #fff">
	 <div id="toolbarTree" class="datagrid-toolbar">
	 	<table width="100%" class="search_app_table">
	 		<tr>
	 			<td width="100%"><input type="text"  name="searchApp" id="searchApp"></input></td>
	 		</tr>
	 	</table>
 	 </div>
	 <ul id="apps">正在加载应用列表...</ul>
</div>
<div data-options="region:'center',split:true" style="padding:0px;">   
	<table id="datagrid1" class="easyui-datagrid" 
			data-options="
				fit: true,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbar',
				method: 'post',
				singleSelect: false,
				checkOnSelect: true,
				selectOnCheck: true,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList
			">
		<thead>
			<tr>
				<sec:accesscontrollist hasPermission="3" domainObject="sysCodingSelectManager_gridform_codingName">
					<th data-options="field:'codingName', halign:'center'" width="120">规则名称</th>
				</sec:accesscontrollist>
				<sec:accesscontrollist hasPermission="3" domainObject="sysCodingSelectManager_gridform_segmentNumber">
					<th data-options="field:'codingValue', halign:'center', align:'left'" width="100">编码值</th>
				</sec:accesscontrollist>
				<sec:accesscontrollist hasPermission="3" domainObject="sysCodingSelectManager_gridform_criterionCode">
					<th data-options="field:'moduleName', halign:'center', align:'left'" width="100">使用对象</th>
				</sec:accesscontrollist>
				<sec:accesscontrollist hasPermission="3" domainObject="sysCodingSelectManager_gridform_creationDate">
					<th data-options="field:'creationDate', halign:'center', align:'center', formatter: formatColumnTime" width="100">创建时间</th>
				</sec:accesscontrollist>
			</tr>
		</thead>
	</table>
	<div id="toolbar" class="datagrid-toolbar" style="height:auto;display: block;">
		<div style="padding:0 0 0 10px;">
			<form id="formSearch" method="post" target="loadFileIframe" action="<%=request.getContextPath() %>/cc/sysCodingSelect/exportExcel4CodingSelectData.do">
				<input type="hidden" id="appId" name="appId">
				<table width="100%" border="0">
				   <tr>
				   	<td width="80px" align="right">规则名称</td>
				   	<td width="150px"><input class="easyui-validatebox" id="searchCodingName" name="searchCodingName" style="width: 150px" data-options="validType:'length[0,100]'" value=""/></td>
				   	<td width="80px" align="right">编码值</td>
				   	<td width="150px"><input class="easyui-validatebox" id="searchCodingValue" name="searchCodingValue" style="width: 150px" data-options="validType:'length[0,100]'" value=""/></td>
				   	<td width="80px" align="right">使用对象</td>
				   	<td width="150px"><input class="easyui-validatebox" id="searchModuleName" name="searchModuleName" style="width: 150px" data-options="validType:'length[0,100]'" value=""/></td>
					<td width="70px">
						<sec:accesscontrollist hasPermission="3" domainObject="sysCodingSelectManager_button_searchRule" >
							<a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchCoding();" href="javascript:void(0);">查询</a>
						</sec:accesscontrollist>
					</td>
					<td align="left">
						<sec:accesscontrollist hasPermission="3" domainObject="sysCodingSelectManager_button_exportExcel" >
							<a class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="ExporterExcel();" href="javascript:void(0);">导出</a> 
						</sec:accesscontrollist>
					</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>		
</body>
</html>
