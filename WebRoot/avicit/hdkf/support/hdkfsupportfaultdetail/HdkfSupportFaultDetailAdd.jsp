<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/Add/null" -->
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
		<form id='form'>
			<input type="hidden" name="id" />
			<table class="form_commonTable">
				<tr>



					<th width="10%"><span class="remind">*</span>批架次:</th>
					<td width="40%"><input title="批架次"
						class="inputbox easyui-validatebox"  required="true"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="batchNo" id="batchNo" onclick="openDialog();" /></td>

					<th width="10%">机型:</th>
					<td width="40%"><input title="机型"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="modelId" id="modelId" /></td>
				</tr>
				<tr>
				<th width="10%"><span class="remind">*</span>发现时机:</th>
					<td width="40%"><pt6:syslookup name="attribute01"
							lookupCode="CSMP_FM_FAULTHAPPENMONMENT"
							isNull="true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
						
						
						<th width="10%"><span class="remind">*</span>是否故障:</th>
						<td width="40%"><pt6:syslookup name="attribute02"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull="true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
						
										</tr>
				<tr>
					<th width="10%">飞行小时:</th>
					<td width="40%"><input title="飞行小时"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="flightHours" id="flightHours" readOnly /></td>

					<th width="10%">飞机起落:</th>
					<td width="40%"><input title="飞机起落"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[22]'" style="width: 180px;"
						type="text" name="flightLanding" id="flightLanding" readOnly /></td>
				</tr>
				<tr>
				<th width="10%"><span class="remind">*</span>求援日期:</th>
					<td width="40%"><input title="求援日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="requestDate" id="requestDate"  required="true"/></td>

				<%--  					
					<th width="10%">求援时间:</th>
 					<td width="40%"><input title="求援时间" class="easyui-datebox" 
 						editable="false" style="width: 182px;" type="text" 
 						name="requestDate" id="requestDate"
 						value="${hdkfSupportRequestInfoDTO.requestDate}" readOnly /> --%>

					<th width="10%"><span class="remind">*</span>发生日期:</th>
					<td width="40%"><input title="发生日期" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"  required="true" 
						name="occurrenceDate" id="occurrenceDate" />
						
						
						<input title="求援请求ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="requestId" id="requestId"
						value="${requestId}" readOnly />
						</td>
						
				</tr>		
				<tr>


					<!-- 					<th width="10%">故障描述:</th> -->
					<!-- 					<td width="40%"><input title="故障描述" -->
					<!-- 						class="inputbox easyui-validatebox" -->
					<!-- 						data-options="validType:'maxLength[1024]'" style="width: 180px;" -->
					<!-- 						type="text" name="faultDesc" id="faultDesc" /></td> -->
					<th width="100px"><span class="remind">*</span>求援信息</th>

					<td colspan="5" align="left" style="padding-left: 3px"><textarea
							rows="12"
							data-options="required:true,validType:'maxLength[2000]'"
							class="textareabox" name="faultDesc" id="faultDesc"
							style="resize: none"></textarea></td>
				</tr>
<!-- 				<tr> -->

<!-- 					<th width="10%">处理结论:</th> -->
<!-- 					<td width="40%"><input title="处理结论" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[4000]'" style="width: 180px;" -->
<!-- 						type="text" name="dealSolution" id="dealSolution" /></td> -->
<!-- 				</tr> -->
				<tr>

<!-- 					<th width="10%">求援请求ID:</th> -->
<!-- 					<td width="40%"></td> -->
					
					

<!-- 					<th width="10%">信息卡编号:</th> -->
<!-- 					<td width="40%"> -->

<!-- 					<input title="信息卡编号" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="text" name="requestNo" id="requestNo" -->
<%-- 						value="${hdkfSupportRequestInfoDTO.requestNo}" readOnly /></td> --%>
				</tr>
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
		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		var requestUnitR;
		var modelIdR;
		$(function() {
			
			//获取选中的批架次
			requestUnitR = "${requestUnit}";
			modelIdR="${modelId}";
			
			//alert(requestUnitR);
			//batchNosall = $('#hdkfSupportRequestInfo').val('batchNo');//"${batchNo}";
			
			/* batchNosall = $('#hdkfSupportRequestInfo').val(); */
			/* var userCommonSelector = new CommonSelector("user","userSelectCommonDialog","userName","userNameName");
			userCommonSelector.init();  */
			//选择部门
			/* var deptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","userName","userNameName");
			deptCommonSelector.init();  */
			//选择角色
			/* var roleCommonSelector = new CommonSelector("role","roleSelectCommonDialog","userName","userNameName",null,null,null);
			roleCommonSelector.init();  */
			/*  //选择群组
			 var groupCommonSelector = new CommonSelector("group","groupSelectCommonDialog","userName","userNameName",null,null,null);
			 groupCommonSelector.init(); 
			 //选择岗位
			 var positionCommonSelector = new CommonSelector("position","positionSelectCommonDialog","userName","userNameName");
			 positionCommonSelector.init();  */
		});
		function openDialog() { 
			var co1=requestUnitR+","+modelIdR;
			this.nData = new CommonDialog(
					"model",
					"530",
					"500",
					"hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfBdAircraftinfoInfo/"
							+ co1, "批架次选择", false, true, false);
			this.nData.show();
		}
		function callBackData(data) {
			$("#model").dialog("close");
			//$("#modelIdAlias").val(data.modelIdAlias);
			//alert("batchNos-->"+batchNos);
			//alert("data.batchNo-->"+data.batchNo);
			
				$("#modelId").val(data.modelIdAlias);
				$("#batchNo").val(data.batchNo);
			

			//$("#batchNoAlias").val();
			$("#flightHours").val(data.flightNum);
			$("#flightLanding").val(data.takeoffLandingNum);

		}
		function closeForm() {
			parent.hdkfSupportFaultDetail.closeDialog("#insert");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				alert("请检查必填项！");
				return;
			}
			 if($("#attribute01").combobox('getValue')==''){
					alert("发现时机，不能为空！");
					return  false;
				}
			 if($("#attribute02").combobox('getValue')==''){
					alert("是否故障，不能为空！");
					return  false;
				}
			if($("#faultDesc").val()==''){
				alert("求援信息不能为空，请检查！");
				return;
			}
			if($("#faultDesc").val().length>500){
				alert("求援信息长度不能超过500");
				return;
			}
			parent.hdkfSupportFaultDetail.save(serializeObject($('#form')),
					"#insert");
		}
	</script>
</body>
</html>