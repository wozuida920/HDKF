<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="avicit.platform6.api.session.SessionHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="avicit.platform6.api.syslookup.SysLookupAPI"%>
<%@ page import="avicit.platform6.api.syslookup.impl.SysLookupAPImpl"%>
<%@ page import="avicit.platform6.api.syslookup.dto.SysLookupSimpleVo"%>
<%@ page import="avicit.platform6.core.spring.SpringFactory"%>
<%@ page import="avicit.platform6.core.properties.PlatformConstant"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="/WEB-INF/tags/shiro.tld"%>
<%
	SysLookupAPI upLoader = SpringFactory.getBean(SysLookupAPI.class);
	Object code = SessionHelper.getCurrentUserLanguageCode(request);
	String s;
	if(code ==null){
		s =PlatformConstant.D_LANGUAGE;
	}else{
		s =code.toString();
	}
	Collection<SysLookupSimpleVo> lookUpValidFlag = upLoader.getLookUpListByType("PLATFORM_VALID_FLAG",SessionHelper.getApplicationId(),s);//修改平台，转换为通用代码，是否有效
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组织管理</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/CommonDialog.js" type="text/javascript"></script>
<link href="static/css/platform/sysdept/icon.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
var path="<%=ViewUtil.getRequestPath(request)%>";
var currTreeNode;

