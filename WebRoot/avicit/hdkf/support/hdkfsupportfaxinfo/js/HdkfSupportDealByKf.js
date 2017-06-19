/**
 * 
 */
 function HdkfSupportDealByKf(datagrid,url,form){
	if(!datagrid || typeof(datagrid)!=='string'&&datagrid.trim()!==''){
		throw new Error("datagrid不能为空！");
	}
    var	_url=url;
    this.getUrl = function(){
    	return _url;
    };
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
HdkfSupportDealByKf.prototype.init=function(){
	var _self = this;
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup',function(e){
		if(e.keyCode == 13){
			_self.searchData();
		}
	});
	this._datagrid=$(this._datagridId).datagrid({
		url:this.getUrl()+"getHdkfSupportDealByKfsByPage.json",
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
//重载数据
HdkfSupportDealByKf.prototype.reLoad=function(){
	//this._datagrid.datagrid('load',{});
		this.searchData();
};
//关闭对话框
HdkfSupportDealByKf.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//去后台查询
HdkfSupportDealByKf.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
/*清空查询条件*/
HdkfSupportDealByKf.prototype.clearData =function(){
	$.each(this.searchForm.find('input'), function(i, n){
		if(n.id != "bpmState" && n.id != "bpmType"){
			n.value = "";
		}
	});
	this.searchData();
};
HdkfSupportDealByKf.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportDealByKf.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportDealByKf.prototype.initWorkFlow=function(status, owner){
	setBpmMenuState(status,owner);
	$('#bpmState').val(status);
	$('#bpmType').val(owner);
	this.searchData();
};
HdkfSupportDealByKf.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                    HdkfSupportDealByKf.prototype.isSelfDeal=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportDealByKf.prototype.isSelfDeal=r);});  
                               HdkfSupportDealByKf.prototype.isOutfield=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportDealByKf.prototype.isOutfield=r);});  
                                                                                    