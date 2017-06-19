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
<!-- ControllerPath = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/Detail/id" -->
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
			<input type="hidden" name="id"
				value='${hdkfSupportFaultDetailDTO.id}' /> <input type="hidden"
				name="id" value='${hdkfSupportFaultDetailDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%">批架次:</th>
					<td width="40%"><input title="批架次" class="inputbox  easyui-validatebox" style="width: 180px;"
						type="text" name="batchNo" id="batchNo" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.batchNo}' /></td>
					<th width="10%">机型:</th>
					<td width="40%"><input title="机型" class="inputbox  easyui-validatebox" style="width: 180px;"
						type="text" name="modelId" id="modelId" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.modelId}' /></td>
				</tr>
				<tr>
				<th align="right"><label>发现时机</label></th>
					<td style="padding-left: 3px"><pt6:syslookup
					name="attribute01" lookupCode="CSMP_FM_FAULTHAPPENMONMENT"
					dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
				</pt6:syslookup></td>
				<th align="right"><label>是否故障</label></th>	
					<td style="padding-left: 3px"><pt6:syslookup 
					name="attribute02" lookupCode="PLATFORM_YES_NO_FLAG"
					dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
				</pt6:syslookup></td>							
				</tr>
				<tr>
					<th width="10%">飞行小时:</th>
					<td width="40%"><input title="飞行小时" class="easyui-numberbox"
						style="width: 180px;" type="text" name="flightHours"
						id="flightHours" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.flightHours}' /></td>
					<th width="10%">飞机起落:</th>
					<td width="40%"><input title="飞机起落" class="easyui-numberbox"
						style="width: 180px;" type="text" name="flightLanding"
						id="flightLanding" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.flightLanding}' /></td>
				</tr>
				<tr>
<%--  					<th width="10%">求援时间:</th>
					<td width="40%"><input title="求援时间" class="easyui-datebox"
						style="width: 180px;" type="text" name="requestDate"
						id="requestDate" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.requestDate}' /></td>
					<th width="10%">发生日期:</th>
					<td width="40%"><input title="发生日期" class="easyui-datebox"
						style="width: 180px;" type="text" name="occurrenceDate"
						id="occurrenceDate" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.occurrenceDate}' /></td> --%>
				    <th align="right"><label>求援日期</label></th>
						<td><input title="求援日期" class="easyui-datebox"
							style="width: 180px;" type="text" name="requestDate"
							id="requestDate" disabled /></td>
					 <th align="right"><label>发生日期</label></th>
						<td><input title="发生日期" class="easyui-datebox"
							style="width: 180px;" type="text" name="occurrenceDate"
							id="occurrenceDate" disabled /></td>
				</tr>
				<!-- 				<tr> -->
				<!-- 					<th width="10%">故障描述:</th> -->
				<!-- 					<td><input title="故障描述" class="inputbox" style="width: 180px;" -->
				<!-- 						type="text" name="faultDesc" id="faultDesc" readonly="readonly" -->
				<%-- 						value='${hdkfSupportFaultDetailDTO.faultDesc}' /></td> --%>
				<!-- 					<th width="10%">处理结论:</th> -->
				<!-- 					<td><input title="处理结论" class="inputbox" style="width: 180px;" -->
				<!-- 						type="text" name="dealSolution" id="dealSolution" -->
				<!-- 						readonly="readonly" -->
				<%-- 						value='${hdkfSupportFaultDetailDTO.dealSolution}' /></td> --%>
				<!-- 				</tr> -->
<%-- 				<tr>

					<th width="10%">信息卡编号:</th>
					<td width="40%"><input title="求援请求ID" class="inputbox"
						style="width: 180px;" type="hidden" name="requestId"
						id="requestId" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.requestId}' /> <input
						title="信息卡编号" class="inputbox  easyui-validatebox" style="width: 180px;" type="text"
						name="requestNo" id="requestNo" readonly="readonly"
						value='${hdkfSupportFaultDetailDTO.requestNo}' /></td> --%>
				</tr>
				<tr>
					<th width="10%"><label>求援信息</label></th>

					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="5"
							data-options="required:true,validType:'maxLength[2000]'"
							class="textareabox" name="faultDesc" id="faultDesc"
							style="resize: none" disabled></textarea></td>
				</tr>
				<tr>
				<th width="10%"><label>处理结论</label></th>

					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="5"
							data-options="required:true,validType:'maxLength[2000]'"
							class="textareabox" name="dealSolution" id="dealSolution"
							style="resize: none" disabled></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			if (!"${hdkfSupportFaultDetailDTO.requestDate}" == "") {
				$('#requestDate').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportFaultDetailDTO.requestDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfSupportFaultDetailDTO.occurrenceDate}" == "") {
				$('#occurrenceDate').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportFaultDetailDTO.occurrenceDate}")
								.format("yyyy-MM-dd"));
			}
			$("#faultDesc").val("${hdkfSupportFaultDetailDTO.faultDesc}");
			$("#dealSolution").val("${hdkfSupportFaultDetailDTO.dealSolution}");
		});
	</script>
</body>
</html>