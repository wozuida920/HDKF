<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
															<input type="hidden" name="id" value='${hdkfSupportProcessViewDTO.id}'/>
																																																																																																																																																																																																																																																																																																										 <table class="form_commonTable">
					<tr>
																																																														<th width="10%">
																								求援请求ID:</th>
								<td width="40%">
																											<input title="求援请求ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestId" id="requestId" value='<c:out value='${hdkfSupportProcessViewDTO.requestId}'/>'/>
																									</td>
																																															<th width="10%">
																								信息处理卡编号:</th>
								<td width="40%">
																											<input title="信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestNo" id="requestNo" value='<c:out value='${hdkfSupportProcessViewDTO.requestNo}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								当前所处状态:</th>
								<td width="40%">
								                                     <pt6:syslookup name="curStatus" lookupCode="SUPPORT_PROCESS_STATUS" defaultValue='${hdkfSupportProcessViewDTO.curStatus}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
																</td>
																																															<th width="10%">
																								当前步骤:</th>
								<td width="40%">
																											<input title="当前步骤" class="inputbox easyui-validatebox" data-options="validType:'maxLength[200]'" style="width: 180px;" type="text" name="curBpmstate" id="curBpmstate" value='<c:out value='${hdkfSupportProcessViewDTO.curBpmstate}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								当前处理人:</th>
								<td width="40%">
																	 <input title="{param.field.comment}" class="inputbox"  style="width: 182px;" type="hidden" name="curUser" id="curUser" value='${hdkfSupportProcessViewDTO.curUser}'/>
						 			 <div class=""><input class="easyui-validatebox"  name="curUserAlias"   id="curUserAlias"  readOnly="readOnly" value='<c:out  value='${hdkfSupportProcessViewDTO.curUserAlias}'/>' style="width:179px;" ></input></div>
																</td>
																																															<th width="10%">
																								求援单位:</th>
								<td width="40%">
																											<input title="求援单位" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestUnit" id="requestUnit" value='<c:out value='${hdkfSupportProcessViewDTO.requestUnit}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								批架次:</th>
								<td width="40%">
																											<input title="批架次" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="batchNo" id="batchNo" value='<c:out value='${hdkfSupportProcessViewDTO.batchNo}'/>'/>
																									</td>
																																															<th width="10%">
																								机型:</th>
								<td width="40%">
																											<input title="机型" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="modelId" id="modelId" value='<c:out value='${hdkfSupportProcessViewDTO.modelId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								求援时间:</th>
								<td width="40%">
																									  		<input title="求援时间" class="easyui-datebox"  style="width: 182px;" type="text" name="requestDate" id="requestDate" value='${hdkfSupportProcessViewDTO.requestDate}'/>
																									</td>
																																															<th width="10%">
																								处理ID:</th>
								<td width="40%">
																											<input title="处理ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="dealId" id="dealId" value='<c:out value='${hdkfSupportProcessViewDTO.dealId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								处理单:</th>
								<td width="40%">
																											<input title="处理单" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="dealName" id="dealName" value='<c:out value='${hdkfSupportProcessViewDTO.dealName}'/>'/>
																									</td>
																																															<th width="10%">
																								答复文号:</th>
								<td width="40%">
																											<input title="答复文号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="respId" id="respId" value='<c:out value='${hdkfSupportProcessViewDTO.respId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								答复文号:</th>
								<td width="40%">
																											<input title="答复文号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="respNo" id="respNo" value='<c:out value='${hdkfSupportProcessViewDTO.respNo}'/>'/>
																									</td>
																																															<th width="10%">
																								任务书ID:</th>
								<td width="40%">
																											<input title="任务书ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="taskId" id="taskId" value='<c:out value='${hdkfSupportProcessViewDTO.taskId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								任务书编号:</th>
								<td width="40%">
																											<input title="任务书编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[30]'" style="width: 180px;" type="text" name="taskNo" id="taskNo" value='<c:out value='${hdkfSupportProcessViewDTO.taskNo}'/>'/>
																									</td>
																																															<th width="10%">
																								借人通知单ID:</th>
								<td width="40%">
																											<input title="借人通知单ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="borrowInfoId" id="borrowInfoId" value='<c:out value='${hdkfSupportProcessViewDTO.borrowInfoId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								信息卡归档ID:</th>
								<td width="40%">
																											<input title="信息卡归档ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="cardArchiveId" id="cardArchiveId" value='<c:out value='${hdkfSupportProcessViewDTO.cardArchiveId}'/>'/>
																									</td>
																																															<th width="10%">
																								任务书归档ID:</th>
								<td width="40%">
																											<input title="任务书归档ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="taskArchiveId" id="taskArchiveId" value='<c:out value='${hdkfSupportProcessViewDTO.taskArchiveId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								是否发外场信息卡:</th>
								<td width="40%">
								                                     <pt6:syslookup name="hasOutfiedcard" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportProcessViewDTO.hasOutfiedcard}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
																</td>
																																															<th width="10%">
																								是否发公用笺:</th>
								<td width="40%">
								                                     <pt6:syslookup name="hasOapublishsheet" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportProcessViewDTO.hasOapublishsheet}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
																</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								是否发传真:</th>
								<td width="40%">
								                                     <pt6:syslookup name="hasFax" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportProcessViewDTO.hasFax}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
																</td>
																																																																																																																																																																																																																																																											</tr>
					</table>
					</form>
	 <div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>	
					<td width="50%" align="right">
						<a title="保存" id="saveButton" class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a>
						<a title="返回" id="returnButton" class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a>
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
																																																								if(!"${hdkfSupportProcessViewDTO.requestDate}"==""){
					$('#requestDate').datebox('setValue', parserColumnTime("${hdkfSupportProcessViewDTO.requestDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																			var curUserUserCommonSelector = new CommonSelector("user","userSelectCommonDialog","curUser","curUserAlias");
					curUserUserCommonSelector.init(); 
																																																																																																																																																																																																																																																																																																																																																																														})
	function closeForm(){
		parent.hdkfSupportProcessView.closeDialog("#edit");
	}
	function saveForm(){
	    if ($('#form').form('validate') == false) {
            return;
        }
		parent.hdkfSupportProcessView.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>