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
<!-- ControllerPath = "hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/HdkfSupportResponseInfoInfo" -->
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
		<div id="toolbarHdkfSupportResponseInfo" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportResponseInfo_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportResponseInfo.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportResponseInfo.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportResponseInfo.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportResponseInfo.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportResponseInfo_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportResponseInfo.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportResponseInfo.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportResponseInfo.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportResponseInfo.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportResponseInfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportResponseInfo.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportResponseInfo_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportResponseInfo.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportResponseInfo_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportResponseInfo.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportResponseInfo_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportResponseInfo.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportResponseInfo"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportResponseInfo',
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
					<th data-options="field:'id', halign:'center',checkbox:true" width="220">主键</th>
					<th data-options="field:'requestDealId', hidden:true" width="220">请求处理ID</th>
					<th data-options="field:'dealNo', align:'center'" width="220">内部处理单</th>
					<th data-options="field:'respName', align:'center', formatter:formateHref" width="220">答复名称</th>
					<th data-options="field:'finalDecision', hidden:true" width="220">最终处理意见</th>
					<th data-options="field:'respUserId', hidden:true" width="220">经办人ID</th>
					<th data-options="field:'respUserName', align:'center'" width="220">经办人姓名</th>
					<th data-options="field:'attribute01', hidden:true" width="220">填写人ID</th>
					<th data-options="field:'attribute02', hidden:true" width="220">填写人姓名</th>
					<th data-options="field:'actualTime', align:'center',formatter:formateDate" width="220">答复时间</th>
					<th data-options="field:'respBy', align:'center',formatter:formaterespBy" width="220">答复方式</th>
					<th data-options="field:'respNo', align:'center'" width="220">答复文号</th>
					<th data-options="field:'requestId', hidden:true" width="220">求援请求ID</th>
					<th data-options="field:'requestNo', align:'center'" width="220">信息卡编号</th>
					<th data-options="field:'activityalias_', align:'center'" width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', align:'center'" width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportResponseInfo">
			<table class="form_commonTable">
				<tr>
			
				
					<th width="10%">答复名称:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="respName" /></td>
						
					<th width="10%">信息卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>
					
				</tr>
				
			
				<tr>
					<th width="10%">答复时间从:</th>
					<td width="40%"><input name="actualTimeBegin"
						id="actualTimeBegin" class="easyui-datebox" editable="false" />
					<th width="10%">答复时间(至):</th>
					<td width="40%"><input name="actualTimeEnd" id="actualTimeEnd"
						class="easyui-datebox" editable="false" /></td>
				</tr>
				<th width="10%">答复方式:</th>
				<td><pt6:syslookup name="respBy"
						lookupCode="SUPPORT_RESPONSE_TYPE"
						isNull="true"
						dataOptions="width:151,editable:false,panelHeight:'auto'">
					</pt6:syslookup></td>
				<th width="10%">答复文号:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="respNo" /></td>
				</tr>
				<tr>
				
					<th width="10%">经办人姓名:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="respUserName" /></td>
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
						onclick="hdkfSupportResponseInfo.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportResponseInfo.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportResponseInfo.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportresponseinfo/js/HdkfSupportResponseInfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportResponseInfo;
		$(function() {
			hdkfSupportResponseInfo = new HdkfSupportResponseInfo(
					'dgHdkfSupportResponseInfo', '${url}', 'searchDialog',
					'hdkfSupportResponseInfo');

			var array = [];

			var searchObject = {
				name : '请求处理ID',
				field : 'REQUEST_DEAL_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '处理信息编号',
				field : 'DEAL_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复名称',
				field : 'RESP_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '最终处理意见',
				field : 'FINAL_DECISION',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '经办人ID',
				field : 'RESP_USER_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '经办人姓名',
				field : 'RESP_USER_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复时间',
				field : 'ACTUAL_TIME',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复方式',
				field : 'RESP_BY',
				type : 1,
				dictCode : 'SUPPORT_RESPONSE_TYPE',
				dataType : 'dict'
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
				hdkfSupportResponseInfo.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportResponseInfo.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportResponseInfo.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			if(value == null){
				value = "";
			}
			return "<a href='javascript:void(0);' onclick='hdkfSupportResponseInfo.detail(\""
					+ row.id + "\",\"" + value + "\",\"" + row.businessstate_ + "\",\"" + row.activityalias_ + "\");'>" + value + "</a>";
		}
		function formaterespBy(value) {
			
			if(value==0)
				{
				//alert(value);
				value ="0";
				}
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportResponseInfo.respBy);
		}
	</script>
</body>
</html>