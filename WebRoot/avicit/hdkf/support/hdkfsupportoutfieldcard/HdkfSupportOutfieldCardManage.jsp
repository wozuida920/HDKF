<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportoutfieldcard/HdkfSupportOutfieldCardController/HdkfSupportOutfieldCardInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<script src="static/js/platform/component/dialog/UserSelectDialog.js"
	type="text/javascript"></script>
<script src="static/js/platform/bpm/client/js/ToolBar.js"
	type="text/javascript"></script>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
		<div id="toolbarHdkfSupportOutfieldCard" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportOutfieldCard_button_bpmAll"
						permissionDes="全部文件">
						<td width="120px;"><a href="javascript:void(0);" id="allMenu"
							name="bpm_all_menu" class='easyui-menubutton'
							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a>
							<div id="allmm" style="width: 105px;">
								<div id='all_start' name="bpm_all_start"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('start','all')">拟稿中</div>
								<div id='all_active' name="bpm_all_active"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('active','all')">流转中</div>
								<div id='all_ended' name="bpm_all_ended"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('ended','all')">已完成</div>
								<div id='all_all' name="bpm_all_all"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('all','all')">全部文件</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportOutfieldCard_button_bpmMyFile"
						permissionDes="我的文件">
						<td width="120px;"><a href="javascript:void(0);" id="myMenu"
							name="bpm_my_menu" class='easyui-menubutton'
							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a>
							<div id="mymm" style="width: 105px;">
								<div id='my_start' name="bpm_my_start"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('start','my')">我的拟稿</div>
								<div id='my_active' name="bpm_my_active"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('active','my')">我的流转</div>
								<div id='my_ended' name="bpm_my_ended"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('ended','my')">我的完成</div>
								<div id='my_all' name="bpm_my_all"
									onclick="hdkfSupportOutfieldCard.initWorkFlow('all','my')">我的全部</div>
							</div></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportOutfieldCard_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportOutfieldCard.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportOutfieldCard_button_edit"
						permissionDes="编辑">
						<td id="tool_edit_td"><a class="easyui-linkbutton"
							iconCls="icon-edit" plain="true"
							onclick="hdkfSupportOutfieldCard.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportOutfieldCard_button_delete"
						permissionDes="删除">
						<td id="tool_del_td"><a class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="hdkfSupportOutfieldCard.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportOutfieldCard_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportOutfieldCard.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportOutfieldCard"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportOutfieldCard',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				onLoadSuccess:loadToolTip,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'id', align:'center',checkbox:true" width="220">主键</th>					
					<th data-options="field:'infoCardNo', align:'center',formatter:formateHref" width="220">外场质量信息卡编号</th>
					<th data-options="field:'dealName', hidden:true, align:'center'" width="220">处理单名称</th>
					<th data-options="field:'requestNo', align:'center'" width="220">信息卡编号</th>
					<th data-options="field:'kfUserId', hidden:true" width="170">客服部经办人</th>
					<th data-options="field:'kfUserName', align:'center'" width="200">客服部经办人</th>
					<th data-options="field:'requestUnit', align:'center'" width="300">求援单位</th>
					<th data-options="field:'faultName', align:'center'" width="220">问题故障名称</th>
					<th data-options="field:'caseDesc', hidden:true" width="220">情况简介</th>
					<th data-options="field:'advice', hidden:true" width="220">建议或要求</th>
					<th data-options="field:'dealDepartId', hidden:true" width="220">承办部门</th>
					<th data-options="field:'dealDepartName', align:'center'" width="220">承办部门</th>
					<th data-options="field:'doneTime', align:'center',formatter:formateDate" width="180">方案形成时间</th>
					<th data-options="field:'activityalias_', align:'center'" width="220px">流程当前步骤</th>
					<th data-options="field:'businessstate_', align:'center'" width="170px">流程状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; display: none;">
		<form id="hdkfSupportOutfieldCard">
			<table class="form_commonTable">
			
				<tr>
					<th width="10%">外场信息处理卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="infoCardNo" /></td>
					<th width="10%">处理单名称:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="dealName" /></td>
				</tr>
					<tr>
				
					
							<th width="10%">承办部门:</th>
					<td width="40%"><input class="inputbox" style="width: 180px;"
						type="hidden" name="dealDepartId" id="dealDepartId" />
						<div class="">
							<input title="承办部门" class="inputbox easyui-validatebox"
								data-options="required:true,validType:'maxLength[50]'"
								readonly="readonly" style="width: 180px;" type="text"
								name="dealDepartName" id="dealDepartName" />
						</div></td>
						
								<th width="10%">承办单位处理人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="dealUserId" /></td>
						
						
