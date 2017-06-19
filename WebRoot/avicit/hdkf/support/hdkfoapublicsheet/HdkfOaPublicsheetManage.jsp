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
<!-- ControllerPath = "hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/HdkfOaPublicsheetInfo" -->
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
		<div id="toolbarHdkfOaPublicsheet" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfOaPublicsheet_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfOaPublicsheet.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfOaPublicsheet.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfOaPublicsheet.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfOaPublicsheet.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfOaPublicsheet_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfOaPublicsheet.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfOaPublicsheet.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfOaPublicsheet.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfOaPublicsheet.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfOaPublicsheet_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfOaPublicsheet.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfOaPublicsheet_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfOaPublicsheet.modify();" href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfOaPublicsheet_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfOaPublicsheet.del();" href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfOaPublicsheet_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfOaPublicsheet.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					<td><a class="easyui-linkbutton" iconCls="icon-search"
						plain="true" onclick="selfDefQury.show();"
						href="javascript:void(0);">高级查询</a></td>
				</tr>
			</table>
		</div>
		<table id="dgHdkfOaPublicsheet"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfOaPublicsheet',
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
						data-options="field:'sheetno', halign:'center', formatter:formateHref"
						width="220">公用笺编号</th>
					<th data-options="field:'sendDepAlias',align:'center'" width="220">发文单位</th>
					<th
						data-options="field:'sentdate', halign:'center',formatter:formateDate"
						width="220">发文日期</th>
					<th data-options="field:'receiveDepAlias',align:'center'"
						width="220">分发单位</th>
					<th data-options="field:'planetype', halign:'center'" width="220">机型</th>
					<th data-options="field:'batchNo', halign:'center'" width="220">批次</th>
					<th data-options="field:'sortieNo', halign:'center'" width="220">架次</th>
					<!-- <th data-options="field:'sheetcontent', halign:'center'" width="220">公用笺内容</th> -->
					<th data-options="field:'sendreason', halign:'center'" width="220">发笺原因</th>
					<th data-options="field:'recorder', halign:'center'" width="220">编写人</th>
					<!-- <th data-options="field:'proofreader', halign:'center'" width="220">校对人</th>
																																																																	<th data-options="field:'reviewer', halign:'center'" width="220">审核人</th>
																																																																	<th data-options="field:'approver', halign:'center'" width="220">审定人</th>
																																																																	<th data-options="field:'remarks', halign:'center'" width="220">备注</th> -->
					<th data-options="field:'activityalias_', halign:'center'"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', halign:'center'"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfOaPublicsheet">
			<table class="form_commonTable">
				<tr>
					<th width="10%">公用笺编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="sheetno" /></td>
					<th width="10%">发文单位:</th>
					<td><input title="发文单位" class="inputbox" type="hidden"
						name="sendDep" id="sendDep" />
						<div class="">
							<input class="easyui-validatebox" name="sendDepAlias"
								id="sendDepAlias" readOnly="readOnly"></input>
						</div></td>
				</tr>
				<tr>
					<!-- <tr>
							    <th width="10%">发文日期从:</th>
									 <td width="40%">
									<input name="sentdateBegin" id="sentdateBegin" class="easyui-datebox" editable="false"  />
									<th width="10%">发文日期(至):</th>
									 <td width="40%">
									<input name="sentdateEnd" id="sentdateEnd" class="easyui-datebox" editable="false"  />
									</td>
								</tr> -->
					<th width="10%">分发单位:</th>
					<td><input title="分发单位" class="inputbox" type="hidden"
						name="receiveDep" id="receiveDep" />
						<div class="">
							<input class="easyui-validatebox" name="receiveDepAlias"
								id="receiveDepAlias" readOnly="readOnly"></input>
						</div></td>
					<th width="10%">机型:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="planetype" /></td>
				</tr>
				<tr>
					<th width="10%">批次:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="batchNo" /></td>
					<th width="10%">架次:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="sortieNo" /></td>
				</tr>
				<!-- 
								<tr>
																																								<th width="10%">公用笺内容:</th>
								    								 <td width="40%"><input class="easyui-validatebox"  style="width: 151px;" type="text" name="sheetcontent"/></td>
																																																<th width="10%">发笺原因:</th>
								    								 <td width="40%"><input class="easyui-validatebox"  style="width: 151px;" type="text" name="sendreason"/></td>
																							</tr> -->
				<tr>
					<th width="10%">编写人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="recorder" /></td>
					<th width="10%">校对人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="proofreader" /></td>
				</tr>
				<tr>
					<th width="10%">审核人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="reviewer" /></td>
					<th width="10%">审定人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="approver" /></td>
				</tr>
				<tr>
					<th width="10%">备注:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="remarks" /></td>
				</tr>
			</table>
			<input type="hidden" name="bpmState" id="bpmState" value="all"></input>
			<input type="hidden" name="bpmType" id="bpmType" value="my"></input>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false" onclick="hdkfOaPublicsheet.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false" onclick="hdkfOaPublicsheet.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfOaPublicsheet.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfoapublicsheet/js/HdkfOaPublicsheet.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfOaPublicsheet;
		$(function() {
			hdkfOaPublicsheet = new HdkfOaPublicsheet('dgHdkfOaPublicsheet',
					'${url}', 'searchDialog', 'hdkfOaPublicsheet');
			var sendDepDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "sendDep", "sendDepAlias");
			sendDepDeptCommonSelector.init();

			var receiveDepDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "receiveDep", "receiveDepAlias",
					"", "", "", -1);
			receiveDepDeptCommonSelector.init();
		
			var array = [];

			var searchObject = {
				name : '公用笺编号',
				field : 'SHEETNO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发文单位',
				field : 'SEND_DEP',
				type : 1,
				dataType : 'dept'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发文日期',
				field : 'SENTDATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '分发单位',
				field : 'RECEIVE_DEP',
				type : 1,
				dataType : 'dept'
			};
			array.push(searchObject);

			var searchObject = {
				name : '机型',
				field : 'PLANETYPE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '批次',
				field : 'BATCH_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '架次',
				field : 'SORTIE_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '公用笺内容',
				field : 'SHEETCONTENT',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发笺原因',
				field : 'SENDREASON',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '编写人',
				field : 'RECORDER',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '校对人',
				field : 'PROOFREADER',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '审核人',
				field : 'REVIEWER',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '审定人',
				field : 'APPROVER',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '备注',
				field : 'REMARKS',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfOaPublicsheet.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfOaPublicsheet.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfOaPublicsheet.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfOaPublicsheet.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
	</script>
</body>
</html>