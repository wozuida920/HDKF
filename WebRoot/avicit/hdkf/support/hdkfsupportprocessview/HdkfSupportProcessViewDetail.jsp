<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false" style="overflow:hidden;padding-bottom:35px;">
		<form id='form'>
									<input type="hidden" name="id" value='${hdkfSupportProcessViewDTO.id}'/>
												<input type="hidden" name="id" value='${hdkfSupportProcessViewDTO.id}'/>
																																																																																																																																																																																																																				<table width="100%" style="padding-top: 10px;">
		<tr>
																																<th align="right">
															求援请求ID:</th>
					<td>
																		<input title="求援请求ID" class="inputbox" style="width: 180px;" type="text" name="requestId" id="requestId" readonly="readonly" value='${hdkfSupportProcessViewDTO.requestId}'/>
																</td>
																										<th align="right">
															信息处理卡编号:</th>
					<td>
																		<input title="信息处理卡编号" class="inputbox" style="width: 180px;" type="text" name="requestNo" id="requestNo" readonly="readonly" value='${hdkfSupportProcessViewDTO.requestNo}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															当前所处状态:</th>
					<td>
																		<input title="当前所处状态" class="inputbox" style="width: 180px;" type="text" name="curStatus" id="curStatus" readonly="readonly" value='${hdkfSupportProcessViewDTO.curStatus}'/>
																</td>
																										<th align="right">
															当前步骤:</th>
					<td>
																		<input title="当前步骤" class="inputbox" style="width: 180px;" type="text" name="curBpmstate" id="curBpmstate" readonly="readonly" value='${hdkfSupportProcessViewDTO.curBpmstate}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															当前处理人:</th>
					<td>
											<input title="{param.field.comment}" class="inputbox"  style="width: 180px;" type="hidden" name="curUser" id="curUser"/>
						<div class=""><input class="easyui-validatebox"  name="curUserAlias"   id="curUserAlias"  readOnly="readOnly" style="width:179px;" ></input></div>
										</td>
																										<th align="right">
															求援单位:</th>
					<td>
																		<input title="求援单位" class="inputbox" style="width: 180px;" type="text" name="requestUnit" id="requestUnit" readonly="readonly" value='${hdkfSupportProcessViewDTO.requestUnit}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															批架次:</th>
					<td>
																		<input title="批架次" class="inputbox" style="width: 180px;" type="text" name="batchNo" id="batchNo" readonly="readonly" value='${hdkfSupportProcessViewDTO.batchNo}'/>
																</td>
																										<th align="right">
															机型:</th>
					<td>
																		<input title="机型" class="inputbox" style="width: 180px;" type="text" name="modelId" id="modelId" readonly="readonly" value='${hdkfSupportProcessViewDTO.modelId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															求援时间:</th>
					<td>
																  		<input title="求援时间" class="easyui-datebox" style="width: 180px;" type="text" name="requestDate" id="requestDate" readonly="readonly" value='${hdkfSupportProcessViewDTO.requestDate}'/>
																</td>
																										<th align="right">
															处理ID:</th>
					<td>
																		<input title="处理ID" class="inputbox" style="width: 180px;" type="text" name="dealId" id="dealId" readonly="readonly" value='${hdkfSupportProcessViewDTO.dealId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															处理单:</th>
					<td>
																		<input title="处理单" class="inputbox" style="width: 180px;" type="text" name="dealName" id="dealName" readonly="readonly" value='${hdkfSupportProcessViewDTO.dealName}'/>
																</td>
																										<th align="right">
															答复文号:</th>
					<td>
																		<input title="答复文号" class="inputbox" style="width: 180px;" type="text" name="respId" id="respId" readonly="readonly" value='${hdkfSupportProcessViewDTO.respId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															答复文号:</th>
					<td>
																		<input title="答复文号" class="inputbox" style="width: 180px;" type="text" name="respNo" id="respNo" readonly="readonly" value='${hdkfSupportProcessViewDTO.respNo}'/>
																</td>
																										<th align="right">
															任务书ID:</th>
					<td>
																		<input title="任务书ID" class="inputbox" style="width: 180px;" type="text" name="taskId" id="taskId" readonly="readonly" value='${hdkfSupportProcessViewDTO.taskId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															任务书编号:</th>
					<td>
																		<input title="任务书编号" class="inputbox" style="width: 180px;" type="text" name="taskNo" id="taskNo" readonly="readonly" value='${hdkfSupportProcessViewDTO.taskNo}'/>
																</td>
																										<th align="right">
															借人通知单ID:</th>
					<td>
																		<input title="借人通知单ID" class="inputbox" style="width: 180px;" type="text" name="borrowInfoId" id="borrowInfoId" readonly="readonly" value='${hdkfSupportProcessViewDTO.borrowInfoId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															信息卡归档ID:</th>
					<td>
																		<input title="信息卡归档ID" class="inputbox" style="width: 180px;" type="text" name="cardArchiveId" id="cardArchiveId" readonly="readonly" value='${hdkfSupportProcessViewDTO.cardArchiveId}'/>
																</td>
																										<th align="right">
															任务书归档ID:</th>
					<td>
																		<input title="任务书归档ID" class="inputbox" style="width: 180px;" type="text" name="taskArchiveId" id="taskArchiveId" readonly="readonly" value='${hdkfSupportProcessViewDTO.taskArchiveId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															是否发外场信息卡:</th>
					<td>
																		<input title="是否发外场信息卡" class="inputbox" style="width: 180px;" type="text" name="hasOutfiedcard" id="hasOutfiedcard" readonly="readonly" value='${hdkfSupportProcessViewDTO.hasOutfiedcard}'/>
																</td>
																										<th align="right">
															是否发公用笺:</th>
					<td>
																		<input title="是否发公用笺" class="inputbox" style="width: 180px;" type="text" name="hasOapublishsheet" id="hasOapublishsheet" readonly="readonly" value='${hdkfSupportProcessViewDTO.hasOapublishsheet}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															是否发传真:</th>
					<td>
																		<input title="是否发传真" class="inputbox" style="width: 180px;" type="text" name="hasFax" id="hasFax" readonly="readonly" value='${hdkfSupportProcessViewDTO.hasFax}'/>
																</td>
																																																																																																																				</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
																																																								if(!"${hdkfSupportProcessViewDTO.requestDate}"==""){
					$('#requestDate').datebox('setValue', parserColumnTime("${hdkfSupportProcessViewDTO.requestDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																			var curUserUserCommonSelector = new CommonSelector("user","userSelectCommonDialog","curUser","curUserAlias");
					curUserUserCommonSelector.init(); 
																																																																																																																																																																																																																																																																																																																																																																														});
	</script>
</body>
</html>