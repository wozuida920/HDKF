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
	src=" avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/js/HdkfEsNoticeinfoEffective1.js"
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
	var hdkfEsNoticeinfoEffective;
	var  bulletinNoR,bulletinIdR;

	$(function() {
		bulletinNoR = "${bulletinNo}";
		//alert("bulletinNoR-->"+bulletinNoR);
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
	//添加飞机架次信息选择框
	function insertShow() {
		var path = "csmp/basicData/csmpbdaircraftinfo/CsmpBdAircraftinfoControllerSelect/CsmpBdAircraftinfoInfoSelect";
		var comm = new CommonDialog("AircraftSelect", "700", "420", path,
				"选择批架次信息", false, true, false);
		comm.show();
	};
	//机型架次回调方法
	function selectAircraftRow(rows) {
		var currentRows = $(hdkfEsNoticeinfoEffective._datagridId).datagrid('getData');
		var size = rows.length;
		var arr = currentRows.rows;	
		var currentRowsSize = currentRows.rows.length;
		for(var i = 0;i<currentRowsSize;i++){				
			for(var j = 0;j<size;j++){
				if(rows[j].id == currentRows.rows[i].aircraftinfoId){
					rows.splice(j,1);
					size--;
					break;
				}
			}
		}
		//alert("size-->"+size);
	     if(size==0){
	    	 
			$.messager.show({
				 title : '提示',
				 msg : '所选择的数据已经存在！'
			 });
			return;
		  } 
	     else{
			for (; size--;) {
				rows[size].batchNo = rows[size].batchNo;
				rows[size].aircraftinfoId = rows[size].id;
				rows[size].bulletinId = bulletinIdR;
				rows[size].bulletinNo = bulletinNoR;
				         //bulletinNo
			    rows[size].customerName = rows[size].custumerName;
				rows[size].modelName = rows[size].modelIdAlias;
				rows[size].customerId = rows[size].companyId;
				delete rows[size].modelIdAlias;
				delete rows[size].id;
				delete rows[size].companyId;
				arr.push(rows[size]);
			};
		
		$(hdkfEsNoticeinfoEffective._datagridId).datagrid('loadData',currentRows);
		hdkfEsNoticeinfoEffective.save(currentRows.rows);
	     }
	};
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
</script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0;">
		<div id="toolbarHdkfEsNoticeinfoEffective" class="datagrid-toolbar">
			<table>
				<tr style="height: 30px;">
                 <th style="width: 250px; font-size: 14px;">技术通报涉及批架次</th>
                 <td width="50%"></td>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_add"
						permissionDes="添加">
						<td><a class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="insertShow();"
							href="javascript:void(0);">添加</a></td>
					</sec:accesscontrollist>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_edit" --%>
<%-- 						permissionDes="保存"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-save" -->
<!-- 							plain="true" onclick="hdkfEsNoticeinfoEffective.save();" -->
<!-- 							href="javascript:void(0);">保存</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
					<sec:accesscontrollist hasPermission="3"
						domainObject="formdialog_hdkfEsNoticeinfoEffective_button_delete"
						permissionDes="删除">
						<td><a class="easyui-linkbutton" iconCls="icon-remove"
							plain="true" onclick="hdkfEsNoticeinfoEffective.del();"
							href="javascript:void(0);">删除</a></td>
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
				
					<th data-options="field:'id', align:'center',checkbox:true"
						width="220">主键</th>
						
						<th data-options="field:'bulletinNo', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[255]'}}"
						width="220">通告编号</th>
						
					
					<th data-options="field:'aircraftinfoId', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">飞机信息表ID</th>

					
					<th data-options="field:'batchNo', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[100]'}}"
						width="220">批架次</th>

				
					<th data-options="field:'modelName', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[100]'}}"
						width="220">机型</th>

					
					<th data-options="field:'bulletinId', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">技术通报详细表ID</th>

					
					
				
					<th data-options="field:'customerId', hidden:true"
						editor="{type:'validatebox',options:{validType:'maxLength[50]'}}"
						width="220">客户ID</th>

				
					<th data-options="field:'customerName', align:'center'"
						editor="{type:'validatebox',options:{validType:'maxLength[255]'}}"
						width="220">客户名称</th>

					
				</tr>
			</thead>
		</table>
	</div>


</body>
</html>