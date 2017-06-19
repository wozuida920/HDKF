<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
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
	<!-- ControllerPath = "hdkf/support/hdkfsupporttaskarchive/HdkfSupportTaskArchiveController/operation/Detail/id" -->
	<title>详细</title>
	<base href="<%=ViewUtil.getRequestPath(request) %>">
	<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
	<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var entryId = "<%=entryId%>";
	var executionId = "<%=executionId%>";
	var taskId = "<%=taskId%>";
	var formId = "<%=formId%>"; 
	
	$(function(){
         if(!"${hdkfSupportTaskArchiveDTO.archiveTime}"==""){
            $('#archiveTime').datebox('setValue', parserColumnTime("${hdkfSupportTaskArchiveDTO.archiveTime}").format("yyyy-MM-dd"));
         }
     });
            
	//初始化页面值
	function initFormData(){
		$.ajax({
			url : 'platform/hdkf/support/hdkfsupporttaskarchive/HdkfSupportTaskArchiveController/toDetailJsp.json',
			data : {
				id : formId
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					result.hdkfSupportTaskArchive.archiveTime = formatDatebox(result.hdkfSupportTaskArchive.archiveTime);
                    $("#formDetail").form('load',result.hdkfSupportTaskArchive);
                    
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
		if ($('#attribute02').val() == '') {
			alert("部长对任务评价不能为空，请填写！");
			return false;
		}
		if ($("#attribute02").val().length>2000) {
			alert("部长对任务评价的长度不能超过2000！");
			return false;
		}
		return true;
	};
	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId,executionId){
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项");
			return;
		}
		if ($('#attribute02').val() == '') {
			alert("部长对任务评价不能为空，请填写！");
			return;
		}
		if ($("#attribute02").val().length>2000) {
			alert("部长对任务评价的长度不能超过2000！");
			return;
		}
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$.ajax({
			url : 'platform/hdkf/support/hdkfsupporttaskarchive/HdkfSupportTaskArchiveController/operation/save',
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
	function doBack(){
		if(parent!=null&&parent.$('#tabs')!=null){
			var currTab = parent.$('#tabs').tabs('getSelected');
			var currTitle = currTab.panel('options').title; 
			parent.$('#tabs').tabs('close',currTitle);
		}
	}
	//页面加载完成后入口
	$(function(){
		initFormData();
		//不控制表单权限
 		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId,executionId,taskId,formId);
		
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
	function toRequestDetail3() {

		if ($("#onOffBtn3").html() == '展开任务书详情') {
			//alert("here");
			var id = $("#taskId").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			
			//avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp
			var url = "avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp?id="
					+ id;

			$("#iframeId3").css('display', 'block');
			$("#iframeId3").attr("src", url);
			$("#onOffBtn3").html('收起任务书详情');
		} else {
			$("#iframeId3").css('display', 'none');
			$("#onOffBtn3").html('展开任务书详情');
		}
	}
	
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
		<div style="margin: 10px 5px 20px 10px;" id="relateTaskDiv">
			<span><a id="onOffBtn3" onclick="toRequestDetail3();"
				href="javascript:void(0)">展开任务书详情</a></span>

			<iframe id="iframeId3" width="99%" height="870" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
<!-- 						<th align="right"><label>任务书ID</label></th> -->
<!-- 						<td></td> -->
						<th width="10%"><label>任务书编号</label></th>
						<td width="40%"><input title="任务书ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="taskId" id="taskId" 
							disabled /><input title="任务书编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="taskNo" id="taskNo"
							disabled /></td>
							
<!-- 					    <th width="10%"><label><span class="remind">*</span>归档编号</label></th> -->
<!-- 						<td width="40%"><input title="归档编号" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="archiveNo" id="archiveNo" required="true" -->
<!-- 							disabled /></td> -->
	
<!-- 						<th align="right"><label><span class="remind">*</span>归档时间</label></th> -->
<!-- 						<td><input title="归档时间" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="archiveTime" required="true" -->
<!-- 							id="archiveTime" disabled /></td> -->
					</tr>
						<tr>
				
					<th align="right">处长对任务评价</th>
					<td  colspan="5" align="left" style="padding-left: 3px">
					<textarea rows="12"
						data-options="required:true,validType:'maxLength[4000]'" 
						class="textareabox" name="attribute01" id="attribute01"  
						style="resize:none"  disabled></textarea></td>
				</tr>
					<tr>
				
					<th align="right"><span class="remind">*</span>部长对任务评价</th>
					<td  colspan="5" align="left" style="padding-left: 3px">
					<textarea rows="12"
						data-options="required:true,validType:'maxLength[2000]'" 
						class="textareabox" name="attribute02" id="attribute02"  
						style="resize:none"  disabled></textarea></td>
				</tr>
				
					<tr>
					</tr>
				</table>
			</form>
		</fieldset>
		<div style="width: 98%; margin-left: 1%; margin-right: 18%">
			<fieldset>
				<legend>附件</legend>
				<div class="formExtendBase" style="margin-left: 10%">
					<div class="column" style="height: 130px;">
						<jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfViewInclude.jsp">
							<jsp:param name="form_id" value="<%=formId%>" />
							<jsp:param name="save_type" value="true" />
							<jsp:param name="file_category" value="PLATFORM_SEX" />
							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
						</jsp:include>
					</div>
				</div>
			</fieldset>
		</div>
		<div id="idea"></div>
	</div>
</body>
</html>