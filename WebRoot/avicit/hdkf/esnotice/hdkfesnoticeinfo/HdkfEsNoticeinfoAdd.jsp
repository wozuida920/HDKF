<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/Add/null" -->
<title>添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" id="id" name="id" />
			<table class="form_commonTable">
				<tr>
					<th width="10%"><span class="remind">*</span>通报编号:</th>
					<td width="40%"><input title="通报编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
					type="text" name="bulletinNo" id="bulletinNo" /></td>
				</tr>
				<tr>
					<th width="10%"><span class="remind">*</span>通报标题:</th>
					<td width="80%"><input title="通报标题"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 360px;"
						type="text" name="title" id="title" /></td>
				</tr>
			
			</table>
		</form>
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
			<jsp:param name="file_size_limit" value="5000MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="" />
			<jsp:param name="form_code" value="hdkfEsNoticeinfo" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="hiddenUploadBtn" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
	</div>
	<div data-options="region:'south',border:false" style="height: 40px;">
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right">
						<!--<a title="保存" id="saveButton" hidden="true" class="easyui-linkbutton primary-btn" onclick="saveForm(false);" href="javascript:void(0);">保存</a> -->
						<a title="保存并启动流程" id="saveStartButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm(true);"
						href="javascript:void(0);">保存并启动流程</a> <a title="返回"
						id="returnButton" class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var attachBusinessId = "";

		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		$(function() {
			
		
			/* var userCommonSelector = new CommonSelector("user","userSelectCommonDialog","userName","userNameName");
			userCommonSelector.init();  */
			//选择部门
			/* var deptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","userName","userNameName");
			deptCommonSelector.init();  */
			//选择角色
			/* var roleCommonSelector = new CommonSelector("role","roleSelectCommonDialog","userName","userNameName",null,null,null);
			roleCommonSelector.init();  */
			/*  //选择群组
			var groupCommonSelector = new CommonSelector("group","groupSelectCommonDialog","userName","userNameName",null,null,null);
			groupCommonSelector.init(); 
			//选择岗位
			var positionCommonSelector = new CommonSelector("position","positionSelectCommonDialog","userName","userNameName");
			positionCommonSelector.init();  */
		});
		function closeForm() {
			parent.hdkfEsNoticeinfo.closeDialog("#insert");
		}
		var issubmitflow = false;
		function saveForm(_issubmitflow) {
			issubmitflow = _issubmitflow;
			if ($('#form').form('validate') == false) {
				alert("请检查表单必填项！");
				return;
			}
			//$('#saveButton').linkbutton('disable').unbind("click");
			$('#saveStartButton').linkbutton('disable').unbind("click");
			//parent.hdkfEsNoticeinfo.ShowMask("开始保存数据...");
			parent.hdkfEsNoticeinfo.save(serializeObject($('#form')), callback);
		}
		function callback(id) {
			$("#id").val(id);
			//parent.hdkfEsNoticeinfo.ShowMask("开始保存附件...");
			var flag = upload(id);
			if (flag == 0) {
				if (issubmitflow) {
					parent.hdkfEsNoticeinfo.saveFormAndStartFlow(
							serializeObject($('#form')), "#insert");
				} else {
					//parent.hdkfEsNoticeinfo.HidMask();
				}
			}
		}

		function afterUploadEvent() {
			if (issubmitflow) {
				parent.hdkfEsNoticeinfo.saveFormAndStartFlow(
						serializeObject($('#form')), "#insert");
			} else {
				//parent.hdkfEsNoticeinfo.HidMask();
			}
		}
	</script>
</body>
</html>