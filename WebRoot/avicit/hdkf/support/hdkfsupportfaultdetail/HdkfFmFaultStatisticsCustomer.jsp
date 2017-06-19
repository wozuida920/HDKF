<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/fault/csmpfmfaultreport/CsmpFmFaultreportController/CsmpFmFaultStatisticsCustomerInfo" -->
<title>客户名称统计明细</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
<script src="static/js/platform/component/fusionchar/js/FusionCharts.js" type="text/javascript"></script>

</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#faultStatistics").tabs({
	    onSelect:function(title,index){

		    if(index){//按客户名称查询
		    	searchData('CustomerQuery');
		    	//getCustomerQueryFormBack();
		    }
    	}
	});
	initView(searchData('CustomerQuery'));
});

//初始化的时候查询文本内容清空
function cleanText(tab){
	$("#"+tab+"SeachForm input").val('');
}

//查询
function searchData(tab){
	 var beginDateParam = $("#"+tab+"SeachForm_beginDate").datebox('getValue');
	 var endDateParam = $("#"+tab+"SeachForm_endDate").datebox('getValue');
	 var beginDate = Date.parse(beginDateParam.replace(/-/g,'/'));
	 var endDate = Date.parse(endDateParam.replace(/-/g,'/'));
     if (beginDate > endDate) {
		$.messager.alert("提示", "查询开始日期不可大于结束日期", "info");
		$("#"+tab+"SeachForm_endDate").datebox('setValue','');
		return;
	 } 
   	 var data = "beginDate="+beginDateParam+"&endDate="+endDateParam;
     ajaxRequest("POST",data,"${url}get"+tab+"Form","json","get"+tab+"FormBack");
}

//清空
function clearData(tab){
	$("#"+tab+"Form input").val('');
	searchData(tab);
}

//初始化页面方法
function initView(tab,tableId){
	//按日期查询条件
	var beginDateParam = $("#"+tab+"SeachForm_beginDate").datebox('getValue');
	var endDateParam = $("#"+tab+"SeachForm_endDate").datebox('getValue');
	var beginDate = Date.parse(beginDateParam.replace(/-/g,'/'));
	var endDate = Date.parse(endDateParam.replace(/-/g,'/'));
    if (beginDate > endDate) {
		$.messager.alert("提示", "查询开始日期不可大于结束日期", "info");
		$("#"+tab+"SeachForm_endDate").datebox('setValue','');
		return;
	} 
   //datagrid样式进行页面渲染
	var dgview = $('#'+tableId);
	dgview.datagrid({
		border: true,
		rownumbers: true,
		animate: true,
		collapsible: false,
		fit: true,
		rownumbers: false,
		idField :'id',
		autoRowHeight: true,
		//日期参数传到后台
		queryParams: {
			beginDate : beginDateParam,
			endDate : endDateParam
			},
		url:"${url}get"+tab+"Form",
		fitColumns: true,
		method:'post',
		pagination:true,
		pageSize:dataOptions.pageSize,
		pageList:[5,10,15,20,30],
		nowrap:true,
		//数据加载成功后,如果有数据默认选中当前页数据行，如果没有数据则返回空字符串
		onLoadSuccess:function(data){
			if(data.total>0){
				onLoadRowsAll(tableId);
			}else{
				onUncheckAllRows(tableId);
			}
		}
	});
}

//客户名称
function getCustomerQueryFormBack(json){
	//var json=[{name:'a',value:12},{name:'b',value:45},{name:'c',value:12},{name:'d',value:45}];
	var chart = new FusionCharts("static/js/platform/component/fusionchar/js/Column2D.swf", "ChartId", "100%", "370", "0", "0");
	var strXML  = "<chart palette='3' caption='按故障发生次数统计查询' xAxisName='客户名称' yAxisName='故障次数' baseFont='微软雅黑'  showValues='1' decimals='1' formatNumberScale='1'>";
	var tableHtml='<table style="width:100%;" align="center" border="1" bordercolor="#E3EFFB">';
	tableHtml += '<tr align="center" height="25px" style="background:#E3EFFB;">';
	tableHtml += '<th>客户名称</th><th>发生次数</th>';
	tableHtml += '</tr>';
	for (var i = 0; i < json.length; i++) {
		strXML += "	<set label='"+json[i].cusName+"' value='"+json[i].customerNum+"'/>" ;
		tableHtml += '<tr align="center" height="25px" >';
		tableHtml += '<td width="50%">'+json[i].cusName+'</td>';
		tableHtml += '<td width="50%">'+json[i].customerNum+'</td>';
		tableHtml += '</tr>';
	}
	strXML += "</chart>";
	tableHtml += '</table>';
	chart.setDataXML(strXML);
	document.getElementById("customerQueryTable").innerHTML=tableHtml;
	chart.render("customerQuery");
	$("#customerQueryTable").hide();
}
</script>

	 		<div id="CustomerQueryForm" class="datagrid-toolbar" style="height: auto;display: block;">
				<fieldset>
						<table class="tableForm" border="0">
							<tr>
							   	<td style="padding-left: 200px;">发生时间:</td>
			    					<td>
			    						<input class="easyui-datebox"  style="width:130px;" type="text" id="CustomerQuerySeachForm_beginDate" name="beginDate" data-options="editable:false"/>
			    						&nbsp;&nbsp;到&nbsp;&nbsp;
			    						<input class="easyui-datebox"  style="width:130px;" type="text" id="CustomerQuerySeachForm_endDate" name="endDate" data-options="editable:false"/>
			    					</td>
								<td style="padding-left: 50px">
									<a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="searchData('CustomerQuery');" href="javascript:void(0);">查询</a>
					    			&nbsp;&nbsp;
					    			<a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="clearData('CustomerQuery');" href="javascript:void(0);">清空</a>
					    			&nbsp;&nbsp;
					    			<a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="customerQueryHide()" href="javascript:void(0);">表格</a>
					    			&nbsp;&nbsp;
					    			<a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="customerQueryTableHide()" href="javascript:void(0);">柱状图</a>
								</td>
							</tr>
						</table>
				</fieldset>
			</div>
		<script type="text/javascript">
			//隐藏表格显示图片
			function customerQueryTableHide(){
				$("#customerQueryTable").hide();
				$("#customerQuery").show();
			}
			//隐藏图片显示表格
			function customerQueryHide(){
				$("#customerQuery").hide();
				$("#customerQueryTable").show();
			}
		</script>
		<div style="width: 100%;height:500px;" align="center" >
				<div id="customerQueryTable" style="float:left;padding-left:40px;padding-top: 10px;height:400px;width:90%">
				<!-- 这里是js动态生成table布局显示 -->
				<!-- 	 <table id="customerQueryTableByPage" style="width:510px;" align="center" border="1" bordercolor="#E3EEFD">
						<thead>
							<tr>
								<th data-options="field:'id', align:'center',checkbox:true" width="220">ID</th>
								<th data-options="field:'customerName', align:'center'" width="50">客户名称</th>
								<th data-options="field:'customerNum', align:'center'" width="50">故障次数</th>
							</tr>
						</thead>
					</table>  -->
				</div>
			<div style="width:90%;height:100%;float:left;padding-left: 40px;padding-top: 10px;"  >
				<div id="customerQuery"></div>
			</div>
		</div> 

</body>
</html>