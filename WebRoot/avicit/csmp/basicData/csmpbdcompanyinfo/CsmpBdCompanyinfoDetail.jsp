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
<!-- ControllerPath = "csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/operation/Detail/id" -->
<title>详情</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false" style="overflow: ; padding-bottom: 35px;">

		<form id='form'>
			<input type="hidden" name="id" value='${csmpBdCompanyinfoDTO.id}' />
			<input type="hidden" name="id" value='${csmpBdCompanyinfoDTO.id}' />
			<table  class="form_commonTable" >
				<tr>
				

					<th style="padding-left: ;" width="17%"><span style="color: red;">*</span> 单位编码:</th>
					<td width="33%"><input title="单位编码" class="easyui-validatebox"
						data-options="required:true" style="width: 90%;" type="text"
						name="companyCode" id="companyCode" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.companyCode}' /></td>
					<th width="17%" ><span style="color: red;">*</span> 公司名称:</th>
					<td width="33%"><input title="公司名称" class="easyui-validatebox"
						data-options="required:true" style="width: 90%;" type="text"
						name="companyName" id="companyName" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.companyName}' /></td>

				</tr>
				<tr>

					<th><span style="color: red;">*</span> 简称:</th>
					<td><input title="简称" class="easyui-validatebox"
						data-options="required:true" style="width: 90%;" type="text"
						name="shortName" id="shortName" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.shortName}' /></td>
					<th>英文名称:</th>
					<td><input title="英文名称" class="easyui-validatebox"
						style="width: 90%;" type="text" name="nameEn" id="nameEn"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.nameEn}' /></td>
				</tr>


				<tr>
					<th>英文缩写:</th>
					<td><input title="英文缩写" class="easyui-validatebox"
						style="width: 90%;" type="text" name="shortNameEn"
						id="shortNameEn" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.shortNameEn}' /></td>
					<th>等级:</th>
					<td><%-- <input title="等级" class="inputbox" style="width: 90%;"
						type="text" name="companyLevel" id="companyLevel"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.companyLevel}' /> --%>
						<pt6:syslookup name="companyLevel"
							lookupCode="CSMP_BD_COMPANYINFO_COMPANY_LEVEL"
							defaultValue='${csmpBdCompanyinfoDTO.companyLevel}'
							isNull="true"
							dataOptions="width:180,editable:false,panelHeight:'auto',disabled:true,onShowPanel:comboboxOnShowPanel">
						</pt6:syslookup>
					</td>
				</tr>
				<tr >

					<th><span style="color: red;">*</span> 地址:</th>
					<td colspan="3" width="33%">
					<input title="地址" class="easyui-validatebox"
						data-options="required:true" style="width:96%;" type="text"
						name="address" id="address" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.address}' />
					</td>
				</tr>
				<tr>
					<th>收货地址:</th>
					<td colspan="3"><input title="收货地址" class="easyui-validatebox" style="width:96%;"
						type="text" name="receiveAddress"
						id="receiveAddress" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.receiveAddress}' /></td>
					<%-- <th align="center">类别:</th>
					<td><input title="类别" class="inputbox" style="width: 180px;"
						type="text" name="companyType" id="companyType"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.companyType}' />
					</td> --%>
				</tr>
				<tr>

					<th><span style="color: red;">*</span> 国家:</th>
					<td><%-- <input title="国家" class="easyui-validatebox"
						data-options="required:true" style="width: 90%;" type="text"
						name="country" id="country" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.country}' /> --%>
						<pt6:syslookup name="country"
							lookupCode="CSMP_BD_COMPANYINFO_NATION"
							isNull="true"
							defaultValue='${csmpBdCompanyinfoDTO.country}'
							dataOptions="title:'国家',width:180,editable:false,disabled:true,panelHeight:'auto'">
						</pt6:syslookup>
						
						</td>
					<th>省份:</th>
					<td><%-- <input title="省份" class="inputbox" style="width: 90%;"
						type="text" name="province" id="province" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.province}' /> --%>
												<input id="province" class="easyui-combobox" name="province"
    data-options="valueField:'lookupCode',disabled:true,textField:'lookupName',url:'platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/getProvinceByCountryCodeValue/${csmpBdCompanyinfoDTO.country}',onShowPanel:comboboxOnShowPanel" value="${csmpBdCompanyinfoDTO.province}"/>  
						
	
						
						
						</td>
				</tr>
				<tr>

					<th>成立时间:</th>
					<td><input title="成立时间" class="easyui-datebox"
						style="width: 90%;" type="text" name="setupdate" id="setupdate"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.setupdate}' /></td>

					<th>营业性质:</th>
					<td><%-- <input title="营业性质" class="inputbox"
						style="width: 90%;" type="text" name="businessNature"
						id="businessNature" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.businessNature}' /> --%>
						<pt6:syslookup name="businessNature"
							lookupCode="CSMP_BD_BUSINESS_NATURE"
							defaultValue='${csmpBdCompanyinfoDTO.businessNature}'
							dataOptions="title:'营业性质',width:180,editable:false,disabled:true,panelHeight:'auto'">
						</pt6:syslookup>
						
						</td>
				</tr>
				<tr>

					<th><span style="color: red;">*</span> 营业状态:</th>
					<td><%-- <input title="营业状态" class="easyui-validatebox"
						data-options="required:true" style="width: 90%;" type="text"
						name="operatingStatus" id="operatingStatus" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.operatingStatus}' /> --%>
						<pt6:syslookup name="operatingStatus"
							lookupCode="CSMP_BD_OPERATING_STATUS"
							defaultValue='${csmpBdCompanyinfoDTO.operatingStatus}'
							dataOptions="width:180,editable:false,disabled:true,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th>语言:</th>
					<td><pt6:syslookup name="language"
							lookupCode="CSMP_BD_COMPANYINFO_LANGUAGE"
							defaultValue='${csmpBdCompanyinfoDTO.language}'
							dataOptions="title:'语言',width:180,editable:false,disabled:true,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>

					<th>电话:</th>
					<td><input title="电话" class="easyui-validatebox" style="width: 90%;"
						type="text" name="telephone" id="telephone" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.telephone}' /></td>

					<th>传真:</th>
					<td><input title="传真" class="easyui-validatebox" style="width: 90%;"
						type="text" name="fax" id="fax" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.fax}' /></td>
				</tr>
				<tr>

					<th>邮件:</th>
					<td  colspan="3"><input title="邮件" class="easyui-validatebox" style="width: 90%;"
						type="text" name="mail" id="mail" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.mail}' /></td>
				</tr>
				<tr>
					<th>账户名称:</th>
					<td><input title="账户名称" class="easyui-validatebox"
						style="width: 90%;" type="text" name="accountName"
						id="accountName" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.accountName}' /></td>
					<th align="center" >税务等级证号:</th>
					<td><input title="税务等级证号" class="easyui-validatebox"
						style="width: 90%;" type="text" name="accountId" id="accountId"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.accountId}' /></td>
				</tr>
				<tr>
					<th>开户地址:</th>
					<td  colspan="3"><input title="开户地址" class="easyui-validatebox"
						style="width: 90%;" type="text" name="accountAddress"
						id="accountAddress" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.accountAddress}' /></td>

				</tr>
				<tr>
					<th>开户电话:</th>
					<td><input title="开户电话" class="easyui-validatebox"
						style="width: 90%;" type="text" name="accountTel"
						id="accountTel" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.accountTel}' /></td>

					<th>开户行:</th>
					<td><input title="开户行" class="easyui-validatebox"
						style="width: 90%;" type="text" name="accountBankName"
						id="accountBankName" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.accountBankName}' /></td>

				</tr>
				<tr>


					<th>账号:</th>
					<td colspan="3"><input title="账号" class="easyui-validatebox"
						style="width: 96%;" type="text" name="accountNo" id="accountNo"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.accountNo}' /></td>

				</tr>
				<tr>
					<th>描述:</th>
					<td colspan="3"><input title="描述" class="easyui-validatebox"
						style="width: 96%;" type="text" name="describe" id="describe"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.describe}' /></td>

				</tr>
				<tr>
					<th>联系人:</th>
					<td><input title="{param.field.comment}" class="easyui-validatebox"
						style="width: 90%;" type="hidden" name="contacts" id="contacts" />
						<div class="">
							<input class="easyui-validatebox" name="contactsAlias"
								id="contactsAlias" readOnly="readOnly" style="width: 90%;"></input>
						</div></td>

					<th>服务代表:</th>
					<td><input title="{param.field.comment}" class="easyui-validatebox"
						style="width: 90%;" type="hidden" name="serviceRepresentative"
						id="serviceRepresentative" />
						<div class="">
							<input class="easyui-validatebox"
								name="serviceRepresentativeAlias"
								id="serviceRepresentativeAlias" readOnly="readOnly"
								style="width: 90%;"></input>
						</div></td>

				</tr>
				<tr>
					<th>法人:</th>
					<td><input title="{param.field.comment}" class="easyui-validatebox"
						style="width: 90%;" type="hidden" name="legalPerson"
						id="legalPerson" />
						<div class="">
							<input class="easyui-validatebox" name="legalPersonAlias"
								id="legalPersonAlias" readOnly="readOnly" style="width: 90%;"></input>
						</div></td>
					<th>CL单客户代码:</th>
					<td><input title="CL单客户代码" class="easyui-validatebox"
						style="width: 90%;" type="text" name="clClientCode"
						id="clClientCode" readonly="readonly"
						value='${csmpBdCompanyinfoDTO.clClientCode}' /></td>

				</tr>
				<tr>
					<th>备注:</th>
					<td colspan="3">
					
					<textarea title="备注" style="width: 96%;" class="textareabox" max="1000" name="remark" rows="2" cols="30" type="text" id="remark" readonly="readonly"
							data-options="required:true,validType:'maxLength[1024]',tipPosition:'bottom'">${csmpBdCompanyinfoDTO.remark}</textarea>
					
					<%-- <input title="备注" class="inputbox"
						style="width: 96%;" type="text" name="remark" id="remark"
						readonly="readonly" value='${csmpBdCompanyinfoDTO.remark}' /> --%></td>
				</tr>
			</table>
		</form>
		
				<!--附件  --> <jsp:include
							page="/avicit/platform6/modules/system/swfupload/swfEditInclude.jsp">
							<jsp:param name="file_size_limit" value="5000MB" />
							<jsp:param name="file_types" value="*.*" />
							<jsp:param name="file_upload_limit" value="10" />
							<jsp:param name="save_type" value="true" />
							<jsp:param name="form_id" value='${id}' />
							<jsp:param name="form_code" value="demo_attach_business_trip" />
							<jsp:param name="allowAdd" value="false" />
							<jsp:param name="allowDel" value="false" />
							<jsp:param name="cleanOnExit" value="true" />
							<jsp:param name="hiddenUploadBtn" value="true" />
							<jsp:param name="secret_level" value="PLATFORM_FILE_SECRET_LEVEL" />
						</jsp:include>
	</div>
	<script type="text/javascript">
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
	</script>
</body>
</html>