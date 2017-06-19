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
<!-- ControllerPath = "hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/Detail/id" -->
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

	$(function() {
		if (!"${hdkfSupportTripTaskDTO.startDate}" == "") {
			$('#startDate').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.startDate}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportTripTaskDTO.endDate}" == "") {
			$('#endDate').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.endDate}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportTripTaskDTO.noticeTime}" == "") {
			$('#noticeTime').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.noticeTime}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportTripTaskDTO.tripStartTime}" == "") {
			$('#tripStartTime').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportTripTaskDTO.tripStartTime}")
							.format("yyyy-MM-dd"));
		}
	})

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/toDetailJsp.json',
					data : {
						id : formId
					},
					async:false,
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportTripTask.startDate = formatDatebox(result.hdkfSupportTripTask.startDate);
							result.hdkfSupportTripTask.endDate = formatDatebox(result.hdkfSupportTripTask.endDate);
							result.hdkfSupportTripTask.noticeTime = formatDatebox(result.hdkfSupportTripTask.noticeTime);
							result.hdkfSupportTripTask.tripStartTime = formatDatebox(result.hdkfSupportTripTask.tripStartTime);
							$("#formDetail").form('load',
									result.hdkfSupportTripTask);
							//alert(result.hdkfSupportTripTask.isNeedEquipment);
							$('#isNeedEquipment').combobox('setValue', result.hdkfSupportTripTask.isNeedEquipment);
							//alert(result.hdkfSupportTripTask.isBorrowSomeone);
							$('#isBorrowSomeone').combobox('setValue', result.hdkfSupportTripTask.isBorrowSomeone);
							//alert("已经setValue...");
							//alert($("#isBorrowSomeone").combobox('getValue'));
							//alert($("#isNeedEquipment").val());
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}
	
	
	window.beforeSubmit = function( _entryId,_executionId,_currentActivityName,_targetActivityName,_formId){
		
		if ($("#contentDemand").val() == '') {
			alert("任务内容与要求不能为空！");
			return false;
		}
		if($('#isBorrowSomeone').combobox('getValue')==''){
			alert("是否借人不能为空，请核查！");
			return false;
		}
		if($('#isNeedEquipment').combobox('getValue')==''){
			alert("请选择是否需要器材，请核查！");
			return false;
		}
		if ($('#form').form('validate') == false) {
			alert("请检查表单相关项，输入是否合法或者为空！");
			return false;
		}
		
		if ($("#taskName").val().length>25) {
			alert("任务书名的长度不能超过25！");
			return false;
		}
		if ($("#contentDemand").val().length>2000) {
			alert("任务内容及要求的长度不能超过1000！");
			return false;
		}
		
		if ($("#needEquipment").val().length>2000) {
			alert("需要的器材的长度不能超过1000！");
			return false;
		}
		
		
		var isBorrowSomeone ;
		$
		.ajax({
			url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/toDetailJsp.json',
			data : {
				id : formId
			},
			async:false,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					isBorrowSomeone = result.hdkfSupportTripTask.isBorrowSomeone;
				  
					
				} else {
					$.messager.show({
						title : '提示',
						msg : "数据加载失败。"
					});
				}
			}
		});
		
		if(!isBorrowSomeone)
		{
			alert("请先点击保存表单按钮，再提交流程");
			return false;
		}
		if(isBorrowSomeone&&isBorrowSomeone=='Y')
		{var endFlag ;
		//alert("enter beforeSubmit...");
		$
		.ajax({
			url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/getBorrowPersonDtoStatusByTaskId.json',
			data : {
				tripTaskId : formId
			},
			async:false,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					endFlag = result.flag;
				  
					
				} else {
					$.messager.show({
						title : '提示',
						msg : "不能进行流程提交。"
					});
				}
			}
		});
		//alert(isOutfield);
		if(!endFlag)
		{
			alert("请确保借人流程已经走完，再提交此流程");
			return false;
		}
		}
	
			return true;
	};
	

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		
		if ($("#contentDemand").val() == '') {
			alert("任务内容与要求不能为空！");
			return;
		}
		
		if ($("#taskName").val().length>50) {
			alert("任务书名的长度不能超过50！");
			return false;
		}
		if ($("#contentDemand").val().length>1000) {
			alert("任务内容及要求的长度不能超过1000！");
			return false;
		}
		
		if ($("#needEquipment").val().length>1000) {
			alert("需要的器材的长度不能超过1000！");
			return false;
		}
	//	alert("isBorrow-->"+$('#isBorrowSomeone').combobox('getValue'));
		if($('#isBorrowSomeone').combobox('getValue')==''){
			alert("是否借人不能为空，请核查！");
			return;
		}
