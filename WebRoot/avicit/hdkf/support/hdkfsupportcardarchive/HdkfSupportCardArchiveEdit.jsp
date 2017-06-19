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
<!-- ControllerPath = "hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${hdkfSupportCardArchiveDTO.id}'/>
				 <table class="form_commonTable">
				<tr>
																																<th width="10%">
															归档类别:</th>
				    <td width="40%">
					                                     <pt6:syslookup name="archiveType" lookupCode="SUPPORT_ARCHIVE_TYPE" defaultValue='${hdkfSupportCardArchiveDTO.archiveType}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
										</td>
																										<th width="10%">
															答复文号:</th>
				    <td width="40%">
																		<input title="答复文号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="respId" id="respId" value='<c:out value='${hdkfSupportCardArchiveDTO.respId}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															答复文号:</th>
				    <td width="40%">
																		<input title="答复文号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="respNo" id="respNo" value='<c:out value='${hdkfSupportCardArchiveDTO.respNo}'/>'/>
																</td>
																										<th width="10%">
															处理ID:</th>
				    <td width="40%">
																		<input title="处理ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="dealId" id="dealId" value='<c:out value='${hdkfSupportCardArchiveDTO.dealId}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															赴外场出发时间:</th>
				    <td width="40%">
																  		<input title="赴外场出发时间" class="easyui-datebox"  style="width: 182px;" type="text" name="tripStartTime" id="tripStartTime" value='${hdkfSupportCardArchiveDTO.tripStartTime}'/>
																</td>
																										<th width="10%">
															求援请求ID:</th>
				    <td width="40%">
																		<input title="求援请求ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestId" id="requestId" value='<c:out value='${hdkfSupportCardArchiveDTO.requestId}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															求援信息编号:</th>
				    <td width="40%">
																		<input title="求援信息编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="requestNo" id="requestNo" value='<c:out value='${hdkfSupportCardArchiveDTO.requestNo}'/>'/>
																</td>
																										<th width="10%">
															归档编号:</th>
				    <td width="40%">
																		<input title="归档编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="archiveNo" id="archiveNo" value='<c:out value='${hdkfSupportCardArchiveDTO.archiveNo}'/>'/>
																</td>
											</tr>
						<tr>
																										<th width="10%">
															归档时间:</th>
				    <td width="40%">
																  		<input title="归档时间" class="easyui-datebox"  style="width: 182px;" type="text" name="archiveTime" id="archiveTime" value='${hdkfSupportCardArchiveDTO.archiveTime}'/>
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
																																				if(!"${hdkfSupportCardArchiveDTO.tripStartTime}"==""){
					$('#tripStartTime').datebox('setValue', parserColumnTime("${hdkfSupportCardArchiveDTO.tripStartTime}").format("yyyy-MM-dd"));
				}
																											if(!"${hdkfSupportCardArchiveDTO.archiveTime}"==""){
					$('#archiveTime').datebox('setValue', parserColumnTime("${hdkfSupportCardArchiveDTO.archiveTime}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																																																		})
	function closeForm(){
		parent.hdkfSupportCardArchive.closeDialog("#edit");
	}
	function saveForm(){
	   if ($('#form').form('validate') == false) {
                return;
            }
		parent.hdkfSupportCardArchive.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>