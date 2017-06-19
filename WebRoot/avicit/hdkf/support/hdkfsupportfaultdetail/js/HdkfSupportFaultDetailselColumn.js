/**
 * 
 */
function HdkfSupportFaultDetailselColumn(datagrid,url,searchD,form){
	if(!datagrid || typeof(datagrid)!=='string'&&datagrid.trim()!==''){
		throw new Error("datagrid不能为空！");
	}
	var _selectId='';
    var	_url=url;
    this.getUrl = function(){
    	return _url;
    }
	this._datagridId="#"+datagrid;
	this._doc = document;
	this._formId="#"+form;
	this._searchDiaId ="#"+searchD;
	this.init.call(this);
};
//初始化操作
HdkfSupportFaultDetailselColumn.prototype.init=function(){
	var _self = this;
	this.searchDialog =$(this._searchDiaId).css('display','block').dialog({
		title:'选择列'
	});
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup',function(e){
		if(e.keyCode == 13){
			_self.searchData();
		}
	});
	this.searchDialog.dialog('close',true);
	this._datagrid=$(this._datagridId).datagrid({
		url:this.getUrl()+"getHdkfSupportFaultDetailsByPage.json"
		});
};

//打开查询框
HdkfSupportFaultDetailselColumn.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};

//隐藏查询框
HdkfSupportFaultDetailselColumn.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};

HdkfSupportFaultDetailselColumn.prototype.attribute01=[];
Platform6.fn.lookup.getLookupType('CSMP_FM_FAULTHAPPENMONMENT',function(r){r&&( HdkfSupportFaultDetailselColumn.prototype.attribute01=r);});
HdkfSupportFaultDetailselColumn.prototype.attribute02=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportFaultDetailselColumn.prototype.attribute02=r);});
     
                                                                                                                             