// 		alert( $("input[name='isNeedEquipment']").val());
// 		alert($("#isNeedEquipment").combobox('getValue'));
 	//	alert("isNeedEquipment---->"+$('#isNeedEquipment').combobox('getValue'));
// 		alert($('#isNeedEquipment').val());
		if($('#isNeedEquipment').combobox('getValue')==''){
			alert("请选择是否需要器材，请核查！");
			return;
		}

		if ($('#form').form('validate') == false) {
			alert("请检查表单相关项，输入是否合法或者为空！");
			return;
		}
		
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/save',
					data : {
						data : dataVo
					},
					async:false,
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
	
	function  downloadPdf(){		   
	    var  pdfId = formId;
		var pdfUrl = "/HDKF/platform/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/downloadPdf?id="+pdfId;
		window.open(pdfUrl);
		}
	//页面加载完成后入口
	function toRequestDetail() {

		if ($("#onOffBtn").html() == '展开信息卡求援详情') {
			//alert("here");
			var id = $("#requestId").val();
			var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			var url = "avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId1").css('display', 'block');
			$("#iframeId1").attr("src", url);
			$("#onOffBtn").html('收起信息卡求援详情');
		} else {
			$("#iframeId1").css('display', 'none');
			$("#onOffBtn").html('展开信息卡求援详情');
		}
	}
	function toRequestDetail2() {

		if ($("#onOffBtn2").html() == '展开客服部处理单详情') {
			//alert("here");
			var id = $("#kfDealId").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			var url = "avicit/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId2").css('display', 'block');
			$("#iframeId2").attr("src", url);
			$("#onOffBtn2").html('收起客服部处理单详情');
		} else {
			$("#iframeId2").css('display', 'none');
			$("#onOffBtn2").html('展开客服部处理单详情');
		}
	}
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
		
		var isNeedEquipment = $("#isNeedEquipment").combobox('getValue');
		//alert("here--->"+isNeedEquipment);
		if(isNeedEquipment=='Y'){
			//alert("in--->"+isNeedEquipment);
	
			//var taskId =formId;
			//alert(taskId);
			var taskNo = $("#taskNo").val();
			//alert("taskNo-->"+taskNo);
			//alert(taskNo);
			var url = "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo1?taskId="+formId+"&taskNo="+taskNo;
		
				//alert(validFlag);
			$("#iframeId").css('display','block');
			$("#iframeId").attr("src",url);
			
			
 		}else if(isNeedEquipment=='N'){
 			$("#iframeId").css('display','none');
 		}
 		
 		//else{
		$("#isNeedEquipment").combobox({onSelect:function(r){
			if($("#taskNo").val()==''){
				alert("请先填写任务书编号，在进行器材详情编辑");
				
			}
			
		else{
			//alert("in here");
			//alert(r.value);
			$("#needEquipment").attr("disabled",false);
			
			//var modelName = $("#modelName").val();
			//var url = "platform/demo/train/demorowedit/DemoRowEditController/DemoRowEditInfo?modelName="+modelName;
			//var taskId = $("#id").val();
			//alert(taskId);
			var taskNo = $("#taskNo").val();
			//alert(taskNo);
			var url = "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo1?taskId="+formId+"&taskNo="+taskNo;
			if(r.value=='Y'){
				//alert(validFlag);
			$("#iframeId").css('display','block');
			$("#iframeId").attr("src",url);
			}
			else{
				$("#needEquipment").attr("disabled","disabled");
				$("#iframeId").css('display','none');
			}
			
		}
			
		}});
		
 		//}
		$("#isNeedEquipment").combobox('setValue',isNeedEquipment);
		
		
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
			<a class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="downloadPdf();" href="javascript:void(0);">生成PDF</a>
		</div>
		<div style="margin: 10px 5px 20px 10px">
			<span><a id="onOffBtn" onclick="toRequestDetail();"
				href="javascript:void(0)">展开信息卡求援详情</a></span>

			<iframe id="iframeId1" width="99%" height="870" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>
		<div style="margin: 10px 5px 20px 10px">
			<span><a id="onOffBtn2" onclick="toRequestDetail2();"
				href="javascript:void(0)">展开客服部处理单详情</a></span>

			<iframe id="iframeId2" width="99%" height="870" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>
		


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
				<tr>
					<th align="right"><label>任务书编号</label></th>
						<td><input title="任务书编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="taskNo" id="taskNo"
							disabled required="true"/></td>
						<th align="right"><span class="remind">*</span><label>任务书名称</label></th>
						<td><input title="任务书名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[25]'"
							style="width: 180px;" type="text" name="taskName" id="taskName"
							disabled required="true" disabled/></td>
						
					</tr>
					<tr>
