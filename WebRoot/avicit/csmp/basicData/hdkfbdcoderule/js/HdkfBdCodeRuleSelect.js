/**
 * 
 */
function CsmpBdAricarftmodel(datagrid, url, form) {
	if (!datagrid || typeof (datagrid) !== 'string' && datagrid.trim() !== '') {
		throw new Error("datagrid不能为空！");
	}
	var _url = url;
	this.getUrl = function() {
		return _url;
	};
	this._datagridId = "#" + datagrid;
	this._doc = document;
	this._formId = "#" + form;
	
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
CsmpBdAricarftmodel.prototype.init = function() {
	var _self = this;
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup', function(e) {
		if (e.keyCode == 13) {
			_self.searchData();
		}
	});
	this._datagrid = $(this._datagridId).datagrid({
		url : this.getUrl() + "getCsmpBdAricarftmodelsByPage.json",
		
		onLoadError:function(arguments){
			$.messager.show({
				 title : '提示',
				 msg : '刷新失败！'
			 });
		},
		
		onDblClickRow : function(index, data){
			_self.getOnClick()(data);
		}
	});
};
// 添加页面
CsmpBdAricarftmodel.prototype.insert = function() {
	this.nData = new CommonDialog("insert", "790", "500", this.getUrl()
			+ 'Add/null', "添加", false, true, false);
	this.nData.show();
};
// 修改页面
CsmpBdAricarftmodel.prototype.modify = function() {
	var rows = this._datagrid.datagrid('getChecked');
	if (rows.length !== 1) {
		alert("请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit", "790", "500", this.getUrl() + 'Edit/'
			+ rows[0].id, "修改", false, true, false);
	this.nData.show();
};

// 详细页
CsmpBdAricarftmodel.prototype.detail = function(id) {
	this.nData = new CommonDialog("detail", "790", "500", this.getUrl()
			+ 'Detail/' + id, "详情", false, true, false);
	this.nData.show();
};
// 保存功能
CsmpBdAricarftmodel.prototype.save = function(form, id) {
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
// 删除
CsmpBdAricarftmodel.prototype.del = function() {
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
						} else if (r.flag == "succ") {
							$.messager.show({
								title : '提示',
								msg : '数据不能删除，已经被使用'
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
CsmpBdAricarftmodel.prototype.reLoad = function() {
	this._datagrid.datagrid('load', {});
};
// 关闭对话框
CsmpBdAricarftmodel.prototype.closeDialog = function(id) {
	$(id).dialog('close');
};
function closeDialog(id) {
	$(id).dialog('close');
}
// 去后台查询
CsmpBdAricarftmodel.prototype.searchData = function() {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', {
		param : JSON.stringify(serializeObject(this.searchForm))
	});
};
/* 清空查询条件 */
CsmpBdAricarftmodel.prototype.clearData = function() {
	this.searchForm.find('input').val('');
	this.searchData();
};
CsmpBdAricarftmodel.prototype.formate = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
CsmpBdAricarftmodel.prototype.formateDateTime = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
CsmpBdAricarftmodel.prototype.searchDataBySfn = function(conditions) {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', conditions);
};
CsmpBdAricarftmodel.prototype.modelType = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_AIRCRAFT_TYPE', function(r) {
	r && (CsmpBdAricarftmodel.prototype.modelType = r);
});