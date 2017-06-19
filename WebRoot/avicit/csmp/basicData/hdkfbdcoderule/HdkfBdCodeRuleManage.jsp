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
<!-- ControllerPath = "csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/HdkfBdCodeRuleInfo" -->
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
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarHdkfBdCodeRule" class="datagrid-toolbar">
			<table>
				<tr>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfBdCodeRule_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfBdCodeRule.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfBdCodeRule_button_edit"
						permissionDes="编辑">
						<td><a class="easyui-linkbutton" iconCls="icon-edit"
							plain="true" onclick="hdkfBdCodeRule.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfBdCodeRule_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfBdCodeRule.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfBdCodeRule_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfBdCodeRule.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfBdCodeRule_button_query"
						permissionDes="生成编码">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfBdCodeRule.generate();"
							href="javascript:void(0);">生成编码</a></td>
					</sec:accesscontrollist>

					<td><a class="easyui-linkbutton" iconCls="icon-search"
						plain="true" onclick="selfDefQury.show();"
						href="javascript:void(0);">高级查询</a></td>
				</tr>
			</table>
		</div>
		<table id="dgHdkfBdCodeRule"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfBdCodeRule',
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
					<th data-options="field:'id', align:'center',checkbox:true"
						width="220">主键</th>
					<th
						data-options="field:'codeType', align:'center',formatter:formatecodeType"
						width="220">编码类型</th>
					<th data-options="field:'attribute01', align:'center'" width="220">机型编码</th>
					<th data-options="field:'planeCode', align:'center'" width="220">机型代码</th>
					<th data-options="field:'curYear', align:'center'" width="220">当前年份</th>
					<th data-options="field:'maxNo', align:'center'" width="220">当前最大编码</th>
					<th data-options="field:'serialnoCount', align:'center'"
						width="220">序列号位数</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfBdCodeRule">
			<table class="form_commonTable">
				<tr>
					<th width="10%">编码类型:</th>
					<td width="40%"><pt6:syslookup name="codeType"
							lookupCode="SUPPORT_CODE_TYPE"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">机型代码:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="planeCode" /></td>
				</tr>
				<tr>
					<th width="10%">当前年份:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="curYear" /></td>
					<th width="10%">当前最大编码:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="maxNo" /></td>
				</tr>
				<tr>
					<th width="10%">序列号位数:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="serialnoCount" /></td>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false" onclick="hdkfBdCodeRule.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false" onclick="hdkfBdCodeRule.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfBdCodeRule.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src=" avicit/csmp/basicData/hdkfbdcoderule/js/HdkfBdCodeRule.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfBdCodeRule;
		$(function() {
			hdkfBdCodeRule = new HdkfBdCodeRule('dgHdkfBdCodeRule', '${url}',
					'searchDialog', 'hdkfBdCodeRule');
			/////
			var array = [];

			var searchObject = {
				name : '编码类型',
				field : 'CODE_TYPE',
				type : 1,
				dictCode : 'SUPPORT_CODE_TYPE',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '机型代码',
				field : 'PLANE_CODE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '当前年份',
				field : 'CUR_YEAR',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '当前最大编码',
				field : 'MAX_NO',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);

			var searchObject = {
				name : '序列号位数',
				field : 'SERIALNO_COUNT',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfBdCodeRule.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfBdCodeRule.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfBdCodeRule.formateTime(value);
		}
		//hdkfBdCodeRule.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="hdkfBdCodeRule.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		function formatecodeType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfBdCodeRule.codeType);
		}
	</script>
</body>
</html>