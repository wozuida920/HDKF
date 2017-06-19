<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/operation/Add/null" -->
<title>添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" />
			<table class="form_commonTable">
				<tr>

					<th width="10%"><span class="remind">*</span>请求处理单:</th>
					<td width="40%"><input title="请求处理ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="kfDealId" id="kfDealId"
						onfocus="openDealByKfDialog();" /></td>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="hidden" name="requestId"
						id="requestId" /> <input title="信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo" readonly/></td>

				</tr>
				<tr>
					<th width="10%">任务书编号:</th>
					<td width="40%"><input title="任务书编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[30]'" style="width: 180px;"
						type="text" name="taskNo" id="taskNo" readonly/></td>
					<th width="10%"><span class="remind">*</span>任务书名称:</th>
					<td width="40%"><input title="任务书名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="taskName" id="taskName" required="true"/></td>

				</tr>


				<tr>
					<th width="10%"><span class="remind">*</span>是否需要器材:</th>
					<td width="40%"><pt6:syslookup name="isNeedEquipment"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull = "true"
							dataOptions="width:180,editable:false,panelHeight:'auto' ,required:true">
						</pt6:syslookup></td>

					<th width="10%"><span class="remind">*</span>是否派人:</th>
					<td width="40%"><pt6:syslookup name="isBorrowSomeone"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull = "true"
							dataOptions="width:180,editable:false,panelHeight:'auto',required:true">
						</pt6:syslookup></td>



				</tr>
				<tr>

					<th width="10%">费用编号:</th>
					<td width="40%"><input title="费用编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="feeNo" id="feeNo"/></td>

					<th width="10%"><span class="remind">*</span>排故所去部队:</th>
					<td width="40%"><input title="排故所去部队"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[80]'" style="width: 180px;"
						type="text" name="toArmyName" id="toArmyName" required="true"/></td>
					<!-- 					<th width="10%">执行者:</th> -->
					<!-- 					<td width="40%"><input title="执行者" -->
					<!-- 						class="inputbox easyui-validatebox" -->
					<!-- 						data-options="validType:'maxLength[300]'" style="width: 180px;" -->
					<!-- 						type="text" name="executors" id="executors" /></td> -->
				<tr>



					<th width="10%"><span class="remind">*</span>填写人</th>
					<td width="40%"><input title="填写人ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="writeManId" id="writeManId" value="${userId}"/> <input
						title="填写人姓名" class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="writeManName" id="writeManName" value="${CURRENT_LOGINUSER.name}"/></td>


				</tr>
				</tr>
				<tr>
					<th width="10%">需要的器材:</th>

					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="12"
							data-options="validType:'maxLength[1000]'"
							class="textareabox" name="needEquipment" id="needEquipment"
							style="resize: none"></textarea></td>
				</tr>
				<!-- 				<tr> -->
				<!-- 					<th width="10%">总任务完成时间:</th> -->
				<!-- 					<td width="40%"><input title="总任务完成时间" -->
				<!-- 						class="easyui-numberbox easyui-validatebox" -->
				<!-- 						data-options="validType:'maxLength[22]'" style="width: 180px;" -->
				<!-- 						type="text" name="totalHours" id="totalHours" /></td> -->
				<!-- 					<th width="10%">任务实际开始时间:</th> -->
				<!-- 					<td width="40%"><input title="任务实际开始时间" class="easyui-datebox" -->
				<!-- 						editable="false" style="width: 182px;" type="text" -->
				<!-- 						name="startDate" id="startDate" /></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<th width="10%">任务实际完成时间:</th> -->
				<!-- 					<td width="40%"><input title="任务实际完成时间" class="easyui-datebox" -->
				<!-- 						editable="false" style="width: 182px;" type="text" name="endDate" -->
				<!-- 						id="endDate" /></td> -->
				<!-- 					<th width="10%">任务完成详细说明:</th> -->
				<!-- 					<td width="40%"><input title="任务完成详细说明" -->
				<!-- 						class="inputbox easyui-validatebox" -->
				<!-- 						data-options="validType:'maxLength[4000]'" style="width: 180px;" -->
				<!-- 						type="text" name="taskDetails" id="taskDetails" /></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<th width="10%">部队领导意见及要求:</th> -->
				<!-- 					<td width="40%"><input title="部队领导意见及要求" -->
				<!-- 						class="inputbox easyui-validatebox" -->
				<!-- 						data-options="validType:'maxLength[4000]'" style="width: 180px;" -->
				<!-- 						type="text" name="suggestionDemand" id="suggestionDemand" /></td> -->
				<!-- 					<th width="10%">任务评价:</th> -->
				<!-- 					<td width="40%"><input title="任务评价" -->
				<!-- 						class="inputbox easyui-validatebox" -->
				<!-- 						data-options="validType:'maxLength[1000]'" style="width: 180px;" -->
				<!-- 						type="text" name="evaluate" id="evaluate" /></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<th width="10%">部队技术室主任:</th> -->
				<!-- 					<td width="40%"><input title="部队技术室主任" -->
				<!-- 						class="inputbox easyui-validatebox" -->
				<!-- 						data-options="validType:'maxLength[20]'" style="width: 180px;" -->
				<!-- 						type="text" name="director" id="director" /></td> -->
				<!-- 					<th width="10%">部队技术室部长:</th> -->
				<!-- 					<td width="40%"><input title="部队技术室部长" -->
				<!-- 						class="inputbox easyui-validatebox" -->
				<!-- 						data-options="validType:'maxLength[20]'" style="width: 180px;" -->
				<!-- 						type="text" name="head" id="head" /></td> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<th width="10%">通知客户时间:</th> -->
				<!-- 					<td width="40%"><input title="通知客户时间" class="easyui-datebox" -->
				<!-- 						editable="false" style="width: 182px;" type="text" -->
				<!-- 						name="noticeTime" id="noticeTime" /></td> -->
				<!-- 					<th width="10%">赴外场出发时间:</th> -->
				<!-- 					<td width="40%"><input title="赴外场出发时间" class="easyui-datebox" -->
				<!-- 						editable="false" style="width: 182px;" type="text" -->
				<!-- 						name="tripStartTime" id="tripStartTime" /></td> -->
				<!-- 				</tr> -->
				<tr>
					<th width="10%"><span class="remind">*</span>任务内容与要求:</th>

					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="12"
							data-options="required:true,validType:'maxLength[1000]'"
							class="textareabox" name="contentDemand" id="contentDemand"
							style="resize: none" required="true"></textarea></td>



					<!-- 					<td width="40%"> -->
					<!-- 					<input title="任务内容与要求" -->
					<!-- 						class="inputbox easyui-validatebox" -->
					<!-- 						data-options="validType:'maxLength[2000]'" style="width: 180px;" -->
					<!-- 						type="text" name="contentDemand" id="contentDemand" /></td> -->

				</tr>
				<tr>
				</tr>
			</table>
			<input type="hidden" value="${id}" name="id" id="id"/>
			
		</form>
		
		<iframe id="iframeId" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
		
		
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="${id}" />
			<jsp:param name="form_code" value="hdkfSupportTripTask" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>

	</div>
	<div data-options="region:'south',border:false" style="height: 40px">
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="60%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">保存并启动流程</a> <a title="返回"
						id="returnButton" class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		$(function() {
// 			var isNeedEquipment = $("#isNeedEquipment").val();
// 			if(isNeedEquipment=='Y'){
		
// 				var taskId = $("#id").val();
// 				//alert(taskId);
// 				var taskNo = $("#taskNo").val();
// 				//alert(taskNo);
// 				var url = "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo2?taskId="+taskId+"&taskNo="+taskNo;
			
// 					//alert(validFlag);
// 				$("#iframeId").css('display','block');
// 				$("#iframeId").attr("src",url);
				
				
// 	 		}
			
			$("#isNeedEquipment").combobox({onSelect:function(r){
				//alert(r.value);
				$("#needEquipment").attr("disabled",false);
				
				//var modelName = $("#modelName").val();
				//var url = "platform/demo/train/demorowedit/DemoRowEditController/DemoRowEditInfo?modelName="+modelName;
				var taskId = $("#id").val();
				//alert(taskId);
				var taskNo = $("#taskNo").val();
				//alert(taskNo);
				var url = "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo1?taskId="+taskId+"&taskNo="+taskNo;
				if(r.value=='Y'){
					//alert(validFlag);
				$("#iframeId").css('display','block');
				$("#iframeId").attr("src",url);
				}
				else{
					$("#needEquipment").attr("disabled","disabled");
					$("#iframeId").css('display','none');
				}
				
				
				
			}});
			
			
			
		});
		
	
		
		//openDealByKfDialog
		//打开客服部处理选择页面
		function openDealByKfDialog() {
			this.nData = new CommonDialog(
					"model4",
					"790",
					"600",
					"hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskController/HdkfSupportDealByKfSelect",
					"信息卡处理信息选择", false, true, false);
			this.nData.show();
		};
		function setDealByKfData(data) {
			$("#model4").dialog("close");

			$("#kfDealId").val(data.id);
			$("#requestId").val(data.requestId);
			$("#requestNo").val(data.requestNo);
			
			getStringRuleCode(data.requestId);

		};
		
		
		function getStringRuleCode(requestId, modelId) {
			$.ajax({
				url : "platform/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/getStringRuleCode.json",
				data : {
					type : "C",
					requestId : requestId
					//modelId : modelId
				},
				type : "post",
				dataType : 'json',
				success : function(result) {
					if (result.flag == "success")
					{
						$("#taskNo").val(result.ruleCode);
					}
				}
			});
		}
		
		

		function closeForm() {
			parent.hdkfSupportTripTask.closeDialog("#insert");
		}
		function saveForm() {
			var isNeedEquipment = $("input[name='isNeedEquipment']").val();
			if (isNeedEquipment == 'N') {

				if ($("#needEquipment").val() != '') {
					alert("不需要器材，此处不需要填写");
					return;
				}
			} else {

			}
			if ($("#contentDemand").val() == '') {
				alert("任务内容与要求不能为空！");
				return;
			}
			if($('#isBorrowSomeone').combobox('getValue')==''){
				alert("是否借人不能为空，请核查！");
				return;
			}
			if($('#isNeedEquipment').combobox('getValue')==''){
				alert("请选择是否需要器材，请核查！");
				return;
			}

			if ($('#form').form('validate') == false) {
				alert("请检查表单相关项，输入是否合法或者为空！");
				return;
			}
			if ($("#taskName").val().length>50) {
				alert("任务书名的长度不能超过50！");
				return;
			}
			if ($("#contentDemand").val().length>1000) {
				alert("任务内容及要求的长度不能超过1000！");
				return;
			}
			
			if ($("#needEquipment").val().length>1000) {
				alert("需要的器材的长度不能超过1000！");
				return;
			}
			
			parent.hdkfSupportTripTask.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
		}
	</script>
</body>
</html>