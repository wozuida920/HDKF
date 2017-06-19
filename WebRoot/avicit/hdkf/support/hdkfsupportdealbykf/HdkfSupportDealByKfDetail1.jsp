<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/Detail/id" -->
<title>详细</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var entryId = "<%=entryId%>";
	var executionId = "<%=executionId%>";
	var taskId = "<%=taskId%>";
	var formId = "<%=formId%>";

	$(function() {
		var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
				"deptSelectCommonDialog", "dealDepartId", "dealDepartIdAlias");
		dealDepartIdDeptCommonSelector.init();
	})

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/toDetailJsp.json',
					data : {
						id : formId
					},
					async:false,
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							$("#formDetail").form('load',
									result.hdkfSupportDealByKf);
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}
	
	
	window.beforeSubmit = function( _entryId,_executionId,_currentActivityName,_targetActivityName,_formId){
		
		 if($("#isOutfield").combobox('getValue')==''){
				alert("是否赴外场，不能为空！");
				return  false;
			}
// 		 if($("#dealSolution").val()==''){
// 				alert("处理结论，不能为空！");
// 				return  false;
// 			}
		 if ($('#formDetail').form('validate') == false) {
				alert("请检查必填项");
				return false;
			}
// 		 if($("#isOutfield").combobox('getValue')=='Y'&&$("#attribute01").combobox('getValue')=='Y'){
// 				alert("赴外场与发传真的值不能都为是，请检查！");
// 				return false ;
// 			}
			if ($("#dealName").val().length>50) {
				alert("处理名称的长度不能超过50！");
				return false;
			}
// 			if ($("#dealSolution").val().length>2000) {
// 				alert("处理结论的长度不能超过2000！");
// 				return false;
// 			}
		
		var isOutfield ;
		//alert("enter beforeSubmit...");
		$
		.ajax({
			url : 'platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/toDetailJsp.json',
			data : {
				id : formId
			},
			async:false,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					isOutfield = result.hdkfSupportDealByKf.isOutfield;
				  
					
				} else {
					$.messager.show({
						title : '提示',
						msg : "数据加载失败。"
					});
				}
			}
		});
		//alert(isOutfield);
		if(!isOutfield)
		{
			alert("请先点击保存表单按钮，再提交流程");
			return false;
		}
		
	  return true;
	};
	
	
	
	

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		 if($("#isOutfield").combobox('getValue')==''){
				alert("是否赴外场，不能为空！");
				return  ;
			}
// 		 if($("#dealSolution").val()==''){
// 				alert("处理结论，不能为空！");
// 				return  ;
// 			}
		 if ($('#formDetail').form('validate') == false) {
				alert("请检查必填项");
				return ;
			}
// 		 if($("#isOutfield").combobox('getValue')=='Y'&&$("#attribute01").combobox('getValue')=='Y'){
// 				alert("赴外场与发传真的值不能都为是，请检查！");
// 				return  ;
// 			}
			if ($("#dealName").val().length>50) {
				alert("处理名称的长度不能超过50！");
				return;
			}
// 			if ($("#dealSolution").val().length>2000) {
// 				alert("处理结论的长度不能超过2000！");
// 				return;
// 			}
		 
		var dataVo = $('#formDetail').serializeArray();
		//alert(dataVo);
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfController/operation/save',
					data : {
						data : dataVo
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							initFormData();
							$.messager.show({
								title : '提示',
								msg : "操作成功。"
							});
						} else {
							$.messager.show({
								title : '提示',
								msg : "操作失败。"
							});
						}
					}
				});
	};

	//返回
	function doBack() {
		if (parent != null && parent.$('#tabs') != null) {
			var currTab = parent.$('#tabs').tabs('getSelected');
			var currTitle = currTab.panel('options').title;
			parent.$('#tabs').tabs('close', currTitle);
		}
	}
	function toRequestDetail(){
		
		if($("#onOffBtn").html()=='展开信息卡求援详情'){
		//alert("here");
		var id = $("#requestId").val();
		var value ="信息卡："+ $("#requestNo").val()+"求援详情";
		//alert(id);
		var url = "avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoDetailAsIframe.jsp?id=" + id;
		
		$("#iframeId").css('display','block');
		$("#iframeId").attr("src",url);
		//alert(1);
// 		if(typeof(top.addTab) != 'undefined'){
// 			//alert(2);
// 			top.addTab(value, url);
// 		}else{
// 			//alert(3);
// 			window.open(url);
// 		}
		$("#onOffBtn").html('收起信息卡求援详情');
		}else{
			$("#iframeId").css('display','none');
			$("#onOffBtn").html('展开信息卡求援详情');
		}
	}
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
		var idR = $("#requestId").val();
		var url = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfSupportFaultDetailInfo3?requestId="
				+ idR;
		$("#iframeIdR").css('display', 'block');
		$("#iframeIdR").attr("src", url);
	});
	
	//////////复制这块，完成长度验证
	$.extend($.fn.validatebox.defaults.rules, {
		maxLength : {
			validator : function(value, param) {
				return param[0] >= value.length;

			},
			message : '请输入最多 {0} 字符.'
		}
	});
	///////////
	
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

		<!-- 流程按钮区域开始 -->
		<div class=datagrid-toolbar>
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
		</div>
		<div  style="margin:10px 5px 20px 10px">
		<span><a id="onOffBtn" onclick="toRequestDetail();"  href="javascript:void(0)" >展开信息卡求援详情</a></span>
	
		<iframe id="iframeId" width="99%" height="870" frameborder="0" style="display:none;margin-top:10px;">
        </iframe>
	</div>

		<!-- 流程按钮区域结束 -->
		<fieldset>
           <legend>信息卡处理详情</legend>
			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId" id="requestId"
							disabled />
						<input title="信息处理卡编号" class="easyui-validatebox"
							style="width: 130px;" type="text" name="requestNo" id="requestNo"
							disabled /></td>
							
					<th align="right"><span class="remind">*</span><label>处理单名称</label></th>
						<td><input title="处理单名称" class="easyui-validatebox"
						data-options="validType:'maxLength[25]'"
							style="width: 180px;" type="text" name="dealName" id="dealName"  required="true"  
							disabled /></td>
							
						
							
