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
<!-- ControllerPath = "csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoController/CsmpBdAircraftinfoInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/com
mon/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
</head>
<body>
<div  class="easyui-layout" fit="true">
	<div data-options="region:'west',split:false,title:''" style="width: 250px; padding: 0px; background:">
		<div id="tt"  class="easyui-tabs" style="" data-options="width:200,height:400,fit:true">
			<div id="t1" title="按公司" >
				<ul id="tree" class="easyui-tree" style="width: auto;"></ul>
			</div>
			<div id="t2" title="按机型" style="">
				<ul id="tree1" class="easyui-tree" style="width: auto; " ></ul>
			</div>
		</div> 
	</div>
	<div data-options="region:'center'" style="background: #ffffff; height: auto; padding: 0px; overflow: hidden;">
		<div class="easyui-layout" fit="true">
			<div data-options="region:'north',title:' '" style="height: 160px;">
				<form id="csmpBdAircraftinfo">
					<table class="form_commonTable">
						<tr>
							<th width="10%">批架次:</th>
							<td width="20%"><input class="easyui-validatebox"
								type="text" name="batchNo" /></td>
							<th width="10%">合同号:</th>
							<td width="20%"><input class="easyui-validatebox"
								type="text" name="contractNo" /></td>
							<th width="10%">注册号:</th>
							<td width="20%"><input class="easyui-validatebox"
								type="text" name="registraterNo" /></td>
						</tr>
						<tr>
							<th width="10%">运营状态:</th>
							<td width="20%">
							
							 <select id="operateStatus"
								class="easyui-combobox" name="operateStatus" panelHeight="auto"
								data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false">
									<option value="">请选择</option>
									<c:forEach items="${type }" var="age">
										<option value="${age.lookupCode }">${age.lookupName}</option>
									</c:forEach>
							</select>
							</td>
							<th width="10%">运营商:</th>
							<td width="20%"><input class="easyui-validatebox"
								type="text" name="operator" /></td>
							<th width="10%">是否商报期内:</th>
							<td width="20%">
							 <select id="isBusinessPeriod"
								class="easyui-combobox" name="isBusinessPeriod"
								data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'">
									 <option value="">请选择</option> 
									<c:forEach items="${isBusinessPeriod }" var="age">
										<option value="${age.lookupCode }">${age.lookupName}</option>
									</c:forEach>
							</select>
							</td>
						</tr>

					</table>
				</form>
				<div id="searchBtns" class="datagrid-toolbar foot-formopera">
					<table class="tableForm" border="0" cellspacing="1" width='100%'>
						<tr>
							<td align="center">
								<a class="easyui-linkbutton" iconCls=""
								plain="false" onclick="search1();" href="javascript:void(0);">查询</a> 
								<a class="easyui-linkbutton"
								iconCls="" plain="false"
								onclick="csmpBdAircraftinfo.clearData();"
								href="javascript:void(0);">清空</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 中之中 -->
			<div data-options="region:'center'"
				style="background: #ffffff; height: auto; padding: 0px; overflow: hidden;">
				<div id="toolbarCsmpBdAircraftinfo" class="datagrid-toolbar">
					<table>
						<tr>

							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdAircraftinfo_button_add"
								permissionDes="添加">
								<td><a class="easyui-linkbutton" iconCls="icon-add"
									plain="true" onclick="insertByNodeId();"
									href="javascript:void(0);">添加</a></td>
							</sec:accesscontrollist>
							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdAircraftinfo_button_edit"
								permissionDes="编辑">
								<td><a class="easyui-linkbutton" iconCls="icon-edit"
									plain="true" onclick="getTabAndNodeEdit();"
									href="javascript:void(0);">编辑</a></td>
							</sec:accesscontrollist>
							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdAircraftinfo_button_delete"
								permissionDes="删除">
								<td><a class="easyui-linkbutton" iconCls="icon-remove"
									plain="true" onclick="csmpBdAircraftinfo.del();"
									href="javascript:void(0);">删除</a></td>
							</sec:accesscontrollist>
							
						</tr>
					</table>
				</div>

				<table id="dgCsmpBdAircraftinfo"
					data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarCsmpBdAircraftinfo',
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
								width="220">主键ID</th>
							<th
								data-options="field:'modelIdAlias',align:'center', halign:'center'"
								width="220">机型</th>
							<th
								data-options="field:'batchNo',align:'center', halign:'center'"
								width="220">批架次</th>
							<th
								data-options="field:'desigeBy',align:'center', halign:'center'"
								width="220">设计单位</th>
							<th
								data-options="field:'productBy',align:'center', halign:'center'"
								width="220">生产单位</th>
							<th
								data-options="field:'contractNo',align:'center', halign:'center'"
								width="220">合同号</th>
							<th
								data-options="field:'registraterNo',align:'center', halign:'center'"
								width="220">注册号</th>
							<th
								data-options="field:'registraterDate',align:'center', halign:'center',formatter:formateDate"
								width="220">注册日期</th>
							<th
								data-options="field:'finishedDate', align:'center',halign:'center',formatter:formateDate"
								width="220">交付日期</th>
							<th
								data-options="field:'isBusinessPeriod',align:'center', halign:'center',formatter:formateisBusinessPeriod"
								width="220">是否商报期内</th>
							<th
								data-options="field:'startOperateDate',align:'center', halign:'center',formatter:formateDate"
								width="220">开始运营日期</th>
							<th
								data-options="field:'operateStatus',align:'center', halign:'center',formatter:formateoperateStatus"
								width="220">运营状态</th>
							<th
								data-options="field:'custumerName',align:'center', halign:'center'"
								width="220">客户名称</th>
							<th
								data-options="field:'operator',align:'center', halign:'center'"
								width="220">运营商</th>
							<!-- <th data-options="field:'companyId', halign:'center'" width="220">单位ID</th> -->
						</tr>
					</thead>
				</table>

			</div>

		</div>
	</div>
	
	<script
		src=" avicit/csmp/basicData/csmpbdaircraftinfo/js/CsmpBdAircraftinfo.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdAircraftinfo;
		var tabs;

		$(function(){
		 	$ .ajax({
				url : 'csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getConervTree',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					$("#tree").tree('loadData', data.tree);
					var node1 = $('#tree').tree('find', 1);
					$('#tree').tree('select', node1.target);
				}
			}); 
			tabs = $("#tt") .tabs({
				cache : false,
				onSelect : function(title,index) {
					if(index==0){
						$ .ajax({
							url : 'csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getConervTree',
							type : 'post',
							dataType : 'json',
							success : function(data) {
								$("#tree").tree('loadData', data.tree);
								var node1 = $('#tree').tree('find', 1);
								$('#tree').tree('select', node1.target);
							}
						});
						
					}else if(index==1){
					$ .ajax({
						url : 'csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/toTree',
						type : 'post',
						dataType : 'json',
						success : function(data) {
							$("#tree1").tree( 'loadData', data.tree);
							var node1 = $('#tree1').tree('find', 1);
							$('#tree1').tree('select', node1.target);
							
						}
					});
					
					}
					
				}
			});
			
			$("#tree").tree({
				onSelect:function(node){
					search1();
				}
			
			});
			$("#tree1").tree({
				onSelect:function(node){
					search1();
				}
			});

			
			csmpBdAircraftinfo = new CsmpBdAircraftinfo('dgCsmpBdAircraftinfo', '${url}', 'searchDialog', 'csmpBdAircraftinfo');
			
			var array = [];

			var searchObject = {
				name : '批架次',
				field : 'BATCH_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '合同号',
				field : 'CONTRACT_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '注册号',
				field : 'REGISTRATER_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '是否商报期内',
				field : 'IS_BUSINESS_PERIOD',
				type : 1,
				dictCode : 'CSMP_BD_ISPERIOD',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '运营状态',
				field : 'OPERATE_STATUS',
				type : 1,
				dictCode : 'CSMP_BD_OPERATIONSTATUS',
				dataType : 'dict'
			};
			array.push(searchObject);

			var searchObject = {
				name : '运营商',
				field : 'OPERATOR',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '单位ID',
				field : 'COMPANY_ID',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				csmpBdAircraftinfo.searchDataBySfn(param);
			});
		});
		
		function formateDate(value, row, index) {
			return csmpBdAircraftinfo.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdAircraftinfo.formateTime(value);
		}
		//csmpBdAircraftinfo.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdAircraftinfo.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		function formateisBusinessPeriod(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdAircraftinfo.isBusinessPeriod);
		}
		function formateoperateStatus(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdAircraftinfo.operateStatus);
		}
		
		//定义一个编辑调用的方法(打开编辑页面)
		function getTabAndNodeEdit(){
			var obj = {};//定义封装个公共的对象
			var tab = tabs.tabs('getSelected');
			var index = $('#tt').tabs('getTabIndex',tab);
			if(index==0){//表示的选择是公司
				currentNode = $("#tree").tree('getSelected');
				if(!currentNode){
					$.messager.alert("提示","请选择左边的一个节点");
					return false;
				}else{
					obj.id=currentNode.id;
				}
				
			}else if(index == 1){//表示的选择是机型
				currentNode = $("#tree1").tree('getSelected');
				if(!currentNode){
					$.messager.alert("提示","请选择左边的一个节点");
					return false;
				}else{
					if(currentNode.id == 1){
						$.messager.alert("提示","不能选择根节点请选择子节点信息");
						return false;
					}
					obj.id=currentNode.id;//给对象把节点的id存进去
					obj.modelNum=currentNode.text;//把对象的节点的名字给存进去
				}
			}
			obj = JSON.stringify(obj);
			obj=eval("("+obj+")");
			
			csmpBdAircraftinfo.modify(obj);
		}
		
		
		
		
		
		//点击保存前进行必要的判断（打开添加页面）
		function insertByNodeId(){
			csmpBdAircraftinfo.clearDataOnly();//清空查询form区域
			var currentNode = null;//定义一个节点对象
			//定义一个对象用来实力化查询区域
			var obj = {};
			var tab = tabs.tabs('getSelected');
			var index = $('#tt').tabs('getTabIndex',tab);

			if(index==0){
				currentNode = $("#tree").tree('getSelected');
				if(!currentNode){
					$.messager.alert("提示","请选择左边的一个节点");
					return false;
				}else{
					obj.id=currentNode.id;
				}
				
			}else if(index == 1){
				currentNode = $("#tree1").tree('getSelected');
				if(!currentNode){
					$.messager.alert("提示","请选择左边的一个节点");
					return false;
				}else{
					if(currentNode.id == 1){
						$.messager.alert("提示","不能选择根节点请选择子节点信息");
						return false;
					}
					obj.id=currentNode.id;
					obj.modelNum=currentNode.text;
				}
			}
			obj = JSON.stringify(obj);
			obj=eval("("+obj+")");
			csmpBdAircraftinfo.insert(obj);
			
			/* if(!currentNode){
				$.messager.alert("提示","请选择一个节点信息");
				return false;
			}
			//定义一个对象
			var obj = {}; */
			/* if(currentNode.id == 1){
				$.messager.alert("提示","不能选择根节点请选择子节点信息");
				return false;
			}else{
				if(index==0){
					obj.id=currentNode.id;
				}else if(index==1){
					obj.id=currentNode.id;
					obj.modelNum=currentNode.text;
				}
				obj = JSON.stringify(obj); 
			}
			obj=eval("("+obj+")");
			csmpBdAircraftinfo.insert(obj); */
		}
		
		var selectNode = null;//全局node记录当前选中的node的具体信息包括分类
		function preparedNode(){
			var obj = serializeObject($("#csmpBdAircraftinfo"));//获取查询区域的obj对象
			var tab = tabs.tabs('getSelected');
			var index = $('#tt').tabs('getTabIndex',tab);
			if(index==0){
				selectNode = $("#tree").tree('getSelected');
				if(selectNode){
					if(selectNode.id=='1'){
						obj.companyId=selectNode.id;
						return obj;
					}
					obj.companyId =selectNode.id;
				}
			}else if(index == 1){
				
				selectNode = $("#tree1").tree('getSelected');
				if(selectNode){
					obj.modelId=selectNode.id;
				}
			}
			return obj; 
		}
		
		function search1(){
			csmpBdAircraftinfo.searchData(preparedNode());
		}
	</script>
</div>
</body>
</html>