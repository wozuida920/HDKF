<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfoapublicsheet/HdkfOaPublicsheetController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
<div data-options="region:'center',split:true,border:false">
	<fieldset> 
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfOaPublicsheetDTO.id}'/>
				 <table class="form_commonTable">
				<tr>
																																<th width="10%">
															公用笺编号:</th>
				    <td width="40%">
																		<input title="公用笺编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="sheetno" id="sheetno" value='<c:out value='${hdkfOaPublicsheetDTO.sheetno}'/>'/>
																</td>
																										<th width="10%">
															发文单位:</th>
				    <td width="40%">
											 <input title="{param.field.comment}" class="inputbox"  style="width: 182px;" type="hidden" name="sendDep" id="sendDep" value='${hdkfOaPublicsheetDTO.sendDep}'/>
			 			 <div class=""><input class="easyui-validatebox"  name="sendDepAlias"   id="sendDepAlias"  readOnly="readOnly" value='<c:out  value='${hdkfOaPublicsheetDTO.sendDepAlias}'/>' style="width:179px;" ></input></div>
										</td>
											</tr>
						<tr>
																										<th width="10%">
															发文日期:</th>
				    <td width="40%">
																  		<input title="发文日期" class="easyui-datebox"  style="width: 182px;" type="text" name="sentdate" id="sentdate" value='${hdkfOaPublicsheetDTO.sentdate}'/>
																</td>
																										<th width="10%">
															分发单位:</th>
				    <td width="40%">
											 <input title="{param.field.comment}" class="inputbox"  style="width: 182px;" type="hidden" name="receiveDep" id="receiveDep" value='${hdkfOaPublicsheetDTO.receiveDep}'/>
			 			 <div class=""><input class="easyui-validatebox"  name="receiveDepAlias"   id="receiveDepAlias"  readOnly="readOnly" value='<c:out  value='${Dept}'/>'  style="width:179px;" ></input></div>
										</td>
											</tr>
						<tr>
																										<th width="10%">
															机型:</th>
				    <td width="40%">
																		<input title="机型" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="planetype" id="planetype" value='<c:out value='${hdkfOaPublicsheetDTO.planetype}'/>'/>
																</td> 
																										<th width="10%">
															批次:</th>
				    <td width="40%">
																		<input title="批次" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="batchNo" id="batchNo" value='<c:out value='${hdkfOaPublicsheetDTO.batchNo}'/>'/>
																</td>
											</tr> 
						<tr>
																										<th width="10%">
															架次:</th>
				    <td width="40%">
																		<input title="架次" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="sortieNo" id="sortieNo" value='<c:out value='${hdkfOaPublicsheetDTO.sortieNo}'/>'/>
																</td><%-- 
																										<th width="10%">
															公用笺内容:</th>
				    <td width="40%">
																		<input title="公用笺内容" class="inputbox easyui-validatebox" data-options="validType:'maxLength[2000]'" style="width: 180px;" type="text" name="sheetcontent" id="sheetcontent" value='<c:out value='${hdkfOaPublicsheetDTO.sheetcontent}'/>'/>
																</td> --%>
						<!-- 					</tr>
						<tr> --><%-- 
																										<th width="10%">
															发笺原因:</th>
				    <td width="40%">
																		<input title="发笺原因" class="inputbox easyui-validatebox" data-options="validType:'maxLength[500]'" style="width: 180px;" type="text" name="sendreason" id="sendreason" value='<c:out value='${hdkfOaPublicsheetDTO.sendreason}'/>'/>
																</td> --%>
																										<th width="10%">
															编写人:</th>
				    <td width="40%">
																		<input title="编写人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="recorder" id="recorder" value='<c:out value='${hdkfOaPublicsheetDTO.recorder}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															校对人:</th>
				    <td width="40%">
																		<input title="校对人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="proofreader" id="proofreader" value='<c:out value='${hdkfOaPublicsheetDTO.proofreader}'/>'/>
																</td>
																										<th width="10%">
															审核人:</th>
				    <td width="40%">
																		<input title="审核人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="reviewer" id="reviewer" value='<c:out value='${hdkfOaPublicsheetDTO.reviewer}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															审定人:</th>
				    <td width="40%">
																		<input title="审定人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="approver" id="approver" value='<c:out value='${hdkfOaPublicsheetDTO.approver}'/>'/>
																</td>
																										<th width="10%">
															备注:</th>
				    <td width="40%">
																		<input title="备注" class="inputbox easyui-validatebox" data-options="validType:'maxLength[1000]'" style="width: 180px;" type="text" name="remarks" id="remarks" value='<c:out value='${hdkfOaPublicsheetDTO.remarks}'/>'/>
																</td>
											</tr>
						<tr>
						
																										<th width="10%">
															发笺原因:</th>
				    <td width="40%">
																		<input title="发笺原因" class="inputbox easyui-validatebox" data-options="validType:'maxLength[500]'" style="width: 180px;" type="text" name="sendreason" id="sendreason" value='<c:out value='${hdkfOaPublicsheetDTO.sendreason}'/>'/>
																</td>
																
						 </tr>
						<tr>
						
				  <th width="10%">公用笺内容:</th>
				    <td colspan="3" align="left" style="padding-left: 3px"><textarea
				    rows="12"	
					data-options="required:true,validType:'maxLength[2000]'"
					class="textareabox"	name="sheetcontent" id="sheetcontent" 
					style="resize: none"><c:out value='${hdkfOaPublicsheetDTO.sheetcontent}'/></textarea></td>
																									
						</tr>										
																
																
						<tr>
																																																																																																																				</tr>
		</table>
		</form>
			<jsp:include page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
            <jsp:param name="file_size_limit" value="5000MB" />
            <jsp:param name="file_types" value="*.*" />
            <jsp:param name="file_upload_limit" value="10" />
            <jsp:param name="save_type" value="true" /> 
            <jsp:param name="form_id" value="${hdkfOaPublicsheetDTO.id}" />
            <jsp:param name="form_code" value="hdkfOaPublicsheet" />
            <jsp:param name="form_field" value="" />
            <jsp:param name="allowAdd" value="true" />
            <jsp:param name="allowDel" value="true" />
            <jsp:param name="cleanOnExit" value="true" />
            <jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
            </jsp:include>
					</fieldset>
		
		
		
				
		 <div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>	
					<td width="60%" align="right">
					<a title="保存" id="saveButton"  class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a>
					<a title="返回" id="returnButton"  class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a>
					</td>		
				</tr>
			</table>
		</div>
	</div>
	
	<script type="text/javascript">
	     $.extend($.fn.validatebox.defaults.rules, {    
        maxLength: {    
            validator: function(value, param){    
                return param[0] >= value.length;
                
            },    
            message: '请输入最多 {0} 字符.'   
        }    
    });  
	$(function(){
																										if(!"${hdkfOaPublicsheetDTO.sentdate}"==""){
					$('#sentdate').datebox('setValue', parserColumnTime("${hdkfOaPublicsheetDTO.sentdate}").format("yyyy-MM-dd"));
				}
					var sendDepDeptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","sendDep","sendDepAlias");
					sendDepDeptCommonSelector.init();
					
					
					var receiveDepDeptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","receiveDep","receiveDepAlias","","","",-1);
					receiveDepDeptCommonSelector.init();
																																																																																																																																																																																																																																																																																
	})																																																																																																																																																																																																																																																																											
	function closeForm(){
		parent.hdkfOaPublicsheet.closeDialog("#edit");
	}
	function saveForm(){
	   if ($('#form').form('validate') == false) {
                return;
            }
		parent.hdkfOaPublicsheet.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>