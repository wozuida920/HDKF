/**
 * 
 */
 function HdkfSupportOutfieldCard(datagrid,url,searchD,form){
	if(!datagrid || typeof(datagrid)!=='string'&&datagrid.trim()!==''){
		throw new Error("datagrid不能为空！");
	}
	var _selectId='';
    var	_url=url;
    this.getUrl = function(){
    	return _url;
    };
    this._formCode = "hdkfSupportOutfieldCard"; //表单的code，启动流程时需要
	this._datagridId="#"+datagrid;
	this._doc = document;
	this._formId="#"+form;
	this._searchDiaId ="#"+searchD;
	this.init.call(this);
}
//初始化操作
HdkfSupportOutfieldCard.prototype.init=function(){
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
		url:this.getUrl()+"getHdkfSupportOutfieldCardsByPage.json",
		onLoadError:function(arguments){
			$.messager.show({
				 title : '提示',
				 msg : '刷新失败！'
			 });
		},
		queryParams : { param : JSON.stringify({"bpmState" : $('#bpmState').val(), "bpmType" : $('#bpmType').val()})}
	});
	setBpmMenuState($('#bpmState').val(), $('#bpmType').val());
};
//添加页面
HdkfSupportOutfieldCard.prototype.insert=function(){
	var clientWidth = document.body.clientWidth;
	var clientHeight = document.body.clientHeight;
	this.nData = new CommonDialog("insert",clientWidth,clientHeight,this.getUrl()+'Add/null',"添加",false,true,false);
	this.nData.show();
};
//修改页面
HdkfSupportOutfieldCard.prototype.modify=function(){
	var rows = this._datagrid.datagrid('getChecked');
	if(rows.length !== 1){
		alert("请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Edit/'+rows[0].id,"编辑",false,true,false);
	this.nData.show();
};
//详细页
HdkfSupportOutfieldCard.prototype.detail=function(id, value, state ,process){
//	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Detail/'+id,"详情",false,true,false);
//	this.nData.show();
//	var url = this.getUrl()+'Detail/'+id;
	var strJsp = "HdkfSupportOutfieldCardDetail.jsp";
	if (state == "流转中")
	{
		strJsp = "HdkfSupportOutfieldCardDetailKf.jsp";
		if(process == "客服部主任审批;" || process == "客服部部长审批;" || process == "承办单位信息员;"){
			strJsp = "HdkfSupportOutfieldCardDetailKf.jsp";
		}else if(process == "客服部技术员;"){
			strJsp = "HdkfSupportOutfieldCardDetail.jsp";
		}else{
			strJsp = "HdkfSupportOutfieldCardDetailInfo.jsp";
		}
	}else if(state == "草稿"){
		strJsp = "HdkfSupportOutfieldCardDetailKf.jsp";
	}else if(state == "结束"){
		strJsp = "HdkfSupportOutfieldCardDetail.jsp";
	}
	var url = "avicit/hdkf/support/hdkfsupportoutfieldcard/" + strJsp + "?id=" + id;
	if(typeof(top.addTab) != 'undefined'){
		top.addTab(value, url);
	}else{
		window.open(url);
	}
};
//保存并启动流程
HdkfSupportOutfieldCard.prototype.saveFormAndStartFlow=function(form,id){
	var _self = this;
	dataVo = JSON.stringify(form);
	//打开流程选择对话框
	var processDef = new StartProcessByFormCode();
	processDef.SetFormCode(_self._formCode);
	StartProcessByFormCode.prototype.doStart = function(pdId) {
		/* 将表单代码、业务数据、流程定义ID提交到Java端 */
		$.ajax({
			url : _self.getUrl()+'saveAndStartProcess.json',
			data :{
				processDefId:pdId,
				formCode:_self._formCode,
				datas:dataVo
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					$.messager.show({title : '提示',msg : "操作成功。"});
					_self.reLoad();
					_self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
					$(id).dialog('close');
					//var processInstanceId = result.bp.processInstanceId; //流程实例ID
					var taskUrl = result.bp.taskUrl; //待办URL
					//打开待办审批页面
					if (taskUrl != null && taskUrl != "" && taskUrl != 'undefined') {
						if(typeof(top.addTab) != 'undefined'){
							top.addTab("流程表单", getPath()+"/"+taskUrl);
						}else{
							window.open(getPath()+"/"+taskUrl);
						}
					}
				}else {
					$.messager.show({title : '提示', msg : "操作失败。"+result.msg});
				}
			}
		});
	};
	processDef.start();
};
//保存功能
HdkfSupportOutfieldCard.prototype.save=function(form,id){
	var _self = this;
	$.ajax({
		 url:_self.getUrl()+"save.json",
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
HdkfSupportOutfieldCard.prototype.del=function(){
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
				 url:_self.getUrl()+'delete.json',
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
HdkfSupportOutfieldCard.prototype.reLoad=function(){
	//this._datagrid.datagrid('load',{});
		this.searchData();
};
//关闭对话框
HdkfSupportOutfieldCard.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//打开查询框
HdkfSupportOutfieldCard.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfSupportOutfieldCard.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfSupportOutfieldCard.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfSupportOutfieldCard.prototype.clearData =function(){
	$.each(this.searchForm.find('input'), function(i, n){
		if(n.id != "bpmState" && n.id != "bpmType"){
			n.value = "";
		}
	});
	this.searchData();
};
HdkfSupportOutfieldCard.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportOutfieldCard.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportOutfieldCard.prototype.initWorkFlow=function(status, owner){
	setBpmMenuState(status,owner);
	$('#bpmState').val(status);
	$('#bpmType').val(owner);
	this.searchData();
};
HdkfSupportOutfieldCard.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                                                                                                                                                                             