<!-- 							<th align="right"><label>外场信息处理卡编号</label></th> -->
<!-- 						<td><input title="外场信息处理卡ID" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="hidden" name="outfieldCardId" -->
<!-- 							id="outfieldCardId" disabled /> -->
<!-- 							<input title="外场信息处理卡编号" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="outfieldCardNo" -->
<!-- 							id="outfieldCardNo" disabled /></td> -->
					</tr>
					<tr>
						
						<th align="right"><label>是否客服部自己处理</label></th>
						<td>						
							<pt6:syslookup name="isSelfDeal"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="required:true,width:180,editable:false,disabled:true,panelHeight:'auto'">
						</pt6:syslookup>
							</td>
							
								
							
							<th align="right"><span class="remind">*</span><label>是否赴外场</label></th>
						<td>
							<pt6:syslookup name="isOutfield"
							lookupCode="PLATFORM_YES_NO_FLAG"
							isNull = "true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto',disabled:'disabled'">
						</pt6:syslookup>
							
							</td>
					</tr>
				
					<tr>
						<th width="10%"><label>处理处室</label></th>
						<td width="40%"><input title="{param.field.comment}"
							class="inputbox" style="width: 180px;" type="hidden"
							name="dealDepartId" id="dealDepartId" />
							<div class="">
								<input class="easyui-validatebox" name="dealDepartIdAlias"
									id="dealDepartIdAlias" readOnly="readOnly" disabled
									style="width: 179px;"></input>
							</div></td>
						<th align="right"><label>技术员</label></th>
						<td><input title="技术员" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="dealUserId"
							id="dealUserId" disabled />
							<input title="技术员姓名" class="easyui-validatebox"
							style="width: 180px;" type="text" name="dealUserName"
							id="dealUserName" disabled />
							</td>
					</tr>
					<tr>
						
						<th align="right"><span class="remind">*</span><label>是否发传真</label></th>
						<td>						
							<pt6:syslookup name="attribute01"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="required:true,width:180,editable:false,disabled:true,panelHeight:'auto'">
						</pt6:syslookup>
							</td>
							
					</tr>
					
					<tr>
						<th align="right"><label>处理结论</label></th>
						<td colspan="5" align="left" style="padding-left: 3px">
						<textarea rows="12"
						data-options="required:true,validType:'maxLength[2000]'" 
						class="textareabox" name="dealSolution" id="dealSolution"  disabled="disabled"
						style="resize:none"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
		<iframe id="iframeIdR" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
		<div style="width: 98%; margin-left: 10px; margin-right: 20px;margin-top:10px;"> 
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="true" />
			<jsp:param name="form_id" value="<%=formId%>" />
			<jsp:param name="form_code" value="hdkfSupportDealByKf" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
		</div>
<!-- 		<div style="width: 98%; margin-left: 1%; margin-right: 18%"> -->
<!-- 			<fieldset> -->
<!-- 				<legend>附件</legend> -->
<!-- 				<div class="formExtendBase" style="margin-left: 10%"> -->
<!-- 					<div class="column" style="height: 130px;"> -->
<%-- 						<jsp:include --%>
<%-- 							page="/avicit/platform6/modules/system/swfupload/swfViewInclude.jsp"> --%>
<%-- 							<jsp:param name="form_id" value="<%=formId%>" /> --%>
<%-- 							<jsp:param name="save_type" value="true" /> --%>
<%-- 							<jsp:param name="file_category" value="PLATFORM_SEX" /> --%>
<%-- 							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" /> --%>
<%-- 						</jsp:include> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</fieldset> -->
<!-- 		</div> -->
		<div id="idea"></div>
	</div>
</body>
</html>