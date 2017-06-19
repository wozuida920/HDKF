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
<!-- ControllerPath = "hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/HdkfSupportFaxInfoInfo" -->
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
		<div id="toolbarHdkfSupportFaxInfo" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaxInfo_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportFaxInfo.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportFaxInfo.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportFaxInfo.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportFaxInfo.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaxInfo_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportFaxInfo.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportFaxInfo.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportFaxInfo.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportFaxInfo.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaxInfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportFaxInfo.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaxInfo_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportFaxInfo.modify();" href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaxInfo_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportFaxInfo.del();" href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaxInfo_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportFaxInfo.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					<td><a class="easyui-linkbutton" iconCls="icon-search"
						plain="true" onclick="selfDefQury.show();"
						href="javascript:void(0);">高级查询</a></td>
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportFaxInfo"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportFaxInfo',
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
					<th data-options="field:'id', align:'center',checkbox:true" width="220">主键</th>
					<th data-options="field:'faxNo', align:'center', formatter:formateHref" width="220">传真编号</th>
					<th data-options="field:'fromAddr', hidden:'true'" width="220">我方地址</th>
					<th data-options="field:'fromZipcode', hidden:'true'" width="220">我方邮编</th>
					<th data-options="field:'fromEnAddr', hidden:'true'" width="220">我方英语地址</th>
					<th data-options="field:'fromTel', hidden:'true'" width="220">我方电话</th>
					<th data-options="field:'fromFax', hidden:'true'" width="220">我方传真</th>
					<th data-options="field:'fromUserAlias',align:'center'" width="220">用户名称</th>
					<th data-options="field:'sendDate', align:'center',formatter:formateDate" width="220">发送日期</th>
					<th data-options="field:'faxPages', align:'center'" width="220">传真页数</th>
					<th data-options="field:'toUuit', align:'center'" width="220">发往单位</th>
					<th data-options="field:'toFax', align:'center'" width="220">发往单位传真号</th>
					<th data-options="field:'toUser', align:'center'" width="220">接收人</th>
				    <!-- <th data-options="field:'faxContent', hidden:'true'" width="220">传真内容</th> -->
					<th data-options="field:'requestDealId', hidden:true" width="220">请求处理ID</th>
					<th data-options="field:'dealName', align:'center'" width="220">处理单名称</th>
					<th data-options="field:'requestId', hidden:true" width="220">求援请求ID</th>
					<th data-options="field:'requestNo', align:'center'" width="220">信息处理卡编号</th>
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
		<form id="hdkfSupportFaxInfo">
			<table class="form_commonTable">
				<tr>
					<th width="10%">传真编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="faxNo" /></td>
					<th width="10%">我方地址:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="fromAddr" /></td>
				</tr>
				<tr>
					<th width="10%">我方邮编:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="fromZipcode" /></td>
					<th width="10%">我方英语地址:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="fromEnAddr" /></td>
				</tr>
				<tr>
					<th width="10%">我方电话:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="fromTel" /></td>
					<th width="10%">我方传真:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="fromFax" /></td>
				</tr>
				<tr>
					<th width="10%">发送人:</th>
					<td><input title="用户名称" class="inputbox" type="hidden"
						name="fromUser" id="fromUser" />
						<div class="">
							<input class="easyui-validatebox" name="fromUserAlias"
								id="fromUserAlias" readOnly="readOnly"></input>
						</div></td>
<!-- 				</tr>
				<tr> -->
					<th width="10%">发送日期从:</th>
					<td width="40%"><input name="sendDateBegin" id="sendDateBegin"
						class="easyui-datebox" editable="false" />
									</tr>
				<tr>
					<th width="10%">发送日期(至):</th>
					<td width="40%"><input name="sendDateEnd" id="sendDateEnd"
						class="easyui-datebox" editable="false" /></td>
				
				<th width="10%">传真页数:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="faxPages" /></td>
				</tr>
				<tr>
					<th width="10%">发往单位:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="toUuit" /></td>
					<th width="10%">发往单位传真号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="toFax" /></td>
				</tr>
				<tr>
					<th width="10%">接收人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="toUser" /></td>
<!-- 					<th width="10%">传真内容:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="faxContent" /></td> -->
<!-- 				</tr>
				<tr> -->
					<th width="10%">处理单名称:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="hidden" id="requestDealId" name="requestDealId" />
						<input class="easyui-validatebox" onclick="openDealByKfDialog()"
						style="width: 151px;" type="text" id="dealName" name="dealName" readonly="readonly" /></td>
									</tr>
				<tr>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="hidden" id="requestId" name="requestId" />
						<input class="easyui-validatebox" readonly="readonly"
						style="width: 151px;" type="text" id="requestNo" name="requestNo" /></td>
				</tr>
				<tr>
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
						onclick="hdkfSupportFaxInfo.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false" onclick="hdkfSupportFaxInfo.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportFaxInfo.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportfaxinfo/js/HdkfSupportFaxInfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportFaxInfo;
		$(function() {
			hdkfSupportFaxInfo = new HdkfSupportFaxInfo('dgHdkfSupportFaxInfo',
					'${url}', 'searchDialog', 'hdkfSupportFaxInfo');
			var fromUserUserCommonSelector = new CommonSelector("user",
					"userSelectCommonDialog", "fromUser", "fromUserAlias");
			fromUserUserCommonSelector.init();

			var array = [];

			var searchObject = {
				name : '传真编号',
				field : 'FAX_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '我方地址',
				field : 'FROM_ADDR',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '我方邮编',
				field : 'FROM_ZIPCODE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '我方英语地址',
				field : 'FROM_EN_ADDR',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '我方电话',
				field : 'FROM_TEL',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '我方传真',
				field : 'FROM_FAX',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发送人',
				field : 'FROM_USER',
				type : 1,
				dataType : 'user'
			};

			array.push(searchObject);

			var searchObject = {
				name : '发送日期',
				field : 'SEND_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '传真页数',
				field : 'FAX_PAGES',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发往单位',
				field : 'TO_UUIT',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发往单位传真号',
				field : 'TO_FAX',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '接收人',
				field : 'TO_USER',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '传真内容',
				field : 'FAX_CONTENT',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '请求处理ID',
				field : 'REQUEST_DEAL_ID',
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
				hdkfSupportFaxInfo.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportFaxInfo.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportFaxInfo.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportFaxInfo.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
		
		//打开客服部处理选择页面
		function openDealByKfDialog() {
			this.nData = new CommonDialog(
					"model4",
					"790",
					"600",
					"hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/HdkfSupportDealByKfSelect",
					"信息卡处理信息选择", false, true, false);
			this.nData.show();
		};
		function setDealByKfData(data) {
			$("#model4").dialog("close");

			$("#requestDealId").val(data.id);
			$("#dealName").val(data.dealName);
			$("#requestId").val(data.requestId);
			$("#requestNo").val(data.requestNo);
		};
	</script>
</body>
</html>