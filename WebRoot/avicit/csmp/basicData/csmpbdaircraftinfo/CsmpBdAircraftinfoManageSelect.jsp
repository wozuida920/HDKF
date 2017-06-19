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
<!-- ControllerPath = "csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoControllerSelect/CsmpBdAircraftinfoInfoSelect" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>
	<script src="avicit/csmp/common/js/ValidtionContent.js" type="text/javascript"></script>
<style type="text/css">
/* 设置点击详细页的<a>标签操作之后的样式（只限于IE浏览器） */
#ahtmlcss { 
color: blue;
} 

.th_wid{
width:10%;
}

.td_wid{
width:15%;
}

</style>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="resizable:true,split:true,region:'north',title:'飞机信息',collapsible:true,onCollapse:_onCollapse" 
	 iconCls="icon-search" style="width:100%;height:130px;overflow-y:hidden;overflow-x:auto;">
	       <center>
				<form id="csmpBdAircraftinfo">
					<table class="form_commonTable" style="width: 70%">
						<tr>
							<th class="th_wid">批架次:</th>
							<td class="td_wid"><input class="easyui-validatebox"
								type="text" name="batchNo" id="batchNo"/></td>
							
							<th class="th_wid">客户:</th>
							<td class="td_wid"><input class="easyui-validatebox"
								type="text" name="custumerName" id="custumerName"/></td>
						</tr>
						<tr>
							<td align="center" colspan="4">
							  <div id="searchBtns" align="center" style="margin-top: 8px;">
									<a class="easyui-linkbutton" iconCls=""
									plain="false" onclick="csmpBdAircraftinfo.searchData();" href="javascript:void(0);">查询</a> 
									&nbsp;
									<a class="easyui-linkbutton"iconCls="" plain="false" onclick="csmpBdAircraftinfo.clearData();"
									href="javascript:void(0);">清空</a>
							  </div>
							</td>
						</tr>
					</table>
				</form>
			</center>
			
				<div id="searchBtns" class="datagrid-toolbar foot-formopera">
					<table class="tableForm" border="0" cellspacing="1" width='100%'>
						<tr>
							<td align="center">
								<a class="easyui-linkbutton" iconCls=""
								plain="false" onclick="csmpBdAircraftinfo.searchData();" href="javascript:void(0);">查询</a> 
								&nbsp;
								<a class="easyui-linkbutton"iconCls="" plain="false"
								onclick="csmpBdAircraftinfo.clearData();"
								href="javascript:void(0);">清空</a>
							</td>
						</tr>
					</table>
				</div>
		</div>

			<div data-options="region:'center'"
				style="background: #ffffff; height: auto; padding: 0px; overflow: hidden;">
				<div id="toolbarCsmpBdAircraftinfo" class="datagrid-toolbar">
				</div>

				<table id="dgCsmpBdAircraftinfo"
					data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarCsmpBdAircraftinfo',
				idField :'id',
				singleSelect: false,
				checkOnSelect: true,
				selectOnCheck: true,
				onDblClickRow : backRow,
				pagination:true,
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
					<thead>
						<tr>
							<th data-options="field:'id', align:'center',checkbox:true"
								width="220">主键ID</th>
							<th data-options="field:'modelIdAlias',align:'center', halign:'center'"
								width="220">机型</th>
							<th data-options="field:'batchNo',align:'center', halign:'center'"
								width="220">批架次</th>
							<th data-options="field:'custumerName',align:'center', halign:'center'"
								width="220">客户名称</th>
							<th data-options="field:'companyId', hidden:true" width="220">单位ID</th>
						</tr>
					</thead>
				</table>
			</div>
			
		<div data-options="region:'south',border:false" style="height:37px"> 
			<div id="toolbar"  align="right" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
				  <div align="right">
					<a href="javascript:void(0);" id="selectContractunitBtn" onclick="backRow();" class="easyui-linkbutton">提交</a>
					<a href="javascript:void(0);" id="closeContractunitBtn" onclick="closeForm();" class="easyui-linkbutton">关闭</a>
				  </div>
	       </div>
       </div>
	
	<script src=" avicit/csmp/basicData/csmpbdaircraftinfo/js/CsmpBdAircraftinfoSelect.js" type="text/javascript"></script>
	<script type="text/javascript">
		var csmpBdAircraftinfo;
		$(function(){
			csmpBdAircraftinfo = new CsmpBdAircraftinfo('dgCsmpBdAircraftinfo', '${url}', 'searchDialog', 'csmpBdAircraftinfo');
			var dgView=$('#dgCsmpBdAircraftinfo');
			//调用初始化方法
			initTheLangField(dgView);
			initTheMessage(dgView);
			
		});
		
		function formateDate(value, row, index) {
			return csmpBdAircraftinfo.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpBdAircraftinfo.formateTime(value);
		}
		//csmpBdAircraftinfo.detail(\''+row.id+'\')
		function formateHref(value, row, inde) {
			return '<a href="javascript:void(0);" onclick="csmpBdAircraftinfo.detail(\''
					+ row.id + '\');">' + value + '</a>';
		}
		function formateisBusinessPeriod(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdAircraftinfo.isBusinessPeriod);
		}
		function formateoperateStatus(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					csmpBdAircraftinfo.operateStatus);
		}
		
		function _onCollapse(){
			var $title = $('.layout-expand-north .panel-title').first();
			$('<div class="panel-icon icon-search"></div>').insertAfter($title);
			$title.addClass('panel-with-icon');
			//修改名称
			$title.text('飞机信息');
		};
		
		function closeForm(){
			parent.$('#AircraftSelect').dialog('close');
		}
		
		
		function backRow(){
			var rows = $('#dgCsmpBdAircraftinfo').datagrid('getChecked');
			if(rows.length <= 0){
				$.messager.show({ title : '提示', msg : '请选择数据！'});
				return false;
			}
			parent.selectAircraftRow(rows);
			parent.$('#AircraftSelect').dialog('close');
		}
	</script>
</div>
</body>
</html>