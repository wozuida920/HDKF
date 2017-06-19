<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/operation/Add/null" -->
<title>单位信息添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
	<script type="text/javascript">
	$(function() {
	 	$("#country").combobox({
			onSelect:function(){
				var pid = $("#country").combobox('getValue');      
				$("#province").combobox('setValue','请选择');
				$("#province").combobox('reload','platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getProvinceByCountryCodeValue/'+pid);
			}
		}); 
	});	
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false"
		style="width: ">
		<form id='form'>			
			<input type="hidden" name="id" />
			<table class="form_commonTable"  >
				<tr>
					<th width="17%"><span style="color: red;">*</span> 单位编码:</th>
					<td width="33%"><input title="单位编码" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="companyCode"
						id="companyCode" /></td>

					<th width="17%"><span style="color: red;">*</span> 公司名称:</th>
					<td width="33%"><input title="公司名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="companyName"
						id="companyName" /></td>
				</tr>
				<tr>
					<th width="17%"><span style="color: red;">*</span> 简称:</th>
					<td width="33%"><input title="简称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="shortName" id="shortName" />
					</td>
					<th width="17%">英文名称:</th>
					<td width="33%"><input title="英文名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="nameEn" id="nameEn" /></td>
				</tr>
				<tr>
					<th width="17%">英文缩写:</th>
					<td width="33%"><input title="英文简称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="shortNameEn" id="shortNameEn" /></td>
					<th width="17%">等级:</th>
					<td width="33%">
						<pt6:syslookup name="companyLevel"
							lookupCode="CSMP_BD_COMPANYINFO_COMPANY_LEVEL"
							isNull="true"
							dataOptions="width:250,editable:false,panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
						</pt6:syslookup>
						
						</td>

				</tr>
				<tr>
					<th width="17%"><span style="color: red;">*</span> 地址:</th>
					<td width="33%" colspan="3"><input title="地址"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[512]'"
						style="width: 180px;" type="text" name="address" id="address" /></td>
				</tr>
				<tr>
					<th width="17%">收货地址:</th>
					<td width="33%" colspan="3"><input title="收货地址"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="receiveAddress" id="receiveAddress" /></td>
				</tr>
				<tr>
					<th width="17%"><span style="color: red;">*</span> 国家:</th>
					<td width="33%">
					<pt6:syslookup name="country"
							lookupCode="CSMP_BD_COMPANYINFO_NATION"
							isNull="true"
							dataOptions="width:250,editable:false,panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
						</pt6:syslookup> 
					</td>
					<th width="17%">省份:</th>
					<td width="33%">
		<input id="province" class="easyui-combobox" name="province" value="请选择"
    data-options="valueField:'lookupCode',textField:'lookupName',url:'platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getProvinceByCountryCodeValue/CHINA',onShowPanel:comboboxOnShowPanel"/>  
						</td>
				</tr>
				<tr>
					<th width="17%">成立时间:</th>
					<td width="33%"><input title="成立时间" class="easyui-datebox"
						editable="false" style="width: 182px;" type="text"
						name="setupdate" id="setupdate" /></td>

					<th width="17%">营业性质:</th>
					<td width="33%">
				<pt6:syslookup name="businessNature"
							lookupCode="CSMP_BD_BUSINESS_NATURE"
							isNull="true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup>
						</td>

				</tr>
				<tr>
					<th width="17%"><span style="color: red;">*</span> 营业状态:</th>
					<td width="33%">
						<pt6:syslookup name="operatingStatus"
							lookupCode="CSMP_BD_OPERATING_STATUS"
							isNull="true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup> 
						</td>
					<th width="17%">语言:</th>
					<td width="33%">
					<pt6:syslookup name="language"
							lookupCode="CSMP_BD_COMPANYINFO_LANGUAGE"
							isNull="true"
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					<th width="17%">电话:</th>
					<td width="33%"><input title="电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="telephone" id="telephone" /></td>

					<th width="17%">传真:</th>
					<td width="33%"><input title="传真"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="fax" id="fax" /></td>
				</tr>
				<tr>
					<th width="17%">邮件:</th>
					<td width="33%" colspan="3"><input title="邮件"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[64]'" style="width: 180px;"
						type="text" name="mail" id="mail" /></td>
				</tr>
				<tr>
					<th width="17%">账户名称:</th>
					<td width="33%"><input title="账户名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="accountName" id="accountName" /></td>

					<th width="17%">税务等级证号:</th>
					<td width="33%"><input title="税务等级证号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="accountId" id="accountId" /></td>
				</tr>
				<tr>
					<th width="17%">开户地址:</th>
					<td width="33%" colspan="3"><input title="开户地址"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="accountAddress" id="accountAddress" /></td>
				</tr>
				<tr>
					<th width="17%">开户电话:</th>
					<td width="33%"><input title="开户电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="accountTel" id="accountTel" /></td>

					<th width="17%">开户行:</th>
					<td width="33%"><input title="开户行"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="accountBankName" id="accountBankName" /></td>
				</tr>
				<tr>
					<th width="17%">账号:</th>
					<td width="33%" colspan="3"><input title="账号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="accountNo" id="accountNo" /></td>
				</tr>
				<tr>
					<th width="17%">描述:</th>
					<td width="33%" colspan="3"><textarea title="描述"
							class="textareabox" max="1000" name="describe" rows="2" cols="30"
							type="text" id="describe"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'"></textarea>
					</td>
				</tr>
				<tr>
					<th width="17%">联系人:</th>
					<td width="33%"><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="contacts" id="contacts" />
						<div class="">
							<input class="easyui-validatebox" name="contactsAlias"
								id="contactsAlias" readOnly="readOnly" style="width: 179px;"></input>
						</div></td>
					<th width="17%">服务代表:</th>
					<td width="33%"><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="serviceRepresentative" id="serviceRepresentative" />
						<div class="">
							<input class="easyui-validatebox"
								name="serviceRepresentativeAlias"
								id="serviceRepresentativeAlias" readOnly="readOnly"
								style="width: 179px;"></input>
						</div></td>
				</tr>
				<tr>
					<th width="17%">法人:</th>
					<td width="33%"><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="legalPerson" id="legalPerson" />
						<div class="">
							<input class="easyui-validatebox" name="legalPersonAlias"
								id="legalPersonAlias" readOnly="readOnly" style="width: 179px;"></input>
						</div></td>
					<th width="17%">CL单客户代码:</th>
					<td width="33%"><input title="CL单客户代码"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="clClientCode" id="clClientCode" /></td>
				</tr>
				<tr>
					<th width="17%">备注:</th>
					<td width="33%" colspan="3"><textarea title="备注"
							class="textareabox" max="1000" name="describe" rows="2" cols="30"
							type="text" id="describe"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'"></textarea>
					</td>
				</tr>
				</table>
			</form>
			 		<jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
							<jsp:param name="file_size_limit" value="5000MB" />
							<jsp:param name="file_types" value="*.*" />
							<jsp:param name="file_upload_limit" value="10" />
							<jsp:param name="save_type" value="true" />
							<jsp:param name="form_id" value="${id}" />
							<jsp:param name="form_code" value="demo_attach_business_trip" />
							<jsp:param name="allowAdd" value="true" />
							<jsp:param name="allowDel" value="true" />
							<jsp:param name="cleanOnExit" value="true" />
							<jsp:param name="hiddenUploadBtn" value="true" />
							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
						</jsp:include> 
	</div>	

	<div data-options="region:'south',border:false" style="height: 40px">
	
			<div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="" width='100%'>
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
		var attachBusinessId = "";

		$.extend($.fn.validatebox.defaults.rules, {
			maxLength : {
				validator : function(value, param) {
					return param[0] >= value.length;

				},
				message : '请输入最多 {0} 字符.'
			}
		});
		$(function() {
			var contactsUserCommonSelector = new CommonSelector("user",
					"userSelectCommonDialog", "contacts", "contactsAlias");
			contactsUserCommonSelector.init();
			var serviceRepresentativeUserCommonSelector = new CommonSelector(
					"user", "userSelectCommonDialog", "serviceRepresentative",
					"serviceRepresentativeAlias");
			serviceRepresentativeUserCommonSelector.init();
			var legalPersonUserCommonSelector = new CommonSelector("user",
					"userSelectCommonDialog", "legalPerson", "legalPersonAlias");
			legalPersonUserCommonSelector.init();
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
		function closeForm() {
			parent.csmpBdCompanyinfo.closeDialog("#insert");
		}
		function saveForm() {
			if ($('#form').form('validate') == false) {
				return;
			}
			parent.csmpBdCompanyinfo.save(serializeObject($('#form')), callback);
		}
		function callback(id) {
			var flag = upload(id);
			if (!flag) {
				closeForm();
				$.messager.show({
					title : '提示',
					msg : '保存成功！'
				});
			}
			parent.csmpBdCompanyinfo.closeDialog("#insert");
		}

		function afterUploadEvent() {
			closeForm();
			$.messager.show({
				title : '提示',
				msg : '保存成功！'
			});
		}
	</script>
</body>
</html>