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
<!-- ControllerPath = "csmp/basicData/csmpbdsparepart/CsmpBdSparepartController/CsmpBdSparepartInfo" -->
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
<script src="static/js/platform/component/common/exportData.js" type="text/javascript"></script>
<script src="avicit/csmp/common/js/ValidtionContent.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'north'" style="background: #ffffff; height: 116px; padding: 0px; overflow: hidden;">
		<div style="height:139px;">
		<form id="csmpBdSparepart" style="">
			<table class="form_commonTable" style>
				<tr>
					<th width="10%">产品名称:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 100px;" type="text" name="productName" /></td>
					<th width="10%">图号:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 100px;" type="text" name="drawingNo" /></td>
					<th width="10%">责任单位:</th>
					<td width="20%"><input class="easyui-validatebox"
						style="width: 100px;" type="text" name="liabilityUnit" /></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera" style="height:30px;background: red">
			<table class="tableForm" border="0" cellspacing="0" width='100%'>
				<tr>
					<td align="center"><a class="easyui-linkbutton " iconCls=""
						plain="false" onclick="csmpBdSparepart.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false" onclick="csmpBdSparepart.clearData();"
						href="javascript:void(0);">清空</a></td>
				</tr>
				
			</table>
		</div>
		</div>
	</div>
	<div data-options="region:'center'"
		style="background: #ffffff; height: auto;font-size:0; padding: 0px; overflow: hidden;">
		<div id="toolbarCsmpBdSparepart" class="datagrid-toolbar">
			<table>
				<tr>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_csmpBdSparepart_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="csmpBdSparepart.setProductNameAnd();"
							href="javascript:void(0);">确认</a></td>
					</sec:accesscontrollist>
				</tr>
			</table>
		</div>
		<table id="dgCsmpBdSparepart"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarCsmpBdSparepart',
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
					<th data-options="field:'id',hidden:true,halign:'center',checkbox:true"
						width="220">主键ID</th>
					<th
						data-options="field:'productName',align:'center', halign:'center'"
						width="220">产品名称</th>
					<th
						data-options="field:'drawingNo',align:'center', halign:'center'"
						width="220">图号</th>
					<th data-options="field:'unit',align:'center', halign:'center'"
						width="220">单位</th>
					<th data-options="field:'quantity',align:'center', halign:'center'"
						width="220">数量</th>
					<th
						data-options="field:'specification',align:'center', halign:'center'"
						width="220">规格</th>
					<th
						data-options="field:'dutyFreePrice',align:'center', halign:'center'"
						width="220">免税单价</th>
					<th data-options="field:'taxPrice',align:'center', halign:'center'"
						width="220">含税单价</th>
					<th
						data-options="field:'liabilityUnit',align:'center', halign:'center'"
						width="220">责任单位</th>
					<th
						data-options="field:'validFlag',align:'center', halign:'center'"
						width="220">有效性</th>
					<th data-options="field:'category',align:'center', halign:'center'" 
						width="220">类别</th>
					<th
						data-options="field:'isRandompart',align:'center', halign:'center',"
						width="220">是否随机件</th>
					<th
						data-options="field:'classifyDept',align:'center', halign:'center',"
						width="220">分类单位</th>
					 <th data-options="field:'remark',align:'center', halign:'center',formatter: function (value, rec, index) {
				        		  if(value==undefined){
				        			   return;
				        		  }
				        		  if(value.length>8){
				        		      return value.substring(0,8)+'...';
				        	      }else{
				        			return value;
				        		}}"
						width="220">备注</th> 
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	
	<script
		src="avicit/hdkf/support/hdkfsupportrequestinfo/js/HdkfBdSparepart.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdSparepart;
		$(function(){
			csmpBdSparepart = new CsmpBdSparepart('dgCsmpBdSparepart','${url}','searchDialog','csmpBdSparepart');
			csmpBdSparepart.setOnClick(function(rowdata){
				 parent.setSparePartTextAndChapter(rowdata);
			});
			
			var array = [];

			/* var searchObject = {
				name : '产品名称',
				field : 'PRODUCT_NAME',
				type : 1,
				dataType:'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '图号',
				field : 'DRAWING_NO',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject);

			var searchObject = {
				name : '责任单位',
				field : 'LIABILITY_UNIT',
				type : 1,
				dataType : 'string'
			};
			array.push(searchObject); */
			///

			//selfDefQury.init(array);
			//selfDefQury.setQuery(function(param) {
			//	csmpBdSparepart.searchDataBySfn(param);
			//});
			var dgView=$('#dgCsmpBdSparepart');
			initTheLangField(dgView);
			initTheMessage(dgView);
		});
		function formateDate(value, row, index) {
			return csmpBdSparepart.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdSparepart.formateTime(value);
		}
		//csmpBdSparepart.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdSparepart.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		function formateisRandompart(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdSparepart.isRandompart);
		}
		function importDataToExcel(){
			var imp = new 
			CommonDialog("importData","700","400",'platform/excelImportController/excelimport/CsmpBdSparepartImpl/xls',"Excel数据导入",false,true,false);
			imp.show();
			
		}
		//Excle导入框回调方法必须有
		 function closeImportData(){
			 csmpBdSparepart.reLoad();
			$("#importData").dialog('close');
			
		} 

	</script>
</body>
</html>