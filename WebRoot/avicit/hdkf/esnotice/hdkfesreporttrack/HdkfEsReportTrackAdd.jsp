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
<!-- ControllerPath = "hdkf/esnotice/hdkfesreporttrack/HdkfEsReportTrackController/operation/Add/null" -->
<title>添加</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include
	page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include
	page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
<script src="static/js/platform/component/common/exteasyui.js"
	type="text/javascript"></script>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" />
			<table class="form_commonTable">
				<tr>



					<!--  <th width="15%"><span class="remind">*</span> 技术通报编号:</th> -->
					
					<th width="15%">通告编号:</th>
					<td width="35%"><input title="通告编号"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[255]'" style="width: 180px;" readonly="readonly"
						type="text" name="bulletinNo" id="bulletinNo" value="${bulletinNo}" />
						<input title="技术通报编号"
						class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[50]'"
						style="width: 180px;" type="hidden" name="techinalBulletinId"
						id="techinalBulletinId" value="${bulletinId}" />
						</td>
											<th width="15%"><span class="remind">*</span>当前处理人:</th>
					<td width="35%"><input title="当前处理人"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[50]'" style="width: 180px;" readonly="readonly"
						type="text" name="people" id="people" value="${people}"/>
					</td>
				</tr>
				<tr>

					<th width="15%">日期:</th>
					<td width="35%"><input title="日期" class="easyui-datebox"
						editable="false" style="width: 182px;" readonly="readonly"
						type="text" name="trackDate" id="trackDate" value="${trackDate}"/></td>
						
				</tr>
				<tr>

					<th width="15%">跟踪情况:</th>
					<td width="35%" colspan="4"><textarea title="跟踪情况"
						class="textareabox" data-options="validType:'maxLength[1024]'" style="width:35%;height:60px;resize:none"
						rows="3" type="text" name="remark" id="remark"></textarea></td>
				</tr>
			</table>
		</form>

	</div>
	<div data-options="region:'south',border:false" style="height: 40px;">
		<div id="toolbar"
			class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>
					<td width="50%" align="right"><a title="保存" id="saveButton"
						class="easyui-linkbutton primary-btn" onclick="saveForm();"
						href="javascript:void(0);">保存</a> <a title="返回" id="returnButton"
						class="easyui-linkbutton" onclick="closeForm();"
						href="javascript:void(0);">返回</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
        $.extend($.fn.validatebox.defaults.rules, {    
        maxLength: {    
            validator: function(value, param){    
                return param[0] >= value.length;
                
            },    
            message: '请输入最多 {0} 字符.'   
        }    
    });  
	$(function(){
																																																																																																																																																																																																										/* var userCommonSelector = new CommonSelector("user","userSelectCommonDialog","userName","userNameName");
		userCommonSelector.init();  */
		//选择部门
		/* var deptCommonSelector = new CommonSelector("dept","deptSelectCommonDialog","userName","userNameName");
	    deptCommonSelector.init();  */
	    //选择角色
	    /* var roleCommonSelector = new CommonSelector("role","roleSelectCommonDialog","userName","userNameName",null,null,null);
	    roleCommonSelector.init();  */ 
	   /*  //选择群组
	    var groupCommonSelector = new CommonSelector("group","groupSelectCommonDialog","userName","userNameName",null,null,null);
	    groupCommonSelector.init(); 
	    //选择岗位
	    var positionCommonSelector = new CommonSelector("position","positionSelectCommonDialog","userName","userNameName");
	    positionCommonSelector.init();  */
	});
	function closeForm(){
		parent.hdkfEsReportTrack.closeDialog("#insert");
	}
	function saveForm(){
	    if ($('#form').form('validate') == false) {
            return;
        }
	   $('#saveButton').linkbutton('disable').unbind("click");
		parent.hdkfEsReportTrack.save(serializeObject($('#form')),"#insert");
	}
	</script>
</body>
</html>