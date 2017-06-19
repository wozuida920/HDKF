/**
 * 
 */
function CsmpBdAircraftinfo(datagrid, url, searchD, form,fid) {
	if (!datagrid || typeof (datagrid) !== 'string' && datagrid.trim() !== '') {
		throw new Error("datagrid不能为空！");
	}
	var _selectId = '';
	var _url = url;
	//过滤id
	var _fid = fid;
	this.getFid = function() {
		return _fid;
	}
	this.getUrl = function() {
		return _url;
	}
	
	this._datagridId = "#" + datagrid;
	this._doc = document;
	this._formId = "#" + form;
	this._searchDiaId = "#" + searchD;
	
	var _onClick=function(){};
	this.getOnClick=function(){
		return _onClick;
	};
	this.setOnClick=function(func){
		_onClick=func;
	};
	this.init.call(this);
};
// 初始化操作
CsmpBdAircraftinfo.prototype.init = function() {
	var _self = this;
	var url="";
	if(this.getFid()=="null"){
		url=this.getUrl() + "getCsmpBdAircraftinfosByPage.json";
	}else{	
		//alert(this.getFid());
		url=this.getUrl() + "getCsmpBdAircraftModelByPage/"+this.getFid();
	}
	this.searchDialog = $(this._searchDiaId).css('display', 'block').dialog({
		title : '查询'
	});
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup', function(e) {
		if (e.keyCode == 13) {
			_self.searchData();
		}
	});
	this.searchDialog.dialog('close', true);
	this._datagrid = $(this._datagridId).datagrid({
		url : url,
		onDblClickRow:function(rowIndex, rowData){
			_self.getOnClick()(rowData);
		}
	});
};
// 添加页面
CsmpBdAircraftinfo.prototype.insert = function(obj) {
	this.nData = new CommonDialog("insert", "790", "500", this.getUrl()
			+ 'Add/null/' + obj.id + '/' + obj.modelNum, "添加", false, true,
			false);
	this.nData.show();
};
// 修改页面
CsmpBdAircraftinfo.prototype.modify = function() {
	var rows = this._datagrid.datagrid('getChecked');
	if (rows.length !== 1) {
		$.messager.alert("提示","请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit", "790", "500", this.getUrl() + 'Edit/'
			+ rows[0].id + '/' + rows[0].modelId + '/null', "修改", false, true,
			false);
	this.nData.show();
};

// 详细页
CsmpBdAircraftinfo.prototype.detail = function(id) {
	this.nData = new CommonDialog("edit", "790", "500", this.getUrl()
			+ 'Detail/' + id, "详情", false, true, false);
	this.nData.show();
};
// 保存功能
CsmpBdAircraftinfo.prototype.save = function(form, id) {
	var _self = this;
	$.ajax({
		url : _self.getUrl() + "save",
		data : {
			data : JSON.stringify(form)
		},
		type : 'post',

		dataType : 'json',
		success : function(r) {
			if (r.flag == "success") {
				_self.reLoad();
				_self._datagrid.datagrid('uncheckAll').datagrid('unselectAll')
						.datagrid('clearSelections');
				$(id).dialog('close');
				$.messager.show({
					title : '提示',
					msg : '保存成功！'
				});
			} else {
				$.messager.show({
					title : '提示',
					msg : r.error
				});
			}
		}
	});
};
//回传id与批架次
CsmpBdAircraftinfo.prototype.chooseOne = function() {
	var rows = this._datagrid.datagrid('getChecked');
	alert(rows.length);
	if(rows.length==0){
		alert("清选一条批架次信息");
		return;
	}
	var modelIdAliass="";
	var modelIds="";
	for(var i=0;i<rows.length;i++)
	{
		if(modelIdAliass=='')
			modelIdAliass=rows[i].modelIdAlias;
			else
				modelIdAliass=modelIdAliass+","+rows[i].modelIdAlias;
	}
	
	for(var i=0;i<rows.length;i++)
	{if(modelIds=='')
		modelIds=rows[i].modelId;
		else
			modelIds=modelIds+","+rows[i].modelId;
	}
	alert(modelIdAliass);
	parent.callBackData(rows[0],modelIdAliass,modelIds);
	
//	parent.callBackBatchNo(batchNos);
	parent.csmpSpmOrdersummary.closeDialog("#insert1");

};
// 删除
CsmpBdAircraftinfo.prototype.del = function() {
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l = rows.length;
	if (l > 0) {
		$.messager.confirm('请确认', '您确定要删除当前所选的数据？', function(b) {
			if (b) {
				for (; l--;) {
					ids.push(rows[l].id);
				}
				$.ajax({
					url : _self.getUrl() + 'delete',
					data : JSON.stringify(ids),
					contentType : 'application/json',
					type : 'post',
					dataType : 'json',
					success : function(r) {
						if (r.flag == "success") {
							_self.reLoad();
							_self._datagrid.datagrid('uncheckAll').datagrid(
									'unselectAll').datagrid('clearSelections');
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
							});
						} else {
							$.messager.show({
								title : '提示',
								msg : r.error
							});
						}
					}
				});
			}
		});
	} else {
		$.messager.alert('提示', '请选择要删除的记录！', 'warning');
	}
};
// 重载数据
CsmpBdAircraftinfo.prototype.reLoad = function() {
	var param = preparedNode();
	//this._datagrid.datagrid('load', param);
	this.searchData(param);
};

// 关闭对话框
CsmpBdAircraftinfo.prototype.closeDialog = function(id) {
	$(id).dialog('close');
};

// 打开查询框
CsmpBdAircraftinfo.prototype.openSearchForm = function() {
	this.searchDialog.dialog('open', true);
};
var globalNode;
// 去后台查询
CsmpBdAircraftinfo.prototype.searchDataAll = function() {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};

// 参数 nodeObject 为从前台传递过来已经准备好的Object查询封装的模拟对象
CsmpBdAircraftinfo.prototype.searchData = function(nodeObject) {

	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	if (!nodeObject) {
		globalNode = serializeObject(this.searchForm);
		this._datagrid.datagrid('load', {
			param : JSON.stringify(globalNode)
		});
	} else {
		globalNode = nodeObject;
		this._datagrid.datagrid('load', {
			param : JSON.stringify(nodeObject)
		});
	}

};
// 隐藏查询框
CsmpBdAircraftinfo.prototype.hideSearchForm = function() {
	this.searchDialog.dialog('close', true);
};
/* 清空查询条件 */
CsmpBdAircraftinfo.prototype.clearData = function() {
	this.searchForm.find('input').val('');
	this.searchData();
};
//仅清楚查询区域数据
CsmpBdAircraftinfo.prototype.clearDataOnly = function() {
	this.searchForm.find('input').val('');
};

CsmpBdAircraftinfo.prototype.formate = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
CsmpBdAircraftinfo.prototype.formateDateTime = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
CsmpBdAircraftinfo.prototype.searchDataBySfn = function(conditions) {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', conditions);
};
CsmpBdAircraftinfo.prototype.isBusinessPeriod = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_ISPERIOD', function(r) {
	r && (CsmpBdAircraftinfo.prototype.isBusinessPeriod = r);
});
CsmpBdAircraftinfo.prototype.operateStatus = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_OPERATIONSTATUS', function(r) {
	r && (CsmpBdAircraftinfo.prototype.operateStatus = r);
});
