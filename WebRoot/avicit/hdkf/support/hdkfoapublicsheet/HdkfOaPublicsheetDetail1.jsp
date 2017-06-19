<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
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
<!-- ControllerPath = "hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/Detail/id" -->
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
		if (!"${hdkfOaPublicsheetDTO.sentdate}" == "") {
			$('#sentdate').datebox(
					'setValue',
					parserColumnTime("${hdkfOaPublicsheetDTO.sentdate}")
							.format("yyyy-MM-dd"));
		}
		var sendDepDeptCommonSelector = new CommonSelector("dept",
				"deptSelectCommonDialog", "sendDep", "sendDepAlias");
		sendDepDeptCommonSelector.init();
		var receiveDepDeptCommonSelector = new CommonSelector("dept",
				"deptSelectCommonDialog", "receiveDep", "receiveDepAlias", "",
				"", "", -1);
		receiveDepDeptCommonSelector.init();
	});
	
	function openDialog() {
		this.nData = new CommonDialog(
				"model1",
				"790",
				"600",
				"hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/HdkfBdAircraftinfoInfo",
				"机型名称选择", false, true, false);
		this.nData.show();
	}
	function callBackDataConpany(data) {
		$("#model1").dialog("close");
		$("#planetype").val(data.modelName);

	}
	
	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							//这就是所要的值 result.Dept;
							result.hdkfOaPublicsheet.sentdate = formatDatebox(result.hdkfOaPublicsheet.sentdate);
							$("#formDetail").form('load',
									result.hdkfOaPublicsheet);
							$("#receiveDepAlias").val(result.Dept);
							$('#attribute03').combobox('setValue', result.hdkfOaPublicsheet.attribute03);
							
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
		
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项");
			return false;
		}
    if($("#sendreason").val() == ''){
   	 alert("请填写公用笺原因!");
   	 return false;
    }
    if($("#sheetcontent").val() == ''){
   	 alert("请填写公用笺内容!");
   	 return false;
    }
    if ($("#sendreason").val().length>1000) {
		alert("公用笺原因的长度不能超过1000！");
		return false;
	}
	if ($("#sheetcontent").val().length>1000) {
		alert("公用笺内容的长度不能超过1000！");
		return false;
	}
	if ($("#remarks").val().length>1000) {
		alert("备注的长度不能超过1000！");
		return false;
	}
		
			return true;
	}; 
	
	

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项");
			return;
		}
	     if($("#sendreason").val() == ''){
	    	 alert("请填写公用笺原因!");
	    	 return;
	     }
	     if($("#sheetcontent").val() == ''){
	    	 alert("请填写公用笺内容!");
	    	 return;
	     }
	     if ($("#sendreason").val().length>1000) {
				alert("公用笺原因的长度不能超过1000！");
				return;
			}
			if ($("#sheetcontent").val().length>1000) {
				alert("公用笺内容的长度不能超过1000！");
				return;
			}
			if ($("#remarks").val().length>1000) {
				alert("备注的长度不能超过1000！");
				return;
			}
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/save',
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

	function downloadPdf() {
		var pdfId = formId;
		var pdfUrl = "/HDKF/platform/hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/downloadPdf?id="
				+ pdfId;
		window.open(pdfUrl);
	}

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
				onclick="doBack();" href="javascript:void(0);">返回</a> <a
				class="easyui-linkbutton" iconCls="icon-print" plain="true"
				onclick="downloadPdf();" href="javascript:void(0);">生成PDF</a>
		</div>


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
					<th align="right"><span class="remind">*</span><label>公用笺编号</label></th>
						<td><input title="公用笺编号" class="easyui-validatebox"
						data-options="required:true"
							style="width: 180px;" type="text" name="sheetno" id="sheetno" /></td>


						<th width="10%"><span class="remind">*</span><label>发文单位</label></th>
						<td width="40%"><input title="{param.field.comment}"
							class="inputbox" style="width: 180px;" type="hidden"
							name="sendDep" id="sendDep" />
							<div class="">
								<input class="easyui-validatebox" name="sendDepAlias"
									id="sendDepAlias" style="width: 179px;"></input>
							</div></td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>发文日期</label></th>
						<td><input title="发文日期" class="easyui-datebox"
							style="width: 180px;" type="text" name="sentdate" id="sentdate" editable="false"/></td>
						<th width="10%"><label>分发单位</label></th>
						<td width="40%"><input title="{param.field.comment}"
							class="inputbox" style="width: 180px;" type="hidden"
							name="receiveDep" id="receiveDep" />
							<div class="">
								<input class="easyui-validatebox" name="receiveDepAlias"
									id="receiveDepAlias" style="width: 179px;">
								</input>
							</div></td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>机型</label></th>
						<td><input title="机型" class="easyui-validatebox"
							style="width: 180px;" type="text" name="planetype" id="planetype"
							onfocus="openDialog();"/></td>
						<th align="right"><span class="remind">*</span><label>批次</label></th>
						<td><input title="批次" class="easyui-numberbox easyui-validatebox"
						data-options="required:true"
							style="width: 180px;" type="text" name="batchNo" id="batchNo"/></td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>架次</label></th>
						<td><input title="架次" class="easyui-numberbox easyui-validatebox"
						data-options="required:true"
							style="width: 180px;" type="text" name="sortieNo" id="sortieNo"/></td>
						<!-- 
																																					<th align="right"><label>公用笺内容</label></th>
						<td>
						<input title="公用笺内容" class="easyui-validatebox" style="width: 180px;" type="text" name="sheetcontent" id="sheetcontent" disabled/>
						</td>
																</tr>
						<tr> 
																																<th align="right"><label>发笺原因</label></th>
						<td>
						<input title="发笺原因" class="easyui-validatebox" style="width: 180px;" type="text" name="sendreason" id="sendreason" disabled/>
						</td> -->
						<th align="right"><span class="remind">*</span><label>编写人</label></th>
						<td><input title="编写人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="recorder" id="recorder"
							readOnly="readOnly" /></td>	
					</tr>
					<!-- <tr>
																																<th align="right"><label>校对人</label></th>
						<td>
						<input title="校对人" class="easyui-validatebox" style="width: 180px;" type="text" name="proofreader" id="proofreader" disabled/>
						</td>
																																					<th align="right"><label>审核人</label></th>
						<td>
						<input title="审核人" class="easyui-validatebox" style="width: 180px;" type="text" name="reviewer" id="reviewer" disabled/>
						</td>
																</tr> -->
					
						<!-- 
																																<th align="right"><label>审定人</label></th>
						<td>
						<input title="审定人" class="easyui-validatebox" style="width: 180px;" type="text" name="approver" id="approver" disabled/>
						</td> -->
						<!-- <th align="right"><label>备注</label></th>
						<td><input title="备注" class="easyui-validatebox"
							style="width: 180px;" type="text" name="remarks" id="remarks"
							disabled /></td> -->
						<!-- </tr> -->
						<!-- <tr> -->
						<!-- <th align="right"><label>发笺原因</label></th>
						<td><input title="发笺原因" class="easyui-validatebox"
							style="width: 180px;" type="text" name="sendreason"
							id="sendreason" disabled /></td> -->
					
						<tr>
					    <th align="right"><label>信息处理卡编号</label></th>
						<td>
						<input title="信息处理卡编号" class="easyui-validatebox" 
						style="width: 180px;" type="text" name="attribute02" id="attribute02"  readOnly="readOnly"/>
						</td>
					<th align="right"><label>是否备件</label></th>
						<td><pt6:syslookup name="attribute03"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
						</tr>
						<tr>									
						<th align="right"><span class="remind">*</span><label>公用笺原因</label></th>
						<td colspan="3" align="left" style="padding-left: 3px"><textarea
							rows="6"
							data-options="required:true,validType:'maxLength[1000]'"
							class="textareabox" name="sendreason" id="sendreason"
							style="resize: none" ></textarea></td>
						</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>公用笺内容</label></th>
						<td colspan="3" align="left" style="padding-left: 3px"><textarea
								rows="8"
								data-options="required:true,validType:'maxLength[1000]'"
								class="textareabox" name="sheetcontent" id="sheetcontent"
								style="resize: none"></textarea></td>


					</tr>
					<tr>
						<th align="right"><label>备注</label></th>
						<td colspan="3" align="left" style="padding-left: 3px"><textarea
							rows="6"
							data-options="required:true,validType:'maxLength[1000]'"
							class="textareabox" name="remarks" id="remarks"
							style="resize: none"></textarea></td>		
						</tr>
					<tr>
					</tr>
				</table>
			</form>
		</fieldset>
		<div
			style="width: 98%; margin-left: 10px; margin-right: 20px; margin-top: 10px;">
			<jsp:include
				page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
				<jsp:param name="file_size_limit" value="1024 MB" />
				<jsp:param name="file_types" value="*.*" />
				<jsp:param name="file_upload_limit" value="10" />
				<jsp:param name="save_type" value="true" />
				<jsp:param name="form_id" value="<%=formId%>" />
				<jsp:param name="form_code" value="hdkfOaPublicsheet" />
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