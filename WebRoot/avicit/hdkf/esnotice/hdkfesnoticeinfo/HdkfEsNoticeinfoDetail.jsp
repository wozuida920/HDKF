<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
	
<script src="avicit/common/js/ValidationContent.js" type="text/javascript">
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<!-- 流程按钮区域开始 -->
		<div class=datagrid-toolbar>
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
		</div>
		<fieldset>
			<form id='form'>
				<input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th width="10%"><label for="bulletinNo"> 通告编号:</label></th>


						<td width="40%"><input title="通告编号"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="bulletinNo" id="bulletinNo" /></td>
						<th width="10%"><label for="title"> 标题:</label></th>


						<td width="40%"><input title="标题"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'"  style="width: 180px;"
							type="text" name="title" id="title" /></td>
					</tr>
					<tr>
						<th width="10%"><label for="organContact"> 机关联系人:</label></th>


						<td width="40%"><input title="机关联系人"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" 
						
							style="width: 180px;"
							type="text" name="organContact" id="organContact" /></td>
						<th width="10%"><label for="telephone"> 机关联系人电话:</label></th>


						<td width="40%"><input title="机关联系人电话"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:['maxLength[100]','telephoneCheck']"  style="width: 180px;"
							type="text" name="telephone" id="telephone" /></td>
					</tr>
					<tr>
						<th width="10%"><label for="bulletinType"> 通报类型 :</label></th>

						<td width="40%" class="disabled"><pt6:syslookup
								name="bulletinType" isNull="true" id="bulletinType"
								title="通报类型 " lookupCode="CSMP_ES_INFO_TYPE"   
								dataOptions="disabled:true,width:180,editable:false,panelHeight:'auto',required:true">
							</pt6:syslookup></td>
						<th width="10%"><label for="materialSupply"> 材料提供方式:</label></th>

						<td width="40%" class="disabled"><pt6:syslookup
								name="materialSupply" isNull="true" id="materialSupply"
								title="材料提供方式" lookupCode="CSMP_ES_PROVIDE_MATERIAL"
								dataOptions="disabled:true,width:180,editable:false,panelHeight:'auto'">
							</pt6:syslookup></td>
					</tr>
					<tr>
						<th width="10%"><label for="implementCompany"> 实施单位:</label></th>

						<td width="40%" class="disabled"><pt6:syslookup
								name="implementCompany" isNull="true" id="implementCompany"
								title="实施单位" lookupCode="CSMP_ES_IMPLEMENT_COMPANY"
								dataOptions="disabled:true,width:180,editable:false,panelHeight:'auto'">
							</pt6:syslookup></td>
						<th width="10%"><label for="reportDate"> 预计上报日期:</label></th>


						<td width="40%" class="disabled"><input title="预计上报日期"
							disabled class="easyui-datebox disabled pt6-disabled"
							editable="false" style="width: 182px;" type="text"
							name="reportDate" id="reportDate" /></td>
					</tr>
					<tr>
						<th width="10%"><label for="author"> 编者:</label></th>


						<td width="40%"><input title="编者"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[50]'" style="width: 180px;"
							type="text" name="author" id="author" /></td>
						<th width="10%"><label for="fileCompany"> 编发单位:</label></th>


						<td width="40%"><input title="编发单位"
							class="inputbox easyui-validatebox disabled pt6-disabled"
						     style="width: 180px;"
						     data-options="validType:'maxLength[50]'"
							type="text" name="fileCompany" id="fileCompany" /></td>
					</tr>
					<tr>
						<th width="10%"><label for="companyTel"> 电话:</label></th>


						<td width="40%"><input title="电话"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							
							data-options="validType:['maxLength[100]','telephoneCheck']" 
							 style="width: 180px;"
							type="text" name="companyTel" id="companyTel" /></td>
						<th width="10%"><label for="includeMars"> 是否包含器材:</label></th>

						<td width="40%" class="disabled"><pt6:syslookup
								name="includeMars" isNull="true" id="includeMars" title="是否包含器材"
								lookupCode="PLATFORM_YES_NO_FLAG"
								dataOptions="disabled:true,width:180,editable:false,panelHeight:'auto',required:true">
							</pt6:syslookup></td>
					</tr>
					<tr>
						<th width="10%"><label for="publishDate"> 预计发布日期:</label></th>


						<td width="40%" class="disabled"><input title="预计发布日期"
							disabled class="easyui-datebox disabled pt6-disabled"
							editable="false" style="width: 182px;" type="text"
							name="publishDate" id="publishDate" /></td>
						<th width="10%"><label for="completeDate"> 预计应完成日期:</label></th>


						<td width="40%" class="disabled"><input title="预计应完成日期"
							disabled class="easyui-datebox disabled pt6-disabled"
							editable="false" style="width: 182px;" type="text"
							name="completeDate" id="completeDate" /></td>
					</tr>
					<tr>
						<th width="10%"><label for="changeNo"> 更改单号:</label></th>


						<td width="40%"><input title="更改单号"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[100]'" style="width: 180px;"
							type="text" name="changeNo" id="changeNo" /></td>
						<th width="10%"><label for="attribute13"> 编写日期:</label></th>


						<td width="40%" class="disabled"><input title="编写日期"
							disabled class="easyui-datebox disabled pt6-disabled"
							editable="false" style="width: 182px;" type="text"
							name="attribute13" id="attribute13" /></td>
					</tr>
					<tr>
						<th width="10%"><label for="performRequirement">
								执行要求:</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="执行要求" rows="5" class="textareabox" 
									name="performRequirement" id="performRequirement" style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th width="10%"><label for="changeComment">
								 换版内容:</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="执行要求" rows="5" class="textareabox" 
									name="changeComment" id="changeComment" style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th width="10%"><label for="remark">
								 备注:</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea title="备注" rows="5" class="textareabox" 
									name="remark" id="remark" style="resize: none" disabled></textarea>
							</div>
						</td>
					</tr>
			
					
					
				</table>
			</form>
		</fieldset>
		<iframe id="iframeIdR" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
        <iframe id="iframeIdR1" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="5000MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value='<%=formId%>' />
			<jsp:param name="form_code" value="hdkfEsNoticeinfo" />
			<jsp:param name="allowAdd" value="process" />
			<jsp:param name="allowDel" value="false" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="hiddenUploadBtn" value="false" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
		<div id="idea"></div>
	</div>
	<script type="text/javascript">
		//返回
		function doBack(){
			if(parent!=null&&parent.$('#tabs')!=null){
				var currTab = parent.$('#tabs').tabs('getSelected');
				var currTitle = currTab.panel('options').title; 
				parent.$('#tabs').tabs('close',currTitle);
			}
		}
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;
				},
				message : '请输入最多 {0} 字符.'
			}
		});

		var entryId = "<%=entryId%>";
		var executionId = "<%=executionId%>";
		var taskId = "<%=taskId%>";
		var formId = "<%=formId%>";
		$(function() {
			if (!"${hdkfEsNoticeinfoDTO.reportDate}" == "") {
				$('#reportDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsNoticeinfoDTO.reportDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfEsNoticeinfoDTO.publishDate}" == "") {
				$('#publishDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsNoticeinfoDTO.publishDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfEsNoticeinfoDTO.completeDate}" == "") {
				$('#completeDate').datebox(
						'setValue',
						parserColumnTime("${hdkfEsNoticeinfoDTO.completeDate}")
								.format("yyyy-MM-dd"));
			}
		
			//初始化页面值
			$
					.ajax({
						url : 'platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController//operation/toDetailJsp.json',
						data : {
							id : formId
						},
						async:false,
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if (result.flag == "success") {
								result.datas.reportDate = formatDatebox(result.datas.reportDate);
								result.datas.publishDate = formatDatebox(result.datas.publishDate);
								result.datas.completeDate = formatDatebox(result.datas.completeDate);
								result.datas.reportTime = formatDatebox(result.datas.reportTime);
								result.datas.replyTime = formatDatebox(result.datas.replyTime);
								result.datas.completeTime = formatDatebox(result.datas.completeTime);
								result.datas.forwardTime = formatDatebox(result.datas.forwardTime);
								result.datas.creationDate = formatDatebox(result.datas.creationDate);
								result.datas.lastUpdateDate = formatDatebox(result.datas.lastUpdateDate);
								result.datas.attribute13 = formatDatebox(result.datas.attribute13);
								result.datas.attribute14 = formatDatebox(result.datas.attribute14);
								$("#form").form('load', result.datas);
							} else {
								$.messager.show({
									title : '提示',
									msg : "数据加载失败。"
								});
							}
						}
					});

			//控制表单权限用这个
			initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
			
			
			
			var bulletinNo = $("#bulletinNo").val();
			var bulletinId = formId;
			var url = "hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/HdkfEsNoticeinfoEffectiveInfo11?bulletinId="+bulletinId+"&bulletinNo="+bulletinNo;
			$("#iframeIdR").css('display','block');
			$("#iframeIdR").attr("src",url);
			
			var includeMars =    $("#includeMars").combobox('getValue');
		
			var url = "hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/HdkfEsNoticeinfoMaterialInfo1?bulletinId="+bulletinId+"&bulletinNo="+bulletinNo;
			if(includeMars=='Y'){
				//alert(validFlag);
			$("#iframeIdR1").css('display','block');
			$("#iframeIdR1").attr("src",url);
			}
			else{
				$("#iframeIdR1").css('display','none');
			}
			
		})

		/**
		 * 保存表单方法
		 * @param processInstanceId
		 * @param executionId
		 */
		var _callback;
		window.saveFormDataSyn = function(processInstanceId, executionId,
				callback) {
			_callback = callback;
			if ($('#form').form('validate') == false) {
				return;
			}
			var dataVo = $('#form').serializeArray();
			var dataJson = convertToJson(dataVo);
			dataVo = JSON.stringify(dataJson);
			$
					.ajax({
						url : "platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/save",
						data : {
							data : dataVo
						},
						type : 'post',
						dataType : 'json',
						success : function(result) {
							if (result.flag == "success") {
								var flag = 0;
								try {
									flag = upload();
								} catch (e) {
								}
								if (flag == 0) {
									$.messager.show({
										title : '提示',
										msg : "保存完成."
									});
									if (_callback != null) {
										_callback();
									}
								}
							} else {
								$.messager.show({
									title : '提示',
									msg : "操作失败。"
								});
							}
						}
					});
		};

		function afterUploadEvent() {
			$.messager.show({
				title : '提示',
				msg : "保存完成."
			});
			if (_callback != null) {
				_callback();
			}
		}
		
		$("#includeMars").combobox({onSelect:function(r){		
			var bulletinNo = $("#bulletinNo").val();
			var bulletinId = formId;
			var url = "hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/HdkfEsNoticeinfoMaterialInfo?bulletinId="+bulletinId+"&bulletinNo="+bulletinNo;
			if(r.value=='Y'){
				//alert(validFlag);
			$("#iframeIdR1").css('display','block');
			$("#iframeIdR1").attr("src",url);
			}
			else{
				$("#iframeIdR1").css('display','none');
			}
			}});
	</script>
</body>
<script type="text/javascript">
	$(function() {
		$('.input-right-icon').unbind("click");
	});
</script>
</html>