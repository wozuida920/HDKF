/**
 * 
 */
//compID 公司ID
function CsmpBdComStr(datagrid,url,searchD,form,compID){
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
	this._compId = compID;//将公司ID赋值给对象
	this._searchDiaId ="#"+searchD;
	this.init.call(this);
};
//初始化操作
CsmpBdComStr.prototype.init=function(){
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
		url:this.getUrl()+"getCsmpBdComStrsByPage/"+this._compId//将请求路径追加公司ID进行后台过滤查询
		});
};
//添加页面
CsmpBdComStr.prototype.insert=function(){
	this.nData = new CommonDialog("insert","790","500",this.getUrl()+'Add/null',"添加",false,true,false);
	this.nData.show();
};
//修改页面
CsmpBdComStr.prototype.modify=function(){
	var rows = this._datagrid.datagrid('getChecked');
	if(rows.length !== 1){
		alert("请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Edit/'+rows[0].id,"修改",false,true,false);
	this.nData.show();
};

//详细页
CsmpBdComStr.prototype.detail=function(id){
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Detail/'+id,"详情",false,true,false);
	this.nData.show();
};
//保存功能
CsmpBdComStr.prototype.save=function(form,id){
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
CsmpBdComStr.prototype.del=function(){
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l =rows.length;
	if(l > 0){
	  $.messager.confirm('请确认','您确定要删除当前所选的数据？',function(b){
		 if(b){
			 for(;l--;){
				 if(rows[l].id == ""){
					 isEdit = false;
				 }
				 if(rows[l].id!=""){
				 ids.push(rows[l].id);
				 }
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
						 parent.csmpBdCompanyinfo.init();  //
						// parent.csmpBdCompanyinfo.reLoad();
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
CsmpBdComStr.prototype.reLoad=function(){
	this._datagrid.datagrid('load',{});
};
//关闭对话框
CsmpBdComStr.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//打开查询框
CsmpBdComStr.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
CsmpBdComStr.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
CsmpBdComStr.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
CsmpBdComStr.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
CsmpBdComStr.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
CsmpBdComStr.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
CsmpBdComStr.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};


CsmpBdComStr.prototype.catalogType = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_COMPANY_TYPE', function(r) {
	r && (CsmpBdComStr.prototype.catalogType = r);
});
                                             