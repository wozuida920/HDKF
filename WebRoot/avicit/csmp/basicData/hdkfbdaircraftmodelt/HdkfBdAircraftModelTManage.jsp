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
<!-- ControllerPath = "csmp/basicData/hdkfbdaircraftmodelt/HdkfBdAircraftModelTController/HdkfBdAircraftModelTInfo" -->
<title>tree</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
</head>

<body class="easyui-layout" fit="true">
	<div data-options="region:'west',split:true,title:''"
		style="width: 150px; padding: 0px;">
		<div id="toolbar" class="datagrid-toolbar">
			<table width="100%">
				<tr>
					<td width="100%"><input type="text" name="searchWord"
						id="searchWord"></input></td>
				</tr>
			</table>
		</div>
		<ul id="tree">正在加载数据...
		</ul>
	</div>
	<div data-options="region:'center',split:true,title:'涉及到此批架次的技术通报列表'"
		style="padding: 0px; overflow: auto;">
<!-- 		<div id="toolbarImportResult" class='datagrid-toolbar'> -->
<!-- 			<table> -->
<!-- 				<tr> -->

<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfBdAircraftModelT_insert_" --%>
<%-- 						permissionDes="添加平级节点"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-add" -->
<!-- 							plain="true" onclick="hdkfBdAircraftModelT.insert();" -->
<!-- 							href="javascript:void(0);">添加平级节点</a></td> -->
<%-- 					</sec:accesscontrollist> --%>

<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfBdAircraftModelT_insertsub_" --%>
<%-- 						permissionDes="添加子节点"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-add_other" -->
<!-- 							plain="true" onclick="hdkfBdAircraftModelT.insertsub();" -->
<!-- 							href="javascript:void(0);">添加子节点</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfBdAircraftModelT_modify_" --%>
<%-- 						permissionDes="编辑"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-edit" -->
<!-- 							plain="true" onclick="hdkfBdAircraftModelT.modify();" -->
<!-- 							href="javascript:void(0);">编辑</a></td> -->
<%-- 					</sec:accesscontrollist> --%>
<%-- 					<sec:accesscontrollist hasPermission="3" --%>
<%-- 						domainObject="formdialog_hdkfBdAircraftModelT_del_" --%>
<%-- 						permissionDes="删除"> --%>
<!-- 						<td><a class="easyui-linkbutton" iconCls="icon-remove" -->
<!-- 							plain="true" onclick="hdkfBdAircraftModelT.del();" -->
<!-- 							href="javascript:void(0);">删除</a></td> -->
<%-- 					</sec:accesscontrollist> --%>



<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<iframe id="iframeId" width="100%" height="400" frameborder="0" style="display:none;">
 </iframe>
	</div>
	<script
		src=" avicit/csmp/basicData/hdkfbdaircraftmodelt/js/HdkfBdAircraftModelT.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		var hdkfBdAircraftModelT;
		$(function() {
			hdkfBdAircraftModelT = new HdkfBdAircraftModelT('tree', '${url}',
					'searchWord');
			hdkfBdAircraftModelT.setOnLoadSuccess(function() {
				//alert("树加载成功事件");
			});
			hdkfBdAircraftModelT.setOnSelect(function(_tree, node) {
			if(node._parentId!="-1"&&node._parentId!="1"){
		
             //   alert(node.attributes.attribute01);
				var batchNo = node.text;
				//hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController
				var url = "hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoController/HdkfEsNoticeinfoInfoImplement1?batchNo="+batchNo;
				$("#iframeId").css('display','block');
				$("#iframeId").attr("src",url); 
			}
			});
			hdkfBdAircraftModelT.init();
		});
	</script>
</body>
</html>