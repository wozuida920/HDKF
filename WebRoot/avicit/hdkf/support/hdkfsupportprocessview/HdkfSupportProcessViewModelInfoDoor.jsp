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
<!-- ControllerPath = "hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/HdkfSupportProcessViewInfo" -->
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
</head>
<body>
<!-- style="text-align: center" width="220" -->
<table id="dgHdkfmodelinfo" width="97%" border="0" cellpadding="10"  
        style="border-collapse: collapse; " bordercolor="#000000" class="datagrid-toolbar">
<!--  <tr height="30px">
     <td data-options=" halign:'center'" width="220" >机型</td>
     
     <td data-options=" halign:'center'" width="220">归档</td>
     
     <td data-options=" halign:'center'" width="220">处理中</td>
     
     <td data-options=" halign:'center'" width="220">信息登记分发</td>
 </tr> -->
 
 


</table>
<script
		src=" avicit/hdkf/support/hdkfsupportprocessview/js/HdkfSupportProcessView.js"
		type="text/javascript"></script>
<script type="text/javascript">

$(function() {
	$
	.ajax({
		url : '${url}'+'getModelInfoQueryForm',
		type : 'post',
		dataType : 'json',
		success : function(result) {
			if (result.flag == "success") {		
				if(result.datasall[0].curDoneall==null){
					result.datasall[0].curDoneall=0;
				}
				if(result.datasall[0].curDealingall==null){
					result.datasall[0].curDealingall=0;
				}
				if(result.datasall[0].curunDoneall==null){
					result.datasall[0].curunDoneall=0;
				}
				var curdone = "归档总计："+result.datasall[0].curDoneall;
				var curdealing= "处理中总计："+result.datasall[0].curDealingall;
				var curundone="登记分发总计："+result.datasall[0].curunDoneall;
				/* <a href="/hello/confirm.jsp?name=asd&password=123456 " /> */
						
						//window.open("avicit/hdkf/support/hdkfsupportprocessview/HdkfModelinfodoneViewManage.jsp");
				var _tr = $("<tr><td>"+"客户"+
						"</a></td><td><a href='javascript:void(0);' onclick='curdoneall(2);'>"+curundone+					
				"</a></td><td><a href='javascript:void(0);' onclick='curdoneall(0);'>"+curdealing+  
				"</td><td><a href='javascript:void(0);' onclick='curdoneall(1);'>"+curdone+"</a></td></tr>");
				
				
/* 				
				 var _tr = $("<tr><td>"+"机型"+"</td><td>"+"归档总计："+  
               		  result.datasall[0].curDoneall+"</td><td>"+"处理中总计："+result.datasall[0].curDealingall+  
                           "</td><td>"+"登记分发总计："+result.datasall[0].curunDoneall+"</td></tr>");
				  */
				 
                 $("#dgHdkfmodelinfo").append(_tr);
                 
					   for(var len=0;len<result.datas.length;len++){
						   
						   var rUnit=result.datas[len].requestUnit;
		                      var _tr = $("<tr><td>"+result.datas[len].requestUnit+
		                    		  "</td><td><a href='javascript:void(0);' onclick='curdo(\""+rUnit+"\",2);'>"
		                                +result.datas[len].curunDonecount+
		                    		  
		                    		 
		                    		  "</a></td><td><a href='javascript:void(0);' onclick='curdo(\""+rUnit+"\",0)'>"
		                    		  +result.datas[len].curDealingcount+  
		                    		  "</a></td><td><a href='javascript:void(0);' onclick='curdo(\""+rUnit+"\",1);'>"
		                    		  +result.datas[len].curDonecount+
		                                "</a></td></tr>");  
		                      
		                      $("#dgHdkfmodelinfo").append(_tr);
					   }
					   
					   

				//console.log(result.datas.length);
				////alert(result.datas.length);
				//$("#form").form('load', result.datas);
			} else {
				$.messager.show({
					title : '提示',
					msg : "数据加载失败。"
				});
			}
		}
	});
	
	
		//ajaxRequest("POST", null, "${url}getModelInfoQueryForm", "json", "getModelinfoQueryFormBack");
}); 
/* var test=new Array();
//机型信息
function getModelinfoQueryFormBack(json) {	
//	console.log(json);
	for ( var i = 0; i < json.length; i++) {         
		test[i]=json[i];
		//alert(test[i].requestUnit);
	}
} */



function curdoneall(curStatuS){
	//统计
	var curstatus=curStatuS;
	var value = "归档总计详情";
	var path ="platform/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/HdkfModelInfodoneallForm?curstatus="+curstatus;	
	top.addTab(value, path);
	
}

function curdo(requestunit,curstatus){
	//统计
	
	var value = "归档总计详情";
	var path ="platform/hdkf/support/hdkfsupportprocessview/HdkfSupportProcessViewController/HdkfModelInfodoneallForm?requestunit="+requestunit+"&curstatus="+curstatus;	
	top.addTab(value, path);
	
	//window.open(path);
	
}
</script>
</body>

</html>