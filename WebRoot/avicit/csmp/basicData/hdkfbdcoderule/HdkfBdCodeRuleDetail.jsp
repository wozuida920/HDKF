<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false" style="overflow:hidden;padding-bottom:35px;">
		<form id='form'>
									<input type="hidden" name="id" value='${hdkfBdCodeRuleDTO.id}'/>
												<input type="hidden" name="id" value='${hdkfBdCodeRuleDTO.id}'/>
																																																																																																																																				<table width="100%" style="padding-top: 10px;">
		<tr>
																																<th align="right">
															编码类型:</th>
					<td>
																		<input title="编码类型" class="inputbox" style="width: 180px;" type="text" name="codeType" id="codeType" readonly="readonly" value='${hdkfBdCodeRuleDTO.codeType}'/>
																</td>
																										<th align="right">
															机型代码:</th>
					<td>
																		<input title="机型代码" class="inputbox" style="width: 180px;" type="text" name="planeCode" id="planeCode" readonly="readonly" value='${hdkfBdCodeRuleDTO.planeCode}'/>
																</td>
											</tr>
						<tr>
																										<th align="right">
															当前年份:</th>
					<td>
																		<input title="当前年份" class="inputbox" style="width: 180px;" type="text" name="curYear" id="curYear" readonly="readonly" value='${hdkfBdCodeRuleDTO.curYear}'/>
																</td>
																										<th align="right">
															当前最大编码:</th>
					<td>
																  		<input title="当前最大编码" class="easyui-numberbox" style="width: 180px;" type="text" name="maxNo" id="maxNo" readonly="readonly" value='${hdkfBdCodeRuleDTO.maxNo}'/>	
																</td>
											</tr>
						<tr>
																										<th align="right">
															序列号位数:</th>
					<td>
																  		<input title="序列号位数" class="easyui-numberbox" style="width: 180px;" type="text" name="serialnoCount" id="serialnoCount" readonly="readonly" value='${hdkfBdCodeRuleDTO.serialnoCount}'/>	
																</td>
																																																																																																																				</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
																																																																																																																																																																																																																																																																																																																																													});
	</script>
</body>
</html>