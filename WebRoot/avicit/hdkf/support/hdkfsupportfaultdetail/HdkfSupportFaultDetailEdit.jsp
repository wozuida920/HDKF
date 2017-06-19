<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/Edit/id" -->
<title>修改</title>
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
		<form id='form'>
			<input type="hidden" name="id"
				value='${hdkfSupportFaultDetailDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<th width="10%">批架次:</th>
					<td width="40%"><input title="批架次"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="batchNo" id="batchNo"
						value='<c:out value='${hdkfSupportFaultDetailDTO.batchNo}'/>'
						disabled /></td>
					<th width="10%">机型:</th>
					<td width="40%"><input title="机型"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="modelId" id="modelId"
						value='<c:out value='${hdkfSupportFaultDetailDTO.modelId}'/>'
						disabled /></td>
				</tr>


				<tr>

					<th width="10%">发现时机:</th>
					<td width="40%"><pt6:syslookup name="attribute01"
							lookupCode="CSMP_FM_FAULTHAPPENMONMENT"
							defaultValue='${HdkfSupportFaultDetailDTO.attribute01}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">是否故障:</th>
					<td width="40%"><pt6:syslookup name="attribute02"
							lookupCode="PLATFORM_YES_NO_FLAG"
							defaultValue='${HdkfSupportFaultDetailDTO.attribute01}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>

				</tr>


				<tr>
					<th width="10%">飞行小时:</th>
					<td width="40%"><input title="飞行小时" class="easyui-numberbox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="flightHours" id="flightHours"
						value='${hdkfSupportFaultDetailDTO.flightHours}' disabled /></td>
					<th width="10%">飞机起落:</th>
					<td width="40%"><input title="飞机起落" class="easyui-numberbox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="flightLanding" id="flightLanding"
						value='${hdkfSupportFaultDetailDTO.flightLanding}' disabled /></td>
				</tr>



				<tr>
					<th width="10%">求援日期:</th>
					<td width="40%"><input title="求援日期" class="easyui-datebox"
						style="width: 182px;" type="text" name="requestDate"
						id="requestDate" editable="false" required="true"
						value='${hdkfSupportFaultDetailDTO.requestDate}' /></td>
					<th width="10%">发生日期:</th>
					<td width="40%"><input title="发生日期" class="easyui-datebox"
						style="width: 182px;" type="text" name="occurrenceDate"
						id="occurrenceDate" editable="false" required="true"
						value='${hdkfSupportFaultDetailDTO.occurrenceDate}' /></td>
				</tr>
				<%-- 				<tr>
					
					
					<th width="10%">信息卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="requestId" id="requestId"
						value='<c:out value='${hdkfSupportFaultDetailDTO.requestId}'/>' />
						
						<input title="信息卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo"
						value='<c:out value='${hdkfSupportFaultDetailDTO.requestNo}'/>' disabled/>
					</td>
				</tr> --%>
				<tr>
					<!-- 					<th width="10%">故障描述:</th> -->
					<!-- 					<td width="40%"><input title="故障描述" -->
					<!-- 						class="inputbox easyui-validatebox" -->
					<!-- 						data-options="validType:'maxLength[1024]'" style="width: 180px;" -->
					<!-- 						type="text" name="faultDesc" id="faultDesc" -->
					<%-- 						value='<c:out value='${hdkfSupportFaultDetailDTO.faultDesc}'/>' /> --%>
					<!-- 					</td> -->
					<!-- 					<th width="10%">处理结论:</th> -->
					<!-- 					<td width="40%"><input title="处理结论" -->
					<!-- 						class="inputbox easyui-validatebox" -->
					<!-- 						data-options="validType:'maxLength[4000]'" style="width: 180px;" -->
					<!-- 						type="text" name="dealSolution" id="dealSolution" -->
					<%-- 						value='<c:out value='${hdkfSupportFaultDetailDTO.dealSolution}'/>' /> --%>
					<!-- 					</td> -->
				</tr>
				<tr>
					<th align="right"><label>求援信息</label></th>

					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="12"
							data-options="required:true,validType:'maxLength[2000]'"
							class="textareabox" name="faultDesc" id="faultDesc"
							style="resize: none"></textarea></td>
				</tr>
				<!-- 				<tr> -->
				<!-- 						<th align="right"><label>处理结论</label></th> -->
				<!-- 						<td colspan="5" align="left" style="padding-left: 3px"> -->
				<!-- 						<textarea rows="12" -->
				<!-- 						data-options="required:true,validType:'maxLength[2000]'"  -->
				<!-- 						class="textareabox" name="dealSolution" id="dealSolution"  -->
				<!-- 						style="resize:none"></textarea> -->
				<!-- 						</td> -->
				<!-- 				</tr> -->

				<tr>
				</tr>
			</table>
		</form>
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">保存</a> <a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	var  requestIdR;
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		$(function() {
			if (!"${hdkfSupportFaultDetailDTO.requestDate}" == "") {
				$('#requestDate').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportFaultDetailDTO.requestDate}")
								.format("yyyy-MM-dd"));
			}
			if (!"${hdkfSupportFaultDetailDTO.occurrenceDate}" == "") {
				$('#occurrenceDate').datebox(
						'setValue',
						parserColumnTime(
								"${hdkfSupportFaultDetailDTO.occurrenceDate}")
								.format("yyyy-MM-dd"));
			}
			//alert("1");
			requestIdR = $("#requestId").val();
			
			$("#faultDesc").val("${hdkfSupportFaultDetailDTO.faultDesc}");
		})
		function closeForm() {
			parent.hdkfSupportFaultDetail.closeDialog("#edit");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				alert("请检查表单必填项！");
				return;
			}
			if($("#faultDesc").val()==''){
				alert("求援信息不能为空，请检查！");
				return;
			}
			if($("#faultDesc").val().length>500){
				alert("求援信息长度不能超过500");
				return;
			}
			if($('#attribute01').combobox('getValue')==''){
				alert("请选择发现时机");
				return;
			}
			if($('#attribute02').combobox('getValue')==''){
				alert("请选择是否故障");
				return;
			}
			
			parent.hdkfSupportFaultDetail.save(serializeObject($('#form')),
					"#edit");
		}
	</script>
</body>
</html>