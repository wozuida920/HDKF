<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
	// 	String parameter = request.getParameter("parameter");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/Detail/id" -->
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
	
	var faxList;
<%-- 	var parameter = <%=parameter %>;//parameter为1时，代表客服部信息员，2代表客服部技术员 --%>
	
// 	if (parameter == 2)
// 	{
// 		$("#finalDecision").removeAttr("disabled");
// 	}

	$(function() {
		if (!"${hdkfSupportResponseInfoDTO.actualTime}" == "") {
			$('#actualTime')
					.datebox(
							'setValue',
							parserColumnTime(
									"${hdkfSupportResponseInfoDTO.actualTime}")
									.format("yyyy-MM-dd"));
		}
	});

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/toDetailJsp.json',
					data : {
						id : formId
					},
					async:false,
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportResponseInfo.actualTime = formatDatebox(result.hdkfSupportResponseInfo.actualTime);
							faxList = result.faxList;
							$("#formDetail").form('load',
									result.hdkfSupportResponseInfo);
							
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
		
		
		 if ($('#formDetail').form('validate') == false) {
				alert("请检查必填项");
				return false;
			}
		 
			if ($("#respName").val().length>50) {
				alert("答复名称的长度不能超过50！");
				return false;
			}
			if ($("#finalDecision").val().length>1000) {
				alert("最终处理意见的长度不能超过1000！");
				return false;
			}
			if ($("#respNo").val().length>50) {
				alert("答复文号的长度不能超过50！");
				return false;
			}
		var endFlag ;
		//alert("enter beforeSubmit...");
		$
		.ajax({
			url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/getOutFieldCardDtoStatusByrequestId.json',
			data : {
				requestId : $("#requestId").val()
			},
			async:false,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					endFlag = result.flag;
				  
					
				} else {
					$.messager.show({
						title : '提示',
						msg : "不能进行流程提交。"
					});
				}
			}
		});
		//alert(isOutfield);
		if(!endFlag)
		{
			alert("请确保外场信息卡流程已经走完，再提交此流程");
			return false;
		}
		var endFaxFlag;
		$
		.ajax({
			url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/getFaxDtoStatusByrequestId.json',
			data : {
				requestId : $("#requestId").val()
			},
			async:false,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					endFaxFlag = result.flag;
				  
					
				} else {
					$.messager.show({
						title : '提示',
						msg : "不能进行流程提交。"
					});
				}
			}
		});
		//alert(isOutfield);
		if(!endFaxFlag)
		{
			alert("请确保所有传真流程已经走完，再提交此流程");
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
		 if ($('#formDetail').form('validate') == false) {
				alert("请检查必填项");
				return ;
			}
			if ($("#respName").val().length>50) {
				alert("答复名称的长度不能超过50！");
				return;
			}
			if ($("#finalDecision").val().length>1000) {
				alert("最终处理意见的长度不能超过1000！");
				return;
			}
		 
			if ($("#respNo").val().length>50) {
				alert("答复文号的长度不能超过50！");
				return;
			}
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/save',
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
	
	function toRequestDetail() {

		if ($("#onOffBtn").html() == '展开信息卡求援详情') {
			//alert("here");
			var id = $("#requestId").val();
			var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			var url = "avicit/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId1").css('display', 'block');
			$("#iframeId1").attr("src", url);
			$("#onOffBtn").html('收起信息卡求援详情');
		} else {
			$("#iframeId1").css('display', 'none');
			$("#onOffBtn").html('展开信息卡求援详情');
		}
	}
	function toRequestDetail2() {

		if ($("#onOffBtn2").html() == '展开客服部处理单详情') {
			//alert("here");
			var id = $("#requestDealId").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			var url = "avicit/hdkf/support/hdkfsupportdealbykf/HdkfSupportDealByKfDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId2").css('display', 'block');
			$("#iframeId2").attr("src", url);
			$("#onOffBtn2").html('收起客服部处理单详情');
		} else {
			$("#iframeId2").css('display', 'none');
			$("#onOffBtn2").html('展开客服部处理单详情');
		}
	}
	function toRequestDetails(onOffBtns,iframeIds,id,cardNo) {
		//alert(id);

		if (onOffBtns.html() .indexOf("展开") >= 0) {
			//alert("here");
			//var id = $("#attribute03").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			
			//avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp
			//avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardDetailAsIframe.jsp
			var url = "avicit/hdkf/support/hdkfsupportfaxinfo/HdkfSupportFaxInfoDetailAsIframe.jsp?id="
					+ id;

			iframeIds.css('display', 'block');
			iframeIds.attr("src", url);
			onOffBtns.html('收起传真详情'+cardNo);
		} else {
			iframeIds.css('display', 'none');
			onOffBtns.html('展开传真详情'+cardNo);
		}
	}
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
	       $.each(faxList,function(index,value){
	    	   
		  		
	    	   
	    	   
	        	 var divId="outCardDiv_"+index;
	        	 var o = '<div style="margin: 10px 5px 20px 10px;" id='+divId+'><span><a href="javascript:void(0)">展开传真详情'+value.faxNo+'</a></span><iframe width="99%" height="670" frameborder="0" style="display: none; margin-top: 10px;"></iframe></div>';
	        	 
	             $("#otherFormDiv").append(o);
	            // var indexDiv = "outCardDiv_"+index;
	             var iframeIds= $("#outCardDiv_"+index).find("iframe");
	            // var onOffBtnIds =  $("#outCardDiv_"+index).find("a");
	             $("#outCardDiv_"+index).find("a").bind("click",function(){
	            //	 alert("in click function---->"+index);
	            	 toRequestDetails( $(this),iframeIds,value.id,value.faxNo);
	             });
	           }
	           );
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
		<div id="otherFormDiv" style="margin: 10px 5px 20px 10px">

			<div style="margin: 10px 5px 20px 10px">
				<span><a id="onOffBtn" onclick="toRequestDetail();"
					href="javascript:void(0)">展开信息卡求援详情</a></span>

				<iframe id="iframeId1" width="99%" height="870" frameborder="0"
					style="display: none; margin-top: 10px;"> </iframe>
			</div>
			<div style="margin: 10px 5px 20px 10px">
				<span><a id="onOffBtn2" onclick="toRequestDetail2();"
					href="javascript:void(0)">展开客服部处理单详情</a></span>
             
				<iframe id="iframeId2" width="99%" height="570" frameborder="0"
					style="display: none; margin-top: 10px;"> </iframe>
			</div>
		</div>

		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>处理单名称</label></th>
						<td><input title="请求处理ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestDealId"
							id="requestDealId" disabled /><input title="处理单名称"
							class="easyui-validatebox" readonly="readonly"
							style="width: 180px;" type="text" name="dealNo" id="dealNo"
							disabled /></td>
						<th align="right"><label>信息处理卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId"
							id="requestId" disabled /><input title="信息处理卡编号"
							class="easyui-validatebox" data-options="required:true"
							style="width: 180px;" type="text" name="requestNo"
							readonly="readonly" id="requestNo" disabled /></td>

					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>答复名称</label></th>
						<td colspan="3"><input title="答复名称"
							class="easyui-validatebox" style="width: 100%;" type="text"
							data-options="validType:'maxLength[50]'"
							required="true" name="respName" id="respName" disabled /></td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>最终处理意见</label></th>
						<td colspan="3">
							<div style="width: 99%;">
								<textarea rows="5" title="最终处理意见" class="textareabox"
									data-options="validType:'maxLength[2000]'" name="finalDecision"
									required="true" id="finalDecision" disabled /></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<!-- <th align="right"><label>经办人姓名</label></th>
						<td><input title="经办人ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" data-options="required:true" name="respUserId"
							id="respUserId" disabled /><input title="经办人姓名"
							class="easyui-validatebox" data-options="required:true" style="width: 180px;" type="text"
							name="respUserName" id="respUserName" disabled /></td> -->

						<th align="right"><span class="remind">*</span><label>答复文号</label></th>
						<td><input title="答复文号" class="easyui-validatebox"
						data-options="validType:'maxLength[50]'"
							style="width: 180px;" type="text" name="respNo" id="respNo"
							required="true" disabled /></td>
						<th width="10%">填写人</th>
						<td width="40%"><input title="填写人ID"
							class="easyui-validatebox" style="width: 180px;" type="hidden"
							data-options="required:true" name="attribute01" id="attribute01"
							disabled /> <input title="填写人姓名" class="easyui-validatebox"
							data-options="required:true" style="width: 180px;" type="text"
							type="text" name="attribute02" id="attribute02" disabled /></td>
					</tr>
					<tr>
						<th align="right"><span class="remind">*</span><label>答复时间</label></th>
						<td><input title="答复时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="actualTime"
						editable="false"	required="true" id="actualTime" disabled /></td>
						<th align="right"><span class="remind">*</span><label>答复方式</label></th>
						<td><pt6:syslookup name="respBy"
								lookupCode="SUPPORT_RESPONSE_TYPE"
								dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel,required:true">
							</pt6:syslookup></td>
					</tr>
					<tr>
						<th align="right"><label>经办人姓名</label></th>
						<td><input title="经办人ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="respUserId"
							id="respUserId" readonly="readonly" disabled /><input
							title="经办人姓名" class="easyui-validatebox" style="width: 180px;"
							type="text" name="respUserName" readonly="readonly"
							id="respUserName" disabled /></td>
					</tr>
				</table>
			</form>
		</fieldset>
		<fieldset>
			<legend>附件</legend>
			<div class="formExtendBase">
				<div class="column" style="height: 130px;">
					<jsp:include
						page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
						<jsp:param value="1024MB" name="file_size_limit" />
						<jsp:param value="*.*" name="file_types" />
						<jsp:param value="10" name="file_upload_limit" />
						<jsp:param value="false" name="save_type" />
						<jsp:param value="<%=formId%>" name="form_id" />
						<jsp:param value="<%=entryId%>" name="entryId" />
						<jsp:param value="<%=executionId%>" name="executionId" />
						<jsp:param value="pm_project" name="form_code" />
						<jsp:param value="id" name="form_field" />
						<jsp:param value="process" name="allowAdd" />
						<jsp:param value="true" name="allowDel" />
						<jsp:param value="true" name="cleanOnExit" />
						<jsp:param value="PLATFORM_FILE_SECRET_LEVEL" name="secret_level" />
					</jsp:include>
				</div>
			</div>
		</fieldset>
		<div id="idea"></div>
	</div>
</body>
</html>