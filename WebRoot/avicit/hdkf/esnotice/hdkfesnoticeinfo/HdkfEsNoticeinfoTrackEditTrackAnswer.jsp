<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="version" value='${hdkfEsNoticeinfoDTO.version}' />
				<input type="hidden" name="id" value='${hdkfEsNoticeinfoDTO.id}'/>
					<table class="form_commonTable">
					<tr>
					<th width="15%">通告编号:</th>
					<td width="35%"><input title="通告编号" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="bulletinNo" id="bulletinNo" value='<c:out value='${hdkfEsNoticeinfoDTO.bulletinNo}'/>'/>
					</td>
					<th width="15%">标题:</th>
					<td width="35%"><input title="标题" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="title" id="title" value='<c:out value='${hdkfEsNoticeinfoDTO.title}'/>'/>
					</td>
					</tr>
<%-- 					<tr>
					<th width="10%">机关联系人:</th>
					<td width="40%"><input title="机关联系人" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="organContact" id="organContact" value='<c:out value='${hdkfEsNoticeinfoDTO.organContact}'/>'/>
					</td>																			
					<th width="10%">机关联系人电话:</th>
					<td width="40%"><input title="机关联系人电话" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" 
					name="telephone" id="telephone" value='<c:out value='${hdkfEsNoticeinfoDTO.telephone}'/>'/>
					</td>
					</tr>
					<tr>
					<th width="10%">通报类型 :</th>
					<td width="40%"><pt6:syslookup name="bulletinType" isNull="true" 
					lookupCode="CSMP_ES_INFO_TYPE" defaultValue='${hdkfEsNoticeinfoDTO.bulletinType}' 
					dataOptions="width:180,editable:false,panelHeight:'auto'">
					</pt6:syslookup> 
					</td>
					<th width="10%">材料提供方式:</th>
					<td width="40%"><pt6:syslookup name="materialSupply" isNull="true" 
					lookupCode="CSMP_ES_PROVIDE_MATERIAL" defaultValue='${hdkfEsNoticeinfoDTO.materialSupply}' 
					dataOptions="width:180,editable:false,panelHeight:'auto'">
					</pt6:syslookup> 
					</td>
					</tr>
					<tr>
					<th width="10%">实施单位:</th>
					<td width="40%"><pt6:syslookup name="implementCompany" isNull="true" 
					lookupCode="CSMP_ES_IMPLEMENT_COMPANY" defaultValue='${hdkfEsNoticeinfoDTO.implementCompany}' 
					dataOptions="width:180,editable:false,panelHeight:'auto'">
					</pt6:syslookup>
					</td>
					<th width="10%">预计上报日期:</th>
					<td width="40%"><input title="预计上报日期" class="easyui-datebox"  editable="false" 
					style="width: 182px;" type="text" name="reportDate" id="reportDate" 
					value='${hdkfEsNoticeinfoDTO.reportDate}'/>
					</td>
					</tr>
					<tr>
					<th width="10%">编者:</th>
					<td width="40%"><input title="编者" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="author" 
					id="author" value='<c:out value='${hdkfEsNoticeinfoDTO.author}'/>'/>
					</td>
					<th width="10%">编发单位:</th>
					<td width="40%"><input title="编发单位" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="fileCompany" id="fileCompany" value='<c:out value='${hdkfEsNoticeinfoDTO.fileCompany}'/>'/>
					</td>
					</tr>
					<tr>
					<th width="10%">电话:</th>
					<td width="40%"><input title="电话" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" 
					name="companyTel" id="companyTel" value='<c:out value='${hdkfEsNoticeinfoDTO.companyTel}'/>'/>
					</td>
					<th width="10%">是否包含器材:</th>
					<td width="40%"><pt6:syslookup name="includeMars" isNull="true" 
					lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfEsNoticeinfoDTO.includeMars}' 
					dataOptions="width:180,editable:false,panelHeight:'auto'">
					</pt6:syslookup> 
					</td>
					</tr>
					<tr>
					<th width="10%">预计发布日期:</th>
					<td width="40%"><input title="预计发布日期" class="easyui-datebox"  editable="false" 
					style="width: 182px;" type="text" name="publishDate" id="publishDate" 
					value='${hdkfEsNoticeinfoDTO.publishDate}'/>
					</td>
					<th width="10%">预计应完成日期:</th>
					<td width="40%"><input title="预计应完成日期" class="easyui-datebox"  editable="false" 
					style="width: 182px;" type="text" name="completeDate" id="completeDate" 
					value='${hdkfEsNoticeinfoDTO.completeDate}'/>
					</td>
					</tr>
					<tr>
					<th width="10%">更改单号:</th>
					<td width="40%"><input title="更改单号" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="changeNo" id="changeNo" value='<c:out value='${hdkfEsNoticeinfoDTO.changeNo}'/>'/>
					</td>
					<th width="10%">执行要求:</th>
					<td width="40%"><input title="执行要求" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[1024]'" style="width: 180px;" type="text" 
					name="performRequirement" id="performRequirement" 
					value='<c:out value='${hdkfEsNoticeinfoDTO.performRequirement}'/>'/>
					</td>
					</tr>
					<tr>
					<th width="10%">换版内容:</th>
					<td width="40%"><input title="换版内容" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[1024]'" style="width: 180px;" type="text" 
					name="changeComment" id="changeComment" value='<c:out value='${hdkfEsNoticeinfoDTO.changeComment}'/>'/>
					</td>
					<th width="10%">备注:</th>
					<td width="40%">
					<input title="备注" class="inputbox easyui-validatebox" data-options="validType:'maxLength[1024]'" 
					style="width: 180px;" type="text" name="remark" id="remark" 
					value='<c:out value='${hdkfEsNoticeinfoDTO.remark}'/>'/>
					</td>
					</tr> --%>
