<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfSupportTripTaskDTO.id}'/>
				 <table class="form_commonTable">
				<tr>
																																<th width="10%">
															请求处理ID:</th>
				    <td width="40%">
																		<input title="请求处理ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="kfDealId" id="kfDealId" value='<c:out value='${hdkfSupportTripTaskDTO.kfDealId}'/>'/>
																</td>
																										<th width="10%">
															任务书编号:</th>
				    <td width="40%">
																		<input title="任务书编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[30]'" style="width: 180px;" type="text" name="taskNo" id="taskNo" value='<c:out value='${hdkfSupportTripTaskDTO.taskNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															任务书名称:</th>
				    <td width="40%">
																		<input title="任务书名称" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="taskName" id="taskName" value='<c:out value='${hdkfSupportTripTaskDTO.taskName}'/>'/>
																</td>
																										<th width="10%">
															是否需要器材:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="isNeedEquipment" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportTripTaskDTO.isNeedEquipment}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
											</tr>
						<tr>
																										<th width="10%">
															需要的器材:</th>
				    <td width="40%">
																		<input title="需要的器材" class="inputbox easyui-validatebox" data-options="validType:'maxLength[4000]'" style="width: 180px;" type="text" name="needEquipment" id="needEquipment" value='<c:out value='${hdkfSupportTripTaskDTO.needEquipment}'/>'/>
																</td>
																										<th width="10%">
															是否派人:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="isBorrowSomeone" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportTripTaskDTO.isBorrowSomeone}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
											</tr>
						<tr>
																										<th width="10%">
															填写人ID:</th>
				    <td width="40%">
																		<input title="填写人ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="writeManId" id="writeManId" value='<c:out value='${hdkfSupportTripTaskDTO.writeManId}'/>'/>
																</td>
																										<th width="10%">
															填写人姓名:</th>
				    <td width="40%">
																		<input title="填写人姓名" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="writeManName" id="writeManName" value='<c:out value='${hdkfSupportTripTaskDTO.writeManName}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															任务内容与要求:</th>
				    <td width="40%">
																		<input title="任务内容与要求" class="inputbox easyui-validatebox" data-options="validType:'maxLength[2000]'" style="width: 180px;" type="text" name="contentDemand" id="contentDemand" value='<c:out value='${hdkfSupportTripTaskDTO.contentDemand}'/>'/>
																</td>
																										<th width="10%">
															费用编号:</th>
				    <td width="40%">
																		<input title="费用编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="feeNo" id="feeNo" value='<c:out value='${hdkfSupportTripTaskDTO.feeNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															排故所去部队:</th>
				    <td width="40%">
																		<input title="排故所去部队" class="inputbox easyui-validatebox" data-options="validType:'maxLength[80]'" style="width: 180px;" type="text" name="toArmyName" id="toArmyName" value='<c:out value='${hdkfSupportTripTaskDTO.toArmyName}'/>'/>
																</td>
																										<th width="10%">
															执行者:</th>
				    <td width="40%">
																		<input title="执行者" class="inputbox easyui-validatebox" data-options="validType:'maxLength[300]'" style="width: 180px;" type="text" name="executors" id="executors" value='<c:out value='${hdkfSupportTripTaskDTO.executors}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															总任务完成时间:</th>
				    <td width="40%">
																  		<input title="总任务完成时间" class="easyui-numberbox easyui-validatebox" data-options="validType:'maxLength[22]'" style="width: 180px;" type="text" name="totalHours" id="totalHours" value='${hdkfSupportTripTaskDTO.totalHours}'/>	
																</td>
																										<th width="10%">
															任务实际开始时间:</th>
				    <td width="40%">
																  		<input title="任务实际开始时间" class="easyui-datebox"  style="width: 182px;" type="text" name="startDate" id="startDate" value='${hdkfSupportTripTaskDTO.startDate}'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															任务实际完成时间:</th>
				    <td width="40%">
																  		<input title="任务实际完成时间" class="easyui-datebox"  style="width: 182px;" type="text" name="endDate" id="endDate" value='${hdkfSupportTripTaskDTO.endDate}'/>
																</td>
																										<th width="10%">
															任务完成详细说明:</th>
				    <td width="40%">
																		<input title="任务完成详细说明" class="inputbox easyui-validatebox" data-options="validType:'maxLength[4000]'" style="width: 180px;" type="text" name="taskDetails" id="taskDetails" value='<c:out value='${hdkfSupportTripTaskDTO.taskDetails}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															部队领导意见及要求:</th>
				    <td width="40%">
																		<input title="部队领导意见及要求" class="inputbox easyui-validatebox" data-options="validType:'maxLength[4000]'" style="width: 180px;" type="text" name="suggestionDemand" id="suggestionDemand" value='<c:out value='${hdkfSupportTripTaskDTO.suggestionDemand}'/>'/>
																</td>
																										<th width="10%">
															任务评价:</th>
				    <td width="40%">
																		<input title="任务评价" class="inputbox easyui-validatebox" data-options="validType:'maxLength[1000]'" style="width: 180px;" type="text" name="evaluate" id="evaluate" value='<c:out value='${hdkfSupportTripTaskDTO.evaluate}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															部队技术室主任:</th>
				    <td width="40%">
																		<input title="部队技术室主任" class="inputbox easyui-validatebox" data-options="validType:'maxLength[20]'" style="width: 180px;" type="text" name="director" id="director" value='<c:out value='${hdkfSupportTripTaskDTO.director}'/>'/>
																</td>
																										<th width="10%">
															部队技术室部长:</th>
				    <td width="40%">
																		<input title="部队技术室部长" class="inputbox easyui-validatebox" data-options="validType:'maxLength[20]'" style="width: 180px;" type="text" name="head" id="head" value='<c:out value='${hdkfSupportTripTaskDTO.head}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															通知客户时间:</th>
				    <td width="40%">
																  		<input title="通知客户时间" class="easyui-datebox"  style="width: 182px;" type="text" name="noticeTime" id="noticeTime" value='${hdkfSupportTripTaskDTO.noticeTime}'/>
																</td>
																										<th width="10%">
															赴外场出发时间:</th>
				    <td width="40%">
																  		<input title="赴外场出发时间" class="easyui-datebox"  style="width: 182px;" type="text" name="tripStartTime" id="tripStartTime" value='${hdkfSupportTripTaskDTO.tripStartTime}'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
											<span style="color:red;">*</span>
										求援请求ID:</th>
				    <td width="40%">
																		<input title="求援请求ID" class="easyui-validatebox" data-options="required:true,validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestId" id="requestId" value='<c:out value='${hdkfSupportTripTaskDTO.requestId}'/>'/>
							                                                                                                                                                                                             
																</td>
																										<th width="10%">
															信息处理卡编号:</th>
				    <td width="40%">
																		<input title="信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestNo" id="requestNo" value='<c:out value='${hdkfSupportTripTaskDTO.requestNo}'/>'/>
																</td>
											</tr>
						<tr>
																																																																																																																				</tr>
		</table>
		</form>
		 <div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>	
					<td width="60%" align="right">
					<a title="保存" id="saveButton"  class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a>
					<a title="返回" id="returnButton"  class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a>
					</td>		
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	     $.extend($.fn.validatebox.defaults.rules, {    
        maxLength: {    
            validator: function(value, param){    
                return param[0] >= value.length;
                
            },    
            message: '请输入最多 {0} 字符.'   
        }    
    });  
	$(function(){
																																																																																	if(!"${hdkfSupportTripTaskDTO.startDate}"==""){
					$('#startDate').datebox('setValue', parserColumnTime("${hdkfSupportTripTaskDTO.startDate}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfSupportTripTaskDTO.endDate}"==""){
					$('#endDate').datebox('setValue', parserColumnTime("${hdkfSupportTripTaskDTO.endDate}").format("yyyy-MM-dd"));
				}
																																					if(!"${hdkfSupportTripTaskDTO.noticeTime}"==""){
					$('#noticeTime').datebox('setValue', parserColumnTime("${hdkfSupportTripTaskDTO.noticeTime}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfSupportTripTaskDTO.tripStartTime}"==""){
					$('#tripStartTime').datebox('setValue', parserColumnTime("${hdkfSupportTripTaskDTO.tripStartTime}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												})
	function closeForm(){
		parent.hdkfSupportTripTask.closeDialog("#edit");
	}
	function saveForm(){
	   if ($('#form').form('validate') == false) {
                return;
            }
		parent.hdkfSupportTripTask.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>