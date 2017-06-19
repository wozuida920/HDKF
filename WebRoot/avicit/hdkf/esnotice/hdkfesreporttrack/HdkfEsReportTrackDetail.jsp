<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false"
		style="overflow: hidden; padding-bottom: 35px;">
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfEsReportTrackDTO.id}' />
			<input type="hidden" name="id" value='${hdkfEsReportTrackDTO.id}' />
			<table width="100%" style="padding-top: 10px;">
				<tr>
					<!-- <th align="right"><span style="color: red;">*</span> 技术通报编号:</th> -->
					
					<th align="right">通告编号:</th>
					<td><input title="通告编号" class="inputbox" style="width: 180px;"
						type="text" name="bulletinNo" id="bulletinNo" readonly="readonly"
						value='${hdkfEsReportTrackDTO.bulletinNo}' />
						<input title="技术通报编号" class="easyui-validatebox"
						data-options="required:true" style="width: 180px;" type="hidden"
						name="techinalBulletinId" id="techinalBulletinId"
						readonly="readonly"
						value='${hdkfEsReportTrackDTO.techinalBulletinId}' /></td>
				</tr>
				<tr>
					<th align="right">日期:</th>
					<td><input title="日期" class="easyui-datebox"
						style="width: 180px;" type="text" name="trackDate" id="trackDate"
						readonly="readonly" value='${hdkfEsReportTrackDTO.trackDate}' /></td>
					<th align="right">当前处理人:</th>
					<td><input title="当前处理人" class="inputbox"
						style="width: 180px;" type="text" name="people" id="people"
						readonly="readonly" value='${hdkfEsReportTrackDTO.people}' /></td>
				</tr>
				<tr>
					<th align="right">跟踪情况:</th>
					<td><input title="跟踪情况" class="inputbox" style="width: 180px;"
						type="text" name="remark" id="remark" readonly="readonly"
						value='${hdkfEsReportTrackDTO.remark}' /></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			if (!"${hdkfEsReportTrackDTO.trackDate}" == "") {
				$('#trackDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsReportTrackDTO.trackDate}")
								.format("yyyy-MM-dd"));
			}
		});
	</script>
</body>
</html>