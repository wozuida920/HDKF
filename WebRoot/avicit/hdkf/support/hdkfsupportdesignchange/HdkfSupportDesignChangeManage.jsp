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
<!-- ControllerPath = "hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController/HdkfSupportDesignChangeInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
<script type="text/javascript">
	var hdkfSupportDesignChange;
	var outCardId;
	$(function() {
		outCardId="${outCardId}";
		hdkfSupportDesignChange = new HdkfSupportDesignChange(
				'dgHdkfSupportDesignChange', '${url}', 'searchDialog',
				'hdkfSupportDesignChange');
		/////
		var array = [];

		var searchObject = {
			name : '外场信息处理卡编号',
			field : 'INFO_CARD_NO',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '是否更改单标志',
			field : 'BEFORE_FLAG',
			type : 1,
			dictCode : 'PLATFORM_YES_NO_FLAG',
			dataType : 'dict'
		};
		array.push(searchObject);

		var searchObject = {
			name : '更改之后标志',
			field : 'AFTER_FLAG',
			type : 1,
			dictCode : 'PLATFORM_YES_NO_FLAG',
			dataType : 'dict'
		};
		array.push(searchObject);

		var searchObject = {
			name : '操作人ID',
			field : 'OPERATE_USER_ID',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '操作人',
			field : 'OPERATE_USER_NAME',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '变更理由',
			field : 'CHANGE_REASON',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '变更时间',
			field : 'CHANGE_TIME',
			type : 1,
			dataType : 'date'
		};
		array.push(searchObject);
		///

		selfDefQury.init(array);
		selfDefQury.setQuery(function(param) {
			hdkfSupportDesignChange.searchDataBySfn(param);
		});
	});
	function formateDate(value, row, index) {
		return hdkfSupportDesignChange.formate(value);
	}
	function formateDateTime(value, row, index) {
		return hdkfSupportDesignChange.formateDateTime(value);
	}
	//hdkfSupportDesignChange.detail(\''+row.id+'\')
	function formateHref(value, row, inde) {
		return '<a href="javascript:void(0);" onclick="hdkfSupportDesignChange.detail(\''
				+ row.id + '\');">' + value + '</a>';
	}
	function formatebeforeFlag(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfSupportDesignChange.beforeFlag);
	}
	function formateafterFlag(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfSupportDesignChange.afterFlag);
	}
	function showToolTip(value, row, index) {
        var abValue = value;
        if (value!=null&&value.length>=19) {
            abValue = value.substring(0,19) + "...";
        }
        var content = '<a href="javascript:void(0);" title="' + value + '" class="easyui-tooltip">' + abValue + '</a>';
        //<a href="#" title="This is the tooltip message." class="easyui-tooltip">Hover me</a>
        return content ;
        
        
    }
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarHdkfSupportDesignChange" class="datagrid-toolbar">
			<table>
				<tr>

<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportDesignChange_table_${param.standName}" --%>
<%-- 						permissionDes="添加"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-add" -->
<!-- 							plain="true" onclick="hdkfSupportDesignChange.insert();" -->
<!-- 							href="javascript:void(0);">添加</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportDesignChange_button_edit" --%>
<%-- 						permissionDes="编辑"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-edit" -->
<!-- 							plain="true" onclick="hdkfSupportDesignChange.modify();" -->
<!-- 							href="javascript:void(0);">编辑</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportDesignChange_button_delete" --%>
<%-- 						permissionDes="删除"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-remove" -->
<!-- 							plain="true" onclick="hdkfSupportDesignChange.del();" -->
<!-- 							href="javascript:void(0);">删除</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportDesignChange_button_query" --%>
<%-- 						permissionDes="查询"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 							plain="true" onclick="hdkfSupportDesignChange.openSearchForm();" -->
<!-- 							href="javascript:void(0);">查询</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportDesignChange_button_seniorquery" --%>
<%-- 						permissionDes="高级查询"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 							plain="true" onclick="selfDefQury.show();" -->
<!-- 							href="javascript:void(0);">高级查询</a></td> -->
<%-- 					</sec:accesscontrollist> --%>

				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportDesignChange"
			data-options="
				fit: true,
				title:'是否触发设计更改单标志变更记录',
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportDesignChange',
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
					<th data-options="field:'id', hidden:true,checkbox:true"
						width="220">主键</th>
					<th data-options="field:'infoCardNo', align:'center'" width="220">外场信息卡编号</th>

					<th
						data-options="field:'beforeFlag', align:'center',formatter:formatebeforeFlag"
						width="120">变更前</th>
					<th
						data-options="field:'afterFlag', align:'center',formatter:formateafterFlag"
						width="120">变更后</th>
					<th data-options="field:'operateUserId', hidden:true"
						width="220">操作人ID</th>

					<th data-options="field:'operateUserName', align:'center'"
						width="120">操作人</th>

					<th data-options="field:'changeReason', align:'center',formatter:showToolTip"
						width="520">变更理由</th>

					<th
						data-options="field:'changeTime', align:'center',formatter:formateDate"
						width="220">变更时间</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportDesignChange">
			<table class="form_commonTable">
				<tr>
					<th width="10%">外场信息处理卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="infoCardNo" /></td>
					<th width="10%">是否更改单标志:</th>
					<td width="40%"><pt6:syslookup name="beforeFlag" isNull="true"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					<th width="10%">更改之后标志:</th>
					<td width="40%"><pt6:syslookup name="afterFlag" isNull="true"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">操作人ID:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="operateUserId" /></td>
				</tr>
				<tr>
					<th width="10%">操作人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="operateUserName" /></td>
					<th width="10%">变更理由:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="changeReason" /></td>
				</tr>
				<tr>
				<tr>
					<th width="10%">变更时间从:</th>
					<td width="40%"><input name="changeTimeBegin"
						id="changeTimeBegin" class="easyui-datebox" editable="false" />
					<th width="10%">变更时间(至):</th>
					<td width="40%"><input name="changeTimeEnd" id="changeTimeEnd"
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
						onclick="hdkfSupportDesignChange.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportDesignChange.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportDesignChange.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src=" avicit/hdkf/support/hdkfsupportdesignchange/js/HdkfSupportDesignChange.js"
		type="text/javascript"></script>

</body>
</html>