<%-- 					<tr>
					<th width="10%">上报文号:</th>
					<td width="40%"><input title="上报文号" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="reportNo" id="reportNo" value='<c:out value='${hdkfEsNoticeinfoDTO.reportNo}'/>'/>
					</td>
					<th width="10%">上报时间:</th>
					<td width="40%"><input title="上报时间" class="easyui-datebox"  editable="false" style="width: 182px;" 
					type="text" name="reportTime" id="reportTime" value='${hdkfEsNoticeinfoDTO.reportTime}'/>
					</td>
					</tr> --%>
					 <tr>
					<th width="15%"><span class="remind">*</span>批复文号:</th>
					<td width="35%"><input title="批复文号" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="replyNo" id="replyNo" value='<c:out value='${hdkfEsNoticeinfoDTO.replyNo}'/>'/>
					</td>
					<th width="15%"><span class="remind">*</span>批复时间:</th>
					<td width="35%"><input title="批复时间" class="easyui-datebox" editable="false" 
					style="width: 182px;" type="text" name="replyTime" id="replyTime" required="true"
					value='${hdkfEsNoticeinfoDTO.replyTime}'/>
					</td>
					</tr>
					<tr>
					<th width="15%"><span class="remind">*</span>应完成时间:</th>
					<td width="35%"><input title="应完成时间" class="easyui-datebox" editable="false" 
					style="width: 182px;" type="text" name="completeTime" id="completeTime" 
					required="true" value='${hdkfEsNoticeinfoDTO.completeTime}'/>
					</td>
<%-- 					<th width="10%">转发文号:</th>
					<td width="40%"><input title="转发文号" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[255]'" style="width: 180px;" type="text" 
					name="forwardNo" id="forwardNo" value='<c:out value='${hdkfEsNoticeinfoDTO.forwardNo}'/>'/>
					</td>
					</tr>
					<tr>
					<th width="10%">转发时间:</th>
					<td width="40%"><input title="转发时间" class="easyui-datebox"  editable="false" 
					style="width: 182px;" type="text" name="forwardTime" id="forwardTime" 
					value='${hdkfEsNoticeinfoDTO.forwardTime}'/>
					</td> --%>
					</tr> 
					<tr>
					</tr>																																																																																																																																																																																																																																																						</tr>
				</table>
			</form>
