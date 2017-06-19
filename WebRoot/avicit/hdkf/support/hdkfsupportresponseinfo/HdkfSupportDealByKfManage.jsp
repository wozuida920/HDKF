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
<!--*****************************搜索*********************************  -->
<div data-options="region:'north'" style="background: #ffffff; height: 116px; padding: 0px; overflow: hidden;">
		<div style="height:139px;">
			<form id="hdkfSupportDealByKf"  style="">
			<table class="form_commonTable" style>
				<tr>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>
					<th width="10%">技术员姓名:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="dealUserName" /></td>
				</tr>
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
						data-options="field:'requestId', hidden:true"
						width="220">求援请求ID</th>
					<th data-options="field:'requestNo', halign:'center'" width="220">信息处理卡编号</th>
					<th data-options="field:'dealName', halign:'center'" width="220">处理名称</th>
					<th
						data-options="field:'isSelfDeal', halign:'center',formatter:formateisSelfDeal"
						width="220">是否客服部自己处理</th>
					<th data-options="field:'outfieldCardId', hidden:true"
						width="220">外场信息处理卡ID</th>
					<th data-options="field:'outfieldCardNo', halign:'center'"
						width="220">外场信息处理卡编号</th>
					<th data-options="field:'dealDepartIdAlias',align:'center'"
						width="220">部门名称</th>
					<th data-options="field:'dealUserId', hidden:true" width="220">技术员</th>
					<th data-options="field:'dealUserName', halign:'center'"
						width="220">技术员</th>
					<th data-options="field:'dealSolution', hidden:true"
						width="220">处理结论</th>
					<th
						data-options="field:'isOutfield', halign:'center',formatter:formateisOutfield"
						width="220">是否赴外场</th>
					<th data-options="field:'activityalias_', halign:'center'"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', halign:'center'"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<script
		src=" avicit/hdkf/support/hdkfsupportresponseinfo/js/HdkfSupportDealByKf.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportDealByKf;
		$(function() {
			hdkfSupportDealByKf = new HdkfSupportDealByKf(
					'dgHdkfSupportDealByKf', '${url}', 
					'hdkfSupportDealByKf');
			hdkfSupportDealByKf.setOnClick(function(rowdata){
				 parent.callBackDataRequest(rowdata);
			});
			
			var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "dealDepartId",
					"dealDepartIdAlias");
			dealDepartIdDeptCommonSelector.init();

			var array = [];

			var searchObject = {
				name : '信息处理卡编号',
				field : 'REQUEST_NO',
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