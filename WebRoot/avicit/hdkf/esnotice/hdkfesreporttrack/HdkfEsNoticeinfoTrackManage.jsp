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
<!-- ControllerPath = "hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/HdkfEsNoticeinfoInfoTrack" -->
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
</head>

<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="#toolbarHdkfEsNoticeinfo" class="datagrid-toolbar">
			<table>
				<tr>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfEsNoticeinfo_button_bpmAll" --%>
<%-- 						permissionDes="全部文件"> --%>
<!-- 						<td width="120px;"><a href="javascript:void(0);" id="allMenu" -->
<!-- 							name="bpm_all_menu" class='easyui-menubutton' -->
<!-- 							data-options="menu:'#allmm',iconCls:'icon-all-file'">全部文件</a> -->
<!-- 							<div id="allmm" style="width: 105px;"> -->
<!-- 								<div id='all_start' name="bpm_all_start" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('start','all')">拟稿中</div> -->
<!-- 								<div id='all_active' name="bpm_all_active" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('active','all')">流转中</div> -->
<!-- 								<div id='all_ended' name="bpm_all_ended" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('ended','all')">已完成</div> -->
<!-- 								<div id='all_all' name="bpm_all_all" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('all','all')">全部文件</div> -->
<!-- 							</div></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfEsNoticeinfo_button_bpmMyFile" --%>
<%-- 						permissionDes="我的文件"> --%>
<!-- 						<td width="120px;"><a href="javascript:void(0);" id="myMenu" -->
<!-- 							name="bpm_my_menu" class='easyui-menubutton' -->
<!-- 							data-options="menu:'#mymm',iconCls:'icon-my-file'">我的文件</a> -->
<!-- 							<div id="mymm" style="width: 105px;"> -->
<!-- 								<div id='my_start' name="bpm_my_start" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('start','my')">我的拟稿</div> -->
<!-- 								<div id='my_active' name="bpm_my_active" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('active','my')">我的流转</div> -->
<!-- 								<div id='my_ended' name="bpm_my_ended" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('ended','my')">我的完成</div> -->
<!-- 								<div id='my_all' name="bpm_my_all" -->
<!-- 									onclick="hdkfEsNoticeinfo.initWorkFlow('all','my')">我的全部</div> -->
<!-- 							</div></td> -->
<%-- 					</sec:accesscontrollist> --%>
				
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="TrackReportinsert();"
							href="javascript:void(0);">填写/修改上报文号</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="TrackAnswerinsert();"
							href="javascript:void(0);">填写/修改批复文号</a></td>
					</sec:accesscontrollist>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfo_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="TrackSendinsert();"
							href="javascript:void(0);">填写/修改转发文号</a></td>
					</sec:accesscontrollist>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportFaultDetail_button_query"
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
						data-options="field:'bulletinNo', align:'center',formatter:formateHrefDetail"
						width="220">通告编号</th>
					<th data-options="field:'title', align:'center'" width="480">标题</th>
					<th
						data-options="field:'reportDate', hidden:true,formatter:formateDate"
						width="200">预计上报日期</th>
					<th
						data-options="field:'bulletinType', align:'center',formatter:formatebulletinType"
						width="180">通报类型</th>
					<th
						data-options="field:'implementCompany', align:'center',formatter:formateimplementCompany"
						width="180">实施单位</th>
					<th data-options="field:'organContact', hidden:true " width="220">机关联系人</th>
					<th data-options="field:'telephone', hidden:true " width="220">机关联系人电话</th>

					
					<!-- 					<th data-options="field:'materialSupply', halign:'center',formatter:formatematerialSupply" width="220">材料提供方式</th>	
					<th data-options="field:'author', halign:'center'" width="220">编者</th>
					<th data-options="field:'fileCompany', halign:'center'" width="220">编发单位</th>
					<th data-options="field:'companyTel', halign:'center'" width="220">电话</th>
					<th data-options="field:'includeMars', halign:'center',formatter:formateincludeMars" width="220">是否包含器材</th>
					<th data-options="field:'publishDate', halign:'center',formatter:formateDate" width="220">预计发布日期</th>
					<th data-options="field:'completeDate', halign:'center',formatter:formateDate" width="220">预计应完成日期</th>
					<th data-options="field:'changeNo', halign:'center'" width="220">更改单号</th>
					<th data-options="field:'performRequirement', halign:'center'" width="220">执行要求</th>
					<th data-options="field:'changeComment', halign:'center'" width="220">换版内容</th>
					<th data-options="field:'remark', halign:'center'" width="220">备注</th> -->

					<th data-options="field:'reportNo', align:'center'" width="220">上报文号</th>
					<th
						data-options="field:'reportTime', hidden:true,formatter:formateDate"
						width="220">上报时间</th>

					<th data-options="field:'replyNo', align:'center'" width="220">批复文号</th>
					<th
						data-options="field:'replyTime', hidden:true,formatter:formateDate"
						width="220">批复时间</th>
					<th
						data-options="field:'completeTime', hidden:true,formatter:formateDate"
						width="220">应完成时间</th>

					<th data-options="field:'forwardNo', align:'center'" width="220">转发文号</th>
					<th
						data-options="field:'forwardTime', hidden:true,formatter:formateDate"
						width="220">转发时间</th>
					<th
						data-options="field:'attribute01', align:'center',formatter:formateHref"
						width="200">上报跟踪</th>
				
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



 	<script
		src="avicit/hdkf/esnotice/hdkfesnoticeinfo/js/HdkfEsNoticeinfoTack.js"
		type="text/javascript"></script> 
	<script
		src="avicit/hdkf/esnotice/hdkfesreporttrack/js/HdkfEsNoticeinfoAddTrackReport.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfEsNoticeinfo;
		var hdkfEsNoticeinfoAddTrackReport;

		$(function() {
			hdkfEsNoticeinfo = new HdkfEsNoticeinfo('dgHdkfEsNoticeinfo',
					'${HdkfEsNoticeinfoUrl}', 'searchDialog',
					'hdkfEsNoticeinfo');
			hdkfEsNoticeinfoAddTrackReport = new HdkfEsNoticeinfoAddTrackReport(
					'hdkfEsNoticeinfoAddTrackReport',
					'${HdkfEsNoticeinfoInsertUrl}', 'searchDialog',
					'hdkfEsNoticeinfoAddTrackReport');
			
		});
		function formateDate(value, row, index) {
			return hdkfEsNoticeinfo.formate(value);
		};
		function formateDateTime(value, row, index) {
			return hdkfEsNoticeinfo.formateTime(value);
		};

		function formateHrefDetail(value, row, inde) {
			return "<a href='javascript:void(0);' onclick='hdkfEsNoticeinfo.detailtrack(\""
					+ row.id + "\",\"" + value + "\");'>" + value + "</a>";
		}

		function formateHref(value, row, inde) {
			var _value = "跟踪情况";
			return '<a id="ahtmlcss" href="javascript:void(0);" onclick="reportTrackIn(\''
					+ row.id
					+ '\',\''
					+ row.bulletinNo
					+ '\');">'
					+ _value
					+ '</a>';
		};

		//上报跟踪页面
		function reportTrackIn(id, bulletinNo) {
			//通告编号
			//platform/hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/
			//parambulletinNo//paramId="+id
			var path = "platform/hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/HdkfEsReportTrackInfoRecord?paramId="
					+ id;
			this.nData = new CommonDialog("reportTrackIn", "1000", "800", path,
					"技术通报上报跟踪详情", false, true, false);
			this.nData.show();
		};

		function _onCollapse() {
			var $title = $('.layout-expand-north .panel-title').first();
			$('<div class="panel-icon icon-search"></div>').insertAfter($title);
			$title.addClass('panel-with-icon');
			//修改名称
			$title.text('技术通报上报跟踪');
		};

		function TrackReportinsert() {
			var rows = $('#dgHdkfEsNoticeinfo').datagrid('getChecked');
			if (rows.length !== 1) {
				$.messager.alert('提示', '请选择一条数据进行填写或者修改上报文号！', 'warning');
				return false;
			}else{
				if(rows[0].reportNo==null){
					hdkfEsNoticeinfoAddTrackReport
					.insertreport(rows[0].id);
				}else{//if(rows[0].reportNo!=null)
					$.messager.confirm('提示', '是否对上报文号信息进行修改！', function(b){
						if(b){
							hdkfEsNoticeinfoAddTrackReport
							.modifyreport(rows[0].id);
							
						}else{
							$.messager.show({
								 title : '提示',
								 msg : r.error
							});
						}
					});
				}
			}

			
			/* $
					.ajax({
						url : '${HdkfEsNoticeinfoInsertUrl}'
								+ 'TrackReport/InsertReport/' + rows[0].id,
						type : 'post',
						dataType : 'json',
						success : function(r) {
							if (r.flag == "success") {
								hdkfEsNoticeinfoAddTrackReport
										.insertreport(rows[0].id);
							} else if (r.flag == 'failure') {
								$.messager.alert('提示', '该条数据已经填写上报文号！',
										'warning');
							}
						}
					}); */
		}
		//TrackAnswerinsert
		function TrackAnswerinsert() {
			var rows = $('#dgHdkfEsNoticeinfo').datagrid('getChecked');
			if (rows.length !== 1) {
				$.messager.alert('提示', '请选择一条数据进行填写或者修改批复文号！', 'warning');
				return false;
			}else{
				if(rows[0].replyNo==null){
					hdkfEsNoticeinfoAddTrackReport
					.insertanswer(rows[0].id);
				}else{//if(rows[0].reportNo!=null)
					$.messager.confirm('提示', '是否对批复文号信息进行修改！', function(b){
						if(b){
							hdkfEsNoticeinfoAddTrackReport
							.modifyanswer(rows[0].id);
							
						}else{
							$.messager.show({
								 title : '提示',
								 msg : r.error
							});
						}
					});
				}
			}
			/* $
					.ajax({
						url : '${HdkfEsNoticeinfoInsertUrl}'
								+ 'TrackAnswer/InsertAnswer/' + rows[0].id,
						type : 'post',
						dataType : 'json',
						success : function(r) {
							if (r.flag == "success") {
								hdkfEsNoticeinfoAddTrackReport
										.insertanswer(rows[0].id);
							} else if (r.flag == 'failure') {
								$.messager.alert('提示', '该条数据已经填写批复文号！',
										'warning');
							}
						}
					}); */
		}
		//TrackSendinsert
		function TrackSendinsert() {
			var rows = $('#dgHdkfEsNoticeinfo').datagrid('getChecked');
			if (rows.length !== 1) {
				$.messager.alert('提示', '请选择一条数据进行添加或者修改转发文号！', 'warning');
				return false;
			}else{
				if(rows[0].forwardNo==null){
					hdkfEsNoticeinfoAddTrackReport.insertsend(rows[0].id);
				}else{//if(rows[0].forwardNo!=null)
					$.messager.confirm('提示', '是否对转发文号信息进行修改！', function(b){
						if(b){
							hdkfEsNoticeinfoAddTrackReport.modifysend(rows[0].id);
							
						}else{
							$.messager.show({
								 title : '提示',
								 msg : r.error
							});
						}
					});
				}
			}
			/* $.ajax({
				url : '${HdkfEsNoticeinfoInsertUrl}' + 'TrackSend/InsertSend/'
						+ rows[0].id,
				type : 'post',
				dataType : 'json',
				success : function(r) {
					if (r.flag == "success") {
						hdkfEsNoticeinfoAddTrackReport.insertsend(rows[0].id);
					} else if (r.flag == 'failure') {
						$.messager.alert('提示', '该条数据已经填写转发文号！', 'warning');
					}
				}
			}); */
		}

		function formatebulletinType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfEsNoticeinfo.bulletinType);
		};

		function formatematerialSupply(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfEsNoticeinfo.materialSupply);
		};

		function formateimplementCompany(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfEsNoticeinfo.implementCompany);
		};
		//formateincludeMars
		function formateincludeMars(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfEsNoticeinfo.includeMars);
		};

		function bpm_operator_refresh() {
			hdkfEsNoticeinfo.reLoad();
		}
	</script>
</body>
</html>