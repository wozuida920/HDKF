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
<!-- ControllerPath = "hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoController/HdkfSupportAssignInfoInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
<script type="text/javascript">
		var hdkfSupportAssignInfo;
		$(function(){
			hdkfSupportAssignInfo= new HdkfSupportAssignInfo('dgHdkfSupportAssignInfo','${url}','searchDialog','hdkfSupportAssignInfo');
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																				/////
			var array=[];
    			                                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'委托人ID',
                                    field:'ASSIGN_USER_ID',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'委托人',
                                    field:'ASSIGN_USER_NAME',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'受托人ID',
                                    field:'ASSIGNED_USER_ID',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'受托人',
                                    field:'ASSIGNED_USER_NAME',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'委托开始日期',
                                    field:'ASSIGN_START_DATE',
                                    type:1,
                                    dataType:'date'};
                                     array.push(searchObject);
                                                                                                                                                                                              
                              var searchObject = 
                                {
                                    name:'委托结束日期',
                                    field:'ASSIGN_END_DATE',
                                    type:1,
                                    dataType:'date'};
                                     array.push(searchObject);
                                                                                                                                                                                              
                              var searchObject = 
                                {
                                    name:'委托理由',
                                    field:'ASSIGN_REASON',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                            
                            var searchObject = 
                                {
                                    name:'是否中止委托',
                                    field:'SUSPEND_FLAG',
                                    type:1,
                                    dictCode:'SUPPORT_ASSIGN_STATUS',
                                    dataType:'dict'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'中止委托理由',
                                    field:'SUSPEND_REASON',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'中止委托日期',
                                    field:'SUSPEND_DATE',
                                    type:1,
                                    dataType:'date'};
                                     array.push(searchObject);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ///
              
            
            selfDefQury.init(array);
            selfDefQury.setQuery(function(param){
                hdkfSupportAssignInfo.searchDataBySfn(param);
            });
		});
		function formateDate(value,row,index){
			return hdkfSupportAssignInfo.formate(value);
		}
		function formateDateTime(value,row,index){
			return hdkfSupportAssignInfo.formateDateTime(value);
		}
		//hdkfSupportAssignInfo.detail(\''+row.id+'\')
		function formateHref(value,row,inde){
			return '<a href="javascript:void(0);" onclick="hdkfSupportAssignInfo.detail(\''+row.id+'\',\''+row.suspendFlag+'\');">'+value+'</a>';
			
		}
 		function formatesuspendFlag(value){
            return Platform6.fn.lookup.formatLookupType(value, hdkfSupportAssignInfo.suspendFlag);
        } 
       </script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarHdkfSupportAssignInfo" class="datagrid-toolbar">
			<table>
				<tr>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_table_${param.standName}"
						permissionDes="委托">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportAssignInfo.insertassign();"
							href="javascript:void(0);">委托</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_table_${param.standName}"
						permissionDes="中止委托">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportAssignInfo.insertstopassign();"
							href="javascript:void(0);">中止委托</a></td>
					</sec:accesscontrollist>


					<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_table_${param.standName}"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportAssignInfo.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_button_edit"
						permissionDes="编辑">
						<td><a class="easyui-linkbutton" iconCls="icon-edit"
							plain="true" onclick="hdkfSupportAssignInfo.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfSupportAssignInfo.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportAssignInfo.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportAssignInfo_button_seniorquery"
						permissionDes="高级查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="selfDefQury.show();"
							href="javascript:void(0);">高级查询</a></td>
					</sec:accesscontrollist>

				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportAssignInfo"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportAssignInfo',
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
						width="180">主键</th>
					<th data-options="field:'assignUserId', hidden:true," width="180">委托人ID</th>

					<th data-options="field:'assignUserName', align:'center',formatter:formateHref"
						width="180">委托人</th>

					<th data-options="field:'assignedUserId', hidden:true," width="120">受托人ID</th>

					<th data-options="field:'assignedUserName', align:'center'"
						width="180">受托人</th>

					<th
						data-options="field:'assignStartDate', align:'center',formatter:formateDate"
						width="180">委托开始时间</th>
					<th
						data-options="field:'assignEndDate', align:'center',formatter:formateDate"
						width="180">委托结束时间</th>
					<th data-options="field:'assignReason', align:'center'" width="280">委托理由</th>

					<th
						data-options="field:'suspendFlag', align:'center',formatter:formatesuspendFlag"
						width="140">委托状态</th>
					<th
						data-options="field:'suspendDate', align:'center',formatter:formateDate"
						width="180">中止委托时间</th>
					<th data-options="field:'suspendReason', align:'center'"
						width="280">中止委托理由</th>


				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportAssignInfo">
			<table class="form_commonTable">
				<tr>
					<th width="10%">委托人ID:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="assignUserId" /></td>
					<th width="10%">委托人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="assignUserName" /></td>
				</tr>
				<tr>
					<th width="10%">受托人ID:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="assignedUserId" /></td>
					<th width="10%">受托人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="assignedUserName" /></td>
				</tr>
				<tr>
				<tr>
					<th width="10%">委托开始日期从:</th>
					<td width="40%"><input name="assignStartDateBegin"
						id="assignStartDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">委托开始日期(至):</th>
					<td width="40%"><input name="assignStartDateEnd"
						id="assignStartDateEnd" class="easyui-datebox" editable="false" />
					</td>
				</tr>
				<tr>
					<th width="10%">委托结束日期从:</th>
					<td width="40%"><input name="assignEndDateBegin"
						id="assignEndDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">委托结束日期(至):</th>
					<td width="40%"><input name="assignEndDateEnd"
						id="assignEndDateEnd" class="easyui-datebox" editable="false" />
					</td>
				</tr>
				<th width="10%">委托理由:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="assignReason" /></td>
				<th width="10%">是否中止委托:</th>
				<td width="40%"><pt6:syslookup name="suspendFlag" isNull="true"
						lookupCode="SUPPORT_ASSIGN_STATUS"
						dataOptions="width:151,editable:false,panelHeight:'auto'">
					</pt6:syslookup></td>
				</tr>
				<tr>
					<th width="10%">中止委托理由:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="suspendReason" /></td>
				</tr>
				<tr>
					<th width="10%">中止委托日期从:</th>
					<td width="40%"><input name="suspendDateBegin"
						id="suspendDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">中止委托日期(至):</th>
					<td><input name="suspendDateEnd" id="suspendDateEnd"
						class="easyui-datebox" editable="false" /></td>
				</tr>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportAssignInfo.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportAssignInfo.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportAssignInfo.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src=" avicit/hdkf/support/hdkfsupportassigninfo/js/HdkfSupportAssignInfo.js"
		type="text/javascript"></script>

</body>
</html>