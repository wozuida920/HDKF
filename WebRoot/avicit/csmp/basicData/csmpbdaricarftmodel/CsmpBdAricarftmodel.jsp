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
<!-- ControllerPath = "csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/CsmpBdAricarftmodelInfo" -->
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
	<div  data-options="region:'north',title:'机型数据信息'" style="border: 0px; height: 150px; background: #fafafa;" iconCls="icon-search">
		<form id="csmpBdAricarftmodel">
			<table class="form_commonTable" style="height:100%">
				<tr>
					<th width="12%">机型编号:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="modelNum" /></td>
					<th width="13%">机型名称:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="modelName" /></td>

					<th width="15%">类型:</th>
					<td width="20%">
						<%-- <pt6:syslookup name="modelType"
							lookupCode="CSMP_BD_AIRCRAFT_TYPE"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup> --%>
						 <select id="modelType" class="easyui-combobox"
						 data-options="fit:true,onShowPanel:comboboxOnShowPanel, editable:false, panelHeight:'auto'"
						name="modelType"   >
							<option value=""></option>
							<c:forEach items="${type }" var="age">
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
					<td align="center"><a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="csmpBdAricarftmodel.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="csmpBdAricarftmodel.clearData();"
						href="javascript:void(0);">清空</a></td>
				</tr>
			</table>
		</div>

	
	</div>
	<div data-options="region:'center'"
		style="background: #ffffff; height:auto; padding: 0px; overflow: hidden;">
		<%-- <div id="toolbarCsmpBdAricarftmodel" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_csmpBdAricarftmodel_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="csmpBdAricarftmodel.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					
				
				</tr>
			</table>
		</div> --%>
		<table id="dgCsmpBdAricarftmodel"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
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
					<th data-options="field:'modelNum',align:'center', halign:'center',formatter: function (value, rec, index) {
				        		  if(value==undefined){
				        			   return;
				        		  }
				        		  if(value.length>8){
				        		      return value.substring(0,10)+'...';
				        	      }else{
				        			return value;
				        		}}" width="220">机型编号</th>
					<th data-options="field:'modelName',align:'center', halign:'center'" width="220">机型名称</th>
					<th
						data-options="field:'modelType',align:'center', halign:'center',formatter:formatemodelType"
						width="220">类型</th>
					
				</tr>
			</thead>
		</table>
	</div>
	
	<script
		src="avicit/csmp/basicData/csmpbdaricarftmodel/js/Csmpmodel.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdAricarftmodel;
		$(function() {
			csmpBdAricarftmodel = new CsmpBdAricarftmodel(
					'dgCsmpBdAricarftmodel', '${url}', 'searchDialog',
					'csmpBdAricarftmodel');
			
			$('#dgCsmpBdAricarftmodel').datagrid({
				onDblClickRow: function(rowIndex, rowData){
					parent.callBackData(rowData);
// 					window.opener.callBackData(rowData);
					
					$("#model").dialog('close');
				}
			});

			
			
			
			
			var array = [];

			var searchObject = {
				name : '机型编号',
				field : 'MODEL_NUM',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '机型名称',
				field : 'MODEL_NAME',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '类型',
				field : 'MODEL_TYPE',
				type : 1,
				dictCode : 'CSMP_BD_AIRCRAFT_TYPE',
				dataType : 'dict'
			};
			array.push(searchObject);
			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				csmpBdAricarftmodel.searchDataBySfn(param);
			});
		});
		function formateDate(value, row, index) {
			return csmpBdAricarftmodel.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdAricarftmodel.formateTime(value);
		}
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdAricarftmodel.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		function formatemodelType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdAricarftmodel.modelType);
		}
	</script>
</body>
</html>