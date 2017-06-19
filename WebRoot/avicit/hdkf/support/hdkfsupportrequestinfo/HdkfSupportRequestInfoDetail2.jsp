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
<!-- ControllerPath = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/Detail/id" -->
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
		if (!"${hdkfSupportRequestInfoDTO.requestDate}" == "") {
			$('#requestDate')
					.datebox(
							'setValue',
							parserColumnTime(
									"${hdkfSupportRequestInfoDTO.requestDate}")
									.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportRequestInfoDTO.repairTime}" == "") {
			$('#repairTime').datebox(
					'setValue',
					parserColumnTime("${hdkfSupportRequestInfoDTO.repairTime}")
							.format("yyyy-MM-dd"));
		}
		if (!"${hdkfSupportRequestInfoDTO.occurrenceDate}" == "") {
			$('#occurrenceDate').datebox(
					'setValue',
					parserColumnTime(
							"${hdkfSupportRequestInfoDTO.occurrenceDate}")
							.format("yyyy-MM-dd"));
		}
	})

	//初始化页面值
	function initFormData() {
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/toDetailJsp.json',
					data : {
						id : formId
					},
					type : 'post',
					dataType : 'json',
					success : function(result) {
						if (result.flag == "success") {
							//进行时间转化
							result.hdkfSupportRequestInfo.requestDate = formatDatebox(result.hdkfSupportRequestInfo.requestDate);
							result.hdkfSupportRequestInfo.repairTime = formatDatebox(result.hdkfSupportRequestInfo.repairTime);
							result.hdkfSupportRequestInfo.occurrenceDate = formatDatebox(result.hdkfSupportRequestInfo.occurrenceDate);
							$("#formDetail").form('load',
									result.hdkfSupportRequestInfo);
							$("#requestManagerName").val("${CURRENT_LOGINUSER.name}");
							$("#requestManagerId").val("${userId}");
							
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
		 if($("#distributionType").combobox('getValue')==''){
				alert("发外场信息卡不能为空！");
				return false;
			}
		 if($("#infoType").combobox('getValue')==''){
				alert("信息类别不能为空！");
				return false;
			}
		 if($("#faultType").combobox('getValue')==''){
				alert("发公用笺不能为空！");
				return false;
			}
		
		
		
		
		var distributionType ;
		$
		.ajax({
			url : 'platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/queryDto.json',
			data : {
				id : formId
			},
			async:false,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					//进行时间转化
					result.hdkfSupportRequestInfo.requestDate = formatDatebox(result.hdkfSupportRequestInfo.requestDate);
					result.hdkfSupportRequestInfo.repairTime = formatDatebox(result.hdkfSupportRequestInfo.repairTime);
					result.hdkfSupportRequestInfo.occurrenceDate = formatDatebox(result.hdkfSupportRequestInfo.occurrenceDate);
				 distributionType=result.hdkfSupportRequestInfo.distributionType;
					
				} else {
					$.messager.show({
						title : '提示',
						msg : "数据加载失败。"
					});
				}
			}
		});
		
		if(!distributionType)
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
		
		 if($("#distributionType").combobox('getValue')==''){
				alert("发外场信息卡不能为空！");
				return ;
			}
		 if($("#infoType").combobox('getValue')==''){
				alert("信息类别不能为空！");
				return ;
			}
		 if($("#faultType").combobox('getValue')==''){
				alert("发公用笺不能为空！");
				return ;
			}
		if ($('#formDetail').form('validate') == false) {
			alert("请检查表单元素，是否有必填项！");
			return;
		}
		
		var dataVo = $('#formDetail').serializeArray();
		var dataJson = convertToJson(dataVo);
		dataVo = JSON.stringify(dataJson);
		$
				.ajax({
					url : 'platform/hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/save',
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
	//页面加载完成后入口
	$(function() {
		initFormData();
		//不控制表单权限
		//initBpmInfo(entryId,executionId,taskId,formId);
		//控制表单权限用这个
		initBpmInfoAndFormAccess(entryId, executionId, taskId, formId);
		var idR =formId;
		//var requestUnitR =$("#requestUnit").val();
		var url = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfSupportFaultDetailInfo2?requestId="+idR;
		$("#iframeId").css('display','block');
		$("#iframeId").attr("src",url);
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


		<!-- 流程按钮区域结束 -->
		<fieldset>

			<form id='formDetail'>
				<input type="hidden" name="id" />
				<!-- 				<table class="form_commonTable"> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>求援方式</label></th> -->
				<!-- 						<td><input title="求援方式" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestMethod" -->
				<!-- 							id="requestMethod" disabled /></td> -->
				<!-- 						<th align="right"><label>信息处理卡编号</label></th> -->
				<!-- 						<td><input title="信息处理卡编号" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestNo" id="requestNo" -->
				<!-- 							disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>故障标题</label></th> -->
				<!-- 						<td><input title="故障标题" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestName" -->
				<!-- 							id="requestName" disabled /></td> -->
				<!-- 						<th align="right"><label>求援单位</label></th> -->
				<!-- 						<td><input title="求援单位" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestUnit" -->
				<!-- 							id="requestUnit" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>求援单位联系人</label></th> -->
				<!-- 						<td><input title="求援单位联系人" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="linkMan" id="linkMan" -->
				<!-- 							disabled /></td> -->
				<!-- 						<th align="right"><label>求援单位联系电话</label></th> -->
				<!-- 						<td><input title="求援单位联系电话" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="linkPhone" id="linkPhone" -->
				<!-- 							disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>求援单位传真</label></th> -->
				<!-- 						<td><input title="求援单位传真" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="fax" id="fax" disabled /> -->
				<!-- 						</td> -->
				<!-- 						<th align="right"><label>求援时间</label></th> -->
				<!-- 						<td><input title="求援时间" class="easyui-datebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestDate" -->
				<!-- 							id="requestDate" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>批架次</label></th> -->
				<!-- 						<td><input title="批架次" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="batchNo" id="batchNo" -->
				<!-- 							disabled /></td> -->
				<!-- 						<th align="right"><label>机型</label></th> -->
				<!-- 						<td><input title="机型" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="modelId" id="modelId" -->
				<!-- 							disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>产品名称</label></th> -->
				<!-- 						<td><input title="产品名称" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="productName" -->
				<!-- 							id="productName" disabled /></td> -->
				<!-- 						<th align="right"><label>型号图号</label></th> -->
				<!-- 						<td><input title="型号图号" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="figureNo" id="figureNo" -->
				<!-- 							disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>件号</label></th> -->
				<!-- 						<td><input title="件号" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="partNo" id="partNo" -->
				<!-- 							disabled /></td> -->
				<!-- 						<th align="right"><label>生产单位</label></th> -->
				<!-- 						<td><input title="生产单位" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="productionUnit" -->
				<!-- 							id="productionUnit" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>飞行小时</label></th> -->
				<!-- 						<td><input title="飞行小时" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="flightHours" -->
				<!-- 							id="flightHours" disabled /></td> -->
				<!-- 						<th align="right"><label>飞机起落</label></th> -->
				<!-- 						<td><input title="飞机起落" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="flightLanding" -->
				<!-- 							id="flightLanding" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>何时大修</label></th> -->
				<!-- 						<td><input title="何时大修" class="easyui-datebox" -->
				<!-- 							style="width: 180px;" type="text" name="repairTime" -->
				<!-- 							id="repairTime" disabled /></td> -->
				<!-- 						<th align="right"><label>发生日期</label></th> -->
				<!-- 						<td><input title="发生日期" class="easyui-datebox" -->
				<!-- 							style="width: 180px;" type="text" name="occurrenceDate" -->
				<!-- 							id="occurrenceDate" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>发现时机</label></th> -->
				<!-- 						<td><input title="发现时机" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="occurrenceTiming" -->
				<!-- 							id="occurrenceTiming" disabled /></td> -->
				<!-- 						<th align="right"><label>ATA章节</label></th> -->
				<!-- 						<td><input title="ATA章节" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="chaperNo" id="chaperNo" -->
				<!-- 							disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>故障描述</label></th> -->
				<!-- 						<td><input title="故障描述" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="faultDesc" id="faultDesc" -->
				<!-- 							disabled /></td> -->
				<!-- 						<th align="right"><label>分发类型</label></th> -->
				<!-- 						<td><input title="分发类型" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="distributionType" -->
				<!-- 							id="distributionType" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>技术员ID</label></th> -->
				<!-- 						<td><input title="技术员ID" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestManagerId" -->
				<!-- 							id="requestManagerId" disabled /></td> -->
				<!-- 						<th align="right"><label>技术员姓名</label></th> -->
				<!-- 						<td><input title="技术员姓名" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="requestManagerName" -->
				<!-- 							id="requestManagerName" disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<th align="right"><label>信息类别</label></th> -->
				<!-- 						<td><input title="信息类别" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="infoType" id="infoType" -->
				<!-- 							disabled /></td> -->
				<!-- 						<th align="right"><label>发公用笺</label></th> -->
				<!-- 						<td><input title="发公用笺" class="easyui-validatebox" -->
				<!-- 							style="width: 180px;" type="text" name="faultType" id="faultType" -->
				<!-- 							disabled /></td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 					</tr> -->
				<!-- 				</table> -->
				<table class="form_commonTable">
					<tr>
						<th align="right"><label>求援方式</label></th>
						<!-- 						<td><input title="求援方式" class="easyui-validatebox" -->
						<!-- 							style="width: 180px;" type="text" name="requestMethod" -->
						<!-- 							id="requestMethod" disabled /></td> -->
						<td><pt6:syslookup name="requestMethod"
								lookupCode="SUPPORT_REQUEST_TYPE"
								dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
							</pt6:syslookup></td>
						<th align="right"><label>信息卡编号</label></th>
						<td><input title="信息卡编号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestNo" id="requestNo"
							disabled /></td>
					</tr>
					<tr>

						<th align="right"><label>求援单位</label></th>
						<td><input title="求援单位" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestUnitAlias"
							id="requestUnitAlias" disabled /></td>

						<th align="right"><label>求援单位联系人</label></th>
						<td><input title="求援单位联系人" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkMan" id="linkMan"
							disabled /></td>
					</tr>
					<tr>

						<th align="right"><label>求援单位联系电话</label></th>
						<td><input title="求援单位联系电话" class="easyui-validatebox"
							style="width: 180px;" type="text" name="linkPhone" id="linkPhone"
							disabled /></td>
						<th align="right"><label>求援单位传真</label></th>
						<td><input title="求援单位传真" class="easyui-validatebox"
							style="width: 180px;" type="text" name="fax" id="fax" disabled />
						</td>
					</tr>
					<tr>



<%-- 						<th align="right"><label>发现时机</label></th>
						<!-- 						<td><input title="发现时机" class="easyui-validatebox" -->
						<!-- 							style="width: 180px;" type="text" name="occurrenceTiming" -->
						<!-- 							id="occurrenceTiming" disabled /></td> -->
						<td style="padding-left: 3px"><pt6:syslookup
								name="occurrenceTiming" lookupCode="CSMP_FM_FAULTHAPPENMONMENT"
								dataOptions="width:150,editable:false,disabled:true,panelHeight:'100%',onShowPanel:comboboxOnShowPanel">
							</pt6:syslookup></td> --%>
<!-- 					</tr>
					<tr> -->
                       <th align="right"><label>批架次</label></th>
					<td><input title="批架次" class="easyui-validatebox"
						style="width: 180px;" type="text" name="batchNo"
						id="batchNo" disabled /></td>
												<th align="right"><label>型号图号</label></th>
						<td><input title="型号图号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="figureNo" id="figureNo"
							disabled /></td>
<!-- 												<th align="right"><label>求援时间</label></th>
						<td><input title="求援时间" class="easyui-datebox"
							style="width: 180px;" type="text" name="requestDate"
							id="requestDate" disabled /></td> -->
						</tr>
					<tr>
						<th align="right"><label>机型</label></th>
						<td><input title="机型" class="easyui-validatebox"
							style="width: 180px;" type="text" name="modelIdAlias"
							id="modelIdAlias" disabled /></td>
<!-- 						<th align="right"><label>何时大修</label></th> -->
<!-- 						<td><input title="何时大修" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="repairTime" -->
<!-- 							id="repairTime" disabled /></td> -->
<!-- 					</tr>
					<tr> -->
						<th align="right"><label>产品名称</label></th>
						<td><input title="产品名称" class="easyui-validatebox"
							style="width: 180px;" type="text" name="productName"
							id="productName" disabled /></td>
														</tr>
					<tr>
						<th align="right"><label>件号</label></th>
						<td><input title="件号" class="easyui-validatebox"
							style="width: 180px;" type="text" name="partNo" id="partNo"
							disabled /></td>
						<th align="right"><label>生产单位</label></th>
						<td><input title="生产单位" class="easyui-validatebox"
							style="width: 180px;" type="text" name="productionUnit"
							id="productionUnit" disabled /></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th align="right"><label>飞行小时</label></th> -->
<!-- 						<td><input title="飞行小时" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" name="flightHours" -->
<!-- 							id="flightHours" disabled /></td> -->
<!-- 						<th align="right"><label>飞机起落</label></th> -->
<!-- 						<td><input title="飞机起落" class="easyui-numberbox" -->
<!-- 							style="width: 180px;" type="text" name="flightLanding" -->
<!-- 							id="flightLanding" disabled /></td> -->
<!-- 					</tr> -->
					
					
<!-- 						<th align="right"><label>发生日期</label></th> -->
<!-- 						<td><input title="发生日期" class="easyui-datebox" -->
<!-- 							style="width: 180px;" type="text" name="occurrenceDate" -->
<!-- 							id="occurrenceDate" disabled /></td> -->
					
<!-- 					<tr> -->

<!-- 						<th align="right"><label>ATA章节</label></th> -->

<!-- 						<td colspan="5" style="padding-left: 3px"> -->
<!-- 						<input id="chaperNo" -->
<!-- 							class="easyui-combobox" name="chaperNo" -->
<!-- 							data-options="valueField:'id',textField:'ataName',url:'platform/csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController/search1',onShowPanel:comboboxOnShowPanel" -->
<%-- 							value="${csmpEtsOutfieldfailureDTO.chaperNo}" disabled="disabled"></input> --%>
<!-- 						</td> -->

<!-- 					</tr> -->
						<tr>
					<th width="94px">信息卡标题:</th>
					<td  width="117px" colspan="5"  style="padding-left: 3px"><input title="信息卡标题"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'" style="width: 180px;"
						type="text" name="requestName" id="requestName" disabled /></td>
				
				</tr>
					<tr>
						<th align="right"><label>信息卡描述</label></th>
						<td colspan="5" style="padding-left: 3px">
							 <textarea
								data-options="required:true,validType:'maxLength[50]'"
								name="faultDesc" id="faultDesc" rows="7" class="textareabox"
								disabled="disabled" style="resize: none"></textarea>

						</td>

					</tr>


					<tr>

						
						<th align="right"><label>技术员</label></th>
						<td><input title="技术员姓名" class="easyui-validatebox"
							style="width: 180px;" type="text" name="requestManagerName"
							id="requestManagerName" disabled  readonly/>
							<input title="技术员ID" class="easyui-validatebox"
							 type="hidden" name="requestManagerId"
							id="requestManagerId" disabled />
							</td>

						<th align="right"><span class="remind">*</span>发外场信息卡</th>
						<td><pt6:syslookup name="distributionType" 
							lookupCode="SUPPORT_DISTRIB_TYPE" 
							isNull="true"
 							dataOptions="required:true,width:180,editable:false,panelHeight:'auto',disabled:'disabled'">
						</pt6:syslookup></td>
					</tr>
							
					<tr>
						<th align="right"><span class="remind">*</span>信息类别</th>
						<td><pt6:syslookup name="infoType"
							lookupCode="CSMP_ES_INFO_TYPE"
							isNull="true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto',disabled:'disabled'"></pt6:syslookup></td>
						<th align="right"><span class="remind">*</span>发公用笺</th>
						<td><pt6:syslookup name="faultType"
							lookupCode="CSMP_ETS_FIGURETYPE"
							isNull="true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto',disabled:'disabled'">
						</pt6:syslookup></td>
					</tr>

					<tr>
					</tr>
				</table>
			</form>

		</fieldset>
		<iframe id="iframeId" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
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