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
<!-- ControllerPath = "hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/HdkfEsReportTrackInfo" -->
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
<script src="avicit/hdkf/common/js/ValidtionContent.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'" style="background: #ffffff; height: auto; padding: 0px; overflow: hidden;">
		<div class="easyui-layout" fit="true">
			<div data-options="region:'north',title:' '" style="height: 160px;">
			
			<form id="hdkfEsReportTrack">
				<table class="form_commonTable">
					<tr>
						<th width="10%">日期从:</th>
						<td width="40%"><input name="trackDateBegin"
						id="trackDateBegin" class="easyui-datebox" editable="false" />
						
					<th width="10%">日期(至):</th>
						<td width="40%"><input name="trackDateEnd" id="trackDateEnd"
						class="easyui-datebox" editable="false" /></td>
					</tr>
					<tr>
					<th width="10%">当前处理人:</th>
					<td width="40%"><input class="easyui-validatebox"
						style="width: 151px;" type="text" name="people" /></td>
					</tr>

					</table>
					</form>	
				<div id="searchBtns" class="datagrid-toolbar foot-formopera">
					<table class="tableForm" border="0" cellspacing="1" width='100%'>
						<tr>
							<td align="center">
								<a class="easyui-linkbutton" iconCls=""
								plain="false" onclick="hdkfEsReportTrack.searchData();" href="javascript:void(0);">查询</a> 
								<a class="easyui-linkbutton"
								iconCls="" plain="false"
								onclick="hdkfEsReportTrack.clearData()"
								href="javascript:void(0);">清空</a>
							</td>
						</tr>
					</table>
				</div>				
			</div>
		<div data-options="region:'center'"
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarHdkfEsReportTrack" class="datagrid-toolbar">
			<table>
				<tr>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsReportTrack_table_${param.standName}"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfEsReportTrack.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsReportTrack_button_edit"
						permissionDes="编辑">
						<td><a class="easyui-linkbutton" iconCls="icon-edit"
							plain="true" onclick="hdkfEsReportTrack.modify();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsReportTrack_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfEsReportTrack.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>

				</tr>
			</table>
		</div>
		<table id="dgHdkfEsReportTrack"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfEsReportTrack',
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
					<th data-options="field:'id', halign:'center',checkbox:true"
						width="220">主键</th>
<!-- 					<th data-options="field:'techinalBulletinId', halign:'center'"
						width="220">技术通报详细编号</th> -->

					<th data-options="field:'bulletinNo', halign:'center'" width="220">通告编号</th>

					<th
						data-options="field:'trackDate', halign:'center',formatter:formateDate"
						width="220">日期</th>
					<th data-options="field:'people', halign:'center'" width="220">当前处理人</th>

					<th data-options="field:'remark', halign:'center'" width="220">跟踪情况</th>

				</tr>
			</thead>
		</table>
	</div>

	 <div data-options="region:'south',border:false" style="height:40px">
	   <div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
			</div>
		</div>
		</div>
	</div>


	<script
		src=" avicit/hdkf/esnotice/hdkfesreporttrack/js/HdkfEsReportTrack.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfEsReportTrack;
		$(function(){
			hdkfEsReportTrack= new HdkfEsReportTrack('dgHdkfEsReportTrack','${url}','searchDialog','hdkfEsReportTrack','${paramId}');
																																																																																																																																																																																																																																																																																																																																															/////
			var array=[];
    			                                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'技术通报详细ID',
                                    field:'TECHINAL_BULLETIN_ID',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'通告编号',
                                    field:'BULLETIN_NO',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'日期',
                                    field:'TRACK_DATE',
                                    type:1,
                                    dataType:'date'};
                                     array.push(searchObject);
                                                                                                                                                                                              
                              var searchObject = 
                                {
                                    name:'当前处理人',
                                    field:'PEOPLE',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                             
                              var searchObject = 
                                {
                                    name:'备注',
                                    field:'REMARK',
                                    type:1,
                                    dataType:'string'};
                                     array.push(searchObject);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ///
              
            
            selfDefQury.init(array);
            selfDefQury.setQuery(function(param){
                hdkfEsReportTrack.searchDataBySfn(param);
            });
		});
		function formateDate(value,row,index){
			return hdkfEsReportTrack.formate(value);
		}
		function formateDateTime(value,row,index){
			return hdkfEsReportTrack.formateDateTime(value);
		}
		//hdkfEsReportTrack.detail(\''+row.id+'\')
		function formateHref(value,row,inde){
			return '<a href="javascript:void(0);" onclick="hdkfEsReportTrack.detail(\''+row.id+'\');">'+value+'</a>';
		}
		
		function closeForm(){
			parent.$('#reportTrackIn').dialog('close');
			//parent.csmpEsNoticeinfoDetail.searchData();
		}
		
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	</script>
	</script>
</body>

</html>