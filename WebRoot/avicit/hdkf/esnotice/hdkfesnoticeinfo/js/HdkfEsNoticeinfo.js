/**
 * 
 */
function HdkfEsNoticeinfo(datagrid,url,searchD,form){
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
	this._formCode = "hdkfEsNoticeinfo";
	this.init.call(this);
};
//初始化操作
HdkfEsNoticeinfo.prototype.init=function(){
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
		url:this.getUrl()+"getHdkfEsNoticeinfosByPage.json",
		queryParams: { param : JSON.stringify(serializeObject(this.searchForm)), bpmState : $('#bpmState').val(),bpmType : $('#bpmType').val()}
		});
	setBpmMenuState($('#bpmState').val(), $('#bpmType').val());
};
 //添加页面
HdkfEsNoticeinfo.prototype.insert=function(){
	this.nData = new CommonDialog("insert","700","500",this.getUrl()+'Add/null',"添加",false,true,false);
	this.nData.show();
};


//编辑页面
HdkfEsNoticeinfo.prototype.modify=function(){
	var rows = this._datagrid.datagrid('getChecked');
	if(rows.length !== 1){
		$.messager.alert('提示','请选择要编辑的记录！','warning');
		return false;
	}
	this.nData = new CommonDialog("edit","790","500",this.getUrl()+'Edit/'+rows[0].id,"编辑",false,true,false);
	this.nData.show();
};
//详细页
HdkfEsNoticeinfo.prototype.detail=function(id, flowstate){
	//if(flowstate != null && flowstate != "null" &&flowstate != ""){
		var taskUrl ="avicit/hdkf/esnotice/hdkfesnoticeinfo/HdkfEsNoticeinfoDetail.jsp?id=" + id;
		if (taskUrl != null && taskUrl != ""&& taskUrl != 'undefined') {
			if (typeof (top.addTab) != 'undefined') {
				top.addTab("流程表单", taskUrl);
			} else {
				window.open(taskUrl);
			}
		}
	//}else{
	// 	$.messager.show({
	//		 title : '提示',
	//		 msg : r.error
	//	 });
		//this.modify(id);
	//}
};
 //保存功能
HdkfEsNoticeinfo.prototype.save=function(form,callback){
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
					 if(typeof(callback)=="function"){
					 callback(r.id);
					}
				 }else{
					 $.messager.show({
						 title : '提示',
						 msg : r.error
					 });
					 //_self.HidMask();
				 } 
			 }
		 });
		

	
	
	
};




//删除
HdkfEsNoticeinfo.prototype.del=function(){
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l =rows.length;
	if(l > 0){
	  $.messager.confirm('请确认','您确定要删除当前所选的数据？',function(b){
		 if(b){
			 for(;l--;){
			 	 if(!(rows[l].businessstate_ == null || rows[l].businessstate_ == "" || rows[l].businessstate_ == "草稿")){
					 $.messager.alert("操作提示", "不能删除正在审批中的数据！！","info");   
					 return false;
				 }
				 ids.push(rows[l].id);
			 }
			 //_self.ShowMask();
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
					//_self.HidMask();
				 }
			 });
		 } 
	  });
	}else{
	  $.messager.alert('提示','请选择要删除的记录！','warning');
	}
};
//重载数据
HdkfEsNoticeinfo.prototype.reLoad=function(){
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm)), bpmState : $('#bpmState').val(),bpmType : $('#bpmType').val()});
};
//关闭对话框
HdkfEsNoticeinfo.prototype.closeDialog=function(id){
	$(id).dialog('close');
};

//打开查询框
HdkfEsNoticeinfo.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfEsNoticeinfo.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm)), bpmState : $('#bpmState').val(),bpmType : $('#bpmType').val()});

};
//隐藏查询框
HdkfEsNoticeinfo.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfEsNoticeinfo.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfEsNoticeinfo.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfEsNoticeinfo.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};

HdkfEsNoticeinfo.prototype.searchDataBySfn =function(conditions){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	 this._datagrid.datagrid('load', conditions);
};

HdkfEsNoticeinfo.prototype.ShowMask = function(msg){
	if(msg == null || msg == "")
		msg = "正在提交数据，请等待...";
	$('#mask').dialog({
	    title: msg
	});

	if(!this.maskisopen){
		$('#mask').dialog("open");
		this.maskisopen = true;
	}
};

