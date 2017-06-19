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
<!-- ControllerPath = "csmp/basicData/csmpbdaricarftmodel/CsmpBdAricarftmodelController/operation/Add/null" -->
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
		<form id='form' >
			<input type="hidden" name="id" />
			<table class="form_commonTable" >
				<tr>



					<th width="15%"><span class="remind">*</span> 机型编号:</th>
					<td width="35%"><input title="机型编号" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'"
						style="width: 180px;" type="text" name="modelNum" id="modelNum" />
					</td>

					<th width="15%"><span class="remind">*</span> 机型名称:</th>
					<td width="35%"><input title="机型名称" class="easyui-validatebox"
						data-options="required:true,validType:'maxLength[200]'"
						style="width: 180px;" type="text" name="modelName" id="modelName" />
					</td>
				</tr>
				<tr>

					<th width="15%"><span class="remind">*</span> 类型:</th>
					<td width="35%"><pt6:syslookup name="modelType"
							lookupCode="CSMP_BD_AIRCRAFT_TYPE" 
							  dataOptions="width:180,editable:false,panelHeight:'auto',onShowPanel:comboboxOnShowPanel">
						</pt6:syslookup></td>

					<th width="15%">有效标识:</th>
					<td width="35%">
					<input type="radio" 
						name="validFlag" data-options="validType:'maxLength[1]'"
						id="validFlag" value="1"  checked="checked">有效</input> 
						<input type="radio"  name="validFlag" 
						data-options="validType:'maxLength[1]'" id="validFlag" value="0">无效</input>
					</td>
					<!-- <input title="有效标识"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1]'" style="width: 180px;"
						type="text" name="validFlag" id="validFlag" /> -->
						
						
						
						</td>
				</tr>
				<tr>

					<th width="15%">描述:</th>
					<td width="35%" colspan="3">
					<!-- <input title="描述"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="describe" id="describe" /> -->
                      <textarea title="描述" class="textareabox" name="describe" id="describe" rows="5"
                      data-options="validType:'maxLength[1000]',tipPosition:'bottom'"></textarea>						
						</td>

					<!-- <th width="10%">备注:</th>
					<td width="40%"><input title="备注"
						class="inputbox easyui-validatebox"
						data-options="validType:'maxLength[1024]'" style="width: 180px;"
						type="text" name="remark" id="remark" /></td> -->
				</tr>
				<tr>
				</tr>
			</table>
		</form>
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
		parent.csmpBdAricarftmodel.closeDialog("#insert");
	}
// 	function validataDate(){
// 		checkDateTime
// 	}
	
	function saveForm(){
		var textareaLength = $("#describe").val().length;
		if(textareaLength>1000){
			$.messager.alert('警告','你输入的描述信息超过了1000字符');  
			return;
		}
	    if ($('#form').form('validate') == false) {
            return;
        }
		parent.csmpBdAricarftmodel.save(serializeObject($('#form')),"#insert");
	}
	</script>
</body>
</html>