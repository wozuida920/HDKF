function HdkfEsNoticeinfoAddTrackReport(datagrid,url,searchD,form){
	
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
HdkfEsNoticeinfoAddTrackReport.prototype.init=function(){
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
	//setBpmMenuState($('#bpmState').val(), $('#bpmType').val());
};
//填写上报文号
HdkfEsNoticeinfoAddTrackReport.prototype.insertreport=function(pid){
//	alert("成功转入填写上报文号");
	var clientWidth = document.body.clientWidth-500;
	var clientHeight = document.body.clientHeight-100;
	this.nData = new CommonDialog("trackEditTrackReport",clientWidth,clientHeight,this.getUrl()+'TrackEditTrackReport/'+pid,"填写上报文号",false,true,false);
	this.nData.show();
};
//填写批复文号
HdkfEsNoticeinfoAddTrackReport.prototype.insertanswer=function(pid){
	var clientWidth = document.body.clientWidth-500;
	var clientHeight = document.body.clientHeight-100;
	//alert("成功转入填写上报文号");
	this.nData = new CommonDialog("trackEditTrackAnswer",clientWidth,clientHeight,this.getUrl()+'TrackEditTrackAnswer/'+pid,"填写批复文号",false,true,false);
	this.nData.show();
};
//填写转发文号
HdkfEsNoticeinfoAddTrackReport.prototype.insertsend=function(pid){
	var clientWidth = document.body.clientWidth-500;
	var clientHeight = document.body.clientHeight-100;
	//alert("成功转入填写上报文号");
	this.nData = new CommonDialog("trackEditTrackSend",clientWidth,clientHeight,this.getUrl()+'TrackEditTrackSend/'+pid,"填写转发文号",false,true,false);
	this.nData.show();
};

//修改上报文号
HdkfEsNoticeinfoAddTrackReport.prototype.modifyreport=function(pid){
//	alert("成功转入填写上报文号");
	var clientWidth = document.body.clientWidth-500;
	var clientHeight = document.body.clientHeight-100;
	this.nData = new CommonDialog("trackEditTrackReport",clientWidth,clientHeight,this.getUrl()+'TrackEditTrackReport/'+pid,"修改上报文号",false,true,false);
	this.nData.show();
};


//修改批复文号
HdkfEsNoticeinfoAddTrackReport.prototype.modifyanswer=function(pid){
	var clientWidth = document.body.clientWidth-500;
	var clientHeight = document.body.clientHeight-100;
	//alert("成功转入填写上报文号");
	this.nData = new CommonDialog("trackEditTrackAnswer",clientWidth,clientHeight,this.getUrl()+'TrackEditTrackAnswer/'+pid,"修改批复文号",false,true,false);
	this.nData.show();
};

//修改转发文号
HdkfEsNoticeinfoAddTrackReport.prototype.modifysend=function(pid){
	var clientWidth = document.body.clientWidth-500;
	var clientHeight = document.body.clientHeight-100;
	//alert("成功转入填写上报文号");
	this.nData = new CommonDialog("trackEditTrackSend",clientWidth,clientHeight,this.getUrl()+'TrackEditTrackSend/'+pid,"修改转发文号",false,true,false);
	this.nData.show();
};

