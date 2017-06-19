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
<!-- ControllerPath = "csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/CsmpBdCompanyinfoInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
			<script src="avicit/csmp/common/js/ValidtionContent.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">

	<div data-options="region:'west',title:'',split:true"
		style="width: 250px; padding: 0px;">
		<div id="toolbar" class="datagrid-toolbar">
			<table width="100%">
				<tr>
					<td width="100%"><input type="text" name="searchWord"
						id="searchWord"></input></td>
				</tr>
			</table>
		</div>
		<ul id="tree">正在加载数据...</ul>

	</div>
	<div data-options="region:'center'"
		style="background: #ffffff; overflow: auto;">
		<div class="easyui-layout" data-options="fit:true">
			<!--查询区  -->
			<div data-options="region:'north'" style="height: 132px">
				<!--*****************************搜索*********************************  resizable:true,modal:false,buttons:'#searchBtns' #fafafa-->
				<div id="mysearchDialog" data-options="iconCls:'icon-search'"
					style="border: 0px; background:" iconCls="icon-search">
					<form id="csmpBdCompanyinfo">
						<table class="form_commonTable">
							<tr>
								<th width="10%">单位编码:</th>
								<td width="10%"><input class="easyui-validatebox"
									style="width: 125px;" type="hidden" id="nodeId" name="nodeId" /><input class="easyui-validatebox"
									style="width: 151px;" type="text" name="companyCode" /></td>
								<th width="10%">单位名称:</th>
								<td width="10%"><input class="easyui-validatebox"
									style="width: 151px;" type="text" name="companyName" /></td>

								<th width="10%">英文名称:</th>
								<td width="10%"><input class="easyui-validatebox"
									style="width: 125px;" type="text" name="nameEn" /></td>

								<th width="10%">营业性质:</th>
								<td width="10%"><pt6:syslookup name="businessNature"
										lookupCode="CSMP_BD_BUSINESS_NATURE"
										isNull="true"
										dataOptions="width:125,editable:false,panelHeight:'auto'">
									</pt6:syslookup></td>
							</tr>
							<tr>

								<th width="10%">CL单客户代码:</th>
								<td width="10%"><input class="easyui-validatebox"
									style="width: 151px;" type="text" name="clClientCode" /></td>


								<th width="10%">简称:</th>
								<td width="10%"><input class="easyui-validatebox"
									style="width: 151px;" type="text" name="shortName" /></td>

								<th width="10%">英文简称:</th>
								<td width="10%"><input class="easyui-validatebox"
									style="width: 151px;" type="text" name="shortNameEn" /></td>


								<th width="10%">营业状态:</th>
								<td width="10%"><pt6:syslookup name="operatingStatus"
										lookupCode="CSMP_BD_OPERATING_STATUS"
										isNull="true"
										dataOptions="width:120,editable:false,panelHeight:'auto'">
									</pt6:syslookup></td>

							</tr>

						</table>
					</form>
					<div id="mysearchBtns" class="datagrid-toolbar foot-formopera"
						style="background:; height: 20px">
						<table class="tableForm" width='100%'>
							<tr>
								<td align="center"><a class="easyui-linkbutton " iconCls=""
									plain="false" onclick="csmpBdCompanyinfo.searchData();"
									href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
									iconCls="" plain="false"
									onclick="csmpBdCompanyinfo.clearData();"
									href="javascript:void(0);">清空</a> <!-- <a class="easyui-linkbutton" iconCls="" plain="false"onclick="csmpBdCompanyinfo.hideSearchForm();"href="javascript:void(0);">返回</a> -->
								</td>
							</tr>
						</table>
					</div>
				</div>

			</div>
			<!--第二张表  -->
			<div data-options="region:'center'"
				style="height: 250px; background: #fafafa;">
				<div id="toolbarCsmpBdCompanyinfo" class="datagrid-toolbar"
					style="height: 30px;">
					<table>
						<tr>
							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdCompanyinfo_button_add"
								permissionDes="添加">
								<td><a class="easyui-linkbutton" iconCls="icon-add"
									plain="true" onclick="insertSTS();" href="javascript:void(0);">添加</a></td>
							</sec:accesscontrollist>
							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdCompanyinfo_button_edit"
								permissionDes="编辑">
								<td><a class="easyui-linkbutton" iconCls="icon-edit"
									plain="true" onclick="csmpBdCompanyinfo.modify();"
									href="javascript:void(0);">编辑</a></td>
							</sec:accesscontrollist>
							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdCompanyinfo_button_delete"
								permissionDes="删除">
								<td><a class="easyui-linkbutton" iconCls="icon-setting"
									plain="true" onclick="csmpBdCompanyinfo.sortset();"
									href="javascript:void(0);">所属分类设置</a></td>
							</sec:accesscontrollist>
							<sec:accesscontrollist hasPermission="3"
								domainObject="formdialog_csmpBdCompanyinfo_button_delete"
								permissionDes="删除">
								<td><a class="easyui-linkbutton" iconCls="icon-remove"
									plain="true" onclick="csmpBdCompanyinfo.del();"
									href="javascript:void(0);">删除</a></td>
							</sec:accesscontrollist>

						</tr>
					</table>
				</div>
				<table id="dgCsmpBdCompanyinfo"
					data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarCsmpBdCompanyinfo',
				idField :'id',
				singleSelect: false,
				checkOnSelect: true,
				selectOnCheck: true,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
					<thead>
						<tr>
							<th data-options="field:'nodeId', align:'center',checkbox:true"
								width="220">结构ID:</th>
							<th data-options="field:'companyCode', align:'center'"
								width="220">单位编码</th>
							<th
								data-options="field:'companyName', align:'center', formatter:formateHref"
								width="220">名称</th>
							<th data-options="field:'shortName', align:'center'" width="220">简称</th>
							<th data-options="field:'shortNameEn', align:'center'"
								width="220">英文简称</th>
							<th data-options="field:'address', align:'center'" width="220">地址</th>
							<th
								data-options="field:'countryAlias', align:'center'" width="220">国家</th>
							<th
								data-options="field:'setupdate', align:'center',formatter:formateDate"
								width="220">成立时间</th>
							<th
								data-options="field:'businessNature', align:'center',formatter:formatebusinessNature"
								width="220">营业性质</th>
							<th
								data-options="field:'operatingStatus', align:'center',formatter:formateoperatingStatus"
								width="220">营业状态</th>
							<th
								data-options="field:'language', align:'center',formatter:formatelanguage"
								width="220">语言</th>
							<th data-options="field:'clClientCode', align:'center'"
								width="220">CL单客户代码</th>
							<!-- 
								<th data-options="field:'companyLevel', halign:'center',formatter:formatecompanyLevel" width="220">等级</th>
								<th data-options="field:'companyType', halign:'center'" width="220">类别</th>
							-->
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<script
		src=" avicit/csmp/basicData/csmpbdcompanyinfo/js/CsmpBdCompanyinfo.js"
		type="text/javascript"></script>
	<script
		src=" avicit/csmp/basicData/csmpbdcompanyinfo/js/CsmpBdCompanystructure.js"
		type="text/javascript"></script>
	<script src=" avicit/csmp/basicData/csmpbdcomstr/js/CsmpBdComStr.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdCompanyinfo;
		var csmpBdCompanystructure;
		$(function() {
			csmpBdCompanystructure = new CsmpBdCompanystructure(
					'tree',
					'platform/csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController',
					'searchWord');
			csmpBdCompanystructure.setOnLoadSuccess(function() {
		});
			csmpBdCompanystructure.setOnSelect(function(_tree, node) {
				var pid = node.id;
				$("#nodeId").attr("value",node.id);
				csmpBdCompanyinfo = new CsmpBdCompanyinfo(
						'dgCsmpBdCompanyinfo', '${url}', 'searchDialog',
						'csmpBdCompanyinfo', pid);
				//csmpBdCompanyinfo.init();
			});

			csmpBdCompanystructure.init();
			var dgView=$('#dgCsmpBdCompanyinfo');
			initTheLangField(dgView);
			initTheMessage(dgView);
		});

		function insertSTS() {
			var node = $("#tree").tree('getSelected');
			if(node.id!='1'&&node.attributes.count>0){
				$.messager.show({
					title : '提示',
					msg : '禁止添加!'
				});
				return false;
			}
			if (node.id == 1) {
				$.messager.alert("提示", "不能选择根节点请选择子节点信息！");
				return false;
			} else {
				csmpBdCompanyinfo.insert();
			}
		}

		function formateDate(value, row, index) {
			return csmpBdCompanyinfo.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdCompanyinfo.formateTime(value);
		}
		//csmpBdCompanyinfo.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdCompanyinfo.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}

		function formatecompanyLevel(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdCompanyinfo.companyLevel);
		}
/* 		function formatecountry(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdCompanyinfo.country);
		} */
/* 		function formateprovince(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdCompanyinfo.province);
		} */
		function formatebusinessNature(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdCompanyinfo.businessNature);
		}
		function formateoperatingStatus(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdCompanyinfo.operatingStatus);
		}
		function formatelanguage(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdCompanyinfo.language);
		}
	</script>
</body>
</html>