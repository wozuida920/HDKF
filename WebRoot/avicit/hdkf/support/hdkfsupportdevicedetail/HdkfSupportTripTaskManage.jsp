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
<!-- ControllerPath = "hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/HdkfSupportTripTaskInfo" -->
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

<div data-options="region:'north'" style="background: #ffffff; height: 116px; padding: 0px; overflow: hidden;">
		<div style="height:139px;">
			<form id="hdkfSupportTripTask"  style="">
			<table class="form_commonTable" style>
				<tr>
					<th width="10%">任务书编号:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 60px;" type="text" name="taskNo" /></td>
					<th width="10%">费用编号:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 60px;" type="text" name="feeNo" /></td>
					<th width="10%">排故所去部队:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 60px;" type="text" name="toArmyName" /></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera" style="height:30px;background: red">
			<table class="tableForm" border="0" cellspacing="0" width='100%'>
				<tr>
					<td align="center"><a class="easyui-linkbutton " iconCls=""
						plain="false" onclick="hdkfSupportTripTask.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false" onclick="hdkfSupportTripTask.clearData();"
						href="javascript:void(0);">清空</a></td>
				</tr>
				
			</table>
		</div>
		</div>
	</div>



	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
<!-- 		<div id="toolbarHdkfSupportTripTask" class="datagrid-toolbar"> -->
<!-- 			<table> -->
<!-- 				<tr> -->
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportTripTask_button_bpmAll" --%>
<%-- 						permissionDes="全部文件"> --%>
<!-- 						<td width="120px;"><a href="javascript:void(0);" id="allMenu" -->
<!-- 							name="bpm_all_menu" class='easyui-menubutton' -->
<!-- 							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a> -->
<!-- 							<div id="allmm" style="width: 105px;"> -->
<!-- 								<div id='all_start' name="bpm_all_start" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('start','all')">拟稿中</div> -->
<!-- 								<div id='all_active' name="bpm_all_active" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('active','all')">流转中</div> -->
<!-- 								<div id='all_ended' name="bpm_all_ended" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('ended','all')">已完成</div> -->
<!-- 								<div id='all_all' name="bpm_all_all" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('all','all')">全部文件</div> -->
<!-- 							</div></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportTripTask_button_bpmMyFile" --%>
<%-- 						permissionDes="我的文件"> --%>
<!-- 						<td width="120px;"><a href="javascript:void(0);" id="myMenu" -->
<!-- 							name="bpm_my_menu" class='easyui-menubutton' -->
<!-- 							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a> -->
<!-- 							<div id="mymm" style="width: 105px;"> -->
<!-- 								<div id='my_start' name="bpm_my_start" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('start','my')">我的拟稿</div> -->
<!-- 								<div id='my_active' name="bpm_my_active" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('active','my')">我的流转</div> -->
<!-- 								<div id='my_ended' name="bpm_my_ended" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('ended','my')">我的完成</div> -->
<!-- 								<div id='my_all' name="bpm_my_all" -->
<!-- 									onclick="hdkfSupportTripTask.initWorkFlow('all','my')">我的全部</div> -->
<!-- 							</div></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportTripTask_button_add" --%>
<%-- 						permissionDes="添加"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-add" -->
<!-- 							plain="true" onclick="hdkfSupportTripTask.insert();" -->
<!-- 							href="javascript:void(0);">添加</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportTripTask_button_edit" --%>
<%-- 						permissionDes="编辑"> --%>
<!-- 						<td id="tool_edit_td"><a class="easyui-linkbutton" -->
<!-- 							iconCls="icon-edit" plain="true" -->
<!-- 							onclick="hdkfSupportTripTask.modify();" -->
<!-- 							href="javascript:void(0);">编辑</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportTripTask_button_delete" --%>
<%-- 						permissionDes="删除"> --%>
<!-- 						<td id="tool_del_td"><a class="easyui-linkbutton" -->
<!-- 							iconCls="icon-remove" plain="true" -->
<!-- 							onclick="hdkfSupportTripTask.del();" href="javascript:void(0);">删除</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportTripTask_button_query" --%>
<%-- 						permissionDes="查询"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 							plain="true" onclick="hdkfSupportTripTask.openSearchForm();" -->
<!-- 							href="javascript:void(0);">查询</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
		<table id="dgHdkfSupportTripTask"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportTripTask',
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
						data-options="field:'kfDealId', hidden:true"
						width="220">请求处理ID</th>
					<th data-options="field:'taskNo', halign:'center'" width="220">任务书编号</th>
					<th data-options="field:'taskName', halign:'center'" width="220">任务书名称</th>
					<th
						data-options="field:'isNeedEquipment', halign:'center',formatter:formateisNeedEquipment"
						width="220">是否需要器材</th>
					<th data-options="field:'needEquipment', hidden:true"
						width="220">需要的器材</th>
					<th
						data-options="field:'isBorrowSomeone', halign:'center',formatter:formateisBorrowSomeone"
						width="220">是否派人</th>
					<th data-options="field:'writeManId', hidden:true" width="220">填写人ID</th>
					<th data-options="field:'writeManName', halign:'center'"
						width="220">填写人姓名</th>
					<th data-options="field:'contentDemand', hidden:true"
						width="220">任务内容与要求</th>
					<th data-options="field:'feeNo', halign:'center'" width="220">费用编号</th>
					<th data-options="field:'toArmyName', halign:'center'" width="220">排故所去部队</th>
					<th data-options="field:'executors', halign:'center'" width="220">执行者</th>
					<th data-options="field:'totalHours', halign:'center'" width="220">总任务完成时间</th>
					<th
						data-options="field:'startDate', hidden:true,formatter:formateDate"
						width="220">任务实际开始时间</th>
					<th
						data-options="field:'endDate', hidden:true,formatter:formateDate"
						width="220">任务实际完成时间</th>
					<th data-options="field:'taskDetails', hidden:true" width="220">任务完成详细说明</th>
					<th data-options="field:'suggestionDemand', hidden:true"
						width="220">部队领导意见及要求</th>
					<th data-options="field:'evaluate', hidden:true" width="220">任务评价</th>
					<th data-options="field:'director', hidden:true" width="220">部队技术室主任</th>
					<th data-options="field:'head', hidden:true" width="220">部队技术室部长</th>
					<th
						data-options="field:'noticeTime', hidden:true,formatter:formateDate"
						width="220">通知客户时间</th>
					<th
						data-options="field:'tripStartTime', hidden:true,formatter:formateDate"
						width="220">赴外场出发时间</th>
					<th data-options="field:'requestId', hidden:true" width="220">求援请求ID</th>
					<th data-options="field:'requestNo', halign:'center'" width="220">信息处理卡编号</th>
					<th data-options="field:'activityalias_', halign:'center'"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', halign:'center'"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
