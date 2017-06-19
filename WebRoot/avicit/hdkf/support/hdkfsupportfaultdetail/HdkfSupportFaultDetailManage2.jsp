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
<!-- ControllerPath = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfSupportFaultDetailInfo" -->
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
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarHdkfSupportFaultDetail" class="datagrid-toolbar">
			<table>
					<tr style="height: 30px;">
					<th style="width: 250px; font-size: 14px;">批架次求援信息详情</th>
					<td width="50%"></td>

<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportFaultDetail_button_add" --%>
<%-- 						permissionDes="添加"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-add" -->
<!-- 							plain="true" onclick="hdkfSupportFaultDetail.insert();" -->
<!-- 							href="javascript:void(0);">添加</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportFaultDetail_button_edit" --%>
<%-- 						permissionDes="编辑"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-edit" -->
<!-- 							plain="true" onclick="hdkfSupportFaultDetail.modify();" -->
<!-- 							href="javascript:void(0);">编辑</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportFaultDetail_button_delete" --%>
<%-- 						permissionDes="删除"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-remove" -->
<!-- 							plain="true" onclick="hdkfSupportFaultDetail.del();" -->
<!-- 							href="javascript:void(0);">删除</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
					
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportFaultDetail"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportFaultDetail',
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
					<th data-options="field:'id', halign:'center',hidden:true"
						width="220">主键</th>
					<th data-options="field:'batchNo', align:'center',formatter:formateHref" width="120">批架次</th>
					<th data-options="field:'modelId', align:'center'" width="120">机型</th>
					<th data-options="field:'flightHours', align:'center'" width="120">飞行小时</th>
					<th data-options="field:'flightLanding', align:'center'"
						width="120">飞机起落</th>
					<th
						data-options="field:'requestDate', hidden:true,formatter:formateDate"
						width="120">求援时间</th>
					<th
						data-options="field:'occurrenceDate', align:'center',formatter:formateDate"
						width="120">发生日期</th>
					<th
						data-options="field:'attribute01', align:'center',formatter:formateattribute01"
						width="120">发现时机</th>
					<th
						data-options="field:'attribute02', align:'center',formatter:formateattribute02"
						width="120">是否故障</th>
					<th data-options="field:'faultDesc', align:'center',formatter:showToolTip" width="420">求援信息</th>
					
					<th data-options="field:'requestId', hidden:true" width="220">求援请求ID</th>
					<th data-options="field:'requestNo', hidden:true" width="220">信息卡编号</th>
				</tr>
			</thead>
		</table>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportfaultdetail/js/HdkfSupportFaultDetail1.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportFaultDetail;
		var requestIdR;
		//var requestUnitR;
		$(function() {
			requestIdR = "${requestId}";
		//	requestUnitR ="${requestUnit}";
			hdkfSupportFaultDetail = new HdkfSupportFaultDetail(
					'dgHdkfSupportFaultDetail', '${url}', 'searchDialog',
					'hdkfSupportFaultDetail');
			/////
			var array = [];

			var searchObject = {
				name : '批架次',
				field : 'BATCH_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '机型',
				field : 'MODEL_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '飞行小时',
				field : 'FLIGHT_HOURS',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);

			var searchObject = {
				name : '飞机起落',
				field : 'FLIGHT_LANDING',
				type : 1,
				dataType : 'number'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援时间',
				field : 'REQUEST_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发生日期',
				field : 'OCCURRENCE_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '故障描述',
				field : 'FAULT_DESC',
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
				name : '求援请求ID',
				field : 'REQUEST_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '信息卡编号',
				field : 'REQUEST_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportFaultDetail.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportFaultDetail.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportFaultDetail.formateTime(value);
		}
		//hdkfSupportFaultDetail.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="hdkfSupportFaultDetail.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		 function showToolTip(value, row, index) {
	            if(value!=null){
				 var abValue = value;
	             if (value!=null&&value.length>=50) {
	                 abValue = value.substring(0,50) + "...";
	             }
	             var content = '<a href="javascript:void(0);" title="' + value + '" class="easyui-tooltip">' + abValue + '</a>';
	             //<a href="#" title="This is the tooltip message." class="easyui-tooltip">Hover me</a>
	             return content ;
	            }
	            else  return "";
	             
	         }
			function formateattribute01(value) {
				return Platform6.fn.lookup.formatLookupType(value,
						hdkfSupportFaultDetail.attribute01);
			}
			function formateattribute02(value) {
				return Platform6.fn.lookup.formatLookupType(value,
						hdkfSupportFaultDetail.attribute02);
			}
	</script>
</body>
</html>