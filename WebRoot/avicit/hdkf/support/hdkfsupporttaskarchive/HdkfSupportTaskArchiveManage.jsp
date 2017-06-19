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
<!-- ControllerPath = "hdkf/support/hdkfsupporttaskarchive/HdkfSupportTaskArchiveController/HdkfSupportTaskArchiveInfo" -->
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
		style="background: #ffffff; height: 0; font-size: 0;">
		<div id="toolbarHdkfSupportTaskArchive" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportTaskArchive_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportTaskArchive.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportTaskArchive.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportTaskArchive.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportTaskArchive.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportTaskArchive_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportTaskArchive.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportTaskArchive.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportTaskArchive.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportTaskArchive.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportTaskArchive_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportTaskArchive.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<%-- 				<sec:accesscontrollist hasPermission="3" domainObject="formdialog_hdkfSupportTaskArchive_button_edit" permissionDes="编辑"> --%>
					<!-- 					<td id="tool_edit_td"><a class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="hdkfSupportTaskArchive.modify();" href="javascript:void(0);">编辑</a></td> -->
					<%-- 				</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportTaskArchive_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportTaskArchive.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportTaskArchive_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportTaskArchive.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportTaskArchive"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportTaskArchive',
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
					<th data-options="field:'taskId', hidden:true, align:'center'"
						width="220">任务书ID</th>
					<th
						data-options="field:'taskNo', align:'center', formatter:formateHref"
						width="220">任务书编号</th>
					<!-- 				<th data-options="field:'archiveNo', hidden:'hidden'" width="220">归档编号</th> -->
					<th
						data-options="field:'archiveTime', align:'center',formatter:formateDate"
						width="220">归档时间</th>
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
		<form id="hdkfSupportTaskArchive">
			<table class="form_commonTable">
			
			
				<tr>
					<th width="10%">归档时间从:</th>
					<td width="40%"><input name="archiveTimeBegin"
						id="archiveTimeBegin" class="easyui-datebox" editable="false" />
					<th width="10%">归档时间(至):</th>
					<td width="40%"><input name="archiveTimeEnd"
						id="archiveTimeEnd" class="easyui-datebox" editable="false" /></td>
				</tr>
				<tr>
					
					<th width="10%">任务书编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="taskNo" /></td>
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
						onclick="hdkfSupportTaskArchive.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportTaskArchive.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportTaskArchive.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupporttaskarchive/js/HdkfSupportTaskArchive.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportTaskArchive;
		$(function() {
			hdkfSupportTaskArchive = new HdkfSupportTaskArchive(
					'dgHdkfSupportTaskArchive', '${url}', 'searchDialog',
					'hdkfSupportTaskArchive');

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
				name : '归档编号',
				field : 'ARCHIVE_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '归档时间',
				field : 'ARCHIVE_TIME',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportTaskArchive.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportTaskArchive.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportTaskArchive.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportTaskArchive.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
	</script>
</body>
</html>