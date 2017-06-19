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
	

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId,executionId){
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
							disabled  />
							<input title="任务书编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="taskNo" id="taskNo"
							 disabled readonly /></td>
					</tr>
				</table>
			</form>
		</fieldset>
		<div style="width: 98%; margin-left: 1%; margin-right: 1%">
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
		</div>
		<div id="idea"></div>
	</div>
	<script type="text/javascript">
		//打开任务书选择页面
		function openDialogTripTask() {
			this.nData = new CommonDialog("model4", "790", "600", "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportTripTaskSelect", "产品选择", false, true, false);
			this.nData.show();
		};
		function setTripTaskData(data) {
			$("#model4").dialog("close");
	
		    $("#taskId").val(data.id);
		    
		    $("#taskNo").val(data.taskNo);
		   
	
		};
	</script>
</body>
</html>