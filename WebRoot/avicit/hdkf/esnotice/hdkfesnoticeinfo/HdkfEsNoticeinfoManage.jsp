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
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/HdkfEsNoticeinfoInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script
	src="avicit/hdkf/esnotice/hdkfesnoticeinfo/js/HdkfEsNoticeinfo.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>

<script type="text/javascript">
	var hdkfEsNoticeinfo;
	$(function() {
		hdkfEsNoticeinfo = new HdkfEsNoticeinfo('dgHdkfEsNoticeinfo', '${url}',
				'searchDialog', 'hdkfEsNoticeinfo');
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

	var array = [];
	
	///

	selfDefQury.init(array);
	selfDefQury.setQuery(function(param) {
		hdkfEsNoticeinfo.searchDataBySfn(param);
	});

	function formateDate(value, row, index) {
		return hdkfEsNoticeinfo.formate(value);
	}
	function formateDateTime(value, row, index) {
		return hdkfEsNoticeinfo.formateDateTime(value);
	}
	//hdkfEsNoticeinfo.detail(\''+row.id+'\')
	function formateHref(value, row, inde) {
		return '<a href="javascript:void(0);" onclick="hdkfEsNoticeinfo.detail(\''
				+ row.id
				+ '\',\''
				+ row.businessstate_
				+ '\');">'
				+ value
				+ '</a>';
	}

	function formatebulletinType(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfo.bulletinType);
	}
	function formatematerialSupply(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfo.materialSupply);
	}
	function formateimplementCompany(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfo.implementCompany);
	}
	function formateincludeMars(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfo.includeMars);
	}
	//批架次
	 function formateCountBatchNoHref(value, row, inde) {
		return '<a id="ahtmlcss" href="javascript:void(0);" onclick="countBatchNoHref(\''
				+ row.id + '\');">' + value + '</a>';
	};
	function countBatchNoHref(id){
		var path = "hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/countBatchNoHref?paramId="+id+"&type=CountBatchNo";
		this.nData = new CommonDialog("countBatchNo","700","420",path,"技术通报批架次详情",false,true,false);
		this.nData.show();
	};
	
	
	//用户数量
	 function formateCountNameHref(value, row, inde) {
		return '<a id="ahtmlcss" href="javascript:void(0);" onclick="countNameHref(\''
				+ row.id + '\');">' + value + '</a>';
	};
	 function countNameHref(id){
			var path = "hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/countNameHref?paramId="+id+"&type=CountName";
			this.nData = new CommonDialog("countName","700","420",path,"技术通报用户信息详情",false,true,false);
			this.nData.show();
		};