<!-- 					<th width="10%">客服部经办人:</th> -->

<!--                        <td width="40%"> <input title="客服部经办人" class="inputbox" -->
<!-- 						style="width: 182px;" type="hidden" name="kfUSerId" -->
<!-- 						id="kfUSerId" /> -->
<!-- 						<div class=""> -->
<!-- 							<input class="easyui-validatebox" name="kfUSerName" -->
<!-- 								id="kfUSerName" readOnly="readOnly" style="width: 179px;"></input> -->
<!-- 						</div></td> -->
						
					
				</tr>
				
			
			
				
				
<!-- 				<tr> -->
<!-- 					<th width="10%">客服转发时间从:</th> -->
<!-- 					<td width="40%"><input name="kfForwardTimeBegin" -->
<!-- 						id="kfForwardTimeBegin" class="easyui-datebox" editable="false" /> -->
<!-- 					<th width="10%">客服转发时间(至):</th> -->
<!-- 					<td width="40%"><input name="kfForwardTimeEnd" -->
<!-- 						id="kfForwardTimeEnd" class="easyui-datebox" editable="false" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<th width="10%">方案形成时间从:</th>
					<td width="40%"><input name="doneTimeBegin" id="doneTimeBegin"
						class="easyui-datebox" editable="false" />
					<th width="10%">方案形成时间(至):</th>
					<td width="40%"><input name="doneTimeEnd" id="doneTimeEnd"
						class="easyui-datebox" editable="false" /></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th width="10%">方案送达客服部时间从:</th> -->
<!-- 					<td width="40%"><input name="sendtoKfTimeBegin" -->
<!-- 						id="sendtoKfTimeBegin" class="easyui-datebox" editable="false" /> -->
<!-- 					<th width="10%">方案送达客服部时间(至):</th> -->
<!-- 					<td width="40%"><input name="sendtoKfTimeEnd" -->
<!-- 						id="sendtoKfTimeEnd" class="easyui-datebox" editable="false" /></td> -->
<!-- 				</tr> -->
				<tr>
				
					<th width="10%">客服部经办人:</th>
					<td width="40%"><input class="inputbox" style="width: 180px;"
						type="hidden" name="kfUserId" id="kfUserId" />
						<div class="">
							<input title="客服部经办人" class="inputbox easyui-validatebox"
								data-options="required:true,validType:'maxLength[50]'"
								readonly="readonly" style="width: 180px;" type="text"
								name="kfUserName" id="kfUserName" />
						</div></td>	
					<th width="10%">信息卡编号:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="requestNo" /></td>

						
				</tr>
			</table>
			<input type="hidden" name="bpmState" id="bpmState" value="all"></input>
			<input type="hidden" name="bpmType" id="bpmType" value="my"></input>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportOutfieldCard.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportOutfieldCard.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportOutfieldCard.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src=" avicit/hdkf/support/hdkfsupportoutfieldcard/js/HdkfSupportOutfieldCard.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfSupportOutfieldCard;
		$(function() {
// 			  var modelNameUserCommonSelector = new CommonSelector("dept",
// 						"deptSelectCommonDialog", "kfUserId", "kfUserName");
// 				modelNameUserCommonSelector.init();
			var dealDepartIdDeptCommonSelector = new CommonSelector("dept",
					"deptSelectCommonDialog", "dealDepartId", "dealDepartName");
			dealDepartIdDeptCommonSelector.init();

          var modelNameUserCommonSelector = new CommonSelector("user",
					"userSelectCommonDialog", "kfUserId", "kfUserName");
			modelNameUserCommonSelector.init();
			
			


			hdkfSupportOutfieldCard = new HdkfSupportOutfieldCard(
					'dgHdkfSupportOutfieldCard', '${url}', 'searchDialog',
					'hdkfSupportOutfieldCard');

		
			///

	
		});
		function loadToolTip(){
			   $(".easyui-tooltip").tooltip({
	               onShow: function () {
	                   $(this).tooltip('tip').css({
	                       borderColor: '#000'
	                   });
	               }
	           });
		 }
		function formateDate(value, row, index) {
			return hdkfSupportOutfieldCard.formate(value);
		}
		function formateDateTime(value, row, index) {
			return hdkfSupportOutfieldCard.formateTime(value);
		}
		//demoBusinessFlow.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfSupportOutfieldCard.detail(\""
					+ row.id + "\",\"" + value + "\",\"" + row.businessstate_ + "\",\"" + row.activityalias_ + "\");'>" + value + "</a>";
		}
	</script>
</body>
</html>