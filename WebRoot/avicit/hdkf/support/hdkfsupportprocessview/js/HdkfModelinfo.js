/**
 * 
 */
function HdkfSupportProcessView(datagrid,url,searchD,form){
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
HdkfSupportProcessView.prototype.init=function(){
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
		url:this.getUrl()+"getHdkfModelinfoByPage.json",
		queryParams: { requestUnit :requestUnitR,curStatus :curStatusR}
		});
};


//添加页面
HdkfSupportProcessView.prototype.insert=function(){
	this.nData = new CommonDialog("insert","790","500",this.getUrl()+'Add/null',"添加",false,true,false);
	this.nData.show();
};
//修改页面

HdkfSupportProcessView.prototype.modify=function(){
	var rows = this._datagrid.datagrid('getChecked');
	if(rows.length !== 1){
		alert("请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Edit/'+rows[0].id,"修改",false,true,false);
	this.nData.show();
};


//详细页
HdkfSupportProcessView.prototype.detail=function(id){
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Detail/'+id,"详情",false,true,false);
	this.nData.show();
};
//保存功能
HdkfSupportProcessView.prototype.save=function(form,id){
	var _self = this;
	$.ajax({
		 url:_self.getUrl()+"save",
		 data : {data :JSON.stringify(form)},
		 type : 'post',
		 
		 dataType : 'json',
		 success : function(r){
			 if (r.flag == "success"){
				 _self.reLoad();
				 _self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				 $(id).dialog('close');
				$.messager.show({
					 title : '提示',
					 msg : '保存成功！'
				 });
			 }else{
				 $.messager.show({
					 title : '提示',
					 msg : r.error
				});
			 } 
		 }
	 });
};
//删除
HdkfSupportProcessView.prototype.del=function(){
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l =rows.length;
	if(l > 0){
	  $.messager.confirm('请确认','您确定要删除当前所选的数据？',function(b){
		 if(b){
			 for(;l--;){
				 ids.push(rows[l].id);
			 }
			 $.ajax({
				 url:_self.getUrl()+'delete',
				 data:	JSON.stringify(ids),
				 contentType : 'application/json',
				 type : 'post',
				 dataType : 'json',
				 success : function(r){
					 if (r.flag == "success") {
						 _self.reLoad();
						 _self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
						 $.messager.show({
							 title : '提示',
							 msg : '删除成功！'
						});
					}else{
						$.messager.show({
							 title : '提示',
							 msg : r.error
						});
					}
				 }
			 });
		 } 
	  });
	}else{
	  $.messager.alert('提示','请选择要删除的记录！','warning');
	}
};
//重载数据
HdkfSupportProcessView.prototype.reLoad=function(){
	this._datagrid.datagrid('load',{});
};
//关闭对话框
HdkfSupportProcessView.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//打开查询框
HdkfSupportProcessView.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfSupportProcessView.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfSupportProcessView.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfSupportProcessView.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfSupportProcessView.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportProcessView.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportProcessView.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                HdkfSupportProcessView.prototype.curStatus=[];
Platform6.fn.lookup.getLookupType('SUPPORT_PROCESS_STATUS',function(r){r&&( HdkfSupportProcessView.prototype.curStatus=r);});  
                                                                   HdkfSupportProcessView.prototype.hasOutfiedcard=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportProcessView.prototype.hasOutfiedcard=r);});  
       HdkfSupportProcessView.prototype.hasOapublishsheet=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportProcessView.prototype.hasOapublishsheet=r);});  
       HdkfSupportProcessView.prototype.hasFax=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportProcessView.prototype.hasFax=r);});  
                                                                                    