<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/Detail/id" -->
<title>详细</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var entryId = "<%=entryId%>";
	var executionId = "<%=executionId%>";
	var taskId = "<%=taskId%>";
	var formId = "<%=formId%>";
//	alert("formId--->"+formId);

	$(function() {
		if (!"${hdkfSupportRequestInfoDTO.requestDate}" == "") {
			$('#requestDate')
					.datebox(
							'setValue',
							parserColumnTime(
									"${hdkfSupportRequestInfoDTO.requestDate}")
									.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportRequestInfoDTO.repairTime}" == "") {
			$('#repairTime').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportRequestInfoDTO.repairTime}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportRequestInfoDTO.occurrenceDate}" == "") {
			$('#occurrenceDate').datebox(
					'setValue',
					parserColumnTime(
							"${hdkfSupportRequestInfoDTO.occurrenceDate}")
							.format("yyyy-MM-dd"));
		}
	})

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					dataType : 'json',
					async:false,
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportRequestInfo.requestDate = formatDatebox(result.hdkfSupportRequestInfo.requestDate);
							result.hdkfSupportRequestInfo.repairTime = formatDatebox(result.hdkfSupportRequestInfo.repairTime);
							result.hdkfSupportRequestInfo.occurrenceDate = formatDatebox(result.hdkfSupportRequestInfo.occurrenceDate);
							$("#formDetail").form('load',
									result.hdkfSupportRequestInfo);
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
	
// 	if($("#faultDesc").val().length>2000){
// 		alert("故障描述长度不能超过2000");
// 		return;
// 	}

	if($("#requestName").val().length>50){
		alert("故障标题长度不能超过50");
		return;
	}
		var dataVo = $('#formDetail').serializeArray();		
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		//alert(dataVo);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/save',
					data : {
						data : dataVo
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							initFormData();
							$.messager.show({
								title : '提示',
								msg : "操作成功。"
							});
						} else {
							$.messager.show({
								title : '提示',
								msg : "操作失败。"
							});
						}
					}
				});
	};

	//返回
	function doBack() {
		if (parent != null && parent.$('#tabs') != null) {
			var currTab = parent.$('#tabs').tabs('getSelected');
			var currTitle = currTab.panel('options').title;
			parent.$('#tabs').tabs('close', currTitle);
		}
	}
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
		var idR =formId;
		var requestUnitR =$("#requestUnit").val();
		var batchNos=   $("#batchNo").val();
		var url = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfSupportFaultDetailInfo1?requestId="+idR+"&requestUnit="+requestUnitR+"&batchNo="+batchNos;
		$("#iframeId").css('display','block');
		$("#iframeId").attr("src",url);
	});
	//////////复制这块，完成长度验证
	$.extend($.fn.validatebox.defaults.rules, {
		maxLength : {
			validator : function(value, param) {
				return param[0] >= value.length;

			},
			message : '请输入最多 {0} 字符.'
		}
	});
	///////////
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

		<!-- 流程按钮区域开始 -->
		<div class=datagrid-toolbar>
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
		</div>


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>求援方式</label></th>
<!-- 						<td><input title="求援方式" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="requestMethod" -->
<!-- 							id="requestMethod" disabled /></td> -->
                             <td><pt6:syslookup
								name="requestMethod" lookupCode="SUPPORT_REQUEST_TYPE"
								dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
							</pt6:syslookup></td>
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="信息处理卡编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestNo" id="requestNo"
							disabled /></td>
					</tr>
					<tr>

						<th align="right"><label>求援单位</label></th>
						<td>
						<input title="求援单位ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestUnit"
							id="requestUnit"  />
						<input title="求援单位" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestUnitAlias"
							id="requestUnitAlias" disabled /></td>

						<th align="right"><label>求援单位联系人</label></th>
						<td><input title="求援单位联系人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkMan" id="linkMan"
							disabled /></td>
					</tr>
					<tr>

						<th align="right"><label>求援单位联系电话</label></th>
						<td><input title="求援单位联系电话" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkPhone" id="linkPhone"
							disabled /></td>
						<th align="right"><label>求援单位传真</label></th>
						<td><input title="求援单位传真" class="easyui-validatebox"
							style="width: 180px;" type="text" name="fax" id="fax" disabled />
						</td>
					</tr>
					<tr>