HdkfEsNoticeinfo.prototype.HidMask = function(time){
	var _self = this;
	if(time == null){
		if(_self.maskisopen){
			$("#mask").dialog("close");
			_self.maskisopen = false;
		}
	}else{
		setTimeout(function(){
			if(_self.maskisopen){
				$("#mask").dialog("close");
				_self.maskisopen = false;
			}
		},time);
	}
};


HdkfEsNoticeinfo.prototype.initWorkFlow = function(state, type) {
	setBpmMenuState(state,type);
	$('#bpmState').val(state);
	$('#bpmType').val(type);
	hdkfEsNoticeinfo.reLoad();
}

//保存并启动流程
HdkfEsNoticeinfo.prototype.saveFormAndStartFlow = function(form, page) {
	var _self = this;
	//_self.ShowMask("开始启动流程...");
	dataVo = JSON.stringify(form);
	// 打开流程选择对话框
	var processDef = new StartProcessByFormCode();
	processDef.SetFormCode(_self._formCode);
	StartProcessByFormCode.prototype.doStart = function(pdId) {
		/* 将表单代码、业务数据、流程定义ID提交到Java端 */
		$.ajax({
			url : _self.getUrl() + 'saveAndStartProcess.json',
			data : {
				processDefId : pdId,
				formCode : _self._formCode,
				datas : dataVo
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				if (result.flag == "success") {
					$.messager.show({
						title : '提示',
						msg : "操作成功。"
					});
					_self.reLoad();
					_self._datagrid.datagrid('uncheckAll').datagrid(
							'unselectAll').datagrid('clearSelections');
					_self.closeDialog(page);

					// //流程实例ID
					var taskUrl = result.bp.taskUrl; // 待办URL
					// 打开待办审批页面
					if (taskUrl != null && taskUrl != ""
							&& taskUrl != 'undefined') {
						if (typeof (top.addTab) != 'undefined') {
							top.addTab("流程表单", getPath() + "/" + taskUrl);
						} else {
							window.open(getPath() + "/" + taskUrl);
						}
					}
				} else {
					$.messager.show({
						title : '提示',
						msg : "操作失败。" + result.msg
					});
				}
				//_self.HidMask();
			}
		});
	};
	processDef.start();
	//_self.HidMask(5000);
};

//时间
HdkfEsNoticeinfo.prototype.checkDateTime = function(beginTime,endTime){
	var beginDate = $(beginTime).datebox();
	var endDate = $(endTime).datebox();
	beginDate.datebox({
		onSelect:function(){
			var etime = endDate.datebox("getValue");
			var btime = beginDate.datebox('getValue');
			if(etime!=null&&etime!=""){
				if(btime>etime){
					$.messager.show({
						title:"错误:",
						msg:"结束时间不能大于开始时间"
					});
					$(this).datebox("setValue","");
					return;
				}
			}
		}
	});
	endDate.datebox({
		onSelect:function(){
			var getBeginTime = beginDate.datebox('getValue');
			var getEndTime = $(this).datebox("getValue");
			if(getBeginTime>getEndTime){
				$.messager.show({
					title:"错误:",
					msg:"结束时间不能小于开始时间"
				});
				$(this).datebox("setValue","");
				return;
			}
		}
	});
};


                        HdkfEsNoticeinfo.prototype.bulletinType=[];
Platform6.fn.lookup.getLookupType('CSMP_ES_INFO_TYPE',function(r){r&&( HdkfEsNoticeinfo.prototype.bulletinType=r);});  
       HdkfEsNoticeinfo.prototype.materialSupply=[];
Platform6.fn.lookup.getLookupType('CSMP_ES_PROVIDE_MATERIAL',function(r){r&&( HdkfEsNoticeinfo.prototype.materialSupply=r);});  
       HdkfEsNoticeinfo.prototype.implementCompany=[];
Platform6.fn.lookup.getLookupType('CSMP_ES_IMPLEMENT_COMPANY',function(r){r&&( HdkfEsNoticeinfo.prototype.implementCompany=r);});  
                       HdkfEsNoticeinfo.prototype.includeMars=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfEsNoticeinfo.prototype.includeMars=r);});  
                                                                                                                                        