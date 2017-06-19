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
<!-- ControllerPath = "hdkf/esnotice/hdkfesnoticeinfomaterial/HdkfEsNoticeinfoMaterialController/HdkfEsNoticeinfoMaterialInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js"
	type="text/javascript"></script>

<script
	src=" avicit/hdkf/esnotice/hdkfesnoticeinfomaterial/js/HdkfEsNoticeinfoMaterial.js"
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
	var hdkfEsNoticeinfoMaterial;
	var bulletinIdR, bulletinNoR;

	$(function() {
		bulletinIdR = "${bulletinId}";
		bulletinNoR = "${bulletinNo}";
		hdkfEsNoticeinfoMaterial = new HdkfEsNoticeinfoMaterial(
				'dgHdkfEsNoticeinfoMaterial', 'searchDialog', '${url}',
				'hdkfEsNoticeinfoMaterial');

		var array = [];

		///

		selfDefQury.init(array);
		selfDefQury.setQuery(function(param) {
			hdkfEsNoticeinfoMaterial.searchDataBySfn(param);
		});

	});
	function formateDate(value, row, index) {
		return hdkfEsNoticeinfoMaterial.formate(value);
	};
	function formateDateTime(value, row, index) {
		return hdkfEsNoticeinfoMaterial.formateDateTime(value);
	};
	function formateequippedByUser(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfoMaterial.equippedByUser);
	}
	function formatevalidFlag(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfoMaterial.validFlag);
	}
	//类型
	function formateCategory(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfoMaterial.sortKind);
	};

	//单位
	function formateUnit(value) {
		return Platform6.fn.lookup.formatLookupType(value,
				hdkfEsNoticeinfoMaterial.unitName);
	};
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
	/**通用代码格式化
	function formatvalidFlag(value){
	return Platform6.fn.lookup.formatLookupType(value,hdkfEsNoticeinfoMaterial.validFlag);
	};
	 **/
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;">
		<div id="toolbarHdkfEsNoticeinfoMaterial" class="datagrid-toolbar">
			<table>
				<tr style="height: 30px;">
					<th style="width: 250px; font-size: 14px;">技术通报所涉及的器材</th>
					<td width="50%"></td>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoMaterial_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="hdkfEsNoticeinfoMaterial.insert();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoMaterial_button_edit"
						permissionDes="保存">
						<td><a class="easyui-linkbutton" iconCls="icon-save"
							plain="true" onclick="hdkfEsNoticeinfoMaterial.save();"
							href="javascript:void(0);">保存</a></td>
					</sec:accesscontrollist>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoMaterial_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfEsNoticeinfoMaterial.del();"
							href="javascript:void(0);">删除</a></td>
					</sec:accesscontrollist>
					<%-- 					<sec:accesscontrollist hasPermission="3" --%>
					<%-- 						domainObject="formdialog_hdkfEsNoticeinfoMaterial_button_query" --%>
					<%-- 						permissionDes="查询"> --%>
					<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
					<!-- 							plain="true" onclick="hdkfEsNoticeinfoMaterial.openSearchForm();" -->
					<!-- 							href="javascript:void(0);">查询</a></td> -->
					<%-- 					</sec:accesscontrollist> --%>
					<%-- 					<sec:accesscontrollist hasPermission="3" --%>
					<%-- 						domainObject="formdialog_hdkfEsNoticeinfoMaterial_button_seniorquery" --%>
					<%-- 						permissionDes="高级查询"> --%>
					<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-search" -->
					<!-- 							plain="true" onclick="selfDefQury.show();" -->
					<!-- 							href="javascript:void(0);">高级查询</a></td> -->
					<%-- 					</sec:accesscontrollist> --%>

				</tr>
			</table>
		</div>
		<table id="dgHdkfEsNoticeinfoMaterial"
			data-options="
				fit: true,
				border: false,
				rownumbers: true,
				animate: true,
				collapsible: false,
				fitColumns: true,
				autoRowHeight: false,
				toolbar:'#toolbarHdkfEsNoticeinfoMaterial',
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
					<th data-options="field:'id', align:'center',checkbox:true"
						width="220">主键</th>

					<!-- 					<th data-options="field:'bulletinId', align:'center'" -->
					<!-- 						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}" -->
					<!-- 						width="220">技术通报详细表ID</th> -->
					<th data-options="field:'bulletinId', hidden: true" width="220">技术通报详细表ID</th>

					<!-- 					<th data-options="field:'bulletinNo', align:'center'" -->
					<!-- 						editor="{type:'validatebox',options:{validType:'maxLength[255]'}}" -->
					<!-- 						width="220">通告编号</th> -->
					<th data-options="field:'bulletinNo', hidden: true" width="220">通告编号</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'sparepartId', hidden: true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">备件信息表ID</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'pmodel',align: 'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">型号</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'sparepartName', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[255]'}}"
						width="220">备件名称</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>

					<th
						data-options="field:'sortKind', align:'center',formatter:formateCategory"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">类型</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'unitName', align: 'center',formatter:formateUnit"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">计量单位</th>


					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'qty', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[22]'}}"
						width="220">数量</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'seq', hidden: true"
						editor="{type:'validatebox',options:{validType:'maxLength[22]'}}"
						width="220">序号</th>



					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'pname', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">名称</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'unitPrice', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">单价</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'equippedByUser', align:'center',formatter:formateequippedByUser"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">用户自备</th>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'oldPmodel', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">旧产品型号</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'disposition', align:'center',formatter:showToolTip"
					editor="{type:'textarea',options:{rows:4,cols:2}}"
						width="220">处置说明</th>

					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'processRoute', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[255]'}}"
						width="220">工艺路线</th>




					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th
						data-options="field:'validFlag', align:'center',formatter:formatevalidFlag"
						editor="{type:'combobox',options:{panelHeight:'auto',editable:false,valueField:'lookupCode',textField:'lookupName'}}"
						width="220">有效性</th>
					<th data-options="field:'version',align:'center',hidden: true"
						" width="220">版本号</th>
					<th data-options="field:'remark', hidden: true"
						editor="{type:'textarea',options:{rows:4,cols:2}}"
						width="220">备注</th>

				</tr>
			</thead>
		</table>
	</div>

	

</body>
</html>