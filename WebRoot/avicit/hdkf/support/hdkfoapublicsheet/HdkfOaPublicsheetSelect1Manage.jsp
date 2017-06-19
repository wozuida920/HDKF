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
<!-- ControllerPath = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfSupportRequestInfoInfo" -->
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
	<div data-options="region:'north'" style="height: 130px;">
		<form id="hdkfSupportRequestInfo">
			<table class="form_commonTable">
				<tr>
					<th>求援方式:</th>
					<td><pt6:syslookup name="requestMethod"
							lookupCode="SUPPORT_REQUEST_TYPE"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th>信息处理卡编号:</th>
					<td><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>
					<th>故障标题:</th>
					<td><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestName" /></td>
				</tr>
				<tr>
					<th>求援单位:</th>
					<td><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestUnit" /></td>
					<th>机型:</th>
					<td><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="modelId" /></td>
					<th>技术员姓名:</th>
					<td><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestManagerName" /></td>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="center">
						<a class="easyui-linkbutton primary-btn" iconCls="" plain="false" onclick="hdkfSupportRequestInfo.searchData();" href="javascript:void(0);">查询</a>
						<a class="easyui-linkbutton" iconCls="" plain="false" onclick="hdkfSupportRequestInfo.clearData();" href="javascript:void(0);">清空</a></td>
				</tr>
			</table>
		</div>
	</div>



	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
	
		<table id="dgHdkfSupportRequestInfo"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportRequestInfo',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				onLoadSuccess:loadToolTip,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'id', hidden:true,checkbox:true"
						width="220">主键</th>
					<th
						data-options="field:'requestMethod', halign:'center',formatter:formaterequestMethod"
						width="220">求援方式</th>
					<th data-options="field:'requestNo', halign:'center' " width="220">信息处理卡编号</th>
					
					<th data-options="field:'requestUnitAlias', halign:'center'" width="220">求援单位</th>
					<th data-options="field:'linkMan', hidden:true" width="220">求援单位联系人</th>
					<th data-options="field:'linkPhone', hidden:true" width="220">求援单位联系电话</th>
					<th data-options="field:'fax', hidden:true" width="220">求援单位传真</th>
					<th
						data-options="field:'requestDate', halign:'center',formatter:formateDate"
						width="220">求援时间</th>
					<th data-options="field:'batchNoAlias', halign:'center'" width="220">批架次</th>
					<th data-options="field:'modelIdAlias', halign:'center'" width="220">机型</th>
					<th data-options="field:'productName', hidden:true" width="220">产品名称</th>
					<th data-options="field:'figureNo', hidden:true" width="220">型号图号</th>
					<th data-options="field:'partNo', hidden:true" width="220">件号</th>
					<th data-options="field:'productionUnit', hidden:true"
						width="220">生产单位</th>
					<th data-options="field:'flightHours', hidden:true" width="220">飞行小时</th>
					<th data-options="field:'flightLanding', hidden:true"
						width="220">飞机起落</th>
					<th
						data-options="field:'repairTime', hidden:true,formatter:formateDate"
						width="220">何时大修</th>
					<th
						data-options="field:'occurrenceDate', hidden:true,formatter:formateDate"
						width="220">发生日期</th>
<!-- 					<th
						data-options="field:'occurrenceTiming', hidden:true,formatter:formateoccurrenceTiming"
						width="220">发现时机</th> -->
					<th data-options="field:'chaperNo', hidden:true" width="220">ATA章节</th>
					<th data-options="field:'requestName', halign:'center',formatter:showToolTip" width="220" >故障标题</th>
					<th
						data-options="field:'distributionType', hidden:true,formatter:formatedistributionType"
						width="220">分发类型</th>
					<th data-options="field:'requestManagerId', hidden:true"
						width="220">技术员ID</th>
					<th data-options="field:'requestManagerName', halign:'center'"
						width="220">技术员</th>
					<th
						data-options="field:'infoType', halign:'center',formatter:formateinfoType"
						width="220">信息类别</th>
					<th
						data-options="field:'faultType', halign:'center',formatter:formatefaultType"
						width="220">发公用笺</th>
					<th data-options="field:'activityalias_', hidden:true"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', hidden:true"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>


	<script
		src="avicit/hdkf/support/hdkfsupportdealbykf/js/HdkfSupportRequestInfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportRequestInfo;
		$(function() {
			hdkfSupportRequestInfo = new HdkfSupportRequestInfo(
					'dgHdkfSupportRequestInfo', '${url}', 'searchDialog',
					'hdkfSupportRequestInfo');
			
			hdkfSupportRequestInfo.setOnClick(
				function(rowdata){
				      parent.setSparePartTextAndChapter(rowdata);
				 }
			);
			var array = [];

			var searchObject = {
				name : '求援方式',
				field : 'REQUEST_METHOD',
				type : 1,
				dictCode : 'SUPPORT_REQUEST_TYPE',
				dataType : 'dict'
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
				name : '故障标题',
				field : 'REQUEST_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援单位',
				field : 'REQUEST_UNIT',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援单位联系人',
				field : 'LINK_MAN',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援单位联系电话',
				field : 'LINK_PHONE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '求援单位传真',
				field : 'FAX',
				type : 1,
				dataType : 'string'
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
				name : '产品名称',
				field : 'PRODUCT_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '型号图号',
				field : 'FIGURE_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '件号',
				field : 'PART_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '生产单位',
				field : 'PRODUCTION_UNIT',
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
				name : '何时大修',
				field : 'REPAIR_TIME',
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
				name : '发现时机',
				field : 'OCCURRENCE_TIMING',
				type : 1,
				dictCode : 'CSMP_FM_FAULTHAPPENMONMENT',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : 'ATA章节',
				field : 'CHAPER_NO',
				type : 1,
				dataType : 'string'
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
				name : '分发类型',
				field : 'DISTRIBUTION_TYPE',
				type : 1,
				dictCode : 'SUPPORT_DISTRIB_TYPE',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '技术员ID',
				field : 'REQUEST_MANAGER_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '技术员姓名',
				field : 'REQUEST_MANAGER_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '信息类别',
				field : 'INFO_TYPE',
				type : 1,
				dictCode : 'CSMP_ES_INFO_TYPE',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '发公用笺',
				field : 'FAULT_TYPE',
				type : 1,
				dictCode : 'CSMP_ETS_FIGURETYPE',
				dataType : 'dict'
			};
			array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportRequestInfo.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return hdkfSupportRequestInfo.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportRequestInfo.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportRequestInfo.detail(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}
	 function showToolTip(value, row, index) {
             var abValue = value;
             if (value!=null&&value.length>=9) {
                 abValue = value.substring(0,9) + "...";
             }
             var content = '<a href="#" title="' + value + '" class="easyui-tooltip">' + abValue + '</a>';
             //<a href="#" title="This is the tooltip message." class="easyui-tooltip">Hover me</a>
             return content ;
             
             
         }
	 function loadToolTip(){
		// alert("here...");
		   $(".easyui-tooltip").tooltip({
               onShow: function () {
                   $(this).tooltip('tip').css({
                       borderColor: '#000'
                   });
               }
           });
	 }
	 
	 
		function formaterequestMethod(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportRequestInfo.requestMethod);
		}
		function formateoccurrenceTiming(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportRequestInfo.occurrenceTiming);
		}
		function formatedistributionType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportRequestInfo.distributionType);
		}
		function formateinfoType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportRequestInfo.infoType);
		}
		function formatefaultType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportRequestInfo.faultType);
		}
	</script>
</body>
</html>