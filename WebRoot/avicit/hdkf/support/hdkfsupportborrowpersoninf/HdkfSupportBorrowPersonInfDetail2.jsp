<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
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
	<!-- ControllerPath = "hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/operation/Detail/id" -->
	<title>详细</title>
	<base href="<%=ViewUtil.getRequestPath(request) %>">
	<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
	<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<script type="text/javascript">
	var baseurl = '<%=request.getContextPath()%>';
	var entryId = "<%=entryId%>";
	var executionId = "<%=executionId%>";
	var taskId = "<%=taskId%>";
	var formId = "<%=formId%>"; 
	
	$(function(){
                if(!"${hdkfSupportBorrowPersonInfDTO.estimateDate}"==""){
                    $('#estimateDate').datebox('setValue', parserColumnTime("${hdkfSupportBorrowPersonInfDTO.estimateDate}").format("yyyy-MM-dd"));
                }
               // var borrowDeptDeptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","borrowDept","borrowDeptAlias");
                 //   borrowDeptDeptCommonSelector.init();
    });
            
	//初始化页面值
	function initFormData(){
		$.ajax({
			url : 'platform/hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/toDetailJsp.json',
			data : {
				id : formId
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					result.hdkfSupportBorrowPersonInf.estimateDate = formatDatebox(result.hdkfSupportBorrowPersonInf.estimateDate);
                    $("#formDetail").form('load',result.hdkfSupportBorrowPersonInf);
                    var linkManBorrowed = "${CURRENT_LOGINUSER.name}";
                    $("#linkManBorrowed").val(linkManBorrowed);
				} else {
					$.messager.show({
						title : '提示',
						msg : "数据加载失败。"
					});
				}
			}
		});
	}
	//是否含有中文（也包含日文和韩文）
	function isChineseChar(str){   
	   var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
	   return reg.test(str);
	}
	//同理，是否含有全角符号的函数
	function isFullwidthChar(str){
	   var reg = /[\uFF00-\uFFEF]/;
	   return reg.test(str);
	} 
	function validatePhone(phoneNumber){
// 		var phoneReg = /^1[3,4,5,8]{1}[0-9]{1}[0-9]{8}$/;
// 		var telReg1 = /^[0-9]{3}-[0-9]{8}$/;
// 		var telReg2 = /^[0-9]{4}-[0-9]{7}$/;
		var flag = false;
// 		if(phoneReg.test(phoneNumber) || telReg1.test(phoneNumber) || telReg2.test(phoneNumber)){
// 			flag = true;
// 		}
		 if(!isChineseChar(phoneNumber)&&!isFullwidthChar(phoneNumber)){
	       	  flag = true;
	         }
		return flag;
	}
	window.beforeSubmit = function( _entryId,_executionId,_currentActivityName,_targetActivityName,_formId){
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项");
			return false;
		}
		var flag = validatePhone($("#linkPhoneBorrowed").val());
		if(!flag){
			alert("请正确填写借出部门联系电话！");
			return false;
		}
		var personFlag = true;
		$.ajax({
			url : "platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/operation/getPersonDetailCountByParentId.json",
			data : {
				borrowInfoId : formId,
				borrowNumber : $("#borrowNumber").val()
			},
			type : "post",
			dataType : 'json',
			async : false,
			success : function(result) {
				if(!result.flag){
					personFlag = false;
				}
			}
		});
		if(!personFlag){
			alert("请检查具体借人名单！");
			return false;
		}
		return true;
	};
	
	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId,executionId){
		if ($('#formDetail').form('validate') == false) {
			alert("请检查必填项");
			return;
		}
		var flag = validatePhone($("#linkPhoneBorrowed").val());
		if(!flag){
			alert("请正确填写借出部门联系电话！");
			return false;
		}
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$.ajax({
			url : 'platform/hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/operation/save',
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
	function doBack(){
		if(parent!=null&&parent.$('#tabs')!=null){
			var currTab = parent.$('#tabs').tabs('getSelected');
			var currTitle = currTab.panel('options').title; 
			parent.$('#tabs').tabs('close',currTitle);
		}
	}
	
	function  downloadPdf(){
		   
	    var  pdfId = formId;
	   // alert(pdfId);
		var pdfUrl = "/HDKF/platform/hdkf/support/hdkfsupportborrowpersoninf/HdkfSupportBorrowPersonInfController/operation/downloadPdf?id="+pdfId;
		//alert(pdfUrl);
		//window.location.href = pdfUrl;//在原来窗体中打开页面用
		window.open(pdfUrl);
		}

	//页面加载完成后入口
	$(function(){
		initFormData();
		//不控制表单权限
 		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId,executionId,taskId,formId);
		var url = "platform/hdkf/support/hdkfsupportpersondetail/HdkfSupportPersonDetailController/HdkfSupportPersonDetailInfo1?formId=" + formId;
		$("#iframeId").attr("src", url);
	});
	
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

		<!-- 流程按钮区域开始 -->
		<div class=datagrid-toolbar>
			<div id=bpmToolBar></div>
			<!-- 自定义按钮放到这里 -->
			<a class="easyui-linkbutton" iconCls="icon-undo" plain="true"
				onclick="doBack();" href="javascript:void(0);">返回</a>
				<a class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="downloadPdf();" href="javascript:void(0);">生成PDF</a>
		</div>


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" id="formId"/>
				<table class="form_commonTable">
					<tr>
<!-- 						<th align="right"><label>任务书ID</label></th> -->
<!-- 						<td><input title="任务书ID" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="taskId" id="taskId" -->
<!-- 							disabled /></td> -->
<!-- 						<th align="right"><label>任务书编号</label></th> -->
<!-- 						<td><input title="任务书编号" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="taskNo" id="taskNo" -->
<!-- 							disabled /></td> -->
                  <th align="right"><label>借人单名称</label></th>
						<td><input title="借人单名称" class="easyui-validatebox"
							style="width: 180px;" type="text" name="borrowName"
							id="borrowName" disabled /></td>
					<th align="right"><label>任务书编号</label></th>
						<td><input title="任务书编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="taskNo" id="taskNo"
						disabled />
						
						<input title="任务书ID" class="easyui-validatebox" 
							style="width: 180px;" type="hidden" name="taskId" id="taskId" 
							disabled />
						</td>

					</tr>
					
					<tr>
						<th align="right"><label>申请借人数量</label></th>
						<td><input title="申请借人数量" class="easyui-numberbox"
							style="width: 180px;" type="text" name="borrowNumber"
							id="borrowNumber" disabled /></td>
						<th align="right"><label>地点</label></th>
						<td><input title="地点" class="easyui-validatebox"
							style="width: 180px;" type="text" name="address" id="address"
							disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>预计时间</label></th>
						<td><input title="预计时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="estimateDate"
							id="estimateDate" disabled /></td>
						<th align="right"><label>专业</label></th>
						<td><input title="专业" class="easyui-validatebox"
							style="width: 180px;" type="text" name="major" id="major"
							disabled /></td>
					</tr>
					<tr>
						<th align="right"><label>客服部经办人</label></th>
						<td><input title="客服部经办人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkManKf" id="linkManKf"
							disabled /></td>
						<th align="right"><label>客服部联系电话</label></th>
						<td><input title="客服部联系电话" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkPhoneKf"
							id="linkPhoneKf" disabled /></td>
					</tr>
					<tr>
						<th align="right"><label><font color="red">*</font>借出部门经办人</label></th>
						<td><input title="借出部门经办人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkManBorrowed"  required="true"
							id="linkManBorrowed" disabled /></td>
						<th align="right"><label><font color="red">*</font>借出部门经办人电话</label></th>
						<td><input title="借出部门经办人电话" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkPhoneBorrowed"  required="true"
							id="linkPhoneBorrowed" disabled /></td>
					</tr>
					<tr>
						
						<th width="10%"><label>借出部门</label></th>
						<td width="40%"><input title="{param.field.comment}"
							class="inputbox" style="width: 180px;" type="hidden"
							name="borrowDept" id="borrowDept" />
							<div class="">
								<input class="easyui-validatebox" name="borrowDeptAlias"
									id="borrowDeptAlias" readOnly="readOnly" style="width: 179px;"></input>
							</div></td>
					</tr>
					<tr>
						<th align="right"><label>任务及要求</label></th>
						<td colspan="3" align="left" style="padding-left: 3px"><textarea
							rows="8"
							data-options="required:true,validType:'maxLength[2000]'"
							class="textareabox" name="taskDemand" id="taskDemand"
							style="resize: none" disabled></textarea></td>
					</tr>
				</table>
			</form>
		</fieldset>
		<iframe id="iframeId" width="100%" height="300" frameborder="0"></iframe>
		<div style="width: 98%; margin-left: 1%; margin-right: 18%">
			<fieldset>
				<legend>附件</legend>
				<div class="formExtendBase" style="margin-left: 10%">
					<div class="column" style="height: 130px;">
						<jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfViewInclude.jsp">
							<jsp:param name="form_id" value="<%=formId%>" />
							<jsp:param name="save_type" value="true" />
							<jsp:param name="file_category" value="PLATFORM_SEX" />
							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
						</jsp:include>
					</div>
				</div>
			</fieldset>
		</div>
		<div id="idea"></div>
	</div>
	
</body>
</html>