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
<!-- ControllerPath = "hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfSupportDealByKfDTO.id}'/>
				 <table class="form_commonTable">
				<tr>
																																<th width="10%">
											<span style="color:red;">*</span>
										求援请求ID:</th>
				    <td width="40%">
																		<input title="求援请求ID" class="easyui-validatebox" data-options="required:true,validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestId" id="requestId" value='<c:out value='${hdkfSupportDealByKfDTO.requestId}'/>'/>
							                                                                                                                                                                                             
																</td>
																										<th width="10%">
															信息处理卡编号:</th>
				    <td width="40%">
																		<input title="信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestNo" id="requestNo" value='<c:out value='${hdkfSupportDealByKfDTO.requestNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															处理名称:</th>
				    <td width="40%">
																		<input title="处理名称" class="inputbox easyui-validatebox" data-options="validType:'maxLength[100]'" style="width: 180px;" type="text" name="dealName" id="dealName" value='<c:out value='${hdkfSupportDealByKfDTO.dealName}'/>'/>
																</td>
																										<th width="10%">
															是否客服部自己处理:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="isSelfDeal" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportDealByKfDTO.isSelfDeal}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
											</tr>
						<tr>
																										<th width="10%">
															外场信息处理卡ID:</th>
				    <td width="40%">
																		<input title="外场信息处理卡ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="outfieldCardId" id="outfieldCardId" value='<c:out value='${hdkfSupportDealByKfDTO.outfieldCardId}'/>'/>
																</td>
																										<th width="10%">
															外场信息处理卡编号:</th>
				    <td width="40%">
																		<input title="外场信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="outfieldCardNo" id="outfieldCardNo" value='<c:out value='${hdkfSupportDealByKfDTO.outfieldCardNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															处理处室:</th>
				    <td width="40%">
											 <input title="{param.field.comment}" class="inputbox"  style="width: 182px;" type="hidden" name="dealDepartId" id="dealDepartId" value='${hdkfSupportDealByKfDTO.dealDepartId}'/>
			 			 <div class=""><input class="easyui-validatebox"  name="dealDepartIdAlias"   id="dealDepartIdAlias"  readOnly="readOnly" value='<c:out  value='${hdkfSupportDealByKfDTO.dealDepartIdAlias}'/>' style="width:179px;" ></input></div>
										</td>
																										<th width="10%">
															技术员:</th>
				    <td width="40%">
																		<input title="技术员" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="dealUserId" id="dealUserId" value='<c:out value='${hdkfSupportDealByKfDTO.dealUserId}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															技术员姓名:</th>
				    <td width="40%">
																		<input title="技术员姓名" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="dealUserName" id="dealUserName" value='<c:out value='${hdkfSupportDealByKfDTO.dealUserName}'/>'/>
																</td>
																										<th width="10%">
															处理结论:</th>
				    <td width="40%">
																		<input title="处理结论" class="inputbox easyui-validatebox" data-options="validType:'maxLength[4000]'" style="width: 180px;" type="text" name="dealSolution" id="dealSolution" value='<c:out value='${hdkfSupportDealByKfDTO.dealSolution}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															是否赴外场:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="isOutfield" lookupCode="PLATFORM_YES_NO_FLAG" defaultValue='${hdkfSupportDealByKfDTO.isOutfield}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
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
																																																																																																																																																																																																																																																																																																		var dealDepartIdDeptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","dealDepartId","dealDepartIdAlias");
					dealDepartIdDeptCommonSelector.init();
																																																																																																																																																																																})
	function closeForm(){
		parent.hdkfSupportDealByKf.closeDialog("#edit");
	}
	function saveForm(){
	   if ($('#form').form('validate') == false) {
                return;
            }
		parent.hdkfSupportDealByKf.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>