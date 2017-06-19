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
<!-- ControllerPath = "hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveController/HdkfSupportCardArchiveInfo" -->
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
		<div id="toolbarHdkfSupportCardArchive" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportCardArchive_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportCardArchive.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportCardArchive.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportCardArchive.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportCardArchive.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportCardArchive_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportCardArchive.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportCardArchive.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportCardArchive.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportCardArchive.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportCardArchive_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportCardArchive.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportCardArchive_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportCardArchive.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportCardArchive_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportCardArchive.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportCardArchive_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportCardArchive.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportCardArchive"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportCardArchive',
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
					<th data-options="field:'requestNo', align:'center',formatter:formateHref" width="220">信息卡编号</th>
					<th
						data-options="field:'archiveType', align:'center',formatter:formatearchiveType"
						width="220">归档类别</th>
					<th data-options="field:'respId', align:'center', hidden:true" width="220">答复文号</th>
					<th data-options="field:'respNo', align:'center'" width="220">答复文号</th>
					<th data-options="field:'dealId', hidden:true" width="220">处理ID</th>
					<th
						data-options="field:'tripStartTime', hidden:true, align:'center',formatter:formateDate"
						width="220">赴外场出发时间</th>
					<th data-options="field:'requestId', hidden:true" width="220">求援请求ID</th>
<!-- 					<th data-options="field:'requestNo', align:'center'" width="220">信息卡编号</th> -->
					<th data-options="field:'attribute02', align:'center'" width="220">任务书编号</th>
					
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
		<form id="hdkfSupportCardArchive">
			<table class="form_commonTable">
				<tr>
					
				
				
				
				<th width="10%">信息卡编号:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="requestNo" /></td>
				
				   <th width="10%">归档类别:</th>
					<td><pt6:syslookup name="archiveType"
							lookupCode="SUPPORT_ARCHIVE_TYPE"
							isNull= "true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				
				</tr>
				<tr>
					<th width="10%">归档时间从:</th>
					<td width="40%"><input name="archiveTimeBegin"
						id="archiveTimeBegin" class="easyui-datebox" editable="false" />
					<th width="10%">归档时间(至):</th>
					<td width="40%"><input name="archiveTimeEnd"
						id="archiveTimeEnd" class="easyui-datebox" editable="false" /></td>
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
						onclick="hdkfSupportCardArchive.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportCardArchive.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportCardArchive.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportcardarchive/js/HdkfSupportCardArchive.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportCardArchive;
		$(function() {
			hdkfSupportCardArchive = new HdkfSupportCardArchive(
					'dgHdkfSupportCardArchive', '${url}', 'searchDialog',
					'hdkfSupportCardArchive');

			var array = [];

			var searchObject = {
				name : '归档类别',
				field : 'ARCHIVE_TYPE',
				type : 1,
				dictCode : 'SUPPORT_ARCHIVE_TYPE',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复文号',
				field : 'RESP_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复文号',
				field : 'RESP_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '处理ID',
				field : 'DEAL_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '赴外场出发时间',
				field : 'TRIP_START_TIME',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援请求ID',
				field : 'REQUEST_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援信息编号',
				field : 'REQUEST_NO',
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
				hdkfSupportCardArchive.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportCardArchive.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportCardArchive.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportCardArchive.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
		function formatearchiveType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportCardArchive.archiveType);
		}
	</script>
</body>
</html>