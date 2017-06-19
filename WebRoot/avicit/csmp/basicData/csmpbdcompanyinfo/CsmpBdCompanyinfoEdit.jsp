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
<!-- ControllerPath = "csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/operation/Edit/id" -->
<title>修改</title>
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
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" value='${csmpBdCompanyinfoDTO.id}' />
			<table class="form_commonTable">
				<tr>
					<%-- <th width="20%"><span style="color: red;">*</span> 结构ID:</th>
					<td width="30%"><input title="结构ID" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="nodeId" id="nodeId"
						value='<c:out value='${csmpBdCompanyinfoDTO.nodeId}'/>' /></td> --%>


					<th width="17%"><span style="color: red;">*</span> 单位编码:</th>
					<td width="33%"><input title="单位编码" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="text" name="companyCode"
						id="companyCode"
						value='<c:out value='${csmpBdCompanyinfoDTO.companyCode}'/>' /></td>


					<th width="17%"><span style="color: red;">*</span> 公司名称:</th>
					<td width="33%"><input title="公司名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="companyName"
						id="companyName"
						value='<c:out value='${csmpBdCompanyinfoDTO.companyName}'/>' /></td>

					<%-- <th width="20%">所属部门:</th>
					<td width="30%"><input title="所属部门"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;"
						type="text" name="deptId" id="deptId"
						value='<c:out value='${csmpBdCompanyinfoDTO.deptId}'/>' /></td> --%>
				</tr>
				<tr>


				</tr>
				<tr>
					<th><span style="color: red;">*</span> 简称:</th>
					<td><input title="简称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[256]'"
						style="width: 180px;" type="text" name="shortName" id="shortName"
						value='<c:out value='${csmpBdCompanyinfoDTO.shortName}'/>' /></td>
					<th>英文名称:</th>
					<td><input title="英文名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="nameEn" id="nameEn"
						value='<c:out value='${csmpBdCompanyinfoDTO.nameEn}'/>' /></td>

				</tr>
				<tr>
					<th>英文缩写:</th>
					<td><input title="英文简称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="shortNameEn" id="shortNameEn"
						value='<c:out value='${csmpBdCompanyinfoDTO.shortNameEn}'/>' /></td>

					<th>等级:</th>
					<td><pt6:syslookup name="companyLevel"
							lookupCode="CSMP_BD_COMPANYINFO_COMPANY_LEVEL"
							defaultValue='${csmpBdCompanyinfoDTO.companyLevel}'
							isNull="true"
							dataOptions="width:180,editable:false,panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
						</pt6:syslookup></td>
				</tr>
				<tr>
					<th><span style="color: red;">*</span> 地址:</th>
					<td colspan="3"><input title="地址"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[512]'"
						style="width: 180px;" type="text" name="address" id="address"
						value='<c:out value='${csmpBdCompanyinfoDTO.address}'/>' /></td>
				</tr>
				<tr>
					<th>收货地址:</th>
					<td colspan="3"><input title="收货地址"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="receiveAddress" id="receiveAddress"
						value='<c:out value='${csmpBdCompanyinfoDTO.receiveAddress}'/>' />
					</td>
					<%-- <th width="20%">类别:</th>
					<td width="30%"><input title="类别"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[128]'" style="width: 180px;"
						type="text" name="companyType" id="companyType"
						value='<c:out value='${csmpBdCompanyinfoDTO.companyType}'/>' /></td> --%>
				</tr>

				<tr>
					<th><span style="color: red;">*</span> 国家:</th>
					<td><pt6:syslookup name="country"
							lookupCode="CSMP_BD_COMPANYINFO_NATION"
							defaultValue='${csmpBdCompanyinfoDTO.country}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>

					<th>省份:</th>
					<td>
							<input id="province" class="easyui-combobox" name="province"
    data-options="valueField:'lookupCode',textField:'lookupName',url:'platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getProvinceByCountryCodeValue/${csmpBdCompanyinfoDTO.country}',onShowPanel:comboboxOnShowPanel" value="${csmpBdCompanyinfoDTO.province}"/>  
						</td>

				</tr>
				<tr>
					<th>成立时间:</th>
					<td><input title="成立时间" class="easyui-datebox"
						style="width: 182px;" type="text" name="setupdate" id="setupdate"
						value='${csmpBdCompanyinfoDTO.setupdate}' /></td>

					<th>营业性质:</th>
					<td><pt6:syslookup name="businessNature"
							lookupCode="CSMP_BD_BUSINESS_NATURE"
							defaultValue='${csmpBdCompanyinfoDTO.businessNature}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>

				</tr>
				<tr>
					<th><span style="color: red;">*</span> 营业状态:</th>
					<td><pt6:syslookup name="operatingStatus"
							lookupCode="CSMP_BD_OPERATING_STATUS"
							defaultValue='${csmpBdCompanyinfoDTO.operatingStatus}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th>语言:</th>
					<td><pt6:syslookup name="language"
							lookupCode="CSMP_BD_COMPANYINFO_LANGUAGE"
							defaultValue='${csmpBdCompanyinfoDTO.language}'
							dataOptions="width:180,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>

				</tr>
				<tr>

					<th>电话:</th>
					<td><input title="电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="telephone" id="telephone"
						value='<c:out value='${csmpBdCompanyinfoDTO.telephone}'/>' /></td>
					<th>传真:</th>
					<td><input title="传真"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="fax" id="fax"
						value='<c:out value='${csmpBdCompanyinfoDTO.fax}'/>' /></td>
				</tr>
				<tr>
					<th>邮件:</th>
					<td colspan="3"><input title="邮件"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[64]'" style="width: 180px;"
						type="text" name="mail" id="mail"
						value='<c:out value='${csmpBdCompanyinfoDTO.mail}'/>' /></td>
				</tr>
				<tr>
					<th>账户名称:</th>
					<td><input title="账户名称"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="accountName" id="accountName"
						value='<c:out value='${csmpBdCompanyinfoDTO.accountName}'/>' /></td>
					<th>税务等级证号:</th>
					<td><input title="税务等级证号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="accountId" id="accountId"
						value='<c:out value='${csmpBdCompanyinfoDTO.accountId}'/>' /></td>
				</tr>
				<tr>
					<th>开户地址:</th>
					<td colspan="3"><input title="开户地址"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="accountAddress" id="accountAddress"
						value='<c:out value='${csmpBdCompanyinfoDTO.accountAddress}'/>' />
					</td>

				</tr>
				<tr>

					<th>开户电话:</th>
					<td><input title="开户电话"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="accountTel" id="accountTel"
						value='<c:out value='${csmpBdCompanyinfoDTO.accountTel}'/>' /></td>
					<th>开户行:</th>
					<td><input title="开户行"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[512]'" style="width: 180px;"
						type="text" name="accountBankName" id="accountBankName"
						value='<c:out value='${csmpBdCompanyinfoDTO.accountBankName}'/>' />
					</td>
				</tr>
				<tr>
					<th>账号:</th>
					<td colspan="3"><input title="账号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[256]'" style="width: 180px;"
						type="text" name="accountNo" id="accountNo"
						value='<c:out value='${csmpBdCompanyinfoDTO.accountNo}'/>' /></td>
				</tr>
				<tr>
					<th>描述:</th>
					<td colspan="3">
						<%-- <input title="描述" class="inputbox easyui-validatebox" data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="describe" id="describe" value='<c:out value='${csmpBdCompanyinfoDTO.describe}'/>' /> --%>
						<textarea title="描述" class="textareabox" max="1000"
							name="describe" rows="2" cols="30" type="text" id="describe"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'">${csmpBdCompanyinfoDTO.describe}</textarea>

					</td>

				</tr>
				<tr>

					<th>联系人:</th>
					<td><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="contacts" id="contacts"
						value='${csmpBdCompanyinfoDTO.contacts}' />
						<div class="">
							<input class="easyui-validatebox" name="contactsAlias"
								id="contactsAlias" readOnly="readOnly"
								value='<c:out  value='${csmpBdCompanyinfoDTO.contactsAlias}'/>'
								style="width: 179px;"></input>
						</div></td>
					<th>服务代表:</th>
					<td><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="serviceRepresentative" id="serviceRepresentative"
						value='${csmpBdCompanyinfoDTO.serviceRepresentative}' />
						<div class="">
							<input class="easyui-validatebox"
								name="serviceRepresentativeAlias"
								id="serviceRepresentativeAlias" readOnly="readOnly"
								value='<c:out  value='${csmpBdCompanyinfoDTO.serviceRepresentativeAlias}'/>'
								style="width: 179px;"></input>
						</div></td>

				</tr>
				<tr>

					<th>法人:</th>
					<td><input title="{param.field.comment}"
						class="inputbox" style="width: 182px;" type="hidden"
						name="legalPerson" id="legalPerson"
						value='${csmpBdCompanyinfoDTO.legalPerson}' />
						<div class="">
							<input class="easyui-validatebox" name="legalPersonAlias"
								id="legalPersonAlias" readOnly="readOnly"
								value='<c:out  value='${csmpBdCompanyinfoDTO.legalPersonAlias}'/>'
								style="width: 179px;"></input>
						</div></td>
					<th>CL单客户代码:</th>
					<td><input title="CL单客户代码"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[32]'" style="width: 180px;"
						type="text" name="clClientCode" id="clClientCode"
						value='<c:out value='${csmpBdCompanyinfoDTO.clClientCode}'/>' /></td>
				</tr>
				<tr>
					<th>备注:</th>
					<td colspan="3"><textarea title="备注"
							class="textareabox" max="1000" name="remark" rows="2" cols="30"
							type="text" id="describe"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'">${csmpBdCompanyinfoDTO.remark}</textarea>
				</tr>

			
			</table>
				<!--附件  --> <jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
							<jsp:param name="file_size_limit" value="5000MB" />
							<jsp:param name="file_types" value="*.*" />
							<jsp:param name="file_upload_limit" value="10" />
							<jsp:param name="save_type" value="true" />
							<jsp:param name="form_id" value='${id}' />
							<jsp:param name="form_code" value="demo_attach_business_trip" />
							<jsp:param name="allowAdd" value="true" />
							<jsp:param name="allowDel" value="true" />
							<jsp:param name="cleanOnExit" value="true" />
							<jsp:param name="hiddenUploadBtn" value="true" />
							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
						</jsp:include>
		</form>
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
			if (!"${csmpBdCompanyinfoDTO.setupdate}" == "") {
				$('#setupdate').datebox(
						'setValue',
						parserColumnTime("${csmpBdCompanyinfoDTO.setupdate}")
								.format("yyyy-MM-dd"));
			}
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
		});
		function closeForm() {
			parent.csmpBdCompanyinfo.closeDialog("#edit");
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