<!-- 						<th width="10%"><label>请求处理单</label></th> -->
<!-- 						<td width="40%"></td> -->
							
							
							
							
						<th width="10%"><label>信息处理卡编号</label></th>
						<td width="40%"><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId"
							id="requestId" disabled /> <input title="信息处理卡编号"
							class="easyui-validatebox" style="width: 180px;" type="text"
							name="requestNo" id="requestNo" disabled /></td>
							
						<th align="right"><span class="remind">*</span><label>排故所去部队</label></th>
						<td><input title="排故所去部队" class="easyui-validatebox"
							style="width: 180px;" type="text" name="toArmyName"
							id="toArmyName" disabled required="true" disabled/>
							<input title="请求处理ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="kfDealId" id="kfDealId"
							disabled /></td>
							


					</tr>
					
					<tr>
<!-- 						<th align="right"><label>需要的器材</label></th> -->
<!-- 						<td><input title="需要的器材" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="needEquipment" -->
<!-- 							id="needEquipment" disabled /></td> -->

	                 	<th align="right"><span class="remind">*</span><label>是否需要器材</label></th>
						<td><pt6:syslookup name="isNeedEquipment"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull = "true"
							dataOptions="width:180,editable:false,panelHeight:'auto',disabled:'disabled'">
						</pt6:syslookup></td>


						<th align="right"><span class="remind">*</span><label>是否借人</label></th>
						<td><pt6:syslookup name="isBorrowSomeone"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull = "true"
							dataOptions="width:180,editable:false,panelHeight:'auto',disabled:'disabled'">
						</pt6:syslookup></td>
					</tr>
					<tr>
						
							
					   <th align="right"><label>费用编号</label></th>
						<td><input title="费用编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="feeNo" id="feeNo"
							 disabled /></td>
						
						<th align="right"><label>填写人</label></th>
						<td><input title="填写人ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="writeManId"
							id="writeManId" disabled /><input title="填写人姓名" class="easyui-validatebox"
							style="width: 180px;" type="text" name="writeManName"
							id="writeManName" disabled /></td>
							
					</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>任务内容与要求</label></th> -->
<!-- 						<td><input title="任务内容与要求" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="contentDemand" -->
<!-- 							id="contentDemand" disabled /></td> -->
						
<!-- 					</tr> -->
					<tr>
					
<!-- 						<th align="right"><label>执行者</label></th> -->
<!-- 						<td><input title="执行者" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="executors" id="executors" -->
<!-- 							disabled /></td> -->
					</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>总任务完成时间</label></th> -->