<%-- 						<th align="right"><label>发现时机</label></th>
						<!-- 						<td><input title="发现时机" class="easyui-validatebox" -->
						<!-- 							style="width: 180px;" type="text" name="occurrenceTiming" -->
						<!-- 							id="occurrenceTiming" disabled /></td> -->
						<td style="padding-left: 3px"><pt6:syslookup
								name="occurrenceTiming" lookupCode="CSMP_FM_FAULTHAPPENMONMENT"
								dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
							</pt6:syslookup></td> --%>
					<!-- </tr>
					<tr> -->
<!-- 						<th align="right"><label>批架次</label></th> -->
<!-- 						<td><input title="批架次" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="batchNoAlias" id="batchNoAlias" -->
<!-- 							disabled /></td> -->
						<th align="right"><label>机型</label></th>
						<td><input title="机型" class="easyui-validatebox"
							style="width: 180px;" type="text" name="modelIdAlias" id="modelIdAlias"
							disabled /></td>
												<th align="right"><label>型号图号</label></th>
						<td><input title="型号图号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="figureNo" id="figureNo"
							disabled /></td>
												<!-- <th align="right"><label>求援时间</label></th>
						<td><input title="求援时间" class="easyui-datebox"
						editable="false"	style="width: 180px;" type="text" name="requestDate"
							id="requestDate" disabled /></td> -->
						</tr>
					<tr>
<!-- 						<th align="right"><label>机型</label></th>
						<td><input title="机型" class="easyui-validatebox"
							style="width: 180px;" type="text" name="modelIdAlias" id="modelIdAlias"
							disabled /></td> -->
<!-- 						<th align="right"><label>何时大修</label></th> -->
<!-- 						<td><input title="何时大修" class="easyui-datebox" -->
<!-- 							editable="false" style="width: 180px;" type="text" name="repairTime" -->
<!-- 							id="repairTime" disabled /></td> -->
<!-- 					</tr>
					<tr> -->
						<th align="right"><label>产品名称</label></th>
						<td><input title="产品名称" class="easyui-validatebox"
							style="width: 180px;" type="text" name="productName"
							id="productName" disabled /></td>
							
													<th align="right"><label>件号</label></th>
						<td><input title="件号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="partNo" id="partNo"
							disabled /></td>
							</tr>
					<tr>


						<th align="right"><label>生产单位</label></th>
						<td><input title="生产单位" class="easyui-validatebox"
							style="width: 180px;" type="text" name="productionUnit"
							id="productionUnit" disabled /></td>
 					</tr> 
<!-- 					<tr> -->
<!-- 						<th align="right"><label>飞行小时</label></th> -->
<!-- 						<td><input title="飞行小时" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" name="flightHours" -->
<!-- 							id="flightHours" disabled /></td> -->
<!-- 						<th align="right"><label>飞机起落</label></th> -->
<!-- 						<td><input title="飞机起落" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" name="flightLanding" -->
<!-- 							id="flightLanding" disabled /></td> -->
<!-- 					</tr> -->
<!-- 					<tr>
						 -->
<!-- 						<th align="right"><label>发生日期</label></th> -->
<!-- 						<td><input title="发生日期" class="easyui-datebox" -->
<!-- 						editable="false"	style="width: 180px;" type="text" name="occurrenceDate" -->
<!-- 							id="occurrenceDate" disabled /></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->

<!-- 						<th align="right"><label>ATA章节</label></th> -->

