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
				<tr>


					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaultDetail_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportFaultDetail.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>


					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaultDetail_button_import_export"
						permissionDes="导出Excel">
						<td><a class="easyui-linkbutton" iconCls="icon-export"
							plain="true" onclick="openselColumnForm();"
							href="javascript:void(0);">导出Excel</a></td>
					</sec:accesscontrollist>

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
					<th data-options="field:'id', halign:'center',checkbox:true"
						width="220">主键</th>
					<th
						data-options="field:'batchNo', align:'center',formatter:formateHref"
						width="220">批架次</th>
					<th data-options="field:'modelId', align:'center'" width="220">机型</th>
					<th data-options="field:'flightHours', hidden:true" width="220">飞行小时</th>
					<th data-options="field:'flightLanding', hidden:true" width="220">飞机起落</th>
					<th
						data-options="field:'requestDate', align:'center',formatter:formateDate"
						width="220">求援日期</th>
					<th
						data-options="field:'occurrenceDate', align:'center',formatter:formateDate"
						width="220">发生日期</th>
					<!-- 					<th
						data-options="field:'requestDate', hidden:true,formatter:formateDate"
						width="220">求援时间</th>
					<th
						data-options="field:'occurrenceDate', halign:'center',formatter:formateDate"
						width="220">发生日期</th> -->
					<th
						data-options="field:'attribute01', align:'center',formatter:formateattribute01"
						width="120">发现时机</th>
					<th
						data-options="field:'attribute02', align:'center',formatter:formateattribute02"
						width="120">是否故障</th>
					<th
						data-options="field:'faultDesc', align:'center',formatter:showToolTip"
						width="220">求援信息</th>
					<th
						data-options="field:'dealSolution', align:'center',formatter:showToolTip"
						width="220">处理结论</th>
					<th data-options="field:'requestId', hidden:true" width="220">求援请求ID</th>
					<th
						data-options="field:'requestNo', align:'center',formatter:formateRequestHref"
						width="220">信息卡编号</th>
				</tr>
			</thead>
		</table>
	</div>


	<!--******************************导出excel********************************  -->
	<div id="selColumn"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#selColumnbt'"
		style="width: 400px; height: 500px; display: none;">
		<form id="hdkfSupportFaultDetailselColumn">
			<table class="form_commonTable">
				<tr>
					<th width="30%">请选择要导出的列:</th>
					<td width="50%">
						<p>
							<input type="checkbox" class="checkbox" id="checkAll" />全选/全部选
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb" id="batchNo" />批架次
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb" id="modelId" />机型
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="flightHours" />飞机小时
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="flightLanding" />飞机起落
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="requestDate" />求援日期
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="occurrenceDate" />发生日期
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="attribute01" />发现时机
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="attribute02" />是否故障
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb" id="faultDesc" />求援信息
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb"
								id="dealSolution" />处理结论
						</p>
						<p>
							<input type="checkbox" class="checkbox" name="cb" id="requestNo" />信息卡编号
						</p>
					</td>
				</tr>
			</table>
		</form>
		<div id="selColumnbt" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false" onclick="exportClientData();"
						href="javascript:void(0);">导出Excel</a> <a
						class="easyui-linkbutton" iconCls="" plain="false"
						onclick="hdkfSupportFaultDetailselColumn.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>



	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportFaultDetail">
			<table class="form_commonTable">
				<tr>
					<th width="10%">批架次:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="batchNo" /></td>
					<th width="10%">机型:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="modelId" /></td>
				</tr>

				<tr>
				<tr>
					<th width="10%">求援时间从:</th>
					<td width="40%"><input name="requestDateBegin"
						id="requestDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">求援时间(至):</th>
					<td width="40%"><input name="requestDateEnd"
						id="requestDateEnd" class="easyui-datebox" editable="false" /></td>
				</tr>
				<tr>
					<th width="10%">发生日期从:</th>
					<td width="40%"><input name="occurrenceDateBegin"
						id="occurrenceDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">发生日期(至):</th>
					<td width="40%"><input name="occurrenceDateEnd"
						id="occurrenceDateEnd" class="easyui-datebox" editable="false" />
					</td>
				</tr>
				<th width="10%">求援信息:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="faultDesc" /></td>
				<th width="10%">处理结论:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="dealSolution" /></td>
				</tr>
				<tr>

					<th width="10%">信息卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportFaultDetail.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportFaultDetail.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportFaultDetail.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src=" avicit/hdkf/support/hdkfsupportfaultdetail/js/HdkfSupportFaultDetail.js"
		type="text/javascript"></script>
	<script
		src=" avicit/hdkf/support/hdkfsupportfaultdetail/js/HdkfSupportFaultDetailselColumn.js"
		type="text/javascript"></script>
	<script src="static/js/platform/component/common/exportData.js"
		type="text/javascript"></script>
	<script type="text/javascript">

		var hdkfSupportFaultDetail;
		var hdkfSupportFaultDetailselColumn;
		$(function() {
			$("#checkAll").click(function() {
				$("input[name='cb']").prop("checked", $(this).prop("checked"));
			});

			hdkfSupportFaultDetail = new HdkfSupportFaultDetail(
					'dgHdkfSupportFaultDetail', '${url}', 'searchDialog',
					'hdkfSupportFaultDetail');
			/////
			hdkfSupportFaultDetailselColumn = new HdkfSupportFaultDetailselColumn(
					'dgHdkfSupportFaultDetail', '${url}', 'selColumn',
					'hdkfSupportFaultDetailselColumn');

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
		function toRequestDetail(id) {

			var value = "信息卡求援详情";
			//alert(id);

			var url = "avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoDetail.jsp?id="
					+ id;

			//alert(1);
			if (typeof (top.addTab) != 'undefined') {
				//alert(2);
				top.addTab(value, url);
			} else {
				//alert(3);
				window.open(url);
			}

		}
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
		var rows;
		function openselColumnForm() {
			rows = $('#dgHdkfSupportFaultDetail').datagrid('getChecked');
			var l = rows.length;
			if (l > 0) {
				$('#selColumn').dialog('open', true);
			} else {
				$.messager.alert('提示', '请选择要导出的行记录！', 'warning');
			}

		}

		//导出excel

		function exportClientData() {
			var id_array = new Array();
			//未选中的框的id
			$('input[name="cb"]').not("input:checked").each(function() {
				id_array.push($(this).attr('id'));//向数组中添加元素  
			});
			id_array = id_array + ",id,requestId";

			var hasChk = $('input[name="cb"]').is(':checked');
			if (hasChk) {
				$.messager
						.confirm(
								'确认',
								'是否确认导出Excel文件?',
								function(r) {
									if (r) {

										// 封装参数
										var columnFieldsOptions = getGridColumnFieldsOptions('dgHdkfSupportFaultDetail');
										var dataGridFields = JSON
												.stringify(columnFieldsOptions[0]);
/* 										var expSearchParams = expSearchParams ? expSearchParams
												: {}; */
										var datas = JSON.stringify(rows);

										 var myParams = {
										 dataGridFields : dataGridFields,// 表头信息集合
										 datas : datas,// 需要导出的数据
										 hasRowNum : true,// 默认为true:代表第一列为序号
										 sheetName : 'sheet1',// 如果该参数为空，默认为导出的Excel文件名
										 unContainFields : id_array.toString(),// 不需要导出的列，使用','分隔即可
										 fileName : '平台用户导出数据' + new Date().format("yyyyMMddhhmmss")// 导出的Excel文件名
										 };  
										var url = "platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/sysuser/exportClient";// 导出请求地址
										var ep = new exportData("xlExport",
												"xlsExport", myParams,
												url);
										ep.excuteExport();
										hdkfSupportFaultDetailselColumn
												.hideSearchForm();
									}
								});
			} else {
				$.messager.alert('提示', '请选择要导出的列记录！', 'warning');
			}

		}

		function showToolTip(value, row, index) {
			if (value != null) {
				var abValue = value;
				if (value != null && value.length >= 50) {
					abValue = value.substring(0, 50) + "...";
				}
				var content = '<a href="javascript:void(0);" title="' + value
						+ '" class="easyui-tooltip">' + abValue + '</a>';
				//<a href="#" title="This is the tooltip message." class="easyui-tooltip">Hover me</a>
				return content;
			} else
				return "";

		}
		function formateRequestHref(value, row, inde) {
			if (value != null)
				return '<a href="javascript:void(0);" onclick="toRequestDetail(\''
						+ row.requestId + '\');">' + value + '</a>';
			else
				return "";
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