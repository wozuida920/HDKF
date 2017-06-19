/**
 * 
 */
 function HdkfSupportRequestInfo(datagrid,url,form){
	if(!datagrid || typeof(datagrid)!=='string'&&datagrid.trim()!==''){
		throw new Error("datagrid不能为空！");
	}
    var	_url=url;
    this.getUrl = function(){
    	return _url;
    };
    this._formCode = "hdkfSupportRequestInfo"; //表单的code，启动流程时需要
	this._datagridId="#"+datagrid;
	this._doc = document;
	this._formId="#"+form;
	
	var _onClick=function(){};
	this.getOnClick=function(){
		return _onClick;
	};
	this.setOnClick=function(func){
		_onClick=func;
	};
	this.init.call(this);
}
//初始化操作
HdkfSupportRequestInfo.prototype.init=function(){
	var _self = this;
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup',function(e){
		if(e.keyCode == 13){
			_self.searchData();
		}
	});
	this._datagrid=$(this._datagridId).datagrid({
		url:this.getUrl()+"getHdkfSupportRequestInfosByPage1.json",
		onLoadError:function(arguments){
			$.messager.show({
				 title : '提示',
				 msg : '刷新失败！'
			 });
		},
		onDblClickRow:function(rowIndex, rowData){
			_self.getOnClick()(rowData);
		},
		queryParams : { param : JSON.stringify({"bpmState" : $('#bpmState').val(), "bpmType" : $('#bpmType').val()})}
	});
	setBpmMenuState($('#bpmState').val(), $('#bpmType').val());
};

//去后台查询
HdkfSupportRequestInfo.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
/*清空查询条件*/
HdkfSupportRequestInfo.prototype.clearData =function(){
	$.each(this.searchForm.find('input'), function(i, n){
		if(n.id != "bpmState" && n.id != "bpmType"){
			n.value = "";
		}
	});
	this.searchData();
};
HdkfSupportRequestInfo.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportRequestInfo.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportRequestInfo.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
        HdkfSupportRequestInfo.prototype.requestMethod=[];
Platform6.fn.lookup.getLookupType('SUPPORT_REQUEST_TYPE',function(r){r&&( HdkfSupportRequestInfo.prototype.requestMethod=r);});  
                                                                           HdkfSupportRequestInfo.prototype.occurrenceTiming=[];
Platform6.fn.lookup.getLookupType('CSMP_FM_FAULTHAPPENMONMENT',function(r){r&&( HdkfSupportRequestInfo.prototype.occurrenceTiming=r);});  
               HdkfSupportRequestInfo.prototype.distributionType=[];
Platform6.fn.lookup.getLookupType('SUPPORT_DISTRIB_TYPE',function(r){r&&( HdkfSupportRequestInfo.prototype.distributionType=r);});  
               HdkfSupportRequestInfo.prototype.infoType=[];
Platform6.fn.lookup.getLookupType('CSMP_ES_INFO_TYPE',function(r){r&&( HdkfSupportRequestInfo.prototype.infoType=r);});  
       HdkfSupportRequestInfo.prototype.faultType=[];
Platform6.fn.lookup.getLookupType('CSMP_ETS_FIGURETYPE',function(r){r&&( HdkfSupportRequestInfo.prototype.faultType=r);});  
                                                                                    