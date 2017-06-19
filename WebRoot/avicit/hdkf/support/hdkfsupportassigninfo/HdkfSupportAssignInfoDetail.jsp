<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportassigninfo/HdkfSupportAssignInfoController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false" style="overflow:hidden;padding-bottom:35px;">
		<form id='form'>
									<input type="hidden" name="id" value='${hdkfSupportAssignInfoDTO.id}'/>
												<input type="hidden" name="id" value='${hdkfSupportAssignInfoDTO.id}'/>
																																																																																																																																																													<table width="100%" style="padding-top: 10px;">
		<tr>
																																<th align="right">
															委托人ID:</th>
					<td>
																		<input title="委托人ID" class="inputbox" style="width: 180px;" type="text" name="assignUserId" id="assignUserId" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignUserId}'/>
																</td>
																										<th align="right">
															委托人:</th>
					<td>
																		<input title="委托人" class="inputbox" style="width: 180px;" type="text" name="assignUserName" id="assignUserName" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignUserName}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															受托人ID:</th>
					<td>
																		<input title="受托人ID" class="inputbox" style="width: 180px;" type="text" name="assignedUserId" id="assignedUserId" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignedUserId}'/>
																</td>
																										<th align="right">
															受托人:</th>
					<td>
																		<input title="受托人" class="inputbox" style="width: 180px;" type="text" name="assignedUserName" id="assignedUserName" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignedUserName}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															委托开始日期:</th>
					<td>
																  		<input title="委托开始日期" class="easyui-datebox" style="width: 180px;" type="text" name="assignStartDate" id="assignStartDate" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignStartDate}'/>
																</td>
																										<th align="right">
															委托结束日期:</th>
					<td>
																  		<input title="委托结束日期" class="easyui-datebox" style="width: 180px;" type="text" name="assignEndDate" id="assignEndDate" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignEndDate}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															委托理由:</th>
					<td>
																		<input title="委托理由" class="inputbox" style="width: 180px;" type="text" name="assignReason" id="assignReason" readonly="readonly" value='${hdkfSupportAssignInfoDTO.assignReason}'/>
																</td>
																										<th align="right">
															是否中止委托:</th>
					<td>
																		<input title="是否中止委托" class="inputbox" style="width: 180px;" type="text" name="suspendFlag" id="suspendFlag" readonly="readonly" value='${hdkfSupportAssignInfoDTO.suspendFlag}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															中止委托理由:</th>
					<td>
																		<input title="中止委托理由" class="inputbox" style="width: 180px;" type="text" name="suspendReason" id="suspendReason" readonly="readonly" value='${hdkfSupportAssignInfoDTO.suspendReason}'/>
																</td>
																										<th align="right">
															中止委托日期:</th>
					<td>
																  		<input title="中止委托日期" class="easyui-datebox" style="width: 180px;" type="text" name="suspendDate" id="suspendDate" readonly="readonly" value='${hdkfSupportAssignInfoDTO.suspendDate}'/>
																</td>
											</tr>
						<tr>
																																																																																																																				</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
																																				if(!"${hdkfSupportAssignInfoDTO.assignStartDate}"==""){
					$('#assignStartDate').datebox('setValue', parserColumnTime("${hdkfSupportAssignInfoDTO.assignStartDate}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfSupportAssignInfoDTO.assignEndDate}"==""){
					$('#assignEndDate').datebox('setValue', parserColumnTime("${hdkfSupportAssignInfoDTO.assignEndDate}").format("yyyy-MM-dd"));
				}
																											if(!"${hdkfSupportAssignInfoDTO.suspendDate}"==""){
					$('#suspendDate').datebox('setValue', parserColumnTime("${hdkfSupportAssignInfoDTO.suspendDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																																});
	</script>
</body>
</html>