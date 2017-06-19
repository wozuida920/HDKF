<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="pt6" uri="/WEB-INF/tags/platform6.tld"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>edittree</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<jsp:include page="/avicit/platform6/modules/system/commonpopup/commonSelectionHead.jsp"></jsp:include>
</head>
<body class="easyui-layout" fit="true">
	<div data-options="region:'center',split:true,border:false">
		<form id='form'>
			<input type="hidden" name="id" />
				<table class="form_commonTable">
					<tr>
																							
																																														
															<th width="10%">
																								机型批架次:</th>
								 <td width="40%">
								                                                                            <input title="机型批架次" class="easyui-validatebox" data-options="validType:'maxLength[300]'" style="width: 180px;" type="text" name="aircraftName" id="aircraftName"/>
                                                                    								</td>								
																																																																																																																																																																																																																																		</tr>
				</table>
		</form>
	 <div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend foot-formopera">
			<table class="tableForm" border="0" cellspacing="1" width='100%'>
				<tr>	
					<td width="60%" align="right"><a title="保存" id="saveButton"  class="easyui-linkbutton primary-btn" plain="false" onclick="saveForm();" href="javascript:void(0);">保存</a>
					<a title="返回" id="returnButton"  class="easyui-linkbutton" plain="false" onclick="closeForm();" href="javascript:void(0);">返回</a>
					</td>
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
			parent.hdkfBdAircraftModelT.closeDialog("#insert");
		}
		function saveForm(){
    		 if ($('#form').form('validate') == false) {
                return;
            }
			parent.hdkfBdAircraftModelT.save(serializeObject($('#form')),'${url}','#insert','${id}');
		}
	</script>
</body>
</html>