</script>
</head>
<body class="easyui-layout" fit="true">
	<div style="display: none">
		<form id="formSearchBpm">
			<input type="hidden" name="bpmState" id="bpmState" value="all"></input>
			<input type="hidden" name="bpmType" id="bpmType" value="my"></input>
		</form>
	</div>
	<div data-options="region:'center'" style="background: #ffffff;height: 0;  font-size:0;">
		<div id="toolbarHdkfEsNoticeinfo" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfEsNoticeinfo.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfEsNoticeinfo.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfEsNoticeinfo.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfEsNoticeinfo.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfEsNoticeinfo.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfEsNoticeinfo.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfEsNoticeinfo.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfEsNoticeinfo.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfEsNoticeinfo.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfEsNoticeinfo.modify();" href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfEsNoticeinfo.del();" href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfEsNoticeinfo.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					
				</tr>
			</table>
		</div>
		<table id="dgHdkfEsNoticeinfo"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfEsNoticeinfo',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'id', align:'center',checkbox:true"
						width="220">主键</th>
					<th
						data-options="field:'bulletinNo', align:'center', formatter:formateHref"
						width="220">通告编号</th>

					<th data-options="field:'title', align:'center'" width="420">标题</th>

					<th data-options="field:'organContact', hidden:true"
						width="220">机关联系人</th>

					<th data-options="field:'telephone', hidden:true" width="220">机关联系人电话</th>
					
					
				    <th data-options="field:'countBatchNo', align:'center',formatter:formateCountBatchNoHref" width="120">批架次</th>
					<th data-options="field:'countName', align:'center',formatter:formateCountNameHref" width="120">用户数量</th>
					

					<th
						data-options="field:'bulletinType', align:'center',formatter:formatebulletinType"
						width="120">通报类型</th>
					<th
						data-options="field:'materialSupply', hidden:true,formatter:formatematerialSupply"
						width="220">材料提供方式</th>
					<th
						data-options="field:'implementCompany', align:'center',formatter:formateimplementCompany"
						width="120">实施单位</th>
					<th
						data-options="field:'attribute13', align:'center',formatter:formateDate"
						width="160">编写日期</th>

					<th data-options="field:'author', hidden:true" width="220">编者</th>

					<th data-options="field:'fileCompany', hidden:true" width="220">编发单位</th>

					<th data-options="field:'companyTel', hidden:true" width="220">电话</th>

					<th
						data-options="field:'includeMars', align:'center',formatter:formateincludeMars"
						width="120">包含器材</th>
					<th
						data-options="field:'publishDate', hidden:true,formatter:formateDate"
						width="220">预计发布日期</th>

					<th
						data-options="field:'completeDate', hidden:true,formatter:formateDate"
						width="220">预计应完成日期</th>

					<th data-options="field:'changeNo', hidden:true" width="220">更改单号</th>

					<th data-options="field:'performRequirement', hidden:true"
						width="220">执行要求</th>

					<th data-options="field:'changeComment', hidden:true"
						width="220">换版内容</th>

					<th data-options="field:'remark', hidden:true" width="220">备注</th>

					<th data-options="field:'reportNo', hidden:true" width="220">上报文号</th>

					<th
						data-options="field:'reportTime', hidden:true,formatter:formateDate"
						width="220">上报时间</th>

					<th data-options="field:'replyNo', hidden:true" width="220">批复文号</th>

					<th
						data-options="field:'replyTime', hidden:true,formatter:formateDate"
						width="220">批复时间</th>

					<th
						data-options="field:'completeTime', hidden:true,formatter:formateDate"
						width="220">应完成时间</th>

					<th data-options="field:'forwardNo', hidden:true" width="220">转发文号</th>

					<th
						data-options="field:'forwardTime', hidden:true,formatter:formateDate"
						width="220">转发时间</th>

					<th data-options="field:'activityalias_', align:'center'"
						width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', align:'center'"
						width="220px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfEsNoticeinfo">
			<table class="form_commonTable">
				<tr>
					<th width="10%">通告编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="bulletinNo" /></td>
					<th width="10%">标题:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="title" /></td>
				</tr>
				
				<tr>
					<th width="10%">通报类型 :</th>
					<td width="40%"><pt6:syslookup name="bulletinType"
							isNull="true" lookupCode="CSMP_ES_INFO_TYPE"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<th width="10%">材料提供方式:</th>
					<td width="40%"><pt6:syslookup name="materialSupply"
							isNull="true" lookupCode="CSMP_ES_PROVIDE_MATERIAL"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
				<tr>
					<th width="10%">实施单位:</th>
					<td width="40%"><pt6:syslookup name="implementCompany"
							isNull="true" lookupCode="CSMP_ES_IMPLEMENT_COMPANY"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				
				<th width="10%">编者:</th>
				<td width="40%"><input class="easyui-validatebox"
					style="width: 151px;" type="text" name="author" /></td>
				</tr>
				
				
				<tr>
					<th width="10%">预计上报日期从:</th>
					<td width="40%"><input name="reportDateBegin"
						id="reportDateBegin" class="easyui-datebox" editable="false" />
					<th width="10%">预计上报日期(至):</th>
					<td><input name="reportDateEnd" id="reportDateEnd"
						class="easyui-datebox" editable="false" /></td>
				</tr>
				<tr>
					<th width="10%">是否包含器材:</th>
					<td width="40%"><pt6:syslookup name="includeMars"
							isNull="true" lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
				</tr>
			
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false" onclick="hdkfEsNoticeinfo.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false" onclick="hdkfEsNoticeinfo.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfEsNoticeinfo.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="mask" data-options="closable: false,modal:true"></div>
</body>
<script type="text/javascript">
	function bpm_operator_refresh() {
		hdkfEsNoticeinfo.reLoad();
	}
</script>
</html>