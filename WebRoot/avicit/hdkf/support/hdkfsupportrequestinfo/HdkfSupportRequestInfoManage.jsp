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
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;  font-size:0;">
		<div id="toolbarHdkfSupportRequestInfo" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportRequestInfo_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportRequestInfo.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportRequestInfo.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportRequestInfo.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportRequestInfo.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportRequestInfo_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportRequestInfo.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportRequestInfo.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportRequestInfo.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportRequestInfo.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportRequestInfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportRequestInfo.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportRequestInfo_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportRequestInfo.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportRequestInfo_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportRequestInfo.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportRequestInfo_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportRequestInfo.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
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
					<th data-options="field:'id', align:'center',checkbox:true"
						width="220">主键</th>
					<th
						data-options="field:'requestMethod', align:'center',formatter:formaterequestMethod"
						width="120">求援方式</th>
					<th data-options="field:'requestNo', align:'center' ,formatter:formateHref" width="220">信息卡编号</th>
					
					<th data-options="field:'requestUnitAlias', align:'center'" width="350">求援单位</th>
					<th data-options="field:'linkMan', hidden:true" width="220">求援单位联系人</th>
					<th data-options="field:'linkPhone', hidden:true" width="220">求援单位联系电话</th>
					<th data-options="field:'fax', hidden:true" width="220">求援单位传真</th>
<!-- 					<th
						data-options="field:'requestDate', align:'center',formatter:formateDate"
						width="220">求援时间</th> -->
					<th data-options="field:'modelIdAlias', hidden:true" width="160">机型</th>
					<th data-options="field:'batchNoAlias', hidden:true" width="160">批架次</th>
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
						data-options="field:'occurrenceDate', hidden:true,formatter:formateDate, align:'center'"
						width="220">发生日期</th>
<!-- 					<th
						data-options="field:'occurrenceTiming', hidden:true,formatter:formateoccurrenceTiming"
						width="220">发现时机</th> -->
					<th data-options="field:'chaperNo', hidden:true" width="220">ATA章节</th>
					<th data-options="field:'requestName', align:'center',formatter:showToolTip" width="300" >信息卡标题</th>
				
					<th data-options="field:'requestManagerId', hidden:true"
						width="220">技术员ID</th>
					<th data-options="field:'requestManagerName', align:'center'"
						width="220">技术员</th>
					<th
						data-options="field:'infoType', align:'center',formatter:formateinfoType"
						width="150">信息类别</th>
					<th
						data-options="field:'distributionType',  align:'center',formatter:formatedistributionType"
						width="220">发外场信息卡</th>
					<th
						data-options="field:'faultType', align:'center',formatter:formatefaultType"
						width="150">发公用笺</th>
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
		<form id="hdkfSupportRequestInfo">
			<table class="form_commonTable">
				<tr>
					<th width="10%">求援方式:</th>
					<td><pt6:syslookup name="requestMethod"
							lookupCode="SUPPORT_REQUEST_TYPE"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">信息卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>
				</tr>
				<tr>
					<th width="10%">信息卡标题:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestName" /></td>
					<th width="10%">求援单位:</th>
					<td width="40%"> <input type="hidden" name="requestUnit" class="easyui-validatebox"
							id="requestUnit" style="width: 148px;  height: 100%;"/>
							<input type="text" data-options="validType:'maxLength[50]'" name="requestUnitAlias" class="easyui-validatebox"
							id="requestUnitAlias" style="width: 148px;  height: 100%;" onfocus="openDialogCompany();" readonly="readonly"/></td>
<!-- 					<input  class="easyui-validatebox" type="hidden"  name="requestUnit"/> -->
<!-- 					<input class="easyui-validatebox" -->
<!-- 						style="width: 151px;" type="text" name="requestUnitAlias" onfocus="openDialogCompany();" readonly="readonly" /> -->
						
						
						
			   
				</tr>
				
				<tr>
					<th width="10%">求援时间从:</th>
					<td width="40%"><input name="requestDateBegin"
						id="requestDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">求援时间(至):</th>
					<td width="40%"><input name="requestDateEnd"
						id="requestDateEnd" class="easyui-datebox" editable="false" /></td>
				</tr>
				
				
				
			
				
			
				<tr>
					
					<th width="10%">技术员姓名:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestManagerName" /></td>
						
					<th width="10%">信息类别:</th>
					<td><pt6:syslookup name="infoType"
							lookupCode="CSMP_ES_INFO_TYPE"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
				
						
						
						<th width="10%">发外场信息卡:</th>
					<td><pt6:syslookup name="distributionType"
							lookupCode="SUPPORT_DISTRIB_TYPE"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
						<th width="10%">发公用笺:</th>
					<td><pt6:syslookup name="faultType"
							lookupCode="CSMP_ETS_FIGURETYPE"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					
					<th width="10%">机型:</th>
					<td width="40%"> <input type="hidden" name="modelId" class="easyui-validatebox"
							id="modelId" style="width: 148px;  height: 100%;"/>
							<input type="text"  name="modelIdAlias" class="easyui-validatebox"
							id="modelIdAlias" style="width: 148px;  height: 100%;" onfocus="openDialog();" readonly="readonly"/></td>

						
						
			   
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
						onclick="hdkfSupportRequestInfo.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportRequestInfo.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportRequestInfo.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportrequestinfo/js/HdkfSupportRequestInfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportRequestInfo;
		$(function() {
			hdkfSupportRequestInfo = new HdkfSupportRequestInfo(
					'dgHdkfSupportRequestInfo', '${url}', 'searchDialog',
					'hdkfSupportRequestInfo');

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
             var content = '<a href="javascript:void(0);" title="' + value + '" class="easyui-tooltip">' + abValue + '</a>';
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
		function openDialog() {
			var co=$("#requestUnitAlias").attr("value");
			var co1=$("#requestUnit").attr("value");
			if(co==''){
				alert("请先选择用户单位");
				return;
			}
			this.nData = new CommonDialog("model", "790", "500", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdAircraftinfoInfo/"+co1, "批架次选择", false, true, false);
			this.nData.show();
		}
		function callBackData(data) {
			$("#model").dialog("close");
	        $("#modelIdAlias").val(data.modelIdAlias);
 			$("#modelId").val(data.modelId);
		//	$("#batchNo").val(data.id);
			//$("#batchNoAlias").val(data.batchNo);
// 			$("#flightHours").val(data.flightNum);
// 			 $("#flightLanding").val(data.takeoffLandingNum);
			
		
		}
	 function openDialogCompany() {
			this.nData = new CommonDialog("model1", "850", "500", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfConpanyInfo", "客户选择", false, true, false);
			this.nData.show();
		}
		//求援单位回写
		function callBackDataConpany(data) {
			$("#model1").dialog("close");
		//	alert("here");
			$("#requestUnit").val(data.id);
			//alert("here  id");
			$("#requestUnitAlias").val(data.companyName);
			//alert("here   name ...");
			
		
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