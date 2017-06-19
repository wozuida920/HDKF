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
<!-- ControllerPath = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfSupportRequestInfoDTO.id}'/>
				 <table class="form_commonTable">
				<tr>
																																<th width="10%">
															求援方式:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="requestMethod" lookupCode="SUPPORT_REQUEST_TYPE" defaultValue='${hdkfSupportRequestInfoDTO.requestMethod}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
																										<th width="10%">
															信息处理卡编号:</th>
				    <td width="40%">
																		<input title="信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestNo" id="requestNo" value='<c:out value='${hdkfSupportRequestInfoDTO.requestNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															故障标题:</th>
				    <td width="40%">
																		<input title="故障标题" class="inputbox easyui-validatebox" data-options="validType:'maxLength[200]'" style="width: 180px;" type="text" name="requestName" id="requestName" value='<c:out value='${hdkfSupportRequestInfoDTO.requestName}'/>'/>
																</td>
																										<th width="10%">
															求援单位:</th>
				    <td width="40%">
																		<input title="求援单位" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestUnit" id="requestUnit" value='<c:out value='${hdkfSupportRequestInfoDTO.requestUnit}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															求援单位联系人:</th>
				    <td width="40%">
																		<input title="求援单位联系人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[20]'" style="width: 180px;" type="text" name="linkMan" id="linkMan" value='<c:out value='${hdkfSupportRequestInfoDTO.linkMan}'/>'/>
																</td>
																										<th width="10%">
															求援单位联系电话:</th>
				    <td width="40%">
																		<input title="求援单位联系电话" class="inputbox easyui-validatebox" data-options="validType:'maxLength[20]'" style="width: 180px;" type="text" name="linkPhone" id="linkPhone" value='<c:out value='${hdkfSupportRequestInfoDTO.linkPhone}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															求援单位传真:</th>
				    <td width="40%">
																		<input title="求援单位传真" class="inputbox easyui-validatebox" data-options="validType:'maxLength[20]'" style="width: 180px;" type="text" name="fax" id="fax" value='<c:out value='${hdkfSupportRequestInfoDTO.fax}'/>'/>
																</td>
																										<th width="10%">
															求援时间:</th>
				    <td width="40%">
																  		<input title="求援时间" class="easyui-datebox"  style="width: 182px;" type="text" name="requestDate" id="requestDate" value='${hdkfSupportRequestInfoDTO.requestDate}'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															批架次:</th>
				    <td width="40%">
																		<input title="批架次" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="batchNo" id="batchNo" value='<c:out value='${hdkfSupportRequestInfoDTO.batchNo}'/>'/>
																</td>
																										<th width="10%">
															机型:</th>
				    <td width="40%">
																		<input title="机型" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="modelId" id="modelId" value='<c:out value='${hdkfSupportRequestInfoDTO.modelId}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															产品名称:</th>
				    <td width="40%">
																		<input title="产品名称" class="inputbox easyui-validatebox" data-options="validType:'maxLength[200]'" style="width: 180px;" type="text" name="productName" id="productName" value='<c:out value='${hdkfSupportRequestInfoDTO.productName}'/>'/>
																</td>
																										<th width="10%">
															型号图号:</th>
				    <td width="40%">
																		<input title="型号图号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="figureNo" id="figureNo" value='<c:out value='${hdkfSupportRequestInfoDTO.figureNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															件号:</th>
				    <td width="40%">
																		<input title="件号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="partNo" id="partNo" value='<c:out value='${hdkfSupportRequestInfoDTO.partNo}'/>'/>
																</td>
																										<th width="10%">
															生产单位:</th>
				    <td width="40%">
																		<input title="生产单位" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="productionUnit" id="productionUnit" value='<c:out value='${hdkfSupportRequestInfoDTO.productionUnit}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															飞行小时:</th>
				    <td width="40%">
																  		<input title="飞行小时" class="easyui-numberbox easyui-validatebox" data-options="validType:'maxLength[22]'" style="width: 180px;" type="text" name="flightHours" id="flightHours" value='${hdkfSupportRequestInfoDTO.flightHours}'/>	
																</td>
																										<th width="10%">
															飞机起落:</th>
				    <td width="40%">
																  		<input title="飞机起落" class="easyui-numberbox easyui-validatebox" data-options="validType:'maxLength[22]'" style="width: 180px;" type="text" name="flightLanding" id="flightLanding" value='${hdkfSupportRequestInfoDTO.flightLanding}'/>	
																</td>
											</tr>
						<tr>
																										<th width="10%">
															何时大修:</th>
				    <td width="40%">
																  		<input title="何时大修" class="easyui-datebox"  style="width: 182px;" type="text" name="repairTime" id="repairTime" value='${hdkfSupportRequestInfoDTO.repairTime}'/>
																</td>
																										<th width="10%">
															发生日期:</th>
				    <td width="40%">
																  		<input title="发生日期" class="easyui-datebox"  style="width: 182px;" type="text" name="occurrenceDate" id="occurrenceDate" value='${hdkfSupportRequestInfoDTO.occurrenceDate}'/>
																</td>
											</tr>
						<tr><%-- 
																										<th width="10%">
															发现时机:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="occurrenceTiming" lookupCode="CSMP_FM_FAULTHAPPENMONMENT" defaultValue='${hdkfSupportRequestInfoDTO.occurrenceTiming}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td> --%>
																										<th width="10%">
															ATA章节:</th>
				    <td width="40%">
																		<input title="ATA章节" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="chaperNo" id="chaperNo" value='<c:out value='${hdkfSupportRequestInfoDTO.chaperNo}'/>'/>
																</td>
<!-- 											</tr>
						<tr> -->
																										<th width="10%">
															求援信息:</th>
				    <td width="40%">
																		<input title="求援信息" class="inputbox easyui-validatebox" data-options="validType:'maxLength[1024]'" style="width: 180px;" type="text" name="faultDesc" id="faultDesc" value='<c:out value='${hdkfSupportRequestInfoDTO.faultDesc}'/>'/>
																</td>
																											</tr>
						<tr>
																										<th width="10%">
															分发类型:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="distributionType" lookupCode="SUPPORT_DISTRIB_TYPE" defaultValue='${hdkfSupportRequestInfoDTO.distributionType}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
											<!-- </tr>
						<tr> -->
																										<th width="10%">
															技术员ID:</th>
				    <td width="40%">
																		<input title="技术员ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestManagerId" id="requestManagerId" value='<c:out value='${hdkfSupportRequestInfoDTO.requestManagerId}'/>'/>
																</td>
																											</tr>
						<tr>
																										<th width="10%">
															技术员姓名:</th>
				    <td width="40%">
																		<input title="技术员姓名" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestManagerName" id="requestManagerName" value='<c:out value='${hdkfSupportRequestInfoDTO.requestManagerName}'/>'/>
																</td>
											<!-- </tr>
						<tr> -->
																										<th width="10%">
															信息类别:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="infoType" lookupCode="CSMP_ES_INFO_TYPE" defaultValue='${hdkfSupportRequestInfoDTO.infoType}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
																					</tr>
						<tr>
																										<th width="10%">
															故障类型:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="faultType" lookupCode="CSMP_ETS_FIGURETYPE" defaultValue='${hdkfSupportRequestInfoDTO.faultType}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
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
																																																			if(!"${hdkfSupportRequestInfoDTO.requestDate}"==""){
					$('#requestDate').datebox('setValue', parserColumnTime("${hdkfSupportRequestInfoDTO.requestDate}").format("yyyy-MM-dd"));
				}
																																																				if(!"${hdkfSupportRequestInfoDTO.repairTime}"==""){
					$('#repairTime').datebox('setValue', parserColumnTime("${hdkfSupportRequestInfoDTO.repairTime}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfSupportRequestInfoDTO.occurrenceDate}"==""){
					$('#occurrenceDate').datebox('setValue', parserColumnTime("${hdkfSupportRequestInfoDTO.occurrenceDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																										})
	function closeForm(){
		parent.hdkfSupportRequestInfo.closeDialog("#edit");
	}
	function saveForm(){
	   if ($('#form').form('validate') == false) {
                return;
            }
		parent.hdkfSupportRequestInfo.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>