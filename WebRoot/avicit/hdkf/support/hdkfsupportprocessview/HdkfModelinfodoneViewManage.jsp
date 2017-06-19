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
<!-- ControllerPath = "hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/HdkfSupportProcessViewInfo" -->
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
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden; ">
		<table id="dgHdkfSupportProcessView"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportProcessView',
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
					<th data-options="field:'id', hidden:'true',checkbox:true"
						width="220">主键</th>
					<th data-options="field:'requestId', hidden:'true'" width="220">求援请求ID</th>
					<th data-options="field:'requestNo', align:'center',halign:'center',formatter:formateRequestHref" width="220">信息卡编号</th>
					<th
						data-options="field:'curStatus',align:'center', halign:'center',formatter:formatecurStatus"
						width="400">当前状态</th>
					<th data-options="field:'curBpmstate',align:'center', halign:'center'" width="270">当前步骤</th>
					<th data-options="field:'curUserAlias',align:'center',align:'center'" width="190">当前处理人</th>
					<th data-options="field:'requestUnit',align:'center', halign:'center'" width="320">求援单位</th>
					<th data-options="field:'batchNo',align:'center', hidden:'true'" width="220">批架次</th>
					<th data-options="field:'modelId',align:'center', hidden:'true'" width="220">机型</th>
					<th
						data-options="field:'requestDate',align:'center', halign:'center',formatter:formateDate"
						width="220">求援时间</th>
					<th data-options="field:'dealId',  hidden:'true'" width="220">处理ID</th>
					<th data-options="field:'dealName',align:'center', halign:'center',formatter:formateDealHref" width="220">处理单</th>
					<th data-options="field:'respId', hidden:'true'" width="220">答复文号</th>
					<th data-options="field:'respNo', align:'center',halign:'center',formatter:formateRespHref" width="220">答复文号</th>
					<th data-options="field:'taskId', hidden:'true'" width="220">任务书ID</th>
					<th data-options="field:'taskNo',align:'center', halign:'center',formatter:formateTaskHref" width="220">任务书编号</th>
					<th data-options="field:'borrowInfoId',align:'center', halign:'center',formatter:formateBorrowHref" width="120">借人单</th>
					<th data-options="field:'cardArchiveId',align:'center', hidden:'true'"
						width="220">归档</th>
					<th data-options="field:'taskArchiveId', hidden:'true'"
						width="220">任务书归档</th>
					<th
						data-options="field:'hasOutfiedcard',align:'center', halign:'center',formatter:formateOutFieldHref"
						width="220">外场信息卡</th>
					<th
						data-options="field:'hasOapublishsheet',align:'center', halign:'center',formatter:formatehasOapublishsheet"
						width="120">公用笺</th>
					<th
						data-options="field:'hasFax', align:'center',halign:'center',formatter:formatehasFax"
						width="120">传真</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportProcessView">
			<table class="form_commonTable">
				<tr>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>


			
