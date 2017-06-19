<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/Add/null" -->
<title>添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
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

					
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="求援请求ID"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="hidden" name="requestId" id="requestId" />
						<input title="信息处理卡编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo" required="true"  onfocus="openRequestDialog();"/></td>
						
<!-- 						<th width="10%">外场信息处理卡编号:</th> -->
<!-- 					    <td width="40%"><input title="外场信息处理卡ID" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="hidden" name="outfieldCardId" id="outfieldCardId" /> -->
<!-- 						<input title="外场信息处理卡编号" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="text" name="outfieldCardNo" id="outfieldCardNo" /></td> -->
               <th width="10%">处理单名称:</th>
					<td width="40%"><input title="处理单名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="dealName" id="dealName" required="true" /></td>
				</tr>
				<tr>
					
					<th width="10%">是否客服部自己处理:</th>
					<td width="40%"><pt6:syslookup name="isSelfDeal" 
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull= "true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
						<th width="10%">是否赴外场:</th>
					<td width="40%"><pt6:syslookup name="isOutfield"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull= "true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				
				<tr>
					<th width="10%">处理处室:</th>
					<td width="40%"><input title="{param.field.comment}"
						class="inputbox" style="width: 180px;" type="hidden"
						name="dealDepartId" id="dealDepartId" />
						<div class="">
							<input class="easyui-validatebox" name="dealDepartIdAlias"
								id="dealDepartIdAlias" readOnly="readOnly" required="true" style="width: 179px;"></input>
						</div></td>
						
					<th width="10%">技术员:</th>
					<td width="40%"><input title="技术员"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="dealUserId" id="dealUserId" />
						<input title="技术员姓名"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="dealUserName" id="dealUserName" required="true" /></td>
					
				</tr>
				<tr>
					<th width="10%"><remind>*</remind>是否发传真:</th>
					<td width="40%"><pt6:syslookup name="attribute01"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull= "true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					
					<th width="10%"><remind>*</remind>处理结论:</th>
					<td  colspan="5" align="left" style="padding-left: 3px">
					<textarea rows="12"
						data-options="required:true,validType:'maxLength[2000]'" 
						class="textareabox" name="dealSolution" id="dealSolution"  
						style="resize:none" required="true"></textarea>

<!--                       <input class="easyui-textbox"  -->
<!--                       data-options="multiline:true,required:true,validType:'maxLength[4000]'" name="dealSolution" id="dealSolution"  -->
<!--                       style="width:800px;height:200px;"> -->

					</td>
						
						
				</tr>
				
			</table>
			<input type="hidden" value="${id}" name="id" />
		</form>
		<div style ="margin-top:30px;">
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="${id}" />
			<jsp:param name="form_code" value="hdkfSupportDealByKf" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
		</div>
	</div>
	<div data-options="region:'south',border:false"  style="height: 40px">
	<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="60%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">保存并启动流程</a> <a title="返回"
						id="returnButton" class="easyui-linkbutton" onclick="closeForm();"
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
		$(function() {
			var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "dealDepartId",
					"dealDepartIdAlias");
			dealDepartIdDeptCommonSelector.init();
		});
		
		function openRequestDialog(){
			this.nData = new CommonDialog("model1", "850", "500", "hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/HdkfSupportRequestInfoSelect",
					"信息卡求援信息选择", false, true, false);
			this.nData.show();
		}
		
		function getOutFiledCardDto(requestId){
			$
			.ajax({
				url : 'platform/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/getOutfieldCardDTOByrequestId.json',
				data : {
					id : requestId
				},
				async:false,
				type : 'post',
				dataType : 'json',
				success : function(result) {
					if (result.flag == "success") {
						//进行时间转化
// 						result.hdkfSupportOutfieldCard.factoryTime = formatDatebox(result.hdkfSupportOutfieldCard.factoryTime);
// 						result.hdkfSupportOutfieldCard.kfForwardTime = formatDatebox(result.hdkfSupportOutfieldCard.kfForwardTime);
// 						result.hdkfSupportOutfieldCard.doneTime = formatDatebox(result.hdkfSupportOutfieldCard.doneTime);
// 						result.hdkfSupportOutfieldCard.sendtoKfTime = formatDatebox(result.hdkfSupportOutfieldCard.sendtoKfTime);
// 						$("#formDetail").form('load', result.hdkfSupportOutfieldCard);
                        $("#outfieldCardId").val(result.hdkfSupportOutfieldCard.id);
                        $("#outfieldCardNo").val(result.hdkfSupportOutfieldCard.infoCardNo);
                        
					} else {
						$.messager.show({
							title : '提示',
							msg : "数据加载失败。"
						});
					}
				}
			});
		}
		
		
		
		
		//求援请求编号回写
		function callBackDataRequest(data) {
			$("#model1").dialog("close");
			$("#requestId").val(data.id);
			$("#requestNo").val(data.requestNo);
			$("#dealUserId").val(data.requestManagerId);
			$("#dealUserName").val(data.requestManagerName);
			
			getOutFiledCardDto(data.id);
			
			
		}
		
		function closeForm() {
			parent.hdkfSupportDealByKf.closeDialog("#insert");
		}
		function saveForm() {
			var requestNo = $("input[name='requestNo']").val();
			//alert(requestNo);
			
			var isSelfDeal = $("input[name='isSelfDeal']").val();
			//alert(isSelfDeal);
			//alert($("#outfieldCardNo").val());
			
			if(isSelfDeal=='N'){
				
				if($("#outfieldCardNo").val()==''){
					alert("不是客服部直接自己处理的求援信息卡，请先选择外场信息处理卡");
					return;
				}
			}
			if($("#dealSolution").val()==''){
				alert("处理结论不能为空！");
				return;
			}

			if ($('#form').form('validate') == false) {
				alert("请检查表单相关项，输入是否合法或者为空！");
				return;
			}
			
			if ($("#dealName").val().length>50) {
				alert("处理名称的长度不能超过50！");
				return;
			}
			if ($("#dealSolution").val().length>2000) {
				alert("处理结论的长度不能超过2000！");
				return;
			}
			
			
			parent.hdkfSupportDealByKf.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
		}
	</script>
</body>
</html>