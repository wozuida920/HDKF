/**
 * 
 */
function HdkfEsReportTrack(datagrid,url,searchD,form,paramId){
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
	this._paramId = paramId;
	this._searchDiaId ="#"+searchD;
	this.init.call(this);
};
//初始化操作
HdkfEsReportTrack.prototype.init=function(){
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
		//url:this.getUrl()+"getHdkfEsReportTracksByPage.json"
		url:this.getUrl()+"getHdkfEsReportTracksByPage/"+_self._paramId
		});
};
//添加页面
HdkfEsReportTrack.prototype.insert=function(){
	var clientWidth = document.body.clientWidth;
	var clientHeight = document.body.clientHeight;
	this.nData = new CommonDialog("insert",clientWidth,clientHeight,this.getUrl()+'Add/'+this._paramId,"添加",false,true,false);
	this.nData.show();
};
//编辑页面
HdkfEsReportTrack.prototype.modify=function(){
	var rows = this._datagrid.datagrid('getChecked');
	if(rows.length !== 1){
		$.messager.alert('提示','请选择要编辑的记录！','warning');
		return false;
	}
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Edit/'+rows[0].id,"编辑",false,true,false);
	this.nData.show();
};

//详细页
HdkfEsReportTrack.prototype.detail=function(id){
	var clientWidth = document.body.clientWidth-200;
	var clientHeight = document.body.clientHeight-200;
	
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Detail/'+id,"详情",false,true,false);
	this.nData.show();
};
//保存功能
HdkfEsReportTrack.prototype.save=function(form,id){
	//alert("1");
	var _self = this;
	//alert("2");
	//alert("url-->"+_self.getUrl());
	//alert('data-->'+JSON.stringify(form));
	$.ajax({
		 url:_self.getUrl()+"save",
		 
		 data : {data :JSON.stringify(form)},
		 type : 'post',	 
		 dataType : 'json',
		 success : function(r){
			 //alert(r.flag);
			 if (r.flag == "success"){
				 //alert("reload...start...");
				 _self.reLoad();
				 //alert("reload...end...");
				// _self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				 //alert("reload...end...1...");
				 $(id).dialog('close');
				 //alert("reload...end...2...");
				$.messager.show({
					 title : '提示',
					 msg : '保存技术通报上报跟踪数据成功！'
				 });
			 }else{
				 $.messager.show({
					 title : '提示',
					 msg : '保存技术通报上报跟踪数据失败！'+r.error
				});
			 } 
		 }
	 });
};
//删除
HdkfEsReportTrack.prototype.del=function(){
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
HdkfEsReportTrack.prototype.reLoad=function(){
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//关闭对话框
HdkfEsReportTrack.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//打开查询框
HdkfEsReportTrack.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfEsReportTrack.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfEsReportTrack.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfEsReportTrack.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfEsReportTrack.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfEsReportTrack.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfEsReportTrack.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                                                                                                         