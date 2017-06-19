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
<!-- ControllerPath = "hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveController/operation/Detail/id" -->
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
	var outCardList;

	$(function() {
		if (!"${hdkfSupportCardArchiveDTO.tripStartTime}" == "") {
			$('#tripStartTime').datebox(
					'setValue',
					parserColumnTime(
							"${hdkfSupportCardArchiveDTO.tripStartTime}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportCardArchiveDTO.archiveTime}" == "") {
			$('#archiveTime')
					.datebox(
							'setValue',
							parserColumnTime(
									"${hdkfSupportCardArchiveDTO.archiveTime}")
									.format("yyyy-MM-dd"));
		}
	})

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					async:false,
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportCardArchive.tripStartTime = formatDatebox(result.hdkfSupportCardArchive.tripStartTime);
							result.hdkfSupportCardArchive.archiveTime = formatDatebox(result.hdkfSupportCardArchive.archiveTime);
							outCardList = result.outCardList;
							$("#formDetail").form('load',
									result.hdkfSupportCardArchive);
						} else {
							$.messager.show({
								title : '提示',
								msg : "数据加载失败。"
							});
						}
					}
				});
	}

	/**
	 * 保存表单方法
	 * @param processInstanceId
	 * @param executionId
	 */
	window.saveFormData = function(processInstanceId, executionId) {
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportcardarchive/HdkfSupportCardArchiveController/operation/save',
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
			var id = $("#dealId").val();
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
	
	function toRequestDetail3() {

		if ($("#onOffBtn3").html() == '展开任务书详情') {
			//alert("here");
			var id = $("#attribute01").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			
			//avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp
			var url = "avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp?id="
					+ id;

			$("#iframeId3").css('display', 'block');
			$("#iframeId3").attr("src", url);
			$("#onOffBtn3").html('收起任务书详情');
		} else {
			$("#iframeId3").css('display', 'none');
			$("#onOffBtn3").html('展开任务书详情');
		}
	}
	function toRequestDetail4() {

		if ($("#onOffBtn4").html() == '展开信息卡答复详情') {
			//alert("here");
			var id = $("#respId").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			
			//avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp
			var url = "avicit/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId4").css('display', 'block');
			$("#iframeId4").attr("src", url);
			$("#onOffBtn4").html('收起信息卡答复详情');
		} else {
			$("#iframeId4").css('display', 'none');
			$("#onOffBtn4").html('展开信息卡答复详情');
		}
	}
	function toRequestDetail5() {

		if ($("#onOffBtn5").html() == '展开外场信息卡详情') {
			//alert("here");
			var id = $("#attribute03").val();
			//var value = "信息卡：" + $("#requestNo").val() + "求援详情";
			//alert(id);
			
			//avicit/hdkf/support/hdkfsupporttriptask/HdkfSupportTripTaskDetailAsIfame.jsp
			//avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardDetailAsIframe.jsp
			var url = "avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardDetailAsIframe.jsp?id="
					+ id;

			$("#iframeId5").css('display', 'block');
			$("#iframeId5").attr("src", url);
			$("#onOffBtn5").html('收起外场信息卡详情');
		} else {
			$("#iframeId5").css('display', 'none');
			$("#onOffBtn5").html('展开外场信息卡详情');
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
			var url = "avicit/hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardDetailAsIframe.jsp?id="
					+ id;

			iframeIds.css('display', 'block');
			iframeIds.attr("src", url);
			onOffBtns.html('收起外场信息卡详情'+cardNo);
		} else {
			iframeIds.css('display', 'none');
			onOffBtns.html('展开外场信息卡详情'+cardNo);
		}
	}
	
	
	//avicit/hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoDetailAsIframe.jsp
	
	
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
		if($("#attribute01").val()!=''){
			$("#relateTaskDiv").css('display', 'block');
			 $('#respNo_td').css('display', 'none');
		     $('#respNo_th').css('display', 'none');
		}
       if($("#respId").val()!=''){
    	   $("#relateRespDiv").css('display', 'block');
    	  
    	   $('#attribute02_th').css('display', 'none');
		   $('#attribute02_td').css('display', 'none');
		    
		  $('#tripStartTime_th').css('display', 'none');
		  $('#tripStartTime_td').css('display', 'none');
    	   
		}
