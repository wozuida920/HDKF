<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportdesignchange/HdkfSupportDesignChangeController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false" style="overflow:hidden;padding-bottom:35px;">
		<form id='form'>
									<input type="hidden" name="id" value='${hdkfSupportDesignChangeDTO.id}'/>
												<input type="hidden" name="id" value='${hdkfSupportDesignChangeDTO.id}'/>
																																																																																																																																														<table width="100%" style="padding-top: 10px;">
		<tr>
																																<th align="right">
															外场信息处理卡编号:</th>
					<td>
																		<input title="外场信息处理卡编号" class="inputbox" style="width: 180px;" type="text" name="infoCardNo" id="infoCardNo" readonly="readonly" value='${hdkfSupportDesignChangeDTO.infoCardNo}'/>
																</td>
																										<th align="right">
															是否更改单标志:</th>
					<td>
																		<input title="是否更改单标志" class="inputbox" style="width: 180px;" type="text" name="beforeFlag" id="beforeFlag" readonly="readonly" value='${hdkfSupportDesignChangeDTO.beforeFlag}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															更改之后标志:</th>
					<td>
																		<input title="更改之后标志" class="inputbox" style="width: 180px;" type="text" name="afterFlag" id="afterFlag" readonly="readonly" value='${hdkfSupportDesignChangeDTO.afterFlag}'/>
																</td>
																										<th align="right">
															操作人ID:</th>
					<td>
																		<input title="操作人ID" class="inputbox" style="width: 180px;" type="text" name="operateUserId" id="operateUserId" readonly="readonly" value='${hdkfSupportDesignChangeDTO.operateUserId}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															操作人:</th>
					<td>
																		<input title="操作人" class="inputbox" style="width: 180px;" type="text" name="operateUserName" id="operateUserName" readonly="readonly" value='${hdkfSupportDesignChangeDTO.operateUserName}'/>
																</td>
																										<th align="right">
															变更理由:</th>
					<td>
																		<input title="变更理由" class="inputbox" style="width: 180px;" type="text" name="changeReason" id="changeReason" readonly="readonly" value='${hdkfSupportDesignChangeDTO.changeReason}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															变更时间:</th>
					<td>
																  		<input title="变更时间" class="easyui-datebox" style="width: 180px;" type="text" name="changeTime" id="changeTime" readonly="readonly" value='${hdkfSupportDesignChangeDTO.changeTime}'/>
																</td>
																																																																																																																				</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
																																														if(!"${hdkfSupportDesignChangeDTO.changeTime}"==""){
					$('#changeTime').datebox('setValue', parserColumnTime("${hdkfSupportDesignChangeDTO.changeTime}").format("yyyy-MM-dd"));
				}
																																																																																																																																																																																																																																																																																																																																																});
	</script>
</body>
</html>