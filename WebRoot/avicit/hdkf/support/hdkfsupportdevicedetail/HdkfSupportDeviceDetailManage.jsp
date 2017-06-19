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
<!-- ControllerPath = "hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportDeviceDetailInfo" -->
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
<style type="text/css">
/* .textarea { */
/* cols:3 */
/* rows:5 */
/* } */
 </style>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;font-size:0;">
		<div id="toolbarHdkfSupportDeviceDetail" class="datagrid-toolbar">
			<table>
				<tr>

					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDeviceDetail_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfSupportDeviceDetail.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDeviceDetail_button_edit"
						permissionDes="保存">
						<td><a class="easyui-linkbutton" iconCls="icon-edit"
							plain="true" onclick="hdkfSupportDeviceDetail.save();"
							href="javascript:void(0);">保存</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDeviceDetail_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfSupportDeviceDetail.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfSupportDeviceDetail_button_query"
						permissionDes="查询">
						<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="hdkfSupportDeviceDetail.openSearchForm();"
							href="javascript:void(0);">查询</a></td>
					</sec:accesscontrollist>
<!-- 					<td><a class="easyui-linkbutton" iconCls="icon-search" -->
<!-- 						plain="true" onclick="selfDefQury.show();" -->
<!-- 						href="javascript:void(0);">高级查询</a></td> -->
				</tr>
			</table>
		</div>
		<table id="dgHdkfSupportDeviceDetail"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfSupportDeviceDetail',
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
					<th data-options="field:'id', halign:'center',checkbox:true"
						width="220">主键</th>
					<th data-options="field:'taskId', hidden:'true'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">任务书ID</th>

					<th data-options="field:'taskNo', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[30]'}}"
						width="220">任务书编号</th>

					<th data-options="field:'deviceNo', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">器件编号</th>

					<th data-options="field:'deviceName', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">器件名称</th>
					<th
						data-options="field:'deviceType', align:'center',formatter:formatedeviceType"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">类型</th>
					<th data-options="field:'singleNumber', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[22]'}}"
						width="220">数量</th>

					<th
						data-options="field:'unit', align:'center',formatter:formateunit"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">计量单位</th>
<!-- 					<th data-options="field:'price', align:'center'" -->
<!-- 						editor="{type:'validatebox',options:{validType:'maxLength[22]'}}" -->
<!-- 						width="220">单价</th> -->

					<th data-options="field:'specifications', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[80]'}}"
						width="220">规格</th>

					<th data-options="field:'liabilityUnit', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[100]'}}"
						width="220">责任单位</th>

					<th
						data-options="field:'categorys', align:'center',formatter:formatecategorys"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">类别</th>
					<th
						data-options="field:'isRandompart', align:'center',formatter:formateisRandompart"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="120">是否随机件</th>
					<th
						data-options="field:'validateFlag', align:'center',formatter:formatevalidateFlag"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="120">有效性</th>
					<th
						data-options="field:'serOwned', align:'center',formatter:formateserOwned"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="120">用户自备</th>
					<th data-options="field:'remark', align:'center'"
						editor="{type:'textarea',options:{rows:5,cols:3}}"
						width="520">备注</th>

				</tr>
			</thead>
		</table>
	</div>

	<!--*****************************搜索*********************************  -->
	<div id="searchDialog"
		data-options="iconCls:'icon-search',resizable:true,modal:false,buttons:'#searchBtns'"
		style="width: 904px; height: 340px; height: 0px; padding: 0px; overflow: hidden;">
		<form id="hdkfSupportDeviceDetail">
			<table class="form_commonTable">
			<tr>
				
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">任务书编号:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="taskNo" /></td>
						
				<th width="10%">器件名称:</th>
					<td width="40%"><input class="easyui-validatebox" type="text"
						name="deviceName" /></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
			
				
				<tr>
					<th width="10%">类别:</th>
					<td width="40%"><pt6:syslookup name="categorys"
							lookupCode="CSMP_BD_GATEGORY"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">是否随机件:</th>
					<td width="40%"><pt6:syslookup name="isRandompart"
							lookupCode="CSMP_BD_RANDOMPART"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
				<tr>
					<th width="10%">有效性:</th>
					<td width="40%"><pt6:syslookup name="validateFlag"
							lookupCode="CSMP_ES_VALID_FLAG"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
					<th width="10%">用户自备:</th>
					<td width="40%"><pt6:syslookup name="serOwned"
							lookupCode="CSMP_ES_EQUIPPED_BY_USER"
							isNull="true"
							dataOptions="width:151,editable:false,panelHeight:'auto'">
						</pt6:syslookup></td>
					<!-- 通用代码
					<th data-options="field:'validFlag',halign:'center',align:'left', formatter: format" editor="{type:'combobox',options:{required:true,panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"  width="220">状态</th>
				-->
				</tr>
			
			</table>
		</form>
		<div id="searchBtns" class="datagrid-toolbar foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td align="right"><a class="easyui-linkbutton primary-btn"
						iconCls="" plain="false"
						onclick="hdkfSupportDeviceDetail.searchData();"
						href="javascript:void(0);">查询</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportDeviceDetail.clearData();"
						href="javascript:void(0);">清空</a> <a class="easyui-linkbutton"
						iconCls="" plain="false"
						onclick="hdkfSupportDeviceDetail.hideSearchForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script
		src=" avicit/hdkf/support/hdkfsupportdevicedetail/js/HdkfSupportDeviceDetail.js"
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
			 
