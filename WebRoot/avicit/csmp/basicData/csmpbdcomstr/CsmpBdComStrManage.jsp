<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdcomstr/CsmpBdComStrController/CsmpBdComStrInfo" -->
<title>单位信息类别</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" charset=utf-8 type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js" type="text/javascript"></script>
</head>
<script>
var compName = '${compName}';
var compCode ='${compCode}';
var compId = '${compId}';
</script>
<body class="easyui-layout" fit="true">

	<div data-options="region:'north',title:'',split:true" style="height: 100px;">
		<table style="background:;" width="100%" height="100%">
			<tr>
				<th align="">
					<center>
						<h1>单位名称:${compName}</h1>
					</center>
				</th>
			</tr>
		</table>
	</div>
	<div data-options="region:'center'" style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarCsmpBdComStr" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdComStr_button_add" permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="insertAnewRow();" href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdComStr_button_save" permissionDes="保存">
						<td><a class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveNewRow();" href="javascript:void(0);">保存</a></td>
					</sec:accesscontrollist>
				<%-- 	<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdComStr_button_edit" permissionDes="编辑">
						<td><a class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="CsmpBdComStr_edit();" href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3" domainObject="formdialog_csmpBdComStr_button_delete" permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="csmpBdComStr.del();" href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
				</tr>
			</table>
		</div>
		<table id="dgCsmpBdComStr" data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarCsmpBdComStr',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'id', align:'center',checkbox:true" width="220">关系表主键ID</th>
					<th data-options="field:'catalogName', align:'center',editor:{type:'combobox',options:{
										valueField:'id',
										required:true, 
										textField:'text',
										editable:false
										}}" width="220">单位结构名称</th>
					<th data-options="field:'companyCode', align:'center'" width="220">单位编码</th>
					<th data-options="field:'catalogType', align:'center',editor:{type:'combobox',options:{
										hasDownArrow:false,
										disabled:true
										}},formatter:formatecatalogType" width="220">单位类型</th>
				<!-- 	<th data-options="field:'remark', align:'center',editor:{type:'textarea'}" width="220">备注</th> -->
					<!-- 
						<th data-options="field:'companyName', align:'center'" width="220">单位名称</th>
						<th data-options="field:'strId', align:'center'" width="220">单位结构ID</th>
						<th data-options="field:'comId', align:'center'" width="220">业务记录主键ID</th>
					 -->
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog" data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'" style="width: 904px; height: 340px; display: none;">
		<form id="csmpBdComStr">
			<table class="form_commonTable">
				<tr>
					<th width="10%">单位结构ID:</th>
					<td width="40%"><input class="easyui-validatebox" style="width: 151px;" type="text" name="strId" /></td>
					<th width="10%">单位ID:</th>
					<td width="40%"><input class="easyui-validatebox" style="width: 151px;" type="text" name="comId" /></td>
				</tr>
				<tr>
					<th width="10%">单位类型:</th>
					<td width="40%"><input class="easyui-validatebox" style="width: 151px;" type="text" name="comType" /></td>
					<th width="10%">备注:</th>
					<td width="40%"><input class="easyui-validatebox" style="width: 151px;" type="text" name="remark" /></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right">
					<a class="easyui-linkbutton primary-btn" iconCls="" plain="false" onclick="csmpBdComStr.searchData();" href="javascript:void(0);">查询</a> 
					<a class="easyui-linkbutton" iconCls="" plain="false" onclick="csmpBdComStr.clearData();" href="javascript:void(0);">清空</a> 
					<a class="easyui-linkbutton" iconCls="" plain="false" onclick="csmpBdComStr.hideSearchForm();" href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script src=" avicit/csmp/basicData/csmpbdcomstr/js/CsmpBdComStr.js" type="text/javascript"></script>
	<script src=" avicit/csmp/basicData/csmpbdcomstr/js/CsmpBdComStr_edit.js" type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdComStr;
		var dg;
		$(function() {
			csmpBdComStr = new CsmpBdComStr('dgCsmpBdComStr', '${url}', 'searchDialog', 'csmpBdComStr', '${compId}');
			var array = [];

			var searchObject = {
				name : '单位结构ID',
				field : 'STR_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '单位ID',
				field : 'COM_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '单位类型',
				field : 'COM_TYPE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '备注',
				field : 'REMARK',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				csmpBdComStr.searchDataBySfn(param);
			});
			
			
			dg = $(csmpBdComStr._datagridId).datagrid({
				/* onClickRow:function(rowIndex, rowData){
					if(!rowData.id){
						console.info(row0);
						$(this).datagrid('beginEdit',rowIndex);
					}
				}*/
			});
		});
		function formateDate(value, row, index) {
			return csmpBdComStr.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdComStr.formateTime(value);
		}
		//csmpBdComStr.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdComStr.detail(\'' + row.id + '\');">' + value + '</a>';
		}
		//格式化单位类型
		function formatecatalogType(value) {
			return Platform6.fn.lookup.formatLookupType(value,csmpBdComStr.catalogType);
		}
	</script>
</body>
</html>