<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/fault/csmpfmfaultreport/CsmpFmFaultreportController/CsmpFmFaultStatisticsCustomerDoorInfo" -->
<title>客户名称统计明细</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/fusionchar/js/FusionCharts.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {		
		ajaxRequest("POST", null, "${url}getCustomerQueryFormDoor", "json", "getCustomerQueryFormBack");
	});
	//客户名称
	function getCustomerQueryFormBack(json) {		
		var chart = new FusionCharts(
				"static/js/platform/component/fusionchar/js/Column3D.swf",
				"ChartId", "100%", "100%", "0", "0");
		var strXML = "<chart palette='3' caption='按故障发生次数统计' xAxisName='客户名称' yAxisName='故障次数' baseFont='微软雅黑'  showValues='1' decimals='1' formatNumberScale='1'>";
		for ( var i = 0; i < json.length; i++) {
			strXML += "	<set label='"+json[i].cusName+"' value='"+json[i].customerNum+"'/>";
		}
		strXML += "</chart>";
		chart.setDataXML(strXML);
		chart.render("customerQuery");	
	}
</script>
	<div id="customerQuery" style="background:#fff;height:260px;margin:10px"></div>
</body>
</html>