/**
 * 
 */
function HdkfSupportFaultDetail(datagrid,url,searchD,form){
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
HdkfSupportFaultDetail.prototype.init=function(){
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
		url:this.getUrl()+"getHdkfSupportFaultDetailsByPage.json"
		});
};
//添加页面
HdkfSupportFaultDetail.prototype.insert=function(){
	this.nData = new CommonDialog("insert","820","660",this.getUrl()+'Add/'+requestIdR,"添加",false,true,false);
	this.nData.show();
};
//修改页面
HdkfSupportFaultDetail.prototype.modify=function(){
	var rows = this._datagrid.datagrid('getChecked');
	if(rows.length !== 1){
		alert("请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Edit/'+rows[0].id,"修改",false,true,false);
	this.nData.show();
};

//详细页
HdkfSupportFaultDetail.prototype.detail=function(id){
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Detail3/'+id,"详情",false,true,false);
	this.nData.show();
};
//保存功能
HdkfSupportFaultDetail.prototype.save=function(form,id){
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
HdkfSupportFaultDetail.prototype.del=function(){
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
HdkfSupportFaultDetail.prototype.reLoad=function(){
	this._datagrid.datagrid('load',{});
};
//关闭对话框
HdkfSupportFaultDetail.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//打开查询框
HdkfSupportFaultDetail.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfSupportFaultDetail.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfSupportFaultDetail.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfSupportFaultDetail.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};

/*HdkfSupportFaultDetail.prototype.exportServerData=function(){
	var rows = this._datagrid.datagrid('getChecked');
	var l =rows.length;
	if(l > 0){
		alert("????");
		$.messager.confirm('确认', '是否确认导出Excel文件?', function(r) {
			if (r) { // 封装参数				
				var columnFieldsOptions = getGridColumnFieldsOptions('dgHdkfSupportFaultDetail');
				var dataGridFields = JSON.stringify(columnFieldsOptions[0]);
				var expSearchParams = expSearchParams ? expSearchParams : {};
 					var rows = $('#dgHdkfSupportFaultDetail').datagrid('getRows');
				var datas = JSON.stringify(serializeObject($('#dgHdkfSupportFaultDetail')));
				// 判断如果没有数据返回当前页面；
				if (rows.length < 1) {
					$.messager.alert('提示', "无记录不允许导出", 'info');
					return;
				}
				// 以下参数为服务器端导出所需要的数据	
				expSearchParams.datas=datas; 
				expSearchParams.dataGridFields = dataGridFields;// 设置导出表头
				expSearchParams.hasRowNum = true;// 是否有行号
				expSearchParams.sheetName = 'sheet1';// 导出的sheet名称
				expSearchParams.unContainFields = '';// 不需要导出的列
				expSearchParams.fileName = '平台用户导出数据' + new Date().format("yyyyMMddhhmmss");// 导出文件名								
				var url = "platform/hdkf/support/hdkfsupportfaultdetail/HdkfSupportFaultDetailController/operation/sysuser/exportServer";// 服务器请求地址_self.getUrl()
				var ep = new exportData("xlsExport", "xlsExport", expSearchParams,
						url);
				ep.excuteExport();
			}

		});
		 
	}else{
		  $.messager.alert('提示','请选择要导出的记录！','warning');
	}
};
*/



HdkfSupportFaultDetail.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportFaultDetail.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportFaultDetail.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};

HdkfSupportFaultDetail.prototype.attribute01=[];
Platform6.fn.lookup.getLookupType('CSMP_FM_FAULTHAPPENMONMENT',function(r){r&&( HdkfSupportFaultDetail.prototype.attribute01=r);});
HdkfSupportFaultDetail.prototype.attribute02=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfSupportFaultDetail.prototype.attribute02=r);});
                                                                                                                               