// 		      textarea: {   
// 		 init: function(container, options){   
// 		             var input = $('<textarea class="datagrid-editable-input" rows='+options.rows+'></textarea>').appendTo(container);   
// 		             return input;   
// 		          },   
// 		 getValue: function(target){   
// 		             return $(target).val();   
// 		         },   
// 		 setValue: function(target, value){   
// 		             $(target).val(value);   
// 		        },   
// 		 resize: function(target, width){   
		 
// 		             var input = $(target);   
// 		             if ($.boxModel == true){   
// 		                 input.width(width - (input.outerWidth() - input.width()));   
// 		             } else {   
// 		                 input.width(width);   
// 		             }   
// 		         }   
// 		     }   
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
		var hdkfSupportDeviceDetail;

		$(function() {
			hdkfSupportDeviceDetail = new HdkfSupportDeviceDetail(
					'dgHdkfSupportDeviceDetail', 'searchDialog', '${url}',
					'hdkfSupportDeviceDetail');

			var array = [];

			var searchObject = {
					name : '任务书ID',
					field : 'TASK_ID',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);

				var searchObject = {
					name : '任务书编号',
					field : 'TASK_NO',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);

				var searchObject = {
					name : '器件编号',
					field : 'DEVICE_NO',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);

				var searchObject = {
					name : '器件名称',
					field : 'DEVICE_NAME',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);

				var searchObject = {
					name : '类型',
					field : 'DEVICE_TYPE',
					type : 1,
					dictCode : 'CSMP_BD_CLASSIFY_DEPT',
					dataType : 'dict'
				};
				array.push(searchObject);

				var searchObject = {
					name : '数量',
					field : 'SINGLE_NUMBER',
					type : 1,
					dataType : 'number'
				};
				array.push(searchObject);

				var searchObject = {
					name : '计量单位',
					field : 'UNIT',
					type : 1,
					dictCode : 'CSMP_SPM_UNIT',
					dataType : 'dict'
				};
				array.push(searchObject);

// 				var searchObject = {
// 					name : '单价',
// 					field : 'PRICE',
// 					type : 1,
// 					dataType : 'number'
// 				};
// 				array.push(searchObject);

				var searchObject = {
					name : '规格',
					field : 'SPECIFICATIONS',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);

				var searchObject = {
					name : '责任单位',
					field : 'LIABILITY_UNIT',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);

				var searchObject = {
					name : '类别',
					field : 'CATEGORYS',
					type : 1,
					dictCode : 'CSMP_BD_GATEGORY',
					dataType : 'dict'
				};
				array.push(searchObject);

				var searchObject = {
					name : '是否随机件',
					field : 'IS_RANDOMPART',
					type : 1,
					dictCode : 'CSMP_BD_RANDOMPART',
					dataType : 'dict'
				};
				array.push(searchObject);

				var searchObject = {
					name : '有效性',
					field : 'VALIDATE_FLAG',
					type : 1,
					dictCode : 'CSMP_ES_VALID_FLAG',
					dataType : 'dict'
				};
				array.push(searchObject);

				var searchObject = {
					name : '用户自备',
					field : 'SER_OWNED',
					type : 1,
					dictCode : 'CSMP_ES_EQUIPPED_BY_USER',
					dataType : 'dict'
				};
				array.push(searchObject);

				var searchObject = {
					name : '备注',
					field : 'REMARK',
					type : 1,
					dataType : 'string'
				};
				array.push(searchObject);
			///

			selfDefQury.init(array);
			selfDefQury.setQuery(function(param) {
				hdkfSupportDeviceDetail.searchDataBySfn(param);
			});

		});
		function formateDate(value, row, index) {
			return hdkfSupportDeviceDetail.formate(value);
		};
		function formateDateTime(value, row, index) {
			return hdkfSupportDeviceDetail.formateTime(value);
		};
		function formatedeviceType(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDeviceDetail.deviceType);
		}
		function formateunit(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDeviceDetail.unit);
		}
		function formatecategorys(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDeviceDetail.categorys);
		}
		function formateisRandompart(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDeviceDetail.isRandompart);
		}
		function formatevalidateFlag(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDeviceDetail.validateFlag);
		}
		function formateserOwned(value) {
			return Platform6.fn.lookup.formatLookupType(value,
					hdkfSupportDeviceDetail.serOwned);
		}
		/**通用代码格式化
		function formatvalidFlag(value){
		return Platform6.fn.lookup.formatLookupType(value,hdkfSupportDeviceDetail.validFlag);
		};
		 **/
	</script>
</body>
</html>