<!-- 						<td colspan="5" style="padding-left: 3px"> -->
<!-- 													<td><input title="ATA章节" class="easyui-validatebox" -->
<!-- 														style="width: 180px;" type="text" name="chaperNo" id="chaperNo" -->
<!-- 														disabled /></td> <input id="chaperNo" -->
<!-- 							class="easyui-combobox" name="chaperNo" -->
<!-- 							data-options="valueField:'id',textField:'ataName',url:'platform/csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController/search1',onShowPanel:comboboxOnShowPanel" -->
<%-- 							value="${csmpEtsOutfieldfailureDTO.chaperNo}" disabled="disabled"></input> --%>
<!-- 						</td> -->

<!-- 					</tr> -->
				<tr>
					<th width="94px">信息卡标题:</th>
					<td  width="117px" colspan="5"  style="padding-left: 3px"><input title="信息卡标题"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'" style="width: 180px;"
						type="text" name="requestName" id="requestName" disabled/></td>
				
				</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>故障描述</label></th> -->
<!-- 						<td colspan="5" style="padding-left: 3px"> -->
							
<!-- 							<textarea -->
<!-- 								data-options="required:true,validType:'maxLength[50]'" -->
<!-- 								name="faultDesc" id="faultDesc" rows="7" class="textareabox" -->
<!-- 								disabled="disabled"  style="resize: none"></textarea> -->

<!-- 						</td> -->
						
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th align="right"><label>技术员ID</label></th> -->
<!-- 						<td><input title="技术员ID" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="requestManagerId" -->
<!-- 							id="requestManagerId" disabled /></td> -->
<!-- 						<th align="right"><label>技术员姓名</label></th> -->
<!-- 						<td><input title="技术员姓名" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="requestManagerName" -->
<!-- 							id="requestManagerName" disabled /></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th align="right"><label>信息类别</label></th> -->
<!-- 						<td><input title="信息类别" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="infoType" id="infoType" -->
<!-- 							disabled /></td> -->
<!-- 						<th align="right"><label>故障类型</label></th> -->
<!-- 						<td><input title="故障类型" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="faultType" id="faultType" -->
<!-- 							disabled /></td> -->
<!-- 					</tr> -->
					<tr>
					</tr>
				</table>
			</form>
<!-- 		<iframe id="iframeId" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe> -->
 		</fieldset>
<!--<fieldset> -->
<!-- 			<legend>附件</legend> -->
<!-- 				<div class="formExtendBase"> -->
<!-- 					<div class="column" style="height: 130px;"> -->
<%-- 				 		<jsp:include --%>
<%-- 							page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp"> --%>
<%-- 							<jsp:param value="1024MB" name="file_size_limit" /> --%>
<%-- 							<jsp:param value="*.*" name="file_types" /> --%>
<%-- 							<jsp:param value="10" name="file_upload_limit" /> --%>
<%-- 							<jsp:param value="false" name="save_type" /> --%>
<%-- 							<jsp:param value="<%=formId %>" name="form_id" /> --%>
<%-- 							<jsp:param value="<%=entryId %>" name="entryId" /> --%>
<%-- 							<jsp:param value="<%=executionId %>" name="executionId" /> --%>
<%-- 							<jsp:param value="pm_project" name="form_code" /> --%>
<%-- 							<jsp:param value="id" name="form_field" />					 --%>
<%-- 							<jsp:param value="process" name="allowAdd" /> --%>
<%-- 							<jsp:param value="true" name="allowDel" /> --%>
<%-- 							<jsp:param value="true" name="cleanOnExit" /> --%>
<%-- 							<jsp:param value="PLATFORM_FILE_SECRET_LEVEL" name="secret_level" /> --%>
<%-- 						</jsp:include> --%>
<!-- 		 			</div> -->
<!-- 				</div> -->
<!-- 		</fieldset> -->

	<div style="width: 98%; margin-left: 10px; margin-right: 20px;margin-top:10px;"> 
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="<%=formId%>" />
			<jsp:param name="form_code" value="hdkfSupportRequestInfo" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
		</div>
		
		<div id="idea"></div>
	</div>
</body>
</html>