<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/fault/csmpfmfaultreport/CsmpFmFaultreportController/CsmpFmFaultStatisticsBatchNoInfo" -->
<title>按批架次统计</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
<script src="static/js/platform/component/fusionchar/js/FusionCharts.js" type="text/javascript"></script>

</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#faultStatistics").tabs({
	    onSelect:function(title,index){
		     if(index){
		    	cleanText('BatchNoQuery');
			    initView('BatchNoQuery','batchNoQueryTableByPage');
		    }   
    	}
	});
	initView('BatchNoQuery','batchNoQueryTableByPage');
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

//当取消全部选中和后台查询没有数据时的实现方法,没有生成图表
function onUncheckAllRows(tableId){
	if("batchNoQueryTableByPage" == tableId){
		getBatchNoQueryFormBack(null,"No data to display");	
	}  else if("chaperNoQueryTableByPage" == tableId){
		getChaperNoQueryFormBack(null,"No data to display");
	}else{
		return;
	}
}

//当加载数据成功后后台返回有数据时的实现方法,默认选中生成图表
function onLoadRowsAll(tableId){
	var htmlStr = "";
	//返回当前页的所有行,在进行判断,有数据行生成图表，没有返回null,没有图表
	var cellRows = $('#'+tableId).datagrid('getRows');
		if(cellRows){
				//根据传入的tableId进行区分模块
				//按批架次汇总
				if("batchNoQueryTableByPage" == tableId){
						  for(var i = 0;i <= cellRows.length;i++){
						  var cellRow = cellRows[i];
						  //判断获得数据行有没有重复的数据，便于页面进行准确显示数据信息
						  if(cellRow){
							 //创健图表需要的属性
							  htmlStr += "<set label='"+cellRow.batchNoName+"' value='"+cellRow.batchNoNum+"'/>";
						  }
					 }
						//进行方法回调创健图表信息
						getBatchNoQueryFormBack(htmlStr);
				//按ATA章节汇总
				} else if("chaperNoQueryTableByPage" == tableId){
					for(var i = 0;i <= cellRows.length;i++){
						var cellRow = cellRows[i];
						 //判断获得数据行有没有重复的数据，便于页面进行准确显示数据信息
						  if(cellRow){
							  //创健图表需要的属性chaperNoName
							  htmlStr += "<set label='"+cellRow.ataNoName+"' value='"+cellRow.chaperNoNum+"'/>" ;
						  }
					}
					//进行方法回调创健图表信息
					getChaperNoQueryFormBack(htmlStr);
				}else{
				//如果传入的参数不匹配返回null,没有图表生成
					onUncheckAllRows(tableId);
				}
		//如果当前页面没有数据返回null,没有图表生成
		}else{
			onUncheckAllRows(tableId);
		}
	}

//按分页汇总带有查询条件方法
function ByPageSearchData(tab,tableId){
	 initView(tab,tableId);
	} 
//按分页汇总清空查询条件方法
function  ByPageClearData(tab,tableId){
		$("#"+tab+"Form input").val('');
		initView(tab,tableId);
	}

//批架次
	function getBatchNoQueryFormBack(htmlStr){
		var chart = new FusionCharts("static/js/platform/component/fusionchar/js/Pie3D.swf", "ChartId", "100%", "400", "0", "0");
		var strXML  = "<chart palette='3' caption='按故障发生次数统计查询' xAxisName='注: 单元模块:问题性质   百分比：发生次数' yAxisName='' baseFont='微软雅黑'  showValues='0' decimals='1' formatNumberScale='1' showPercentInToolTip='0'>";
		if(htmlStr){
			strXML += htmlStr;
		}
		strXML += "</chart>";
		chart.setDataXML(strXML);
		chart.render("batchNoQuery");	
}
</script>
	<!--按批架次查询按钮操作(扇形图)  -->
		<div id="BatchNoQueryForm" class="datagrid-toolbar" style="height: auto;display: block;">
			<fieldset>
					<table class="tableForm" border="0">
						<tr>
						   	<td style="padding-left: 200px;">发生时间:</td>
		    					<td>
		    						<input class="easyui-datebox"  style="width:130px;" type="text" id="BatchNoQuerySeachForm_beginDate" name="beginDate" data-options="editable:false"/>
		    						&nbsp;到&nbsp;
		    						<input class="easyui-datebox"  style="width:130px;" type="text" id="BatchNoQuerySeachForm_endDate" name="endDate" data-options="editable:false"/>
		    					</td>
							<td style="padding-left: 50px">
								<a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="ByPageSearchData('BatchNoQuery','batchNoQueryTableByPage');" href="javascript:void(0);">查询</a>
				    			&nbsp;&nbsp;
				    			<a class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="ByPageClearData('BatchNoQuery','batchNoQueryTableByPage');" href="javascript:void(0);">清空</a>
							</td> 
						</tr>
					</table>
			</fieldset> 
		</div>   
		<div id="batchNoQueryTable"  style="float:left;padding-left:40px;padding-top: 10px;height:400px;width:420px">
		<!-- 这里是js动态生成table布局显示 -->
			<table id="batchNoQueryTableByPage" style="width:510px;" align="center" border="1" bordercolor="#E3EEFD">
				<thead>
					<tr>
						<!-- <th data-options="field:'id', align:'center',checkbox:true" width="220">ID</th> -->
						<th data-options="field:'batchNoName', align:'center'" width="50">批架次</th>
						<th data-options="field:'batchNoNum', align:'center'" width="50">故障次数</th>
					</tr>
				</thead>
			</table>
		</div>
		<div style="width:500px;height:300px;float:left;padding-left: 40px;padding-top: 10px;">
			<div id="batchNoQuery"></div>
		</div>
</body>
</html>