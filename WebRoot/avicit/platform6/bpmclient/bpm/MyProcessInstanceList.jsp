<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<html>
<head>
<%
	String tab = request.getParameter("tab");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程实例信息</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/bpmclient/bpm/ProcessCommonJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/fusionchar/js/FusionCharts.js" type="text/javascript"></script>
</head>

<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var tabSelectedIndex = "0"; //那个标签被选中
	/**
	 * 页面请求入口
	 */
	$(function() {
		loadProcessTree();
		myProcessInstanceBegin();
		init();
		window.setTimeout("expand()", 500);
	});

	/**
	 * 初始化页面参数
	 */
	function init() {
		var tab = '<%=tab%>';
		if (tab != "undefind" && tab != "" && tab != "null") {
			if (tab != "Todo") {
				$("#instance"+tab+"_startDateBegin").datebox("setValue", '<%=startDate%>'); 
				$("#instance"+tab+"_startDateEnd").datebox("setValue", '<%=endDate%>');
			}
			if (tab == "Start") {
				$('#myProcessTab').tabs("select", 0);
			}
			if (tab == "Todo") {
				$('#myProcessTab').tabs("select", 1);
			}
			if (tab == "Finish") {
				$('#myProcessTab').tabs("select", 2);
			}
		}
	}

	/**
	 * 加载流程业务目录树
	 */
	function loadProcessTree() {
		$('#mytree').tree({
			checkbox : false,
			lines : true,
			method : 'post',
			animate : true,
			url : 'platform/bpm/clientbpmdisplayaction/getProcessStartTree.json?id=root',
			onBeforeExpand : function(node, param) {
				$('#mytree').tree('options').url = "platform/bpm/clientbpmdisplayaction/getProcessStartTree.json?id=" + node.id;
			},
			onClick : function(node) {
				clickTree(node);
			}
		});
	}
	/**
	 * 点击树节点操作
	 */
	function clickTree(node) {
		expand();
		var nodeType = node.attributes.nodeType;
		if (nodeType != null && nodeType == "catalog") {
			$('#instanceStart_catalogId').val(node.id);
			$('#instanceStart_pdId').val("");
			$('#instanceTodo_catalogId').val(node.id);
			$('#instanceTodo_pdId').val("");
			$('#instanceFinish_catalogId').val(node.id);
			$('#instanceFinish_pdId').val("");
		} else if (nodeType != null && nodeType == "process") {
			$('#instanceStart_catalogId').val("");
			$('#instanceStart_pdId').val(node.id);
			$('#instanceTodo_catalogId').val("");
			$('#instanceTodo_pdId').val(node.id);
			$('#instanceFinish_catalogId').val("");
			$('#instanceFinish_pdId').val(node.id);
		}

		if (tabSelectedIndex == "0") {
			searchInstanceStart();
		} else if (tabSelectedIndex == "1") {
			searchInstanceTodo();
		} else if (tabSelectedIndex == "2") {
			searchInstanceFinish();
		} else if (tabSelectedIndex == "3") {
			//searchInstanceFinish();
		}
	}
	/**
	 * 展开树节点操作
	 */
	function expand() {
		var node = $('#mytree').tree('getSelected');
		if (node) {
			$('#mytree').tree('expand', node.target);
		} else {
			$('#mytree').tree('expandAll');
		}
	}
	/**
	 * 入口
	 */
	function myProcessInstanceBegin() {
		$('#myProcessTab').tabs({
			onSelect : function(title, index) {
				if (index == 0) {
					tabSelectedIndex = "0";
					searchInstanceStart();
				}
				if (index == 1) {
					tabSelectedIndex = "1";
					searchInstanceTodo();
				}
				if (index == 2) {
					tabSelectedIndex = "2";
					searchInstanceFinish();
				}
				if (index == 3) {
					tabSelectedIndex = "3";
					//searchAutoActDurationTop10();
				}
			}
		});
	}
	/////////////////////////////////////////////////////////////////////////////////
	/**
	 * 我启动的流程实例查询
	 */
	function searchInstanceStart() {
		var startDateBegin = $('#instanceStart_startDateBegin').datetimebox('getValue');
		var startDateEnd = $('#instanceStart_startDateEnd').datetimebox('getValue');
		
		var definename = $('#instanceStart_definename').val();
		var entryName = $('#instanceStart_entryName').val();
		var state = $('#instanceStart_state').combobox('getValue');
		
		var catalogId = $('#instanceStart_catalogId').val();
		var pdId = $('#instanceStart_pdId').val();
		var queryParas = "catalogId=" + catalogId + "&startDateBegin=" + startDateBegin + "&startDateEnd=" + startDateEnd + "&pdId=" + pdId;
		queryParas += "&definename=" + definename + "&entryName=" + entryName + "&state=" + state;
		getInstanceStart(queryParas);
	}
	/**
	 * 清空我启动的流程实例查询条件
	 */
	function clearInstanceStart() {
		//$('#instanceStart_catalogId').val('');
		
		$('#instanceStart_definename').val('');
		$('#instanceStart_entryName').val('');
		$('#instanceStart_state').combobox("setValue", "");
		
		$('#instanceStart_startDateBegin').datebox("setValue", "");
		$('#instanceStart_startDateEnd').datebox("setValue", "");
		//$('#instanceStart_pdId').val('');
	}
	/**
	 * 我启动的流程实例查询ajax请求
	 */
	function getInstanceStart(queryParas) {
		var dataGridHeight = $(".easyui-layout").height() - $("#d1").height() - 55;//150;
		$('#instanceStartDiv').datagrid({
			url : encodeURI('platform/bpm/clientbpmdisplayaction/getProcessInstanceListByPage.json?' + queryParas),
			width : '100%',
			nowrap : false,
			striped : true,
			autoRowHeight : false,
			singleSelect : false,
			checkOnSelect : false,
			remoteSort : false,
			height : dataGridHeight,
			fitColumns : true,
			sortName : 'startdate', //排序字段,当表格初始化时候的排序字段
			sortOrder : 'desc', //定义排序顺序
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			queryParams : {
				"" : ""
			},
			loadMsg : ' 处理中，请稍候…',
			columns : [ [ {
				field : 'id',
				hidden : true
			}, {
				field : 'definename',
				title : '流程定义名称',
				width : 60,
				align : 'left',
				sortable : true
			}, {
				field : 'entryname',
				title : '流程实例名称',
				width : 50,
				align : 'left',
				sortable : true,
				formatter : function(value, rec) {
					if (value == null || value == "") {
						value = "未命名";
					}
					var processInstance = "'" + rec.entryid + "'";
					var state = "'" + rec.state + "'";
					var id = "'" + rec.id + "'";
					return '<a href="javascript:window.trackBpm(' + processInstance + ')">' + value + '</a>';
				}
			}, {
				field : 'state',
				title : '状态',
				width : 40,
				align : 'left',
				sortable : true,
				formatter : function(value) {
					if (value == 'active') {
						return '流转中';
					} else if (value == 'ended') {
						return '结束';
					} else if (value == 'suspended') {
						return '挂起';
					}

				}
			}, {
				field : 'userid',
				title : '创建者',
				width : 25,
				align : 'left',
				sortable : true
			}, {
				field : 'deptid',
				title : '创建部门',
				width : 50,
				align : 'left',
				sortable : true
			}, {
				field : 'startdate',
				title : '启动时间',
				width : 50,
				align : 'left',
				sortable : true,
				formatter : function(value, rec) {
					var startdateMi = rec.startdate;
					if (startdateMi == undefined) {
						return;
					}
					var newDate = new Date(startdateMi);
					return newDate.Format("yyyy-MM-dd hh:mm:ss");
				}
			}, {
				field : 'enddate',
				title : '结束时间',
				width : 50,
				align : 'left',
				editor : 'text',
				formatter : function(value, rec) {
					var endateMi = rec.enddate;
					if (endateMi == undefined) {
						return;
					}
					var newDate = new Date(endateMi);
					return newDate.Format("yyyy-MM-dd hh:mm:ss");
				}
			} ] ]
		});
		//设置分页控件   
		var p = $('#instanceStartDiv').datagrid('getPager');
		$(p).pagination({
			pageSize : 20,//每页显示的记录条数，默认为10
			pageList : [ 5, 10, 15, 20, 25, 30 ],//可以设置每页记录条数的列表
			beforePageText : '第',//页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	}
	var myUtils = {
		IS_IE6: navigator.userAgent.indexOf('MSIE 6') >= 0
	};
	/**
	 * 流程跟踪
	 */
	function trackBpm(processInstanceId) {
		$.ajax({
			type : "POST",
			data : {processInstanceId: processInstanceId},
			url : "platform/bpm/clientbpmdisplayaction/isUserSecretLevel", 
			dataType : "json",
			success : function(r) {
				var b = r.result;
				if(b){
					var url = getPath2() + "/avicit/platform6/bpmclient/bpm/ProcessTrack.jsp";
					if(myUtils.IS_IE6){
						url = getPath2()+"/avicit/platform6/bpmclient/bpm/ProcessTrack_bak.jsp";
					}
					url += "?processInstanceId=" + processInstanceId;
					window.open(encodeURI(url), "流程图", "scrollbars=no,status=yes,resizable=no,top=0,left=0,width=700,height=400");
				}else{
					$.messager.alert('提示','人员密级不符合要求，无法打开！');
				}
			}
		});
	}
	//////////////////////////////////////////////////////////////////////////////
	/**
	 * 我处理中的流程实例查询
	 */
	function searchInstanceTodo() {
		var startDateBegin = $('#instanceTodo_startDateBegin').datetimebox('getValue');
		var startDateEnd = $('#instanceTodo_startDateEnd').datetimebox('getValue');
		var catalogId = $('#instanceTodo_catalogId').val();
		
		var definename = $('#instanceTodo_definename').val();
		var entryName = $('#instanceTodo_entryName').val();
		var createUserId = $('#instanceTodo_createUserId').val();
		var createDeptId = $('#instanceTodo_createDeptId').val();
		
		var pdId = $('#instanceTodo_pdId').val();
		var queryParas = "catalogId=" + catalogId + "&startDateBegin=" + startDateBegin + "&startDateEnd=" + startDateEnd + "&pdId=" + pdId;
		queryParas += "&definename=" + definename + "&entryName=" + entryName + "&createUserId=" + createUserId + "&createDeptId=" + createDeptId;
		getInstanceTodo(queryParas);
	}
	/**
	 * 清空我处理中的流程实例查询条件
	 */
	function clearInstanceTodo() {
		//$('#instanceTodo_catalogId').val('');
		$('#instanceTodo_startDateBegin').datebox("setValue", "");
		$('#instanceTodo_startDateEnd').datebox("setValue", "");
		
		$('#instanceTodo_definename').val("");
		$('#instanceTodo_entryName').val("");
		$('#instanceTodo_createUserId').val("");
		$('#instanceTodo_createUserName').val("");
		$('#instanceTodo_createDeptId').val("");
		$('#instanceTodo_createDeptName').val("");
		
		//$('#instanceTodo_pdId').val('');
	}
	/**
	 * 我处理中的流程实例查询ajax请求
	 */
	function getInstanceTodo(queryParas) {
		var dataGridHeight = $(".easyui-layout").height() - $("#d2").height() - 55;//175;
		$('#instanceTodoDiv').datagrid({
			url : encodeURI('platform/bpm/clientbpmdisplayaction/getProcessInstanceTodoListByPage.json?isFinished=0&' + queryParas),
			width : '100%',
			nowrap : false,
			striped : true,
			autoRowHeight : false,
			singleSelect : false,
			checkOnSelect : false,
			remoteSort : false,
			height : dataGridHeight,
			fitColumns : true,
			sortName : 'startdate', //排序字段,当表格初始化时候的排序字段
			sortOrder : 'desc', //定义排序顺序
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			queryParams : {
				"" : ""
			},
			loadMsg : ' 处理中，请稍候…',
			columns : [ [ {
				field : 'id',
				hidden : true
			}, {
				field : 'definename',
				title : '流程定义名称',
				width : 60,
				align : 'left',
				sortable : true
			}, {
				field : 'entryname',
				title : '流程实例名称',
				width : 50,
				align : 'left',
				sortable : true,
				formatter : function(value, rec) {
					if(value == null || value == ""){
						value = "未命名";
					}
					var processInstance = "'" + rec.entryid + "'";
					var state = "'" + rec.state + "'";
					var id = "'" + rec.id + "'";
					return '<a href="javascript:window.trackBpm(' + processInstance + ')">' + value + '</a>';
				}
			}, {
				field : 'state',
				title : '状态',
				width : 40,
				align : 'left',
				sortable : true,
				formatter : function(value) {
					if (value == 'active') {
						return '流转中';
					} else if (value == 'ended') {
						return '结束';
					} else if (value == 'suspended') {
						return '挂起';
					}

				}
			}, {
				field : 'userid',
				title : '创建者',
				width : 25,
				align : 'left',
				sortable : true
			}, {
				field : 'deptid',
				title : '创建部门',
				width : 50,
				align : 'left',
				sortable : true
			}, {
				field : 'startdate',
				title : '启动时间',
				width : 50,
				align : 'left',
				sortable : true,
				formatter : function(value, rec) {
					var startdateMi = rec.startdate;
					if (startdateMi == undefined) {
						return;
					}
					var newDate = new Date(startdateMi);
					return newDate.Format("yyyy-MM-dd hh:mm:ss");
				}
			}, {
				field : 'enddate',
				title : '结束时间',
				width : 50,
				align : 'left',
				editor : 'text',
				formatter : function(value, rec) {
					var endateMi = rec.enddate;
					if (endateMi == undefined) {
						return;
					}
					var newDate = new Date(endateMi);
					return newDate.Format("yyyy-MM-dd hh:mm:ss");
				}
			} ] ]
		});
		//设置分页控件   
		var p = $('#instanceTodoDiv').datagrid('getPager');
		$(p).pagination({
			pageSize : 20,//每页显示的记录条数，默认为10
			pageList : [ 5, 10, 15, 20, 25, 30 ],//可以设置每页记录条数的列表
			beforePageText : '第',//页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	}
	//////////////////////////////////////////////////////////////////////////////
	/**
	 * 我经办过流程实例查询
	 */
	function searchInstanceFinish() {
		var startDateBegin = $('#instanceFinish_startDateBegin').datetimebox('getValue');
		var startDateEnd = $('#instanceFinish_startDateEnd').datetimebox('getValue');
		var catalogId = $('#instanceFinish_catalogId').val();
		var pdId = $('#instanceFinish_pdId').val();
		
		var definename = $('#instanceFinish_definename').val();
		var entryName = $('#instanceFinish_entryName').val();
		var state = $('#instanceFinish_state').combobox("getValue");
		var createUserId = $('#instanceFinish_createUserId').val();
		var createDeptId = $('#instanceFinish_createDeptId').val();
		
		var queryParas = "catalogId=" + catalogId + "&startDateBegin=" + startDateBegin + "&startDateEnd=" + startDateEnd + "&pdId=" + pdId;
		queryParas += "&definename=" + definename + "&entryName=" + entryName + "&state=" + state + "&createUserId=" + createUserId + "&createDeptId=" + createDeptId;
		getInstanceFinish(queryParas);
	}
	/**
	 * 清空我经办过流程实例条件
	 */
	function clearInstanceFinish() {
		//$('#instanceFinish_catalogId').val('');
		$('#instanceFinish_startDateBegin').datebox("setValue", "");
		$('#instanceFinish_startDateEnd').datebox("setValue", "");
		
		$('#instanceFinish_definename').val("");
		$('#instanceFinish_entryName').val("");
		$('#instanceFinish_state').combobox("setValue", "");
		$('#instanceFinish_createUserId').val("");
		$('#instanceFinish_createUserName').val("");
		$('#instanceFinish_createDeptId').val("");
		$('#instanceFinish_createDeptName').val("");
		
		//$('#instanceFinish_pdId').val('');
	}
	/**
	 * 我经办过流程实例查询ajax请求
	 */
	function getInstanceFinish(queryParas) {
		var dataGridHeight = $(".easyui-layout").height() - $("#d3").height() - 55;//175;
		$('#instanceFinishDiv').datagrid({
			url : encodeURI('platform/bpm/clientbpmdisplayaction/getProcessInstanceTodoListByPage.json?isFinished=1&' + queryParas),
			width : '100%',
			nowrap : false,
			striped : true,
			autoRowHeight : false,
			singleSelect : false,
			checkOnSelect : false,
			remoteSort : false,
			height : dataGridHeight,
			fitColumns : true,
			sortName : 'startdate', //排序字段,当表格初始化时候的排序字段
			sortOrder : 'desc', //定义排序顺序
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			queryParams : {
				"" : ""
			},
			loadMsg : ' 处理中，请稍候…',
			columns : [ [ {
				field : 'id',
				hidden : true
			}, {
				field : 'definename',
				title : '流程定义名称',
				width : 60,
				align : 'left',
				sortable : true
			}, {
				field : 'entryname',
				title : '流程实例名称',
				width : 50,
				align : 'left',
				sortable : true,
				formatter : function(value, rec) {
					if(value == null || value == ""){
						value = "未命名";
					}
					var processInstance = "'" + rec.entryid + "'";
					var state = "'" + rec.state + "'";
					var id = "'" + rec.id + "'";
					return '<a href="javascript:window.trackBpm(' + processInstance + ')">' + value + '</a>';
				}
			}, {
				field : 'state',
				title : '状态',
				width : 40,
				align : 'left',
				sortable : true,
				formatter : function(value) {
					if (value == 'active') {
						return '流转中';
					} else if (value == 'ended') {
						return '结束';
					} else if (value == 'suspended') {
						return '挂起';
					}

				}
			}, {
				field : 'userid',
				title : '创建者',
				width : 25,
				align : 'left',
				sortable : true
			}, {
				field : 'deptid',
				title : '创建部门',
				width : 50,
				align : 'left',
				sortable : true
			}, {
				field : 'startdate',
				title : '启动时间',
				width : 50,
				align : 'left',
				sortable : true,
				formatter : function(value, rec) {
					var startdateMi = rec.startdate;
					if (startdateMi == undefined) {
						return;
					}
					var newDate = new Date(startdateMi);
					return newDate.Format("yyyy-MM-dd hh:mm:ss");
				}
			}, {
				field : 'enddate',
				title : '结束时间',
				width : 50,
				align : 'left',
				editor : 'text',
				formatter : function(value, rec) {
					var endateMi = rec.enddate;
					if (endateMi == undefined) {
						return;
					}
					var newDate = new Date(endateMi);
					return newDate.Format("yyyy-MM-dd hh:mm:ss");
				}
			} ] ]
		});
		//设置分页控件   
		var p = $('#instanceFinishDiv').datagrid('getPager');
		$(p).pagination({
			pageSize : 20,//每页显示的记录条数，默认为10
			pageList : [ 5, 10, 15, 20, 25, 30 ],//可以设置每页记录条数的列表
			beforePageText : '第',//页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	}
	
	
	$(function(){
		var comSelector1 = new CommonSelector("user","userSelectCommonDialog","instanceTodo_createUserId","instanceTodo_createUserName",null,null,null,null,null,null,600,400);
		comSelector1.init(null, null, 'n'); //选择人员  回填部门 */
		
		var comSelector2 = new CommonSelector("user","userSelectCommonDialog","instanceFinish_createUserId","instanceFinish_createUserName",null,null,null,null,null,null,600,400);
		comSelector2.init(null, null, 'n'); //选择人员  回填部门 */

		var comSelector3 = new CommonSelector("dept","deptSelectCommonDialog","instanceTodo_createDeptId","instanceTodo_createDeptName",null,null,null,null,null,null,600,400);
		comSelector3.init(); //选择人员  回填部门 */

		var comSelector4 = new CommonSelector("dept","deptSelectCommonDialog","instanceFinish_createDeptId","instanceFinish_createDeptName",null,null,null,null,null,null,600,400);
		comSelector4.init(); //选择人员  回填部门 */
	});
</script>
<body class="easyui-layout" fit="true">
	<div data-options="region:'west',title:'流程业务目录',split:false" style="width:200px;overflow: auto;">
		<ul id="mytree"></ul>
	</div>
	<div region="center" border="false" style="overflow: hidden;height:0px;">
		<div id="myProcessTab">
			<div title="我发起的流程" style="padding:10px;width:auto">
				<div id="d1" class="datagrid-toolbar" style="height:auto;display: block;">
					<fieldset>
						<legend>查询条件</legend>
						<input type="hidden" name="catalogId" id="instanceStart_catalogId" /> <input type="hidden" name="pdId" id="instanceStart_pdId" />
						<table class="tableForm" width='100%' align="left">
							<tr>
								<td style="width:70px" align="left">&nbsp;定义名称：</td>
								<td style="width:160px" align="left"><input id="instanceStart_definename" class="easyui-validatebox" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;实例名称：</td>
								<td style="width:160px" align="left"><input id="instanceStart_entryName" class="easyui-validatebox" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;流转状态：</td>
								<td style="width:160px" align="left"><select id="instanceStart_state" class="easyui-combobox" style="width:150px;" data-options="editable:false">
										<option value="">全部</option>
										<option value="active">流转中</option>
										<option value="ended">结束</option>
										<option value="suspended">挂起</option>
								</select></td>
							</tr>
							<tr>
								<td style="width:70px" align="left">&nbsp;开始时间：</td>
								<td style="width:160px" align="left"><input id="instanceStart_startDateBegin" class="easyui-datebox" editable="false" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;结束时间：</td>
								<td style="width:160px" align="left"><input id="instanceStart_startDateEnd" class="easyui-datebox" editable="false" style="width: 150px;" /></td>
								<td colspan=2 align="left"><a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchInstanceStart();" href="javascript:void(0);">查询</a> <a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="clearInstanceStart();" href="javascript:void(0);">清空</a></td>
							</tr>
						</table>
					</fieldset>
				</div>
				<br>
				<table id="instanceStartDiv"></table>
			</div>
			<div title="我处理中的流程" style="padding:10px;width:auto">
				<div id="d2" class="datagrid-toolbar" style="height:auto;display: block;">
					<fieldset>
						<legend>查询条件</legend>
						<input type="hidden" name="catalogId" id="instanceTodo_catalogId" /> <input type="hidden" name="pdId" id="instanceTodo_pdId" />
						<table class="tableForm" width='100%' align="left">
							<tr>
								<td style="width:70px" align="left">&nbsp;定义名称：</td>
								<td style="width:160px" align="left"><input id="instanceTodo_definename" class="easyui-validatebox" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;实例名称：</td>
								<td style="width:160px" align="left"><input id="instanceTodo_entryName" class="easyui-validatebox" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;创建者：</td>
								<td style="width:160px" align="left"><input type="hidden" id="instanceTodo_createUserId"/><input id="instanceTodo_createUserName" class="easyui-validatebox" readonly style="width:150px;" /></td>
							</tr>
							<tr>
								<td style="width:70px" align="left">&nbsp;开始时间：</td>
								<td style="width:160px" align="left"><input id="instanceTodo_startDateBegin" class="easyui-datebox" editable="false" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;结束时间：</td>
								<td style="width:160px" align="left"><input id="instanceTodo_startDateEnd" class="easyui-datebox" editable="false" style="width: 150px;" /></td>
								<td style="width:70px" align="left">&nbsp;创建部门：</td>
								<td style="width:160px" align="left"><input type="hidden" id="instanceTodo_createDeptId"/><input id="instanceTodo_createDeptName" class="easyui-validatebox" readonly style="width:150px;" /></td>
							</tr>
							<tr>
								<td colspan=6 align="center"><a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchInstanceTodo();" href="javascript:void(0);">查询</a><a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="clearInstanceTodo();" href="javascript:void(0);">清空</a></td>
							</tr>
						</table>
					</fieldset>
				</div>
				<br>
				<table id="instanceTodoDiv"></table>
			</div>
			<div title="我经办过的流程" style="padding:10px;width:auto">
				<div id="d3" class="datagrid-toolbar" style="height:auto;display: block;">
					<fieldset>
						<legend>查询条件</legend>
						<input type="hidden" name="catalogId" id="instanceFinish_catalogId" /> <input type="hidden" name="pdId" id="instanceFinish_pdId" />
						<table class="tableForm" width='100%' align="left">
							<tr>
								<td style="width:70px" align="left">&nbsp;定义名称：</td>
								<td style="width:160px" align="left"><input id="instanceFinish_definename" class="easyui-validatebox" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;实例名称：</td>
								<td style="width:160px" align="left"><input id="instanceFinish_entryName" class="easyui-validatebox" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;创建者：</td>
								<td style="width:160px" align="left"><input type="hidden" id="instanceFinish_createUserId"/><input id="instanceFinish_createUserName" class="easyui-validatebox" readonly style="width:150px;" /></td>
							</tr>
							<tr>
								<td style="width:70px" align="left">&nbsp;开始时间：</td>
								<td style="width:160px" align="left"><input id="instanceFinish_startDateBegin" class="easyui-datebox" editable="false" style="width:150px;" /></td>
								<td style="width:70px" align="left">&nbsp;结束时间：</td>
								<td style="width:160px" align="left"><input id="instanceFinish_startDateEnd" class="easyui-datebox" editable="false" style="width: 150px;" /></td>
								<td style="width:70px" align="left">&nbsp;创建部门：</td>
								<td style="width:160px" align="left"><input type="hidden" id="instanceFinish_createDeptId"/><input id="instanceFinish_createDeptName" class="easyui-validatebox" readonly style="width:150px;" /></td>
							</tr>
							<tr>
								<td style="width:70px" align="left">&nbsp;流转状态：</td>
								<td style="width:160px" align="left"><select id="instanceFinish_state" class="easyui-combobox" style="width:150px;" data-options="editable:false">
										<option value="">全部</option>
										<option value="active">流转中</option>
										<option value="ended">结束</option>
										<option value="suspended">挂起</option>
								</select></td>
								<td colspan=2 align="center"><a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchInstanceFinish();" href="javascript:void(0);">查询</a><a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="clearInstanceFinish();" href="javascript:void(0);">清空</a></td>
								<td style="width:70px" align="left"></td>
								<td style="width:160px" align="left"></td>
							</tr>
						</table>
					</fieldset>
				</div>
				<br>
				<table id="instanceFinishDiv"></table>
			</div>
		</div>
	</div>
</body>
</html>