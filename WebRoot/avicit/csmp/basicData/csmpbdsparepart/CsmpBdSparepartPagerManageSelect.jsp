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
<!-- ControllerPath = "csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/CsmpBdSparepartInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
<script src="avicit/csmp/common/js/ValidtionContent.js" type="text/javascript"></script>
<style type="text/css">
/* 设置点击详细页的<a>标签操作之后的样式（只限于IE浏览器） */
#ahtmlcss { 
color: blue;
} 

.th_wid{
width: 14%;
}

.td_wid{
width:18%;
}
</style>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="resizable:true,split:true,region:'north',title:'备件信息',collapsible:true,onCollapse:_onCollapse" 
	 iconCls="icon-search" style="width:100%;height:130px;overflow-y:hidden;overflow-x:auto;">
	 <center>
		<form id="csmpBdSparepart">
			<table class="form_commonTable"  style="width: 80%;">
				<tr>
					<th class="th_wid">产品名称:</th>
					<td class="td_wid"><input class="easyui-validatebox"
						 type="text" name="productName" /></td>
					<th class="th_wid">型号:</th>
					<td class="td_wid"><input class="easyui-validatebox"
						 type="text" name="drawingNo" /></td>
					<th class="th_wid">责任单位:</th>
					<td class="td_wid"><input class="easyui-validatebox"
						 type="text" name="liabilityUnit" /></td>
				</tr>
				<tr>
					<td colspan="10" align="center">
						<div id="searchBtns" align="center" style="margin-top: 8px;">
							<a class="easyui-linkbutton primary-btn"
							iconCls="" plain="false" onclick="csmpBdSparepart.searchData();"
							href="javascript:void(0);">查询</a> 
							&nbsp;&nbsp;
							<a class="easyui-linkbutton"
							iconCls="" plain="false" onclick="csmpBdSparepart.clearData();"
							href="javascript:void(0);">重置</a> 
						</div>
					</td>
				</tr>
			</table>
		</form>
		</center>
	</div>
	<div data-options="region:'center'"
		style="background: #ffffff; height: auto; padding: 0px; overflow: hidden;">
		<div id="toolbarCsmpBdSparepart" class="datagrid-toolbar">
		</div>
		<table id="dgCsmpBdSparepart"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarCsmpBdSparepart',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				onDblClickRow : backRow,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'id', halign:'center',checkbox:true" width="220">主键ID</th>
					<th data-options="field:'productName',align:'center'" width="220">产品名称</th>
					<th data-options="field:'drawingNo',align:'center'" width="220">备件型号</th>
					<th data-options="field:'unit',align:'center',formatter:formateUnit" width="220">计量单位</th>
					<th data-options="field:'category',align:'center',formatter:formateCategory" width="220"">类别</th>
			</thead>
		</table>
	</div>
	
	  <div data-options="region:'south',border:false" style="height:37px"> 
			<div id="toolbar"  align="right" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
				  <div align="right">
					<a href="javascript:void(0);" id="selectContractunitBtn" onclick="backRow();" class="easyui-linkbutton">提交</a>
					<a href="javascript:void(0);" id="closeContractunitBtn" onclick="closeForm();" class="easyui-linkbutton">关闭</a>
				  </div>
	       </div>
       </div>
	
	<script src="avicit/csmp/basicData/csmpbdsparepart/js/CsmpBdSparepartSelect.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		var csmpBdSparepart;
		$(function(){
			csmpBdSparepart = new CsmpBdSparepart('dgCsmpBdSparepart','${url}','searchDialog','csmpBdSparepart');
			var dgView=$('#dgCsmpBdSparepart');
			//调用初始化方法
			initTheLangField(dgView);
			initTheMessage(dgView);
			
		});
		function formateDate(value, row, index) {
			return csmpBdSparepart.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdSparepart.formateTime(value);
		}
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdSparepart.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		
		function formateCategory(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdSparepart.category);
		}
		function formateUnit(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdSparepart.unit);
		}
		
		function backRow(){
			var rows = $('#dgCsmpBdSparepart').datagrid('getSelected');
			if(!rows){
				$.messager.show({ title : '提示', msg : '请选择一条数据！'});
				return false;
			}
			parent.selectCsmpBdSparepartRow(rows);
			parent.$('#searchCsmpBdSparepartSelect').dialog('close');
		}
		
		function closeForm(){
			parent.$('#searchCsmpBdSparepartSelect').dialog('close');
		}
		
		function _onCollapse(){
			var $title = $('.layout-expand-north .panel-title').first();
			$('<div class="panel-icon icon-search"></div>').insertAfter($title);
			$title.addClass('panel-with-icon');
			//修改名称
			$title.text('备件基础信息');
		};

	</script>
</body>
</html>