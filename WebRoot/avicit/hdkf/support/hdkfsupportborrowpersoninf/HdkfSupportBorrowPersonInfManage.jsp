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
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
		<div id="toolbarHdkfSupportBorrowPersonInf" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportBorrowPersonInf_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportBorrowPersonInf_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportBorrowPersonInf.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportBorrowPersonInf_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportBorrowPersonInf.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportBorrowPersonInf_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportBorrowPersonInf.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportBorrowPersonInf_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportBorrowPersonInf.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportBorrowPersonInf_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true"
							onclick="hdkfSupportBorrowPersonInf.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
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
						data-options="field:'taskId', hidden:true, align:'center'"
						width="220">任务书ID</th>
					<th data-options="field:'taskNo', align:'center'" width="250">任务书编号</th>
					<th data-options="field:'borrowName', align:'center', formatter:formateHref" width="220">借人单名称</th>
					<th data-options="field:'borrowDeptAlias',align:'center'"
						width="200">部门名称</th>
					<th data-options="field:'borrowNumber', align:'center'"
						width="170">借人数量</th>
					<th data-options="field:'address', align:'center'" width="170">地点</th>
					<th
						data-options="field:'estimateDate', align:'center',formatter:formateDate"
						width="180">预计时间</th>
					<th data-options="field:'major', align:'center'" width="220">专业</th>
					<th data-options="field:'linkManKf', align:'center'" width="220">客服部经办人</th>
					<th data-options="field:'linkPhoneKf', hidden:true, align:'center'" width="250">客服部联系电话</th>
					<th data-options="field:'attribute11', align:'center'" width="220">实际借人数量</th>
					<th data-options="field:'linkManBorrowed', align:'center'"
						width="220">借出部门经办人</th>
					<th data-options="field:'linkPhoneBorrowed', hidden:true, align:'center'"
						width="220">借出部门经办人电话</th>
					<th data-options="field:'activityalias_', align:'center'"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', align:'center'"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportBorrowPersonInf">
			<table class="form_commonTable">
				<tr>
				
				<th width="10%">借人单名称:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="borrowName" /></td>
					
					<th width="10%">任务书编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="taskNo" /></td>
					
				</tr>
				<tr>
					
					<th width="10%">所借部门:</th>
					<td><input title="部门名称" class="inputbox" type="hidden"
						name="borrowDept" id="borrowDept" />
						<div class="">
							<input class="easyui-validatebox" name="borrowDeptAlias"
								id="borrowDeptAlias" readOnly="readOnly"></input>
						</div></td>
					<th width="10%">借出部门经办人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="linkManBorrowed" /></td>
				</tr>
				<tr>
					<th width="10%">借人数量:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="borrowNumber" /></td>
					<th width="10%">地点:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="address" /></td>
				</tr>
				
				<tr>
					<th width="10%">预计时间从:</th>
					<td width="40%"><input name="estimateDateBegin"
						id="estimateDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">预计时间(至):</th>
					<td width="40%"><input name="estimateDateEnd"
						id="estimateDateEnd" class="easyui-datebox" editable="false" />
					</td>
				</tr>
				<tr>
					<th width="10%">专业:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="major" /></td>
					<th width="10%">客服部经办人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="linkManKf" /></td>
					
				</tr>
				
		
			</table>
			<input type="hidden" name="bpmState" id="bpmState" value="all"></input>
			<input type="hidden" name="bpmType" id="bpmType" value="my"></input>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportBorrowPersonInf.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportBorrowPersonInf.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportBorrowPersonInf.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
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

// 			var searchObject = {
// 				name : '任务及要求',
// 				field : 'TASK_DEMAND',
// 				type : 1,
// 				dataType : 'string'
// 			};
// 			array.push(searchObject);

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