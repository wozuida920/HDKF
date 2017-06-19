<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController/operation/Edit/id" -->
<title>修改</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
						<input type="hidden" name="version" value='${hdkfSupportDesignChangeDTO.version}' />
												<input type="hidden" name="id" value='${hdkfSupportDesignChangeDTO.id}'/>
								
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
							 <table class="form_commonTable">
					<tr>
																																																														<th width="10%">
																								外场信息处理卡编号:</th>
								<td width="40%">
																											<input title="外场信息处理卡编号" class="inputbox easyui-validatebox" data-options="validType:'maxLength[40]'" style="width: 180px;" type="text" name="infoCardNo" id="infoCardNo" value='<c:out value='${hdkfSupportDesignChangeDTO.infoCardNo}'/>'/>
																									</td>
																																															<th width="10%">
																								是否更改单标志:</th>
								<td width="40%">
								                                     <pt6:syslookup name="beforeFlag" lookupCode="PLATFORM_YES_NO_FLAG" isNull="true" defaultValue='${hdkfSupportDesignChangeDTO.beforeFlag}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
																</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								更改之后标志:</th>
								<td width="40%">
								                                     <pt6:syslookup name="afterFlag" lookupCode="PLATFORM_YES_NO_FLAG" isNull="true" defaultValue='${hdkfSupportDesignChangeDTO.afterFlag}' dataOptions="width:180,editable:false,panelHeight:'auto'">
                                     </pt6:syslookup> 
																</td>
																																															<th width="10%">
																								操作人ID:</th>
								<td width="40%">
																											<input title="操作人ID" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="operateUserId" id="operateUserId" value='<c:out value='${hdkfSupportDesignChangeDTO.operateUserId}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								操作人:</th>
								<td width="40%">
																											<input title="操作人" class="inputbox easyui-validatebox" data-options="validType:'maxLength[50]'" style="width: 180px;" type="text" name="operateUserName" id="operateUserName" value='<c:out value='${hdkfSupportDesignChangeDTO.operateUserName}'/>'/>
																									</td>
																																															<th width="10%">
																								变更理由:</th>
								<td width="40%">
																											<input title="变更理由" class="inputbox easyui-validatebox" data-options="validType:'maxLength[2000]'" style="width: 180px;" type="text" name="changeReason" id="changeReason" value='<c:out value='${hdkfSupportDesignChangeDTO.changeReason}'/>'/>
																									</td>
																	</tr>
									<tr>
																																															<th width="10%">
																								变更时间:</th>
								<td width="40%">
																									  		<input title="变更时间" class="easyui-datebox"  style="width: 182px;" type="text" name="changeTime" id="changeTime" value='${hdkfSupportDesignChangeDTO.changeTime}'/>
																									</td>
																																																																																																																																																																																																																																																											</tr>
					</table>
					</form>
	 
	</div>  
	<div data-options="region:'south',border:false" style="height:40px;">
    		 <div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>	
					<td width="50%" align="right">
						<a title="保存" id="saveButton" class="easyui-linkbutton primary-btn" onclick="saveForm();" href="javascript:void(0);">保存</a>
						<a title="返回" id="returnButton" class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a>
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
																																														if(!"${hdkfSupportDesignChangeDTO.changeTime}"==""){
					$('#changeTime').datebox('setValue', parserColumnTime("${hdkfSupportDesignChangeDTO.changeTime}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																})
	function closeForm(){
		parent.hdkfSupportDesignChange.closeDialog("#edit");
	}
	function saveForm(){
	    if ($('#form').form('validate') == false) {
            return;
        }
	$('#saveButton').linkbutton('disable').unbind("click");
		parent.hdkfSupportDesignChange.save(serializeObject($('#form')),"#edit");
	}
	</script>
</body>
</html>