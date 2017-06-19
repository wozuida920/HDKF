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
							data-options="validType:'maxLength[255]'" style="width: 180px;"
							type="text" name="bulletinNo" id="bulletinNo" /></td>
						<th width="10%"><label for="title"> 标题:</label></th>


						<td width="40%"><input title="标题"
							class="inputbox easyui-validatebox disabled pt6-disabled"
							data-options="validType:'maxLength[255]'" style="width: 180px;"
							type="text" name="title" id="title" /></td>
					</tr>
					
					
					
				</table>
			</form>
		</fieldset>
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
			
			//初始化页面值
			$
					.ajax({
						url : 'platform/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController//operation/toDetailJsp.json',
						data : {
							id : formId
						},
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
	</script>
</body>
<script type="text/javascript">
	$(function() {
		$('.input-right-icon').unbind("click");
	});
</script>
</html>