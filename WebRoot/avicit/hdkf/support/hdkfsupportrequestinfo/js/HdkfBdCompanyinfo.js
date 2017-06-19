/**
 * 
 */
function CsmpBdCompanyinfo(datagrid, url, searchD, form, pid) {
	if (!datagrid || typeof (datagrid) !== 'string' && datagrid.trim() !== '') {
		throw new Error("datagrid不能为空！");
	}
	var _selectId = '';
	var _url = url;
	this._pid = pid;
	this.getUrl = function() {
		return _url;
	}
	this._datagridId = "#" + datagrid;
	this._doc = document;
	// /????
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
CsmpBdCompanyinfo.prototype.init = function() {
	var _self = this;
	// 查询框显示
	this.searchDialog = $(this._searchDiaId).css('display', 'block').dialog({
		title : '查询'
	});
	this.searchForm = $(this._formId).form();

	this.searchForm.find('input').on('keyup', function(e) {
		if (e.keyCode == 13) {
			_self.searchData();
		}
	});
	// this.searchDialog.dialog('close',true);
	this._datagrid = $(this._datagridId).datagrid({
		url : _self.getUrl() + "getCsmpBdCompanyinfosByPage/" + this._pid,
		onDblClickRow:function(rowIndex, rowData){
			_self.getOnClick()(rowData);
		}
	});
	_self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');

};

// 进入关系页面
CsmpBdCompanyinfo.prototype.sortset = function() {

	var rows = this._datagrid.datagrid('getChecked');
	/* alert(rows.length); */
	if (rows.length!=1) {
		$.messager.alert("提示", "请选择一条数据编辑！");
		return false;
	}

	//'csmp/basicData/csmpbdcomstr/CsmpBdComStrController/CsmpBdComStrInfo/' + rows[0].id + '/' + rows[0].companyName,
	var path = 'csmp/basicData/csmpbdcomstr/CsmpBdComStrController/CsmpBdComStrInfo?id='+ rows[0].id +'&name='+rows[0].companyName;
	this.nData = new CommonDialog("comStrInfo", "800", "500", path, "单位类别设置", false, true, false);
	this.nData.show();
};
//确认回填
CsmpBdCompanyinfo.prototype.setConpanyAlias = function() {
	var rows = this._datagrid.datagrid('getChecked');
	if (rows.length !== 1) {
		alert("请选择一条数据编辑！");
		return false;
	}
    parent.callBackDataConpany(rows[0]);
};
// 添加页面
CsmpBdCompanyinfo.prototype.insert = function() {
	var _self = this;

	this.nData = new CommonDialog("insert", "800", "500", this.getUrl() + 'Add/null', "添加", false, true, false);
	this.nData.show();
};

// 修改页面
CsmpBdCompanyinfo.prototype.modify = function() {
	var rows = this._datagrid.datagrid('getChecked');
	if (rows.length !== 1) {
		alert("请选择一条数据编辑！");
		return false;
	}
	this.nData = new CommonDialog("edit", "700", "500", this.getUrl() + 'Edit/' + rows[0].id, "修改", false, true, false);
	this.nData.show();
};

// 详细页
CsmpBdCompanyinfo.prototype.detail = function(id) {
	this.nData = new CommonDialog("edit", "700", "500", this.getUrl() + 'Detail/' + id, "详情", false, true, false);
	this.nData.show();
};
// 保存功能
CsmpBdCompanyinfo.prototype.save = function(form, callback) {

	var _self = this;

	$.ajax({
		url : _self.getUrl() + "save",
		data : {
			data : JSON.stringify(form),
			pid : this._pid
		},
		type : 'post',
		dataType : 'json',
		success : function(r) {

			if (r.flag == "success") {
				$.messager.show({
					title : '提示',
					msg : '保存成功！'
				});

				_self.reLoad();
				_self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				if (typeof (callback) == "function") {
					callback(r.id);
				}

				_self.closeDialog();
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
CsmpBdCompanyinfo.prototype.del = function() {
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l = rows.length;
	if (l > 0) {
		$.messager.confirm('请确认', '您确定要删除当前所选的数据并解除关系？', function(b) {
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
							_self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
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
CsmpBdCompanyinfo.prototype.reLoad = function() {

	this._datagrid.datagrid('load', {});
};
// 关闭对话框
CsmpBdCompanyinfo.prototype.closeDialog = function(id) {
	$(id).dialog('close');
};

/*
 * //打开查询框 CsmpBdCompanyinfo.prototype.openSearchForm =function(){
 * this.searchDialog.dialog('open',true); };
 */
// 去后台查询
CsmpBdCompanyinfo.prototype.searchData = function(nodeObject) {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	// 将form表单序列化成一个json对象
	this._datagrid.datagrid('load', {param : JSON.stringify(serializeObject(this.searchForm))
	});
};
/*
 * //隐藏查询框 CsmpBdCompanyinfo.prototype.hideSearchForm =function(){
 * this.searchDialog.dialog('close',true); };
 */
/* 清空查询条件 */
CsmpBdCompanyinfo.prototype.clearData = function() {
	var v=$("#nodeId").attr("value");
	this.searchForm.find('input').val('');
	$("#nodeId").attr("value",v);
	this.searchData();
};
CsmpBdCompanyinfo.prototype.formate = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
CsmpBdCompanyinfo.prototype.formateDateTime = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};

CsmpBdCompanyinfo.prototype.companyLevel = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_COMPANYINFO_COMPANY_LEVEL', function(r) {
	r && (CsmpBdCompanyinfo.prototype.companyLevel = r);
});
CsmpBdCompanyinfo.prototype.country = [];
Platform6.fn.lookup.getLookupType('PLATFORM_NATION', function(r) {
	r && (CsmpBdCompanyinfo.prototype.country = r);
});
CsmpBdCompanyinfo.prototype.businessNature = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_BUSINESS_NATURE', function(r) {
	r && (CsmpBdCompanyinfo.prototype.businessNature = r);
});
CsmpBdCompanyinfo.prototype.operatingStatus = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_OPERATING_STATUS', function(r) {
	r && (CsmpBdCompanyinfo.prototype.operatingStatus = r);
});
CsmpBdCompanyinfo.prototype.language = [];
Platform6.fn.lookup.getLookupType('CSMP_BD_COMPANYINFO_LANGUAGE', function(r) {
	r && (CsmpBdCompanyinfo.prototype.language = r);
});