<%-- 					<th width="10%">当前所处状态:</th>
					<td width="40%"><pt6:syslookup name="curStatus"
							lookupCode="SUPPORT_PROCESS_STATUS"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'"
							
							>
						</pt6:syslookup></td> --%>
					<th width="10%">当前所处状态:</th>
					<td width="40%"><pt6:syslookup name="curStatus"
							lookupCode="SUPPORT_PROCESS_STATUS"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'"
							
							>
				</pt6:syslookup></td> 
					
				</tr>
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
				<th width="10%">求援单位:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestUnit" /></td>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportProcessView.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportProcessView.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportProcessView.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src="avicit/hdkf/support/hdkfsupportprocessview/js/HdkfModelinfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportProcessView;
		var curStatusR;
		var requestUnitR;
		$(function() {
			curStatusR="${curStatus}";
			requestUnitR="${requestUnit}";
			
 			hdkfSupportProcessView = new HdkfSupportProcessView(
					'dgHdkfSupportProcessView', '${url}', 'searchDialog',
					'hdkfSupportProcessView');
 	
			var curUserUserCommonSelector = new CommonSelector("user",
					"userSelectCommonDialog", "curUser", "curUserAlias");
			curUserUserCommonSelector.init();
			
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
				name : '当前所处状态',
				field : 'CUR_STATUS',
				type : 1,
				dictCode : 'SUPPORT_PROCESS_STATUS',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '当前步骤',
				field : 'CUR_BPMSTATE',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '当前处理人',
				field : 'CUR_USER',
				type : 1,
				dataType : 'user'
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
				name : '求援时间',
				field : 'REQUEST_DATE',
				type : 1,
				dataType : 'date'
			};
			array.push(searchObject);

			var searchObject = {
				name : '处理ID',
				field : 'DEAL_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '处理单',
				field : 'DEAL_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复文号',
				field : 'RESP_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '答复文号',
				field : 'RESP_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务书ID',
				field : 'TASK_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务书编号',
				field : 'TASK_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '借人通知单ID',
				field : 'BORROW_INFO_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '信息卡归档ID',
				field : 'CARD_ARCHIVE_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '任务书归档ID',
				field : 'TASK_ARCHIVE_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否发外场信息卡',
				field : 'HAS_OUTFIEDCARD',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否发公用笺',
				field : 'HAS_OAPUBLISHSHEET',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否发传真',
				field : 'HAS_FAX',
				type : 1,
				dictCode : 'PLATFORM_YES_NO_FLAG',
				dataType : 'dict'
			};
			array.push(searchObject);
	
			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportProcessView.searchDataBySfn(param);
			});
		});
		//hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo1
		//toOapublishsheetDetail
		function toOapublishsheetDetail(id) {

			var value = "公用笺详情";
			//alert(id);
		//	var url = "platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/HdkfSupportPersonDetailInfo?formId=" + formId;
			var url = "platform/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/HdkfOaPublicsheetInfo1?requestId="
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
		function toFaxDetail(id) {

			var value = "传真详情";
			//alert(id);
		//	var url = "platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/HdkfSupportPersonDetailInfo?formId=" + formId;
			var url = "platform/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/HdkfSupportFaxInfoInfo1?requestId="
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
		
		
		
		function toOutFieldDetail(id) {

			var value = "外场信息卡详情";
			//alert(id);
		//	var url = "platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/HdkfSupportPersonDetailInfo?formId=" + formId;
			var url = "platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/HdkfSupportOutfieldCardInfo1?requestId="
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
		function toDealDetail(id) {

			var value = "信息卡处理详情";
			
			var url = "avicit/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfDetail.jsp?id="
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
		function toSupportProcess(id) {

			var value = "整体流程图形化显示";
			
			var url = "avicit/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessView.jsp?id="
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
		function toRespDetail(id) {

			var value = "信息卡答复详情";
			
			var url = "avicit/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoDetail.jsp?id="
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
		function toTaskDetail(id) {

			var value = "任务书详情";
			
			var url = "avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetail.jsp?id="
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
		function toBorrowDetail(id) {

			var value = "借人单详情";
			
			var url = "avicit/hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfDetail.jsp?id="
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
			return hdkfSupportProcessView.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportProcessView.formateTime(value);
		}
		//hdkfSupportProcessView.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			
			return '<a href="javascript:void(0);" onclick="hdkfSupportProcessView.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		function formateRequestHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="toRequestDetail(\''
					+ row.requestId + '\');">' + value + '</a>';
		}
		function formateDealHref(value, row, inde) {
			if(value)
			return '<a href="javascript:void(0);" onclick="toDealDetail(\''
					+ row.dealId + '\');">' + value + '</a>';
		}
		function formateRespHref(value, row, inde) {
			if(row.respNo)
			return '<a href="javascript:void(0);" onclick="toRespDetail(\''
					+ row.respId + '\');">' + value + '</a>';
		}
		function formateTaskHref(value, row, inde) {
			if(value)
			return '<a href="javascript:void(0);" onclick="toTaskDetail(\''
					+ row.taskId + '\');">' + value + '</a>';
		}
		function formateBorrowHref(value, row, inde) {
			if(row.borrowInfoId)
			return '<a href="javascript:void(0);" onclick="toBorrowDetail(\''
					+ row.borrowInfoId + '\');">查看</a>';
		}
		//toOutFieldDetail
	    function formateOutFieldHref(value, row, inde) {
			if(value=='Y')
			return '<a href="javascript:void(0);" onclick="toOutFieldDetail(\''
					+ row.requestId + '\');">查看</a>';
			else
				return "无";
		}
		
		function formatehasOutfiedcard(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportProcessView.hasOutfiedcard);
		}
		function formatehasOapublishsheet(value, row, inde) {
			//return Platform6.fn.lookup.formatLookupType(value,
				//	hdkfSupportProcessView.hasOapublishsheet);
			if(value=='Y')
				return '<a href="javascript:void(0);" onclick="toOapublishsheetDetail(\''
						+ row.requestId + '\');">查看</a>';
				else
					return "无";
		}
		function formatehasFax(value, row, inde) {
			//return Platform6.fn.lookup.formatLookupType(value,
			//		hdkfSupportProcessView.hasFax);
			if(value=='Y')
				return '<a href="javascript:void(0);" onclick="toFaxDetail(\''
						+ row.requestId + '\');">查看</a>';
				else
					return "无";
		}
		
		function formatecurStatus(value ,row, inde) {
			var abValue = Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportProcessView.curStatus);
			return '<a href="javascript:void(0);" onclick="toSupportProcess(\''
			+ row.curStatus + '\');">' + abValue + '</a>';
			
			
			
		}
	</script>
</body>
</html>