<%-- 		<jsp:include page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
			<jsp:param name="file_size_limit" value="5000MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" /> 
		   <jsp:param name="form_id" value='${hdkfEsNoticeinfoDTO.id}' />
			<jsp:param name="form_code" value="hdkfEsNoticeinfo" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="hiddenUploadBtn" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include> --%>		
	</div>
	<div data-options="region:'south',border:false" style="height:40px;">
	 	<div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>	
					<td width="50%" align="right">
					<!--<a title="保存" id="saveButton"  hidden="true" class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a> -->
					<a title="保存" id="saveButton"  class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a>
					<a title="返回" id="returnButton" class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
 	 	<script
		src="avicit/hdkf/esnotice/hdkfesnoticeinfo/js/HdkfEsNoticeinfoTack.js"
		type="text/javascript"></script> 
<!-- 	<script src="avicit/hdkf/esnotice/hdkfesnoticeinfo/js/HdkfEsNoticeinfo.js" type="text/javascript"></script>
	 --><script type="text/javascript">
	
		$.extend($.fn.validatebox.defaults.rules, {	
		maxLength: {	
			validator: function(value, param){	
				return param[0] >= value.length;
				
			},	
			message: '请输入最多 {0} 字符.'   
		}	
	});  
	$(function(){

																																																			if(!"${hdkfEsNoticeinfoDTO.reportDate}"==""){
					$('#reportDate').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.reportDate}").format("yyyy-MM-dd"));
				}
																																if(!"${hdkfEsNoticeinfoDTO.publishDate}"==""){
					$('#publishDate').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.publishDate}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfEsNoticeinfoDTO.completeDate}"==""){
					$('#completeDate').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.completeDate}").format("yyyy-MM-dd"));
				}
																																					if(!"${hdkfEsNoticeinfoDTO.reportTime}"==""){
					$('#reportTime').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.reportTime}").format("yyyy-MM-dd"));
				}
																	if(!"${hdkfEsNoticeinfoDTO.replyTime}"==""){
					$('#replyTime').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.replyTime}").format("yyyy-MM-dd"));
				}
												if(!"${hdkfEsNoticeinfoDTO.completeTime}"==""){
					$('#completeTime').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.completeTime}").format("yyyy-MM-dd"));
				}
																	if(!"${hdkfEsNoticeinfoDTO.forwardTime}"==""){
					$('#forwardTime').datebox('setValue', parserColumnTime("${hdkfEsNoticeinfoDTO.forwardTime}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																})
	
	function closeForm(){
		parent.hdkfEsNoticeinfo.closeDialog("#trackEditTrackAnswer");
	}
	
	var issubmitflow = false;
	function saveForm(){
	//	issubmitflow = _issubmitflow;
	
		if ($('#form').form('validate') == false) {
			alert("请填写完整数据！");
			return;
		}
		
		if ($("#replyNo").val() == '') {
			
			alert("请填写批复文号！");
			return;
		}
		
		
		if($("replyTime").val()==''){
			alert("请填写时间！");
			return;
		}
		
		if($("completeTime").val()==''){
			alert("请填写时间！");
			return;
		}
		//$('#saveButton').linkbutton('disable').unbind("click");
		parent.hdkfEsNoticeinfo.save(serializeObject($('#form')),"#trackEditTrackAnswer");
	}
	function callback(id){
		$("#id").val(id);
		//parent.hdkfEsNoticeinfo.ShowMask("开始保存附件...");
		var flag = upload(id);
		if(flag == 0){
			closeForm();
		}
	}
	
	function afterUploadEvent(){
		closeForm();
	}
	</script>
</body>
</html>