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
<!-- ControllerPath = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/operation/Add/null" -->
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
			<input type="hidden" name="id"  />
			<table class="form_commonTable">
				<tr>

					<th width="10%"><span class="remind">*</span>求援方式:</th>
					<td width="40%"><pt6:syslookup name="requestMethod"
							lookupCode="SUPPORT_REQUEST_TYPE"
							isNull = "true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">信息处理卡编号:</th>
					<td width="40%"><input title="自动生成"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestNo" id="requestNo" readonly/></td>
				</tr>
				<tr>
					
					<th width="10%"><span class="remind">*</span>求援单位:</th>
					<td width="40%">
						
						<input type="hidden" name="requestUnit" class="easyui-validatebox"
							id="requestUnit" style="width: 148px;  height: 100%;"/>
							<input type="text" data-options="required:true,validType:'maxLength[50]'" name="requestUnitAlias" class="easyui-validatebox"
							id="requestUnitAlias" style="width: 148px;  height: 100%;" onfocus="openDialogCompany();" readonly="readonly"/>
				    </td>
						
						
						
						
						
					
						<th width="10%">求援单位联系人:</th>
					<td width="40%"><input title="求援单位联系人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[20]'" style="width: 180px;"
						type="text" name="linkMan" id="linkMan" /></td>	
						
				</tr>
				<tr>
				
					<th width="10%">求援单位联系电话:</th>
					<td width="40%"><input title="求援单位联系电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[20]'" style="width: 180px;"
						type="text" name="linkPhone" id="linkPhone" /></td>
						
					<th width="10%">求援单位传真:</th>
					<td width="40%"><input title="求援单位传真"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[20]'" style="width: 180px;"
						type="text" name="fax" id="fax" /></td>
				</tr>
				<tr>
				<th width="10%"><span class="remind">*</span>机型:</th>
					<td width="40%"><input title="机型"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="modelId" id="modelId" />
						
						<input type="text" name="modelIdAlias" class="easyui-validatebox"
						editable="false"
						data-options="required:true,validType:'maxLength[100]'"
							id="modelIdAlias" style="width: 180px;" onfocus="openDialogma();"   />		
				
<%-- 					<th width="10%"><span class="remind">*</span>发现时机:</th>
					<td width="40%"><pt6:syslookup name="occurrenceTiming"
							lookupCode="CSMP_FM_FAULTHAPPENMONMENT"
							isNull="true"
							dataOptions="required:true,width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td> --%>
							<!-- <th width="10%"><span class="remind">*</span>求援时间:</th>
					<td width="40%"><input title="求援时间" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="requestDate" id="requestDate"  required="true"/></td> -->

						
						
												
                <!-- <th width="10%"><span class="remind">*</span>批架次:</th> -->
				<input title="批架次"
						class="inputbox easyui-validatebox" 
						data-options="validType:'maxLength[100]'" style="width: 180px;"
 						type="hidden" name="batchNo" id="batchNo" /> </td>
 						
 				<th width="10%">产品名称:</th>
					<td width="40%"><input title="产品名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[200]'" style="width: 180px;"
						type="text" name="productName" id="productName" onfocus="openDialogSparePart();"/></td>
					
						
				</tr>
				<tr>
<!-- 					<th width="10%"><span class="remind">*</span>批架次:</th> -->
<!-- 					<td width="40%"><input title="批架次" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[100]'" style="width: 180px;" -->
<!-- 						type="hidden" name="batchNo" id="batchNo" /> -->
						
<!-- 						<input type="hidden" name="batchNoAlias" class="easyui-validatebox" -->
<!-- 						data-options="required:true,validType:'maxLength[100]'" -->
<!-- 							id="batchNoAlias" style="width: 180px;" /> -->
<!-- 						</td> -->



					<!-- <th width="10%"><span class="remind">*</span>机型:</th>
					<td width="40%"><input title="机型"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="hidden" name="modelId" id="modelId" />
						
						<input type="text" name="modelIdAlias" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[100]'"
							id="modelIdAlias" style="width: 180px;"   />
						
						</td> -->
					
<!-- 					<th width="10%"><span class="remind">*</span>何时大修:</th> -->
<!-- 					<td width="40%"><input title="何时大修" class="easyui-datebox" -->
<!-- 						editable="false" style="width: 182px;" type="text" -->
<!-- 						name="repairTime" id="repairTime"  required="true"/></td> -->
						
