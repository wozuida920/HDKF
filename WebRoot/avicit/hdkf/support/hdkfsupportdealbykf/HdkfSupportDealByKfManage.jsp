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
<!-- ControllerPath = "hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/HdkfSupportDealByKfInfo" -->
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
		<div id="toolbarHdkfSupportDealByKf" class="datagrid-toolbar">
			<table>
				<tr>
				   <c:if test="${ CURRENT_LOGINUSER.loginName.contains('admin') }">
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDealByKf_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportDealByKf.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportDealByKf.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportDealByKf.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportDealByKf.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					</c:if>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDealByKf_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportDealByKf.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportDealByKf.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportDealByKf.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportDealByKf.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDealByKf_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportDealByKf.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDealByKf_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportDealByKf.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDealByKf_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportDealByKf.del();" href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDealByKf_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportDealByKf.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportDealByKf"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportDealByKf',
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
						data-options="field:'requestId', hidden:true, formatter:formateHref"
						width="220">求援请求ID</th>
					<th data-options="field:'requestNo', align:'center',formatter:formateHref" width="220">信息卡编号</th>
					<th data-options="field:'dealName', align:'center'" width="220">处理单名称</th>
					
<!-- 					<th data-options="field:'outfieldCardId', hidden:true" -->
<!-- 						width="220">外场信息处理卡ID</th> -->
<!-- 					<th data-options="field:'outfieldCardNo', halign:'center'" -->
<!-- 						width="220">外场信息处理卡编号</th> -->
					<th data-options="field:'dealDepartIdAlias', hidden:true, align:'center'"
						width="220">部门名称</th>
					<th data-options="field:'dealUserId', hidden:true" width="150">技术员ID</th>
					<th data-options="field:'dealUserName', halign:'center', align:'center'"
						width="220">技术员</th>
					<th data-options="field:'dealSolution', hidden:true"
						width="220">处理结论</th>
					<th
						data-options="field:'isSelfDeal', align:'center',formatter:formateisSelfDeal"
						width="220">内部处理</th>
					<th
						data-options="field:'attribute01', align:'center',formatter:formateisSelfDeal"
						width="220">发传真</th>
					<th
						data-options="field:'isOutfield', align:'center',formatter:formateisOutfield"
						width="150">赴外场</th>
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
		<form id="hdkfSupportDealByKf">
			<table class="form_commonTable">
				<tr>
					
					<th width="10%">信息卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>
						<th width="10%">处理单名称:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="dealName" /></td>
				</tr>
				
			
				<tr>
					<th width="10%">处理处室:</th>
					<td><input title="部门名称" class="inputbox" type="hidden"
						name="dealDepartId" id="dealDepartId" />
						<div class="">
							<input class="easyui-validatebox" name="dealDepartIdAlias"
								id="dealDepartIdAlias" readOnly="readOnly"></input>
						</div></td>
					
					<th width="10%">技术员姓名:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="dealUserName" /></td>
				
				</tr>
				<tr>
					<th width="10%">赴外场:</th>
					<td><pt6:syslookup name="isOutfield"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">发传真:</th>
					<td><pt6:syslookup name="attribute01"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
				
					<th width="10%">内部处理:</th>
					<td><pt6:syslookup name="isSelfDeal"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
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
						onclick="hdkfSupportDealByKf.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportDealByKf.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportDealByKf.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportdealbykf/js/HdkfSupportDealByKf.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportDealByKf;
		$(function() {
			hdkfSupportDealByKf = new HdkfSupportDealByKf(
					'dgHdkfSupportDealByKf', '${url}', 'searchDialog',
					'hdkfSupportDealByKf');
			var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "dealDepartId",
					"dealDepartIdAlias");
			dealDepartIdDeptCommonSelector.init();

			var array = [];

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

			var searchObject = {
				name : '处理单名称',
				field : 'DEAL_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否客服部自己处理',
				field : 'IS_SELF_DEAL',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '外场信息处理卡ID',
				field : 'OUTFIELD_CARD_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '外场信息处理卡编号',
				field : 'OUTFIELD_CARD_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '处理处室',
				field : 'DEAL_DEPART_ID',
				type : 1,
				dataType : 'dept'
			};
			array.push(searchObject);

			var searchObject = {
				name : '技术员',
				field : 'DEAL_USER_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '技术员姓名',
				field : 'DEAL_USER_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '处理结论',
				field : 'DEAL_SOLUTION',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否赴外场',
				field : 'IS_OUTFIELD',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportDealByKf.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportDealByKf.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportDealByKf.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportDealByKf.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
		function formateisSelfDeal(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDealByKf.isSelfDeal);
		}
		function formateisOutfield(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDealByKf.isOutfield);
		}
	</script>
</body>
</html>