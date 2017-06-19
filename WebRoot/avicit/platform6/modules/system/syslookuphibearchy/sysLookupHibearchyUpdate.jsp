<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑多维通用代码</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/component/common/EasyUIJsInclude.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	getHibearchy('${param.id}');
});

window.onresize = comboboxHidePanel;

/**
 * 装载标准的值
 */
function getHibearchy(id){
	$.ajax({
		url : 'platform/sysLookupHibearchy/getHibearchy',
		data : {id :id},
		type : 'post',
		dataType : 'json',
		async: false,
		success : function(result) {
			if(result && result.bean){
				$("#formHibearchy").form('load', result.bean);
			}
		}
	});
}
</script>
</head>
<body class="easyui-layout">
<div region="center" border="false" style="padding: 0 15px 0 0">
   <form id="formHibearchy" fit="true">
   		<input id="id" name="id" type="hidden" value="${param.id}"/>
		<input id="version" name="version" type="hidden" value=""/>
		<table class="form_commonTable">
			<tr>
				<th width="18%"><span class="remind">*</span>系统代码类型</th>
                <td class="<c:if test="${param.lookupTypeReadOnly == 'true'}">input-readonly</c:if>">
                    <input id="lookupType" name="lookupType" title="系统代码类型" class="easyui-validatebox" required="true" type="text" 
						data-options="validType:'length[0,50]'" <c:if test="${param.lookupTypeReadOnly == 'true'}">readonly="readonly"</c:if>/>
                </td>
            </tr>
            <tr>
                <th><span class="remind">*</span>系统级别</th>
                <td>
                	<input id="systemFlag" name="systemFlag" title="系统级别" class="easyui-combobox" required="true" 
					     data-options="editable:false,panelHeight:'auto',valueField:'code',textField:'name',onShowPanel:comboboxOnShowPanel,
							  url:'platform/sysLookupHibearchy/getLookUpJsonData.json?lookUpCode=PLATFORM_SYS_USER_FLAG'" />
                </td>
             </tr>
             <tr>
                 <th><span class="remind">*</span>有效标识</th>
                 <td>
                     <input id="validFlag" name="validFlag" title="有效标识" class="easyui-combobox" required="true"
					   data-options="editable:false,panelHeight:'auto',valueField:'code',textField:'name',onShowPanel:comboboxOnShowPanel,
							url:'platform/sysLookupHibearchy/getLookUpJsonData.json?lookUpCode=PLATFORM_VALID_FLAG'" />
                 </td>
             </tr>
             <tr>
                 <th><span class="remind">*</span>多语言</th>
                 <td class="input-readonly">
                     <input id="sysLanguageCode" name="sysLanguageCode" title="有效标识" class="easyui-combobox" readonly="readonly" required="true"
					    data-options="editable:false,panelHeight:'auto',valueField:'code',textField:'name',onShowPanel:comboboxOnShowPanel,
							url:'platform/sysLookupHibearchy/getSysLanguages.json'" />
                  </td>
             </tr>
             <tr>
                 <th><span class="remind">*</span>数据编码</th>
                 <td>
                     <input id="typeKey" name="typeKey" title="数据编码" class="easyui-validatebox" data-options="validType:'length[0,255]'" required="true" type="text" value=""/>
                 </td>
             </tr>
             <tr>
                 <th><span class="remind">*</span>系统代码值</th>
                 <td>
                     <input id="typeValue" name="typeValue" title="系统代码值" class="easyui-validatebox" data-options="validType:'length[0,255]'" required="true" type="text" value=""/>
                 </td>
             </tr>
             <tr>
                 <th><span class="remind">*</span>排序</th>
                 <td>
                     <input id="orderBy" name="orderBy" title="排序" class="easyui-numberbox" data-options="min:0,max:1000000" required="true" type="text" data-options="min:0" value=""/>
                 </td>
             </tr>
             <tr>
                 <th>备注</th>
                 <td>
                     <textarea style="height: 50px;" class="textareabox" id="remark" name="remark"  title="备注"></textarea>
                 </td>
             </tr>
        </table>
	</form>
</div>
</body>
</html>