<!-- 				</tr>
				<tr> -->
	
						<th width="10%">型号图号:</th>
					<td width="40%"><input title="型号图号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="figureNo" id="figureNo"  readonly/></td>
						<th width="10%">件号:</th>
					<td width="40%"><input title="件号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[100]'" style="width: 180px;"
						type="text" name="partNo" id="partNo" /></td>
						</tr>
				<tr>
					
					
					<th width="10%">生产单位:</th>
					<td width="40%"><input title="生产单位"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="productionUnit" id="productionUnit" /></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th width="10%">飞行小时:</th> -->
<!-- 					<td width="40%"><input title="飞行小时" -->
<!-- 						class=" easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[22]'" style="width: 180px;" -->
<!-- 						type="text" name="flightHours" id="flightHours" readonly/></td> -->
<!-- 					<th width="10%">飞机起落:</th> -->
<!-- 					<td width="40%"><input title="飞机起落" -->
<!-- 						class=" easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[22]'" style="width: 180px;" -->
<!-- 						type="text" name="flightLanding" id="flightLanding" readonly/></td> -->
<!-- 				</tr> -->
				<tr>
				
<!-- 					<th width="10%"><span class="remind">*</span>发生日期:</th> -->
<!-- 					<td width="40%"><input title="发生日期" class="easyui-datebox" -->
<!-- 						editable="false" style="width: 182px;" type="text" -->
<!-- 						name="occurrenceDate" id="occurrenceDate"  required="true"/></td> -->
				</tr>
<!-- 				<tr> -->
<!-- 				       <th width="94px"><span class="remind">*</span>ATA章节</th> -->
<!-- 						<td width="117px" colspan="5" style="padding-left: 3px"> -->
<!-- 						 <input type="hidden" name="chaperNo" -->
<!-- 						id="chaperNo" /> <input title="ATA章节" class="easyui-combotree" -->
<!-- 						data-options="required:true,validType:'maxLength[255]',panelHeight:'170',onShowPanel:comboboxOnShowPanel" -->
<!-- 						style="width: 180px;" type="text" name="chaperNoAlias" id="chaperNoAlias" /> -->
<!-- 						</td> -->
<!-- 				</tr> -->
				<tr>
				
				<th width="94px"><span class="remind">*</span>信息卡标题:</th>
					<td  width="117px" colspan="5"  style="padding-left: 3px"><input title="信息卡标题"
						class="inputbox easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="requestName" id="requestName" /></td>
				
				</tr>
				
				<tr>
				
<!-- 					<th width="100px"><span class="remind">*</span>故障现象描述</th> -->
						
<!-- 						<td colspan="5" align="left" style="padding-left: 3px"> -->
<!-- 							<textarea rows="12" -->
<!-- 						data-options="required:true,validType:'maxLength[2000]'" class="textareabox" name="faultDesc" id="faultDesc" style="resize:none"></textarea> -->
<!-- 						</td> -->
						
<!-- 					<th width="10%">分发类型:</th> -->
<%-- 					<td width="40%"><pt6:syslookup name="distributionType" --%>
<%-- 							lookupCode="SUPPORT_DISTRIB_TYPE" --%>
<%-- 							dataOptions="width:180,editable:false,panelHeight:'auto'"> --%>
<%-- 						</pt6:syslookup></td> --%>
				</tr>
			
