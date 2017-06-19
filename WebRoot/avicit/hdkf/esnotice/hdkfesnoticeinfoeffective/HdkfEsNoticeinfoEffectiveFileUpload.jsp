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
<!-- ControllerPath = "csmp/technicalBulletin/csmpesnoticeinfoeffective/CsmpEsNoticeinfoEffectiveController/operation/Add/null" -->
<title>添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
	
	<div id="AddModelInfoShow">
		<div style="margin-top:20px;"></div>
		<div style="width: 98%;margin-left: 1%;margin-right: 15%">
			<fieldset>
				<legend>附件</legend>
				<div class="formExtendBase">
					<div class="column" style="height: 150px;">
						<jsp:include page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
							<jsp:param value="1024MB" name="file_size_limit"/>
							<jsp:param value="*.*" name="file_types"/>
							<jsp:param value="10" name="file_upload_limit"/>
							<jsp:param value="false" name="save_type"/>
							<jsp:param value="${hdkfEsNoticeinfoEffectiveDTO.id}" name="form_id"/>
							<jsp:param value="HDKF_ES_NOTICEINFO_EFFECTIVE" name="form_code"/>  
							<jsp:param value="form_field" name="form_field"/>
							<jsp:param value="true" name="allowAdd"/>
							<jsp:param value="true" name="allowDel"/>
							<jsp:param value="true" name="cleanOnExit"/>
							<jsp:param value="PLATFORM_FILE_SECRET_LEVEL" name="secret_level"/>
						</jsp:include>
					</div>
				</div>
			</fieldset>
		</div>
	</div>	
	
	<div id="AddModelInfoDeatilShow">
		<div style="margin-top:20px;"></div>
		<div style="width: 98%;margin-left: 1%;margin-right: 15%">
			<fieldset>
			<legend>附件</legend>
				<div class="formExtendBase">
					<div class="column" style="height: 150px;">
						<jsp:include page="/avicit/platform6/modules/system/swfupload/swfViewInclude.jsp"> 
							<jsp:param name="form_id" value="${hdkfEsNoticeinfoEffectiveDTO.id}" /> 
					     	<jsp:param name="save_type" value="false" /> 
					     	<jsp:param name="file_category" value="PLATFORM_SEX" /> 
					     	<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL"/> 
				 		</jsp:include>
		 			</div>
				</div>
		</fieldset>
		</div>
	</div>
		
		<div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var typeId = '${typeId}';
			if(typeId == "AddModelInfo"){
				$('#AddModelInfoShow').show();
				$('#AddModelInfoDeatilShow').hide();
			}else if(typeId == "AddModelInfoDeatil"){
				$('#AddModelInfoShow').hide();
				$('#AddModelInfoDeatilShow').show();
			}
		});
		function closeForm() {
			//alert("close form....");
			parent.hdkfEsNoticeinfoEffective.searchData();
			//alert("hdkfEsNoticeinfoEffective");
			parent.hdkfEsNoticeinfoEffective.closeDialog("#fileUpload");
		}
	</script>
</body>
</html>