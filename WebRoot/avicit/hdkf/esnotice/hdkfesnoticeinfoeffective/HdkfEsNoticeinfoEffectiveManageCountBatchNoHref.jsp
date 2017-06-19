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
<!-- ControllerPath = "csmp/technicalBulletin/csmpesnoticeinfoeffective/CsmpEsNoticeinfoEffectiveController/CsmpEsNoticeinfoEffectiveInfo" -->
<title></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
<script src="static/js/platform/component/sfn/SelfDefiningQuery.js" type="text/javascript"></script>
<script src="avicit/csmp/common/js/ValidtionContent.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center'"
		style="background: #ffffff; height: 0px; padding: 0px; overflow: hidden;">
		<div id="toolbarCsmpEsNoticeinfoEffective" class="datagrid-toolbar">
			 <center>
				<form id="csmpBdAircraftinfo">
					<table class="form_commonTable">
						
					</table>
				</form>
			</center>
		</div>
		<table id="dgCsmpEsNoticeinfoEffective"
								data-options="
									fit: true,
									border: false,
									rownumbers: true,
									animate: true,
									collapsible: false,
									fitColumns: true,
									autoRowHeight: false,
									toolbar:'#toolbarCsmpEsNoticeinfoEffective',
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
										<!-- <th data-options="field:'id', align:'center',checkbox:true" width="220">主键</th> -->
										<th data-options="field:'customerName',align:'center', halign:'center'" width="220">客户名称</th>
										<th data-options="field:'modelName',align:'center', halign:'center'" width="220">机型</th>
										<th data-options="field:'batchNo',align:'center', halign:'center'" width="220">批架次</th>
									</tr>
								</thead>
		</table>
			
	</div>
	 
<!-- 	 <div data-options="region:'south',border:false" style="height: 40px;margin-right: 30px;" >		 -->
<!-- 		<div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera"> -->
<!-- 			<table class="tableForm" border="0" cellspacing="1" width='100%'> -->
<!-- 				<tr>	 -->
<!-- 					<td width="50%" align="right"> -->
<!-- 						<a title="返回" id="returnButton" class="easyui-linkbutton" onclick="closeForm();" href="javascript:void(0);">返回</a> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
			
		
	<script src="avicit/hdkf/esnotice/hdkfesnoticeinfoeffective/js/CsmpEsNoticeinfoEffective.js" type="text/javascript"></script>
	<script type="text/javascript">
		var csmpEsNoticeinfoEffective;
		var paramId = '${paramId}';
		var type = '${type}';
		$(function() {
			csmpEsNoticeinfoEffective = new CsmpEsNoticeinfoEffective(
					'dgCsmpEsNoticeinfoEffective', '${Infourl}', 'searchDialog',
					'csmpEsNoticeinfoEffective',paramId,type);
			
		});
		function formateDate(value, row, index) {
			return csmpEsNoticeinfoEffective.formate(value);
		}
		function formateDateTime(value, row, index) {
			return csmpEsNoticeinfoEffective.formateTime(value);
		}
		
		function closeForm(){
			parent.csmpEsNoticeinfoEffective.closeDialog("#countBatchNo");
		}
	</script>
</body>
</html>