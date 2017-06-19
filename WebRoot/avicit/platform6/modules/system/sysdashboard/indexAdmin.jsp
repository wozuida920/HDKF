
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@page import="avicit.platform6.api.session.dto.SecurityUser"%>
<%@page import="avicit.platform6.api.session.dto.SecurityMenu"%>
<%@page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="avicit.platform6.core.spring.SpringFactory"%>
<%@page import="avicit.platform6.commons.utils.ViewUtil"%>
<%@page import="avicit.platform6.api.sysprofile.SysProfileAPI"%>
<%@page import="avicit.platform6.api.sysmenu.impl.SysMenuAPImpl"%>
<%@page import="avicit.platform6.api.session.SessionHelper"%>
<%@page import="avicit.platform6.api.sysshirolog.impl.AfterLoginSessionProcess"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="avicit.platform6.core.locale.PlatformLocalesJSTL"%>

<%
	SysMenuAPImpl sysMenuAPI = SpringFactory.getBean(SysMenuAPImpl.class);
	SysProfileAPI sysProfileAPI = SpringFactory.getBean("sysProfileAPI");
	SecurityUser user = SessionHelper.getSecurityUser(request);
	
	String appId =SessionHelper.getApplicationId();
	SecurityMenu menu = new SecurityMenu();
	menu.reflashMenu(appId);
    String indexElement = sysMenuAPI.getIndexElementVlign(SessionHelper.getCurrentLanguageCode(request), user, menu,appId);
	String sysPortletConfigId = request.getParameter("sysPortletConfigId");
	String messageURL = sysMenuAPI.getMessagerUrl();
	
	String messageCount = "";
 	String loginname =user.getUser().getName();
	String controlMessageDialog = sysProfileAPI.getProfileValueByCode("PLATFORM_V6_MESSAGE_DIALOG_SHOW"); //控制消息弹出窗口是否显示
	String quickSearch = sysMenuAPI.getQuickSearch(SessionHelper.getLocaleByUser(request));
	
	//首页皮肤设置
	String skinColor = (String)request.getSession().getAttribute(AfterLoginSessionProcess.SESSION_CURRENT_USER_SKIN);
	String skinSwitch = (String)request.getSession(false).getAttribute(AfterLoginSessionProcess.SESSION_CURRENT_SKIN_SWITCH);
	//是否显示
	String showArrowFlag = sysProfileAPI.getProfileValueByCode("PLATFORM_V6_DISPLAY_SEARCH");
	if(showArrowFlag == null || "".equals(showArrowFlag)){
		showArrowFlag = "true";
	}
	//版权信息
	int copyrightHeight = 30;
	String copyright = sysProfileAPI.getProfileValueByCode("PLATFORM_V6_COPYRIGHT");
	if(copyright == null || "".equals(copyright)){
		copyright = "";
		copyrightHeight = 0;
	}
%>
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="chrome=1">
<script type="text/javascript">
	var logoutTip = "<%=PlatformLocalesJSTL.getBundleValue("platform.dashboard.index.logout.tip")%>";
	var onFocusTip = "<%=PlatformLocalesJSTL.getBundleValue("platform.search.onFocus.tip")%>";
	var resetPorletTip = "<%=PlatformLocalesJSTL.getBundleValue("platform.portlet.reset.tip")%>";
	var homePage = "<%=PlatformLocalesJSTL.getBundleValue("portal.index.homePage")%>";
	var messageIntervalTime = "<%=sysProfileAPI.getProfileValueByCode("PLATFORM_V6_MESSAGE_REQUEST_INTERVAL")%>";
	if(typeof(messageIntervalTime)=='undefined' || messageIntervalTime == null || messageIntervalTime == "null"){
		messageIntervalTime = 10000;
	}
	//add by xingc
	var skinSwitch = "<%=skinSwitch %>";
	
</script>
<title><%=PlatformLocalesJSTL.getBundleValue("portal.index.homePage")%></title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<link href="static/css/platform/themes/<%=skinColor %>/index/style/easyui.css" rel="stylesheet" id="skins" type="text/css" />
<link href="static/css/platform/themes/<%=skinColor %>/index/style/platform_title.css" rel="stylesheet" type="text/css" />
<link href="static/css/platform/themes/<%=skinColor %>/sysmessage/style/messageDialogCss.css" rel="stylesheet" type="text/css" />
<link href="static/css/platform/public/skin/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/js/platform/component/jQuery/jQuery-1.8.2/jquery-1.8.2.js"></script>
<script type="text/javascript" src="static/js/platform/index/js/jQuery/jQuery-easydrag-1.5/jquery.hoverIntent.minified.js"></script>
<script type="text/javascript" src="static/js/platform/index/js/jQuery/jQuery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/js/platform/index/js/platform.jquery.dcmegamenu.1.3.3.js"></script>
<!-- add by xingc-->
<script type="text/javascript" src="static/js/platform/sysmessage/js/messageDialog.js"></script>
<script type="text/javascript" src="static/js/platform/search/js/quickSearch.js"></script>
<script type="text/javascript" src="static/js/platform/component/common/CommonDialog.js"></script>
<script type="text/javascript" src="static/js/platform/index/js/platform.dashboard.index.js"></script>
<script type="text/javascript" src="static/js/platform/index/js/platform.dashboard.index.classic.js"></script>


