<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String entryId = request.getParameter("entryId");
	String executionId = request.getParameter("executionId");
	String taskId = request.getParameter("taskId");
	String formId = request.getParameter("id");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ControllerPath = "hdkf/support/hdkfsupportresponseinfo/HdkfSupportResponseInfoController/operation/Detail/id" -->
<title>图形化显示</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/BpmJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<style type="text/css">
#brandDiv{width:1265px;height:358px;}
#brandDiv img{width:100%;height:100%;}
</style>
</head>
<script type="text/javascript">

	var formId = "<%=formId%>";
	//alert("formId-->"+formId);
	

	


	//返回
	function doBack() {
		if (parent != null && parent.$('#tabs') != null) {
			var currTab = parent.$('#tabs').tabs('getSelected');
			var currTitle = currTab.panel('options').title;
			parent.$('#tabs').tabs('close', currTitle);
		}
	}
	//页面加载完成后入口
	$(function() {
          
		var curStatus = formId;
		//alert(curStatus);
		var widthV,heightV,leftV,topV;
		widthV ='63px';
		heightV = '55px';
		//curStatus="54";
        if(curStatus=="2"){
			
			leftV='110px';
			topV ='112px';
			
			
		}
        else if(curStatus=="3"){
			
			leftV='210px';
			topV ='112px';
			
			
		}
       else if(curStatus=="4"){
			
			leftV='467px';
			topV ='46px';
			
			
		}
       else if(curStatus=="7"){
			
			leftV='632px';
			topV ='46px';
			
			
		}
       else if(curStatus=="1"){
			
			leftV='859px';
			topV ='47px';
			
			
		}
       else if(curStatus=="6"){
			
			leftV='1107px';
			topV ='46px';
			
			
		}
       else if(curStatus=="55"){
			
			leftV='1107px';
			topV ='262px';
			
			
		}
       else if(curStatus=="5"){
			
			leftV='464px';
			topV ='269px';
			
			
		}
       else if(curStatus=="51"){
			
			leftV='595px';
			topV ='269px';
			
			
		}
       else if(curStatus=="52"){
			
			leftV='731px';
			topV ='181px';
			
			
		}
       else if(curStatus=="53"){
			
			leftV='866px';
			topV ='270px';
			
			
		}
       else if(curStatus=="54"){
			
			leftV='985px';
			topV ='170px';
			
			
		}
      
		
		//alert("here1");
		$("#layer1").css("width",widthV);
		$("#layer1").css("height",heightV);
		$("#layer1").css("left",leftV);
		$("#layer1").css("top",topV);
		$("#layer1").css("display","block");
		//alert("here2");
		
	});
</script>
<body class="easyui-layout" fit="true">
	<div region='center' border="false" style="overflow: true;">

		
		<div    style="margin: 10px 5px 20px 10px">
	     <div id="brandDiv"> <img src="avicit/hdkf/support/images/support_process.png"/> 
	     <div id="layer1" style="display:none;  float:left;border:solid 1px red;  
	     position:absolute; width:160.627451px; height:124.784314px;left:13.803922px;top:26.117647px;"></div>
	     </div>
		</div>

	</div>
</body>
</html>