<!-- 				<tr> -->
<!-- 					<th width="10%">技术员ID:</th> -->
<!-- 					<td width="40%"><input title="技术员ID" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="text" name="requestManagerId" id="requestManagerId" /></td> -->
<!-- 					<th width="10%">技术员姓名:</th> -->
<!-- 					<td width="40%"><input title="技术员姓名" -->
<!-- 						class="inputbox easyui-validatebox" -->
<!-- 						data-options="validType:'maxLength[50]'" style="width: 180px;" -->
<!-- 						type="text" name="requestManagerName" id="requestManagerName" /></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th width="10%">信息类别:</th> -->
<%-- 					<td width="40%"><pt6:syslookup name="infoType" --%>
<%-- 							lookupCode="CSMP_ES_INFO_TYPE" --%>
<%-- 							dataOptions="width:180,editable:false,panelHeight:'auto'"> --%>
<%-- 						</pt6:syslookup></td> --%>
<!-- 					<th width="10%">故障类型:</th> -->
<%-- 					<td width="40%"><pt6:syslookup name="faultType" --%>
<%-- 							lookupCode="CSMP_ETS_FIGURETYPE" --%>
<%-- 							dataOptions="width:180,editable:false,panelHeight:'auto'"> --%>
<%-- 						</pt6:syslookup></td> --%>
<!-- 				</tr> -->
<!-- 				<tr > -->
<!-- 				<th width="10%">复选框测试:</th> -->
<!-- 					<td width="40%"> -->
<!-- 				<span class="block-box">  -->
<!--                 <input type="checkbox" class="checkbox" id="check1"/>  -->
<!--                 <span class="checkbox-text">复选框</span>  -->
<!--                  <input type="checkbox" class="checkbox" id="check2"/>  -->
<!--                 <span class="checkbox-text">复选框1</span> -->
<!--                  <input type="checkbox" class="checkbox" id="check3"/>  -->
<!--                 <span class="checkbox-text">复选框2</span>   -->
<!--             </span> </td> -->
<!-- 				</tr> -->
			</table>
			<input type="hidden" value="${id}" name="id" />
		</form>
		<iframe id="iframeId" width="100%" height="600" frameborder="0" style="display:none;">
        </iframe>
		<jsp:include
			page="/avicit/platform6/modules/system/swfupload/swfBpmEditInclude.jsp">
			<jsp:param name="file_size_limit" value="1024 MB" />
			<jsp:param name="file_types" value="*.*" />
			<jsp:param name="file_upload_limit" value="10" />
			<jsp:param name="save_type" value="false" />
			<jsp:param name="form_id" value="${id}" />
			<jsp:param name="form_code" value="hdkfSupportRequestInfo" />
			<jsp:param name="form_field" value="" />
			<jsp:param name="allowAdd" value="true" />
			<jsp:param name="allowDel" value="true" />
			<jsp:param name="cleanOnExit" value="true" />
			<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
		</jsp:include>
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
			
		//	alert("${id}");
			
			
			////ATA选择框  设置字段的样式属性为树形下拉选择框
			
			$('#chaperNoAlias').combotree({
								required : true,
								editable : false,
								/**
								 * 访问地址： url地址 +"/gettree/2/All"
								 * 第一个参数 gettree：controller层的映射路径
								 * 第二个参数 2：  代表需要显示树目录的第几层的节点
								 * 第三个参数 null： 代表查询树节点数据的显示判断（0 无效， 1 有效，null 查询所有）
								 **/ 
								url : 'platform/csmp/basicData/csmpbdatachapter/CsmpBdAtachapterController/gettree/3/1',
								//选择之后的操作，给相应的文本框赋值			
								onSelect : function(record) {
									$("#chaperNo").val(record.id);
									$("#chaperNoAlias").val(record.ataName);
								}
							});
			
			
		});
		function closeForm() {
			parent.hdkfSupportRequestInfo.closeDialog("#insert");
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
		function saveForm() {
			
// 			if($("#check1").attr('checked'))
// 				alert("check1");
// 			if($("#check2").attr('checked'))
// 				alert("check2");
// 			if($("#check3").attr('checked'))
// 				alert("check3");
			
			var numberRex = /^[0-9]*$/;
			var faxRex = /^(^(\d{3,4}-)?\d{7,8})$|^((1[0-9][0-9]\d{8}$))$/;
			var mobileRex=/^1[3-8]+\d{9}$/;
			var phoneRex=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
			//alert($("#requestMethod").val());
			//alert($("#requestMethod").combobox('getValue'));
			if($("#requestMethod").combobox('getValue')==''){
				alert("求援方式不能为空！");
				return;
			}
// 			if($("#occurrenceTiming").combobox('getValue')==''){
// 				alert("发现时机不能为空！");
// 				return;
// 			}
// 			if($("#faultDesc").val()==''){
// 				alert("故障描述不能为空！");
// 				return;
// 			}
			
			
			if($('#linkPhone').val()!=''){
				var linkPhoneVal = $('#linkPhone').val();
// 				 if(!mobileRex.test(linkPhoneVal)&&!phoneRex.test(linkPhoneVal))
// 				    {
// 					 alert("请输入正确的电话号码！");
// 				      return ;
// 				    }
                  if(isChineseChar(linkPhoneVal)||isFullwidthChar(linkPhoneVal)){
                	  alert("电话号码不能包含中文或者全角符号，请检查！");
                	  return;
                  }
			}
          if($("#fax").val()!=''){
				
				var  faxVal = $("#fax").val();
				
// 				if(!faxRex.test(faxVal))
// 				{
// 				alert("请输入正确的传真号码！");
// 				return;
// 				}
			    if(isChineseChar(faxVal)||isFullwidthChar(faxVal)){
              	  alert("传真号码不能包含中文或者全角符号，请检查！");
              	  return;
                }
			}
          // $('#dd').datebox('getValue');
//           if($("#requestDate").datebox('getValue')<$("#occurrenceDate").datebox('getValue'))
//         	  {
//         	    alert("故障发生时间不能大于求援时间，请检查！");
// 				return;
//         	  }
          
          
          
// 			if($('#flightHours').val()!=''){
// 				if(!numberRex.test($('#flightHours').val())){
// 					alert("请输入正确的飞行小时，数字！");
// 				}
// 			}
// 			if($('#flightLanding').val()!=''){
// 				if(!numberRex.test($('#flightLanding').val())){
// 					alert("请输入正确的飞机起落，数字！");
// 				}
// 			}

			if ($('#form').form('validate') == false) {
				alert("请检查表单相关项，输入是否合法或者为空！");
				return;
			}
// 			if($("#faultDesc").val().length>2000){
// 				alert("故障描述长度不能超过2000");
// 				return;
// 			}

			if($("#requestName").val().length>50){
				alert("信息卡标题长度不能超过50");
				return;
			}
			$('#saveButton').linkbutton('disable').unbind("click");
			
			parent.hdkfSupportRequestInfo.saveFormAndStartFlow(
					serializeObject($('#form')), "#insert");
		}
		//打开求援单位页面
		function openDialogCompany() {
			this.nData = new CommonDialog("model1", "850", "500", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfConpanyInfo", "客户选择", false, true, false);
			this.nData.show();
		}
		//求援单位回写
		var requestUnit;
		
		function callBackDataConpany(data) {
			$("#model1").dialog("close");
			$("#requestUnit").val(data.id);
			$("#requestUnitAlias").val(data.companyName);
			requestUnit=data.id;
/*  			
			var idR = "${id}";
			var url = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfSupportFaultDetailInfo1?requestId="+idR+"&requestUnit="+data.id;
			$("#iframeId").css('display','block');
			$("#iframeId").attr("src",url);  */
		}
		
		
		function getStringRuleCode(requestId, modelId) {
			$.ajax({
				url : "platform/csmp/basicData/hdkfbdcoderule/HdkfBdCodeRuleController/operation/getStringRuleCode.json",
				data : {
					type : "A",
					requestId : requestId,
					modelId : modelId
				},
				type : "post",
				dataType : 'json',
				success : function(result) {
					if (result.flag == "success")
					{
						$("#requestNo").val(result.ruleCode);
					}
				}
			});
		}
		
/* 		//打开选择机型、批架次页面
		function openDialog() {
			var co=$("#requestUnitAlias").attr("value");
			var co1=$("#requestUnit").attr("value");
			if(co==''){
				alert("请先选择用户单位");
				return;
			}
			this.nData = new CommonDialog("model", "790", "500", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdAircraftinfoInfos/"+co1, "批架次选择", false, true, false);
			this.nData.show();
		} */
		//打开选择机型页面
		function openDialogma() {
			var co=$("#requestUnitAlias").attr("value");
			var co1=$("#requestUnit").attr("value");
			if(co==''){
				
				alert("请先选择用户单位");
				$("#requestUnitAlias").focus();
				return ;
			}
			this.nData = new CommonDialog("model", "490", "400", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdAircraftinfoModelInfos/"+co1, "机型选择", false, true, false);
			this.nData.show();
		}
		
		function callBackData(data) {
			$("#model").dialog("close");
	        $("#modelIdAlias").val(data.modelIdAlias);
 			$("#modelId").val(data.modelId);
		//	$("#batchNo").val(data.id);
			//$("#batchNoAlias").val(data.batchNo);
// 			$("#flightHours").val(data.flightNum);
// 			 $("#flightLanding").val(data.takeoffLandingNum);
			//alert("in callBackBatchNo ---->"+batchNos);
	        //  $("#batchNo").val(batchNos);
	          
	 			
/* 				var idR = "${id}";
				var url = "hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/HdkfSupportFaultDetailInfo1?requestId="+idR+"&requestUnit="+requestUnit+"&batchNo="+batchNos;
				$("#iframeId").css('display','block');
				$("#iframeId").attr("src",url); 
	           */
	          
			getStringRuleCode($("#id").val(),data.modelId);
		}
		
		
		//打开选择产品名称页面
		function openDialogSparePart() {
			this.nData = new CommonDialog("model3", "790", "600", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdSparepartInfoSelect", "产品选择", false, true, false);
			this.nData.show();
		}
		function setSparePartTextAndChapter(data) {
			$("#model3").dialog("close");
			$("#productName").val(data.productName);
			$("#figureNo").val(data.drawingNo);
			$("#productionUnit").val(data.liabilityUnit);

		}
	</script>
</body>
</html>