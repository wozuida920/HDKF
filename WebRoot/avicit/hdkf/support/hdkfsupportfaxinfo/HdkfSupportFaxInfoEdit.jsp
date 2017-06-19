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
<!-- ControllerPath = "hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfSupportFaxInfoDTO.id}'/>
				 <table class="form_commonTable">
				<tr>
																																<th width="10%">
															传真编号:</th>
				    <td width="40%">
																		<input title="传真编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="faxNo" id="faxNo" value='<c:out value='${hdkfSupportFaxInfoDTO.faxNo}'/>'/>
																</td>
																										<th width="10%">
															我方地址:</th>
				    <td width="40%">
																		<input title="我方地址" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="fromAddr" id="fromAddr" value='<c:out value='${hdkfSupportFaxInfoDTO.fromAddr}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															我方邮编:</th>
				    <td width="40%">
																		<input title="我方邮编" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="fromZipcode" id="fromZipcode" value='<c:out value='${hdkfSupportFaxInfoDTO.fromZipcode}'/>'/>
																</td>
																										<th width="10%">
															我方英语地址:</th>
				    <td width="40%">
																		<input title="我方英语地址" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="fromEnAddr" id="fromEnAddr" value='<c:out value='${hdkfSupportFaxInfoDTO.fromEnAddr}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															我方电话:</th>
				    <td width="40%">
																		<input title="我方电话" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="fromTel" id="fromTel" value='<c:out value='${hdkfSupportFaxInfoDTO.fromTel}'/>'/>
																</td>
																										<th width="10%">
															我方传真:</th>
				    <td width="40%">
																		<input title="我方传真" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="fromFax" id="fromFax" value='<c:out value='${hdkfSupportFaxInfoDTO.fromFax}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															发送人:</th>
				    <td width="40%">
											 <input title="{param.field.comment}" class="inputbox"  style="width: 182px;" type="hidden" name="fromUser" id="fromUser" value='${hdkfSupportFaxInfoDTO.fromUser}'/>
			 			 <div class=""><input class="easyui-validatebox"  name="fromUserAlias"   id="fromUserAlias"  readOnly="readOnly" value='<c:out  value='${hdkfSupportFaxInfoDTO.fromUserAlias}'/>' style="width:179px;" ></input></div>
										</td>
																										<th width="10%">
															发送日期:</th>
				    <td width="40%">
																  		<input title="发送日期" class="easyui-datebox"  style="width: 182px;" type="text" name="sendDate" id="sendDate" value='${hdkfSupportFaxInfoDTO.sendDate}'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															传真页数:</th>
				    <td width="40%">
																  		<input title="传真页数" class="easyui-numberbox easyui-validatebox" data-options="validType:'maxLength[22]'" style="width: 180px;" type="text" name="faxPages" id="faxPages" value='${hdkfSupportFaxInfoDTO.faxPages}'/>	
																</td>
																										<th width="10%">
															发往单位:</th>
				    <td width="40%">
																		<input title="发往单位" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="toUuit" id="toUuit" value='<c:out value='${hdkfSupportFaxInfoDTO.toUuit}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															发往单位传真号:</th>
				    <td width="40%">
																		<input title="发往单位传真号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="toFax" id="toFax" value='<c:out value='${hdkfSupportFaxInfoDTO.toFax}'/>'/>
																</td>
																										<th width="10%">
															接收人:</th>
				    <td width="40%">
																		<input title="接收人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="toUser" id="toUser" value='<c:out value='${hdkfSupportFaxInfoDTO.toUser}'/>'/>
																</td>
											</tr>
						<tr>
<%-- 						<th width="10%">
						传真内容:</th>
				    <td width="40%">
					<input title="传真内容" class="inputbox easyui-validatebox" 
					data-options="validType:'maxLength[4000]'" style="width: 180px;" 
					type="text" name="faxContent" id="faxContent" value='<c:out value='${hdkfSupportFaxInfoDTO.faxContent}'/>'/>
					</td> --%>
																										<th width="10%">
															请求处理ID:</th>
				    <td width="40%">
																		<input title="请求处理ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestDealId" id="requestDealId" value='<c:out value='${hdkfSupportFaxInfoDTO.requestDealId}'/>'/>
																</td>
<!-- 											</tr>
						<tr> -->
																										<th width="10%">
															处理单名称:</th>
				    <td width="40%">
																		<input title="处理单名称" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="dealName" id="dealName" value='<c:out value='${hdkfSupportFaxInfoDTO.dealName}'/>'/>
																</td>
																											</tr>
						<tr>
																										<th width="10%">
															求援请求ID:</th>
				    <td width="40%">
																		<input title="求援请求ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestId" id="requestId" value='<c:out value='${hdkfSupportFaxInfoDTO.requestId}'/>'/>
<!-- 																</td>
											</tr>
						<tr> -->
																										<th width="10%">
															信息处理卡编号:</th>
				    <td width="40%">
																		<input title="信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestNo" id="requestNo" value='<c:out value='${hdkfSupportFaxInfoDTO.requestNo}'/>'/>
																</td>
																											</tr>
						<tr>
																																																																																																																				</tr>
		</table>
		</form>
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
																																																			if(!"${hdkfSupportFaxInfoDTO.sendDate}"==""){
					$('#sendDate').datebox('setValue', parserColumnTime("${hdkfSupportFaxInfoDTO.sendDate}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																				var fromUserUserCommonSelector = new CommonSelector("user","userSelectCommonDialog","fromUser","fromUserAlias");
					fromUserUserCommonSelector.init(); 
																																																																																																																																																																																																																																																																																})
	function closeForm(){
		parent.hdkfSupportFaxInfo.closeDialog("#edit");
	}
	function saveForm(){
	   if ($('#form').form('validate') == false) {
                return;
            }
		parent.hdkfSupportFaxInfo.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>