//        if($("#attribute03").val()!=''){
// 			$("#outFieldCardDiv").css('display', 'block');
// 		}
       $.each(outCardList,function(index,value){
    	   
	  		
    	   
    	   
      	 var divId="outCardDiv_"+index;
      	 var o = '<div style="margin: 10px 5px 20px 10px;" id='+divId+'><span><a href="javascript:void(0)">展开外场信息卡详情'+value.infoCardNo+'</a></span><iframe width="99%" height="870" frameborder="0" style="display: none; margin-top: 10px;"></iframe></div>';
      	 
           $("#otherFormDiv").append(o);
          // var indexDiv = "outCardDiv_"+index;
           var iframeIds= $("#outCardDiv_"+index).find("iframe");
          // var onOffBtnIds =  $("#outCardDiv_"+index).find("a");
           $("#outCardDiv_"+index).find("a").bind("click",function(){
          //	 alert("in click function---->"+index);
          	 toRequestDetails( $(this),iframeIds,value.id,value.infoCardNo);
           });
         }
         );
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
		</div>
		
		<div  id="otherFormDiv"  style="margin: 10px 5px 20px 10px">
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
<!-- 		<div style="margin: 10px 5px 20px 10px;display:none" id="outFieldCardDiv"> -->
<!-- 			<span><a id="onOffBtn5" onclick="toRequestDetail5();" -->
<!-- 				href="javascript:void(0)">展开外场信息卡详情</a></span> -->

<!-- 			<iframe id="iframeId5" width="99%" height="870" frameborder="0" -->
<!-- 				style="display: none; margin-top: 10px;"> </iframe> -->
<!-- 		</div> -->
		<div style="margin: 10px 5px 20px 10px;display:none" id="relateTaskDiv">
			<span><a id="onOffBtn3" onclick="toRequestDetail3();"
				href="javascript:void(0)">展开任务书详情</a></span>

			<iframe id="iframeId3" width="99%" height="870" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>
		<div style="margin: 10px 5px 20px 10px;display:none" id="relateRespDiv">
			<span><a id="onOffBtn4" onclick="toRequestDetail4();"
				href="javascript:void(0)">展开信息卡答复详情</a></span>

			<iframe id="iframeId4" width="99%" height="870" frameborder="0"
				style="display: none; margin-top: 10px;"> </iframe>
		</div>
	</div>
		
		


		<!-- 流程按钮区域结束 -->
		<fieldset>
          <legend>归档信息详情</legend>
			<form id='formDetail'>
				<input type="hidden" name="id" /> <input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
<!-- 					<th align="right"><label>请求处理ID</label></th> -->
<!-- 						<td></td> -->
							
							<th align="right"><label>信息卡编号</label></th>
						<td><input title="求援请求ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="requestId" id="requestId"
							disabled /><input title="求援信息编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestNo" id="requestNo"
							disabled />
							<input title="处理ID" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="dealId" id="dealId"
							disabled />
							<input title="外场信息卡" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="attribute03" id="attribute03"
							disabled />
							</td>
							
						<th align="right"><label>归档类别</label></th>
						<td>							
							<pt6:syslookup name="archiveType"
							lookupCode="SUPPORT_ARCHIVE_TYPE"
							dataOptions="required:true,width:180,editable:false,disabled:true,panelHeight:'auto'">
							</pt6:syslookup>
							</td>
						
					</tr>
					
					
				
					<tr>
								
<!-- 						<th width="10%">外场信息卡编号:</th> -->
<!-- 					<td width="40%"><input title="外场信息卡ID" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="hidden" name="attribute03" id="attribute03" /> -->
<!-- 						<input title="外场信息卡编号" class="inputbox easyui-validatebox" -->
<!-- 						editable="false" style="width: 182px;" type="text" -->
<!-- 						name="attribute04" id="attribute04" disabled  /></td> -->
						
						<th align="right"><label>归档时间</label></th>
						<td><input title="归档时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="archiveTime"
							id="archiveTime" disabled /></td>
						
						<th id="tripStartTime_th" align="right"><label>赴外场出发时间</label></th>
						<td id="tripStartTime_td"><input title="赴外场出发时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="tripStartTime"
							id="tripStartTime" disabled /></td>
					</tr>
					<tr>
						<th id="respNo_th" align="right"><label>答复文号</label></th>
						<td id="respNo_td"><input title="答复文号" class="easyui-validatebox"
							style="width: 180px;" type="hidden" name="respId" id="respId"
							disabled /><input title="答复文号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="respNo" id="respNo"
							disabled /></td>
							
					<th id="attribute02_th" align="right">任务书编号:</th>
					<td id="attribute02_td"><input title="任务书ID"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="attribute01" id="attribute01" />
						<input title="任务书编号" class="inputbox easyui-validatebox"
						editable="false" style="width: 182px;" type="text"
						name="attribute02" id="attribute02" disabled  /></td>
						
					</tr>
						<tr>
						
<!-- 						<th align="right"><label>归档编号</label></th> -->
<!-- 						<td><input title="归档编号" class="easyui-validatebox" -->
<!-- 							style="width: 180px;" type="text" name="archiveNo" id="archiveNo" -->
<!-- 							disabled /></td> -->
							
						
					</tr>
					
				</table>
			</form>
		</fieldset>
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