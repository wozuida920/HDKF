<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/HdkfSupportBorrowPersonInfInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<script src="static/js/platform/component/dialog/UserSelectDialog.js"
	type="text/javascript"></script>
<script src="static/js/platform/bpm/client/js/ToolBar.js"
	type="text/javascript"></script>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'north'"
		style="background: #ffffff; height: 200px; padding: 0px; overflow: hidden;">
		<div style="height: 200px;">
			<form id="hdkfSupportBorrowPersonInf">
			<table class="form_commonTable">
				
				<tr>
					<th width="10%">借人单名称:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="borrowName" /></td>
					<th width="10%">专业:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="major" /></td>
				</tr>
				
				<tr>
					<th width="10%">客服部经办人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="linkManKf" /></td>
						<th width="10%">客服部联系电话:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="linkPhoneKf" /></td>
				</tr>
				<tr>
					<th width="10%">借出部门经办人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="linkManBorrowed" /></td>
					<th width="10%">借出部门经办人电话:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="linkPhoneBorrowed" /></td>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="center"><a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportBorrowPersonInf.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportBorrowPersonInf.clearData();"
						href="javascript:void(0);">清空</a></td>
				</tr>
			</table>
		</div>
		</div>
	</div>

	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
		<!-- tollbar删掉了 -->
		<table id="dgHdkfSupportBorrowPersonInf"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportBorrowPersonInf',
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
					<th data-options="field:'id', halign:'center',checkbox:true"
						width="220">主键</th>
					<th
						data-options="field:'taskId', halign:'center'"
						width="220">任务书ID</th>
					<th data-options="field:'taskNo', halign:'center'" width="220">任务书编号</th>
					<th data-options="field:'borrowName', halign:'center', formatter:formateHref" width="220">借人单名称</th>
					<th data-options="field:'borrowDeptAlias',align:'center'"
						width="220">部门名称</th>
					<th data-options="field:'borrowNumber', halign:'center'"
						width="220">借人数量</th>
					<th data-options="field:'address', halign:'center'" width="220">地点</th>
					<th
						data-options="field:'estimateDate', halign:'center',formatter:formateDate"
						width="220">预计时间</th>
					<th data-options="field:'major', halign:'center'" width="220">专业</th>
					<th data-options="field:'linkManKf', halign:'center'" width="220">客服部经办人</th>
					<th data-options="field:'linkPhoneKf', halign:'center'" width="220">客服部联系电话</th>
					<th data-options="field:'taskDemand', halign:'center'" width="220">任务及要求</th>
					<th data-options="field:'linkManBorrowed', halign:'center'"
						width="220">借出部门经办人</th>
					<th data-options="field:'linkPhoneBorrowed', halign:'center'"
						width="220">借出部门经办人电话</th>
					<th data-options="field:'activityalias_', halign:'center'"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', halign:'center'"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	

	<script
		src=" avicit/hdkf/support/hdkfsupportborrowpersoninf/js/HdkfSupportBorrowPersonInf.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportBorrowPersonInf;
		$(function() {
			hdkfSupportBorrowPersonInf = new HdkfSupportBorrowPersonInf(
					'dgHdkfSupportBorrowPersonInf', '${url}', 'searchDialog',
					'hdkfSupportBorrowPersonInf');
			var borrowDeptDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "borrowDept", "borrowDeptAlias");
			borrowDeptDeptCommonSelector.init();
			
			var array = [];

			var searchObject = {
				name : '任务书ID',
				field : 'TASK_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务书编号',
				field : 'TASK_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '借人单名称',
				field : 'BORROW_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '借用人所在部门',
				field : 'BORROW_DEPT',
				type : 1,
				dataType : 'dept'
			};
			array.push(searchObject);

			var searchObject = {
				name : '借人数量',
				field : 'BORROW_NUMBER',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);

			var searchObject = {
				name : '地点',
				field : 'ADDRESS',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '预计时间',
				field : 'ESTIMATE_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '专业',
				field : 'MAJOR',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '客服部经办人',
				field : 'LINK_MAN_KF',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '客服部联系电话',
				field : 'LINK_PHONE_KF',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务及要求',
				field : 'TASK_DEMAND',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '借出部门经办人',
				field : 'LINK_MAN_BORROWED',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '借出部门经办人电话',
				field : 'LINK_PHONE_BORROWED',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportBorrowPersonInf.searchDataBySfn(param);
			});
			hdkfSupportBorrowPersonInf.setOnClick(function(rowdata){
				 parent.setBorrowPersonInfData(rowdata);
			});
			
		});
		function formateDate(value, row, index) {
			return hdkfSupportBorrowPersonInf.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportBorrowPersonInf.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportBorrowPersonInf.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
	</script>
</body>
</html>