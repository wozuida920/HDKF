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
<!-- ControllerPath = "hdkf/support/hdkfsupportsolutiondetail/HdkfSupportSolutionDetailController/HdkfSupportSolutionDetailInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>

<script
	src=" avicit/hdkf/support/hdkfsupportsolutiondetail/js/HdkfSupportSolutionDetail.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
		maxLength : {
			validator : function(value, param) {
				return param[0] >= value.length;

			},
			message : '请输入最多 {0} 字符.'
		}
	});
	$.extend($.fn.datagrid.defaults.editors, {   
		 

		 textarea: {   
			 init: function(container, options){   
			             var input = $('<textarea class="datagrid-editable-input" style="word-wrap:break-word;"    cols='+options.cols+' rows='+options.rows+'></textarea>').appendTo(container);   
			             return input;   
			          },   
			 getValue: function(target){   
			             return $(target).val();   
			         },   
			 setValue: function(target, value){   
			             $(target).val(value);   
			        },   
			 resize: function(target, width){   
			 
			             var input = $(target);   
			             if ($.boxModel == true){   
			                 input.width(width - (input.outerWidth() - input.width()));   
			             } else {   
			                 input.width(width);   
			             }   
			         }   
			     }   
			
	 }); 
	var hdkfSupportSolutionDetail;
	var infoCardNoR,dealUserIdR,dealUserNameR;
	

	$(function() {
		infoCardNoR="${infoCardNo}";
		dealUserIdR = "${userId}";
		dealUserNameR = "${CURRENT_LOGINUSER.name}";
		hdkfSupportSolutionDetail = new HdkfSupportSolutionDetail(
				'dgHdkfSupportSolutionDetail', 'searchDialog', '${url}',
				'hdkfSupportSolutionDetail');
	
		var array = [];

		var searchObject = {
			name : '承办人ID',
			field : 'DEAL_USER_ID',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '承办人',
			field : 'DEAL_USER_NAME',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '方案形日期',
			field : 'DONE_TIME',
			type : 1,
			dataType : 'date'
		};
		array.push(searchObject);

		var searchObject = {
			name : '外场信息处理卡编号',
			field : 'INFO_CARD_NO',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '求援请求ID',
			field : 'REQUEST_ID',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '信息卡编号',
			field : 'REQUEST_NO',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);

		var searchObject = {
			name : '处理结论',
			field : 'DEAL_SOLUTION',
			type : 1,
			dataType : 'string'
		};
		array.push(searchObject);
		///

		selfDefQury.init(array);
		selfDefQury.setQuery(function(param) {
			hdkfSupportSolutionDetail.searchDataBySfn(param);
		});

	});
	function formateDate(value, row, index) {
		return hdkfSupportSolutionDetail.formate(value);
	};
	 function showToolTip(value, row, index) {
         var abValue = value;
         if (value!=null&&value.length>=60) {
             abValue = value.substring(0,60) + "...";
         }
         var content = '<a href="javascript:void(0);" title="' + value + '" class="easyui-tooltip">' + abValue + '</a>';
         //<a href="#" title="This is the tooltip message." class="easyui-tooltip">Hover me</a>
         return content ;
         
         
     };
	function formateDateTime(value, row, index) {
		return hdkfSupportSolutionDetail.formateDateTime(value);
	};
	/**通用代码格式化
	function formatvalidFlag(value){
	return Platform6.fn.lookup.formatLookupType(value,hdkfSupportSolutionDetail.validFlag);
	};
	 **/
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;">
		<div id="toolbarHdkfSupportSolutionDetail" class="datagrid-toolbar">
			<table>
				<tr>