$.extend($.fn.validatebox.defaults.rules,{
    //国内邮编验证
    zipcode: {
        validator: function (value) {
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: "请输入正确的邮编格式"
    },
  //电话验证
    tel: {
        validator: function (value) {
        	var mobilereg = /^((13[0-9])|(15[^4,\D])|(18[0,5-9])|145|147)\d{8}$/;
            var phonereg = /^((0[0-9]{2,3})-)([0-9]{7,8})(-([0-9]{3,}))?$/;
            return mobilereg.test(value) || phonereg.test(value);
        },
        message: "请输入有效的电话号码"
    },
    fax :{
    	validator: function (value) {
        	var reg = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
            return reg.test(value);
        },
        message: "请输入有效的传真号码"
    }
});

$(document).ready(function(){ 
	addOrg();
});

function setFormReadOnly(isReadOnly){
	if(!isReadOnly){
		$("form input").attr("disabled",false);
		$('form textarea').attr("disabled",false);
	}else{
		$("form input").attr("disabled",true);
		$('form textarea').attr("disabled",true);
	}
}

function loadDeptInfo(deptId){
	$.ajax({
        cache:false,
        type: "POST",
        url:'platform/sysdept/sysDeptController/getDeptById.json?id='+deptId,
        dataType:"json",
        data:{id:deptId},
        error: function(request) {
        	$.messager.alert('提示','操作失败，服务请求状态：'+request.status+' '+request.statusText+' 请检查服务是否可用！','warning');
        },
        success: function(data) {
			if(data.result==0&&data.sysDept){
				var sysDept=data.sysDept;
				addDept(sysDept);
			}else{
				$.messager.alert('提示',data.msg,'warning');
			}
        }
    }); 
}

function clearOrgForm(){
	$('#orgAddForm').form('load',{
		ID:'',
		PARENT_ORG_ID:'',
		ORG_CODE:'',
		ORG_NAME:'',
		POST:'',
		TEL:'',
		FAX:'',
		EMAIL:'',
		WORK_CALENDAR_ID:'',
		ORDER_BY:'',
		ORG_PLACE:'',
		RESPONSIBLE_DEPT_ID:'',
		RESPONSIBLE_DEPT_NAME:'',
		VALID_FLAG:'',
		ORG_DESC:''
	});
}

function addOrg(){
	var selectNode = parent.currTreeNode;
	if(!selectNode){
		$.messager.alert('提示',"请选择组织！",'warning');
		return;
	}
	clearOrgForm();
		
	var parentOrgId;
	parentOrgId=selectNode.id;
	
	if(parentOrgId=='root'){
		parentOrgId='-1';
	}
	
	$('#orgAddForm').form('load',{
		PARENT_ORG_ID:parentOrgId,
		
		VALID_FLAG:'1',
		ORDER_BY: '0'
	});
	
	setFormReadOnly(false);
	
	$("#ORG_CODE:focus");
	
	
}

</script>
</head>
<body>

<div region="center" border="false" style="overflow: hidden;">
  
			<form id="orgAddForm" name="orgEditForm" method="post">
				
				<input type="hidden"  name="ID" id="ID"></input>
				<input type="hidden"  name="PARENT_ORG_ID" id="PARENT_ORG_ID"></input>
				<input type="hidden"  name="RESPONSIBLE_DEPT_ID" id="RESPONSIBLE_DEPT_ID" >
				
				<table class="form_commonTable">
					<tr>
	                    <th width="10%"><span class="remind">*</span>组织编码:</th>
	                    <td width="40%" >
	                        <input title="组织代码" class="easyui-validatebox" data-options="required:true,validType:'length[0,100]'"  type="text" name="ORG_CODE" id="ORG_CODE"/>
	                    </td>
	                    <th width="10%"><span class="remind">*</span>组织名称:</th>
	                    <td>
	                        <input title="组织名称" class="easyui-validatebox" data-options="required:true,validType:'maxLength[50]'"  type="text" name="ORG_NAME" id="ORG_NAME"/>
	                    </td>
	                </tr>
	                <tr>
	                    <th width="10%">排序编号:</th>
	                    <td>
	                        <input title="排序编号" class="easyui-numberbox" data-options="max:9999999999" type="text" name="ORDER_BY" id="ORDER_BY"/>
	                    </td>
	                    <th width="10%">邮编:</th>
	                    <td>
	                        <input title="邮编" class="easyui-validatebox" data-options="validType:'zipcode'" type="text" name="POST" id="POST"/>
	                    </td>
	                </tr>
					<tr>
	                    <th width="10%">电话:</th>
	                    <td>
	                        <input title="电话" class="easyui-validatebox" data-options="validType:'tel'" type="text" name="TEL" id="TEL"/>
	                    </td>
	                    <th width="10%">传真:</th>
	                    <td>
	                        <input title="传真" class="easyui-validatebox" data-options="validType:'fax'" type="text" name="FAX" id="FAX"/>
	                    </td>
	                </tr>
	                <tr>
	                    <th width="10%">邮箱:</th>
	                    <td width="40%">
	                        <input title="邮箱" class="easyui-validatebox" data-options="validType:'email'" type="text" name="EMAIL" id="EMAIL"/>
	                    </td>
	                    <th width="10%">办公地点:</th>
	                    <td>
	                        <input title="办公地点" class="easyui-validatebox" data-options="validType:length[0,100]" type="text" name="ORG_PLACE" id="ORG_PLACE"/>
	                    </td>
	                </tr>
	                <tr>
	                    <th width="10%">工作日历:</th>
	                    <td width="40%">
	                        <input title="工作日历" class="easyui-datebox" type="text" name="WORK_CALENDAR_ID" id="WORK_CALENDAR_ID"/>
	                    </td>
	                    <th width="10%">是否有效:</th>
	                    <td>
	                        <c:forEach items="<%=lookUpValidFlag%>" var="data">
								<input type="radio" name="VALID_FLAG"  id="VALID_FLAG" value="${data.lookupCode}" style="width: 20px"/>${data.lookupName}
							</c:forEach>
	                    </td>
	                </tr>
	                <tr>
	                	<th valign="top">描述:</th>
						<td colspan="3"style="_padding-left:16px;">
							<textarea class="textareabox" style="height:50px;width:391px;_width:397px;" rows="4"
								id="ORG_DESC" name="ORG_DESC"></textarea>
						</td>
					</tr>
				</table>
			</form> 
</div>
</body>
</html>