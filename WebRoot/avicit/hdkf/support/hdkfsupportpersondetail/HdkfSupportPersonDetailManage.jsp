<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/HdkfSupportPersonDetailInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
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
		<%-- <div id="toolbarHdkfSupportPersonDetail" class="datagrid-toolbar">
			<table>
				<tr>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportPersonDetail_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportPersonDetail.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportPersonDetail_button_edit"
						permissionDes="保存">
						<td><a class="easyui-linkbutton" iconCls="icon-edit"
							plain="true" onclick="hdkfSupportPersonDetail.save();"
							href="javascript:void(0);">保存</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportPersonDetail_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfSupportPersonDetail.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportPersonDetail_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportPersonDetail.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					<td><a class="easyui-linkbutton" iconCls="icon-search"
						plain="true" onclick="selfDefQury.show();"
						href="javascript:void(0);">高级查询</a></td>
				</tr>
			</table>
		</div> --%>
		<table id="dgHdkfSupportPersonDetail"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportPersonDetail',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				pagination:true,
				method:'get',
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'id', halign:'center',checkbox:true"
						width="220">主键</th>
					<th data-options="field:'borrowInfoId', halign:'center',hidden:'true'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">借人通知单ID</th>

					<th data-options="field:'personName', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[30]'}}"
						width="220">姓名</th>

					<th
						data-options="field:'sex', align:'center',formatter:formatesex"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">性别</th>
					<th data-options="field:'cardId', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">身份证号</th>

					<th data-options="field:'workNum', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">工号</th>

					<th data-options="field:'majors', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">专业</th>

					<th data-options="field:'phone', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[30]'}}"
						width="220">电话</th>

					<th data-options="field:'remark', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[1000]'}}"
						width="220">备注</th>

				</tr>
			</thead>
		</table>
	</div>

	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportPersonDetail">
			<table class="form_commonTable">
				<tr>
<!-- 					<th width="10%">借人通知单ID:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="borrowInfoId"/></td> -->
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">姓名:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="personName" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
<!-- 				</tr>
				<tr> -->
					<th width="10%">性别:</th>
					<td width="40%"><pt6:syslookup name="sex"
							lookupCode="PLATFORM_SEX"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
								</tr>
				<tr>
					<th width="10%">身份证号:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="cardId" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
<!-- 				</tr>
				<tr> -->
					<th width="10%">工号:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="workNum" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
								</tr>
				<tr>
					<th width="10%">专业:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="majors" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
<!-- 				</tr>
				<tr> -->
					<th width="10%">电话:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="phone" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
								</tr>
<!-- 				<tr> -->
<!-- 					<th width="10%">备注:</th> -->
<!-- 					<td width="40%"><input class="easyui-validatebox" type="text" -->
<!-- 						name="remark" /></td> -->
<!-- 					通用代码
<!-- 					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th> -->
<!-- 				--> -->
<!-- 				</tr> -->
				<tr>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportPersonDetail.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportPersonDetail.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportPersonDetail.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src=" avicit/hdkf/support/hdkfsupportpersondetail/js/HdkfSupportPersonDetail1.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		var hdkfSupportPersonDetail;
		var borrowInfoId = "${borrowPersonInfDTO.id}";
		$(function() {
			hdkfSupportPersonDetail = new HdkfSupportPersonDetail(
					'dgHdkfSupportPersonDetail', 'searchDialog', '${url}',
					'hdkfSupportPersonDetail');

			var array = [];

			var searchObject = {
				name : '借人通知单ID',
				field : 'BORROW_INFO_ID',
				type : 1,
				dataType : 'string',
			};
			array.push(searchObject);

			var searchObject = {
				name : '姓名',
				field : 'PERSON_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '性别',
				field : 'SEX',
				type : 1,
				dictCode : 'PLATFORM_SEX',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '身份证号',
				field : 'CARD_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '工号',
				field : 'WORK_NUM',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '专业',
				field : 'MAJORS',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '电话',
				field : 'PHONE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '备注',
				field : 'REMARK',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportPersonDetail.searchDataBySfn(param);
			});

		});
		function formateDate(value, row, index) {
			return hdkfSupportPersonDetail.formate(value);
		};
		function formateDateTime(value, row, index) {
			return hdkfSupportPersonDetail.formateTime(value);
		};
		function formatesex(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportPersonDetail.sex);
		}
		/**通用代码格式化
		function formatvalidFlag(value){
		return Platform6.fn.lookup.formatLookupType(value,hdkfSupportPersonDetail.validFlag);
		};
		 **/
	</script>
</body>
</html>