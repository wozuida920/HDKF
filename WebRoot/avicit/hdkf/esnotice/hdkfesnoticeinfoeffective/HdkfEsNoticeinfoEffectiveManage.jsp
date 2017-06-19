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
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/HdkfEsNoticeinfoEffectiveInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>

<script
	src=" avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/js/HdkfEsNoticeinfoEffective.js"
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
	var hdkfEsNoticeinfoEffective;
	var  bulletinIdR;
	var planTime = '${planTime}';
	var completeDate = '${completeDate}';
	var name = '${name}';
	$(function() {
		bulletinIdR = "${bulletinId}";
		hdkfEsNoticeinfoEffective = new HdkfEsNoticeinfoEffective(
				'dgHdkfEsNoticeinfoEffective', 'searchDialog', '${url}',
				'hdkfEsNoticeinfoEffective');

		var array = [];

	
		///

		selfDefQury.init(array);
		selfDefQury.setQuery(function(param) {
			hdkfEsNoticeinfoEffective.searchDataBySfn(param);
		});

	});
	function formateDate(value, row, index) {
		return hdkfEsNoticeinfoEffective.formate(value);
	};
	function formateDateTime(value, row, index) {
		return hdkfEsNoticeinfoEffective.formateDateTime(value);
	};
	function formatedoFlag(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfoEffective.doFlag);
	}
	/**通用代码格式化
	function formatvalidFlag(value){
	return Platform6.fn.lookup.formatLookupType(value,hdkfEsNoticeinfoEffective.validFlag);
	};
	 **/
	//上传附件页面
		function formateUploadFile(value, row, inde) {
		 if(row.doFlag)
			return '<a id="ahtmlcss" href="javascript:void(0);" onclick="fileUpload(\''
					+ row.id + '\');">' + value + '</a>';
		else   return '';
		}
		function fileUpload(id) {
			var path = 'hdkf/esnotice/hdkfesnoticeinfoeffective/HdkfEsNoticeinfoEffectiveController/operation/' + 'FileUpload/' + id
					+ '/AddModelInfo';
			this.nData = new CommonDialog("fileUpload", "600", "320", path,
					"添加附件页面", false, true, false);
			this.nData.show();
		}
		 function showToolTip(value, row, index) {
             var abValue = value;
             if (value!=null&&value.length>=8) {
                 abValue = value.substring(0,8) + "...";
             }
             if(value)
             {var content = '<a href="javascript:void(0);" title="' + value + '" class="easyui-tooltip">' + abValue + '</a>';
             //<a href="#" title="This is the tooltip message." class="easyui-tooltip">Hover me</a>
             return content ;
             }else
            	 return '';
             
             
         }
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
		<div id="toolbarHdkfEsNoticeinfoEffective" class="datagrid-toolbar">
			<table>
				<tr>
	              <sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_clear"
						permissionDes="提交">
						<td><a class="easyui-linkbutton" iconCls="icon-tools"
							plain="true" onclick="hdkfEsNoticeinfoEffective.clear();"
							href="javascript:void(0);">重置</a></td>
					</sec:accesscontrollist>
					
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_edit"
						permissionDes="保存">
						<td><a class="easyui-linkbutton" iconCls="icon-edit"
							plain="true" onclick="hdkfEsNoticeinfoEffective.edit();"
							href="javascript:void(0);">编辑</a></td>
					</sec:accesscontrollist>
					
					
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_save"
						permissionDes="保存">
						<td><a class="easyui-linkbutton" iconCls="icon-save"
							plain="true" onclick="hdkfEsNoticeinfoEffective.save();"
							href="javascript:void(0);">保存</a></td>
					</sec:accesscontrollist>
					
					
						<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_submit"
						permissionDes="提交">
						<td><a class="easyui-linkbutton" iconCls="icon-submit"
							plain="true" onclick="hdkfEsNoticeinfoEffective.submit();"
							href="javascript:void(0);">提交</a></td>
					</sec:accesscontrollist>
					
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true"
							onclick="hdkfEsNoticeinfoEffective.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
					

				</tr>
			</table>
		</div>
		<table id="dgHdkfEsNoticeinfoEffective"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfEsNoticeinfoEffective',
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
					<th data-options="field:'id', halign:'center',checkbox:true"
						width="220">主键</th>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'aircraftinfoId', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">飞机信息表ID</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'batchNo', align:'center'"
						
						width="220">批架次</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'modelName', align:'center'"
						
						width="220">机型</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'bulletinId', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">技术通报详细表ID</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'bulletinNo', hidden:true"
						
						width="220">通告编号</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'customerId', hidden:true"
						
						width="220">客户ID</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'customerName', align:'center'"
					
						width="220">客户名称</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'doFlag', align:'center',formatter:formatedoFlag"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">是否贯彻</th>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'planTime', hidden:true,formatter:formateDate"
						editor="{type:'datebox',options:{editable:false}}" width="220">计划贯彻时间</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'doTime', align:'center',formatter:formateDate"
						editor="{type:'datebox',options:{editable:false}}" width="220">贯彻完成时间</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'undoReason', align:'center',formatter:showToolTip"
							editor="{type:'textarea',options:{rows:4,cols:2}}"
						width="220">不执行理由</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'userComments', align:'center',formatter:showToolTip"
							editor="{type:'textarea',options:{rows:4,cols:2}}"
						width="220">用户意见</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'writeName', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">填写人</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'completeDate', align:'center',formatter:formateDate"
						editor="{type:'datebox',options:{editable:false}}" width="220">填写日期</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'remarks', align:'center',formatter:showToolTip"
					editor="{type:'textarea',options:{rows:4,cols:2}}"
						width="220">备注</th>
						
					<th data-options="field:'countFile', align:'center',formatter:formateUploadFile" width="220">附件</th>

				</tr>
			</thead>
		</table>
	</div>

	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; height: 0px; padding: 0px; overflow: hidden;">
		<form id="hdkfEsNoticeinfoEffective">
			<table class="form_commonTable">
				<tr>
				
					<th width="10%">批架次:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="batchNo" /></td>
					
					<th width="10%">机型:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="modelName" /></td>
					
				</tr>
				
				<tr>
					<th width="10%">客户名称:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="customerName" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">是否贯彻:</th>
					<td width="40%"><pt6:syslookup name="doFlag" isNull="true"
							lookupCode="PLATFORM_YES_NO_FLAG"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
				
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera" style="margin-top:30px;margin-bottom:5px;">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfEsNoticeinfoEffective.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfEsNoticeinfoEffective.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfEsNoticeinfoEffective.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>