<!-- 						<td><input title="总任务完成时间" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="totalHours" -->
<!-- 							id="totalHours" disabled /></td> -->
<!-- 						<th align="right"><label>任务实际开始时间</label></th> -->
<!-- 						<td><input title="任务实际开始时间" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="startDate" id="startDate" -->
<!-- 							disabled /></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th align="right"><label>任务实际完成时间</label></th> -->
<!-- 						<td><input title="任务实际完成时间" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="endDate" id="endDate" -->
<!-- 							disabled /></td> -->
<!-- 						<th align="right"><label>任务完成详细说明</label></th> -->
<!-- 						<td><input title="任务完成详细说明" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="taskDetails" -->
<!-- 							id="taskDetails" disabled /></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
						
					
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th align="right"><label>部队技术室主任</label></th> -->
<!-- 						<td><input title="部队技术室主任" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="director" id="director" -->
<!-- 							disabled /></td> -->
<!-- 						<th align="right"><label>部队技术室部长</label></th> -->
<!-- 						<td><input title="部队技术室部长" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="head" id="head" disabled /> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th align="right"><label>通知客户时间</label></th> -->
<!-- 						<td><input title="通知客户时间" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="noticeTime" -->
<!-- 							id="noticeTime" disabled /></td> -->
<!-- 						<th align="right"><label>赴外场出发时间</label></th> -->
<!-- 						<td><input title="赴外场出发时间" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="tripStartTime" -->
<!-- 							id="tripStartTime" disabled /></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
						
					
<!-- 					</tr> -->
					<tr>
					<th align="right"><span class="remind">*</span><label>任务内容与要求:</label></th>
								
					<td  colspan="5" align="left" style="padding-left: 3px">
					<textarea rows="12"
						data-options="required:true,validType:'maxLength[2000]'" 
						class="textareabox" name="contentDemand" id="contentDemand"  
						style="resize:none" required="true" disabled ></textarea></td>
					</tr>
					
			    <tr>
				<th align="right"><label>需要的器材:</label></th>
					
					<td  colspan="5" align="left" style="padding-left: 3px">
					<textarea rows="12"
						data-options="required:true,validType:'maxLength[2000]'" 
						class="textareabox" name="needEquipment" id="needEquipment"  
						style="resize:none"  disabled ></textarea></td>
				</tr>
<!-- 				<tr> -->
<!-- 				<th align="right"><label>部队领导意见及要求</label></th> -->
			
<!-- 				<td  colspan="5" align="left" style="padding-left: 3px"> -->
<!-- 					<textarea rows="12" -->
<!-- 						data-options="required:true,validType:'maxLength[4000]'"  -->
<!-- 						class="textareabox" name="suggestionDemand" id="suggestionDemand"   -->
<!-- 						style="resize:none" disabled ></textarea></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
				
<!-- 					<th align="right"><label>任务评价</label></th> -->
<!-- 					<td  colspan="5" align="left" style="padding-left: 3px"> -->
<!-- 					<textarea rows="12" -->
<!-- 						data-options="required:true,validType:'maxLength[4000]'"  -->
<!-- 						class="textareabox" name="evaluate" id="evaluate"   -->
<!-- 						style="resize:none" disabled ></textarea></td> -->
<!-- 				</tr> -->
				
					
					
					
					<tr>
					</tr>
				</table>
			</form>
		</fieldset>
		<iframe id="iframeId" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
		<fieldset>
			<legend>附件</legend>
				<div class="formExtendBase">
					<div class="column" style="height: 130px;">
				 		<jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
							<jsp:param value="1024MB" name="file_size_limit" />
							<jsp:param value="*.*" name="file_types" />
							<jsp:param value="10" name="file_upload_limit" />
							<jsp:param value="false" name="save_type" />
							<jsp:param value="<%=formId %>" name="form_id" />
							<jsp:param value="<%=entryId %>" name="entryId" />
							<jsp:param value="<%=executionId %>" name="executionId" />
							<jsp:param value="pm_project" name="form_code" />
							<jsp:param value="id" name="form_field" />					
							<jsp:param value="process" name="allowAdd" />
							<jsp:param value="true" name="allowDel" />
							<jsp:param value="true" name="cleanOnExit" />
							<jsp:param value="PLATFORM_FILE_SECRET_LEVEL" name="secret_level" />
						</jsp:include>
		 			</div>
				</div>
		</fieldset>
		<div id="idea"></div>
	</div>
</body>
</html>