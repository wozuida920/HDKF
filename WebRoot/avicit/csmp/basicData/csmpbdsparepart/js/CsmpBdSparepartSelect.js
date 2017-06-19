/**
 * 
 */
function CsmpBdSparepart(datagrid,url,searchD,form){
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
CsmpBdSparepart.prototype.init=function(){
	var _self = this;
	this.searchDialog =$(this._searchDiaId).css('display','block').dialog({
		title:'查询'
	});
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup',function(e){
		if(e.keyCode == 13){
			_self.searchData();
		}
	});
	this.searchDialog.dialog('close',true);
	this._datagrid=$(this._datagridId).datagrid({
		url:this.getUrl()+"getCsmpBdSparepartSelectByPage.json"
		});
};



//重载数据
CsmpBdSparepart.prototype.reLoad=function(){
	this._datagrid.datagrid('load',{});
};
//关闭对话框
CsmpBdSparepart.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//去后台查询
CsmpBdSparepart.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};

/*清空查询条件*/
CsmpBdSparepart.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
CsmpBdSparepart.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
CsmpBdSparepart.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};

CsmpBdSparepart.prototype.unit=[];
Platform6.fn.lookup.getLookupType('CSMP_SPM_UNIT',function(r){r&&( CsmpBdSparepart.prototype.unit=r);});  

CsmpBdSparepart.prototype.category=[];
Platform6.fn.lookup.getLookupType('CSMP_BD_GATEGORY',function(r){r&&( CsmpBdSparepart.prototype.category=r);}); 
                                                                        