<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportSolutionDetail_button_add" --%>
<%-- 						permissionDes="添加"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-add" -->
<!-- 							plain="true" onclick="hdkfSupportSolutionDetail.insert();" -->
<!-- 							href="javascript:void(0);">添加</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportSolutionDetail_button_edit" --%>
<%-- 						permissionDes="保存"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-save" -->
<!-- 							plain="true" onclick="hdkfSupportSolutionDetail.save();" -->
<!-- 							href="javascript:void(0);">保存</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportSolutionDetail_button_delete" --%>
<%-- 						permissionDes="删除"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-remove" -->
<!-- 							plain="true" onclick="hdkfSupportSolutionDetail.del();" -->
<!-- 							href="javascript:void(0);">删除</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportSolutionDetail_button_query" --%>
<%-- 						permissionDes="查询"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 							plain="true" -->
<!-- 							onclick="hdkfSupportSolutionDetail.openSearchForm();" -->
<!-- 							href="javascript:void(0);">查询</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfSupportSolutionDetail_button_seniorquery" --%>
<%-- 						permissionDes="高级查询"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 							plain="true" onclick="selfDefQury.show();" -->
<!-- 							href="javascript:void(0);">高级查询</a></td> -->
<%-- 					</sec:accesscontrollist> --%>

				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportSolutionDetail"
			data-options="
				fit: true,
				title:'处理结论详情',
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportSolutionDetail',
				idField :'id',
				singleSelect: true,
				checkOnSelect: true,
				selectOnCheck: false,
				pagination:true,
				method:'get',
				pageSize:dataOptions.pageSize,
				pageList:dataOptions.pageList,
				striped:true">
			<thead>
				<tr>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'id', hidden:true,checkbox:true"
						width="220">主键</th>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'dealUserId', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[100]'}}"
						width="220">承办人ID</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
<!-- 					<th data-options="field:'dealUserName', align:'center'"    -->
<!-- 						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}" -->
<!-- 						width="120">承办人</th> -->
                     <th data-options="field:'dealUserName', align:'center'" width="120">承办人</th>
					

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
<!-- 					<th data-options="field:'infoCardNo', hidden:true" -->
<!-- 						editor="{type:'validatebox',options:{validType:'maxLength[40]'}}" -->
<!-- 						width="120">外场信息处理卡编号</th> -->
						
					<th data-options="field:'infoCardNo', align:'center'" width="120">外场信息处理卡编号</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'requestId',  hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">求援请求ID</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'requestNo', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">信息卡编号</th>
						
                 <th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
<!-- 					<th -->
<!-- 						data-options="field:'doneTime', align:'center',formatter:formateDate" -->
<!-- 						editor="{type:'datebox',options:{editable:false}}" width="120">方案形成日期</th> -->
					
					<th data-options="field:'doneTime', align:'center',formatter:formateDate" width="120">外场信息处理卡编号</th>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
<!-- 					<th data-options="field:'dealSolution', align:'center'" -->
<!-- 						editor="{type:'textarea',options:{rows:5,cols:3}}" -->
<!-- 						width="520">处理结论</th> -->
             <th data-options="field:'dealSolution', align:'center',formatter:showToolTip" width="520">处理结论</th>

				</tr>
			</thead>
		</table>
	</div>

	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; height: 0px; padding: 0px; overflow: hidden;">
		<form id="hdkfSupportSolutionDetail">
			<table class="form_commonTable">
				<tr>
					<th width="10%">承办人ID:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="dealUserId" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">承办人:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="dealUserName" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
				<tr>
				<tr>
					<th width="10%">方案形日期从:</th>
					<td width="40%"><input name="doneTimeBegin" id="doneTimeBegin"
						class="easyui-datebox" editable="false" />
					<th width="10%">方案形日期(至):</th>
					<td width="40%"><input name="doneTimeEnd" id="doneTimeEnd"
						class="easyui-datebox" editable="false" /></td>
				</tr>
				<th width="10%">外场信息处理卡编号:</th>
				<td width="40%"><input class="easyui-validatebox" type="text"
					name="infoCardNo" /></td>
				<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				<th width="10%">求援请求ID:</th>
				<td width="40%"><input class="easyui-validatebox" type="text"
					name="requestId" /></td>
				<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
				<tr>
					<th width="10%">信息卡编号:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="requestNo" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">处理结论:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="dealSolution" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
				<tr>
				</tr>
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportSolutionDetail.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportSolutionDetail.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportSolutionDetail.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>