<!-- 	<div id="searchDialog" -->
<!-- 		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'" -->
<!-- 		style="width: 904px; height: 340px; display: none;"> -->
<!-- 		<form id="hdkfSupportTripTask"> -->
<!-- 			<table class="form_commonTable"> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">请求处理ID:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="kfDealId" /></td> -->
<!-- 					<th width="10%">任务书编号:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="taskNo" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">任务书名称:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="taskName" /></td> -->
<!-- 					<th width="10%">是否需要器材:</th> -->
<%-- 					<td><pt6:syslookup name="isNeedEquipment" --%>
<%-- 							lookupCode="PLATFORM_YES_NO_FLAG" --%>
<%-- 							isNull="true" --%>
<%-- 							dataOptions="width:151,editable:false,panelHeight:'auto'"> --%>
<%-- 						</pt6:syslookup></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">需要的器材:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="needEquipment" /></td> -->
<!-- 					<th width="10%">是否派人:</th> -->
<%-- 					<td><pt6:syslookup name="isBorrowSomeone" --%>
<%-- 							lookupCode="PLATFORM_YES_NO_FLAG" --%>
<%-- 							isNull="true" --%>
<%-- 							dataOptions="width:151,editable:false,panelHeight:'auto'"> --%>
<%-- 						</pt6:syslookup></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">填写人ID:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="writeManId" /></td> -->
<!-- 					<th width="10%">填写人姓名:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="writeManName" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">任务内容与要求:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="contentDemand" /></td> -->
<!-- 					<th width="10%">费用编号:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="feeNo" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">排故所去部队:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="toArmyName" /></td> -->
<!-- 					<th width="10%">执行者:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="executors" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">总任务完成时间:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="totalHours" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">任务实际开始时间从:</th> -->
<!-- 					<td width="40%"><input name="startDateBegin" -->
<!-- 						id="startDateBegin" class="easyui-datebox" editable="false" /> -->
<!-- 					<th width="10%">任务实际开始时间(至):</th> -->
<!-- 					<td width="40%"><input name="startDateEnd" id="startDateEnd" -->
<!-- 						class="easyui-datebox" editable="false" /></td> -->
<!-- 				</tr> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">任务实际完成时间从:</th> -->
<!-- 					<td width="40%"><input name="endDateBegin" id="endDateBegin" -->
<!-- 						class="easyui-datebox" editable="false" /> -->
<!-- 					<th width="10%">任务实际完成时间(至):</th> -->
<!-- 					<td width="40%"><input name="endDateEnd" id="endDateEnd" -->
<!-- 						class="easyui-datebox" editable="false" /></td> -->
<!-- 				</tr> -->
<!-- 				<th width="10%">任务完成详细说明:</th> -->
<!-- 				<td width="40%"><input class="easyui-validatebox" -->
<!-- 					style="width: 151px;" type="text" name="taskDetails" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">部队领导意见及要求:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="suggestionDemand" /></td> -->
<!-- 					<th width="10%">任务评价:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="evaluate" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">部队技术室主任:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="director" /></td> -->
<!-- 					<th width="10%">部队技术室部长:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="head" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">通知客户时间从:</th> -->
<!-- 					<td width="40%"><input name="noticeTimeBegin" -->
<!-- 						id="noticeTimeBegin" class="easyui-datebox" editable="false" /> -->
<!-- 					<th width="10%">通知客户时间(至):</th> -->
<!-- 					<td width="40%"><input name="noticeTimeEnd" id="noticeTimeEnd" -->
<!-- 						class="easyui-datebox" editable="false" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">赴外场出发时间从:</th> -->
<!-- 					<td width="40%"><input name="tripStartTimeBegin" -->
<!-- 						id="tripStartTimeBegin" class="easyui-datebox" editable="false" /> -->
<!-- 					<th width="10%">赴外场出发时间(至):</th> -->
<!-- 					<td width="40%"><input name="tripStartTimeEnd" -->
<!-- 						id="tripStartTimeEnd" class="easyui-datebox" editable="false" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<th width="10%">求援请求ID:</th> -->
<!-- 				<td width="40%"><input class="easyui-validatebox" -->
<!-- 					style="width: 151px;" type="text" name="requestId" /></td> -->
<!-- 				<th width="10%">信息处理卡编号:</th> -->
<!-- 				<td width="40%"><input class="easyui-validatebox" -->
<!-- 					style="width: 151px;" type="text" name="requestNo" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 			<input type="hidden" name="bpmState" id="bpmState" value="all"></input> -->
<!-- 			<input type="hidden" name="bpmType" id="bpmType" value="my"></input> -->
<!-- 		</form> -->
<!-- 		<div id="searchBtns" class="datagrid-toolbar foot-formopera"> -->
<!-- 			<table class="tableForm" border="0" cellspacing="1" width='100%'> -->
<!-- 				<tr> -->
<!-- 					<td align="right"><a class="easyui-linkbutton primary-btn" -->
<!-- 						iconCls="" plain="false" -->
<!-- 						onclick="hdkfSupportTripTask.searchData();" -->
<!-- 						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton" -->
<!-- 						iconCls="" plain="false" -->
<!-- 						onclick="hdkfSupportTripTask.clearData();" -->
<!-- 						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton" -->
<!-- 						iconCls="" plain="false" -->
<!-- 						onclick="hdkfSupportTripTask.hideSearchForm();" -->
<!-- 						href="javascript:void(0);">返回</a></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<script
		src=" avicit/hdkf/support/hdkfsupportdevicedetail/js/HdkfSupportTripTask.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportTripTask;
		$(function() {
			hdkfSupportTripTask = new HdkfSupportTripTask(
					'dgHdkfSupportTripTask', '${url}', 'searchDialog',
					'hdkfSupportTripTask');
			hdkfSupportTripTask.setOnClick(function(rowdata){
				 parent.setTripTaskData(rowdata);
			});
			var array = [];

			var searchObject = {
				name : '请求处理ID',
				field : 'KF_DEAL_ID',
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
				name : '任务书名称',
				field : 'TASK_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否需要器材',
				field : 'IS_NEED_EQUIPMENT',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '需要的器材',
				field : 'NEED_EQUIPMENT',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否派人',
				field : 'IS_BORROW_SOMEONE',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '填写人ID',
				field : 'WRITE_MAN_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '填写人姓名',
				field : 'WRITE_MAN_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务内容与要求',
				field : 'CONTENT_DEMAND',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '费用编号',
				field : 'FEE_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '排故所去部队',
				field : 'TO_ARMY_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '执行者',
				field : 'EXECUTORS',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '总任务完成时间',
				field : 'TOTAL_HOURS',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务实际开始时间',
				field : 'START_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务实际完成时间',
				field : 'END_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务完成详细说明',
				field : 'TASK_DETAILS',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '部队领导意见及要求',
				field : 'SUGGESTION_DEMAND',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务评价',
				field : 'EVALUATE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '部队技术室主任',
				field : 'DIRECTOR',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '部队技术室部长',
				field : 'HEAD',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '通知客户时间',
				field : 'NOTICE_TIME',
				type : 1,
				dataType : 'date'
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
				name : '信息处理卡编号',
				field : 'REQUEST_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportTripTask.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportTripTask.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportTripTask.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportTripTask.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
		function formateisNeedEquipment(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportTripTask.isNeedEquipment);
		}
		function formateisBorrowSomeone(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportTripTask.isBorrowSomeone);
		}
	</script>
</body>
</html>