<script type="text/javascript">
var baseUrl = "<%=ViewUtil.getRequestPath(request)%>";
var messageCount = "<%=messageCount%>";
var doradoFlag = false;
var controlMessageDialog ="<%=controlMessageDialog%>";

function loadMessageData(){
	if(controlMessageDialog!="" && controlMessageDialog == "true"){
		loadMessage(baseUrl,messageIntervalTime,doradoFlag);
	}else{
		
	}
}
function openLayoutPage() {
	var dialogId = "layoutDialog";
	var usd = new CommonDialog(dialogId, "450", "450",
			baseUrl + 'avicit/platform6/modules/system/sysdashboard/indexPortletConfig.jsp?isgloable=true&sysPortletConfigId=<%=sysPortletConfigId%>&dialogId='+dialogId, "设置页面布局", false, true, false);
	usd.show();
}
function openPortletAdd() {
	var dialogId = "portletAddDialog";
	var usd = new CommonDialog(dialogId, "450", "450",
			baseUrl + 'avicit/platform6/modules/system/sysdashboard/indexPortletAdd.jsp?isgloable=true&dialogId='+dialogId, "添加首页应用", false, true, false);
	usd.show();
}
function savePortlet(){
	var portlet = "";
	var iframeBody = $("#iframeBody")[0].contentWindow;
	var portletRow = iframeBody.$("#portalContent .ui-portlet");
	var layout = iframeBody.$("#layout").val();
	$.each(portletRow,function(k,v){
		 var indexs = iframeBody.getPortletInfo(v.id);
         $.each(indexs, function(k1, v1) {
        	 portlet = portlet + v.id+";"+k1+";"+v1.x+":"+v1.y+"@";
         });
	});

	if(portlet!=null&&portlet!=""){
		portlet = portlet.substring(0,portlet.length-1);
		$.ajax({ 
			url: baseUrl+'platform/IndexPortalController/saveIndexPortlet.json',
			async : false,
			type: "POST",
			data : 'isgloable=true&sysPortletConfigId=<%=sysPortletConfigId%>&portlet=' + portlet+'&layout='+layout,
			success: function(){
				//获取当前操作的数据行记录
				$.messager.defaults = {ok:"确定"};
				$.messager.alert('提示','保存页面设置成功!','info',function(){
					hideDialog();
					window.location.reload();
					//refreshPortlet();	
				});
				//alert('保存页面设置成功!')
				
			},
			error : function(){
				//alert('portlet配置信息保存失败!');
			}
		});
	}else{
		$.messager.alert('提示','请至少添加一个首页模块','info',
			function(){
		window.location.reload();
		});
	}

}
</script>
</head>

<body class="easyui-layout"	onload="addTab('<%=PlatformLocalesJSTL.getBundleValue("portal.index.homePage")%>','avicit/platform6/modules/system/sysdashboard/indexPortlet.jsp?isgloable=true&sysPortletConfigId=<%=sysPortletConfigId%>','static/images/platform/index/images/icons.gif','homePage','-0px -20px');loadMessageData();mainOfQuickSearch();">
	<div region="center" style="overflow: hidden;">
		<div id="divBodyWidth" style="height: 58px; position: relative; z-index: 5;">
			<div id="header">
				<div class="logo">

				</div>
			</div>
		</div>
		<div class="index-menu" style="width: 100%; position:relative;z-index:4;left:0px;">
			<div class="menu-scroller-left" ></div>
			<div class="menu-scroller-right"></div>
			<div class="menu-header">
			</div>
		</div>
		<div id="divBody">
			<div id="tabs" class="easyui-tabs" style='overflow: hidden;position:absolute;padding-top:2px;'></div>
		</div>
	</div>

	<div id="menu" style="top:85px;">
	    <div id="tooltip_menu" >
	        <a href="javascript:void(0);" onclick="openPortletAdd();return false;" ><img src='static/images/platform/index/images/portlet_add.gif' border='0'>&nbsp;添加首页应用</a>
	        <a href="javascript:void(0);" onclick="openLayoutPage();return false;" ><img src='static/images/platform/index/images/portlet_undo.gif' border='0'>&nbsp;设置页面布局</a>
	        <a href="javascript:void(0);" onclick="savePortlet();return false;" ><img src='static/images/platform/index/images/portlet_all.gif' border='0'>&nbsp;保存页面设置</a>
	    </div>
    </div>
	<div id="dialog" class="web_dialog">
	  <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
	    <tr>
	      <td class="web_dialog_title"><span>Online Survey</span></td>
	      <td class="web_dialog_title align_right"><a href="#" id="btnClose">X</a></td>
	    </tr>
	    <tr>
	      <td colspan="2"><div id="context" style="width: 100%;"></div></td>
	    </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td align="right">
	      	<input type="button" id="save" value="<%=PlatformLocalesJSTL.getBundleValue("portal.conpnent.save")%>">
	      	<input type="button" id="cancel" onclick="hideDialog();return false;" value="<%=PlatformLocalesJSTL.getBundleValue("portal.conpnent.cancel")%>" >&nbsp;&nbsp;&nbsp;</td>
	    </tr>
	  </table>
	</div>
	<!-- 敏捷搜索提示框；默认隐藏，激发敏捷搜索后显示  -->
	<div id="agileSearchResult" class="agileSearchResults"></div>
</body>

</html>