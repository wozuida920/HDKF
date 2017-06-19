﻿/**
 * 
 */
function HdkfSupportPersonDetail(datagrid, searchD, url, form) {
	if (!datagrid || typeof (datagrid) !== 'string' && datagrid.trim() !== '') {
		throw new Error("datagrid不能为空！");
	}
	if (!searchD || typeof (searchD) !== 'string' && searchD.trim() !== '') {
		throw new Error("查询id不能为空！");
	}
	this._datagridId = "#" + datagrid;
	this._formId = "#" + form;
	this._searchDiaId = "#" + searchD;
	this._doc = document;
	this._url = url;
	this.comboData = {};
	// 正在编辑的行
	this._indexEditing = -1;
	// 是否可以结束编辑
	this._isEndEdit = true;
	this.init.call(this);
};
// 初始化操作
// 通用代码 待定
/**
 * DemoSingleForm.prototype.validFlag=[];
 * Platform6.fn.lookup.getLookupType('PLATFORM_VALID_FLAG',function(r){r&&(DemoSingleForm.prototype.validFlag=r);});
 */
HdkfSupportPersonDetail.prototype.init = function() {
	var _self = this;
	this._datagrid = $(this._datagridId).datagrid({
		url : this._url + 'getHdkfSupportPersonDetailsByPage.json?borrowInfoId=' + borrowInfoId,
		onAfterEdit : function(rowIndex, rowData, changes) {
			var rows = dg.datagrid('getRows');
			var l = rows.length;
			_self._isEndEdit = true;
		},
		onClickRow : function(rowIndex, rowData) {
			if (_self._indexEditing != rowIndex && _self.endEdit())
				_self._indexEditing = -1;
			_self.edit();
		}
	});
	var dg = this._datagrid;
/*	this.searchDialog = $(this._searchDiaId).css('display', 'block').dialog({
		title : '查询'
	});
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup', function(e) {
		if (e.keyCode == 13) {
			_self.searchData();
		}
	});
	this.searchDialog.dialog('close', true);*/
	
	this.searchDialog =$(this._searchDiaId).css('display','block').dialog({
		title:'查询'
	});
	this.searchForm = $(this._formId).form();
	this.searchForm.find('input').on('keyup',function(e){
		if(e.keyCode == 13){
			_self.searchData();
		}
	});
	this.searchDialog.dialog('close', true);

};
// 添加
HdkfSupportPersonDetail.prototype.insert = function() {
	if (!this.endEdit()) {
		$.messager.alert('提示', '不能编辑，请确保上一条数据填写完整', 'warning');
		return false;
	}
	var temp = this._datagrid;
	temp.datagrid('insertRow', {
		index : 0,
		row : {}
	});
	temp.datagrid('selectRow', 0).datagrid('beginEdit', 0);
	this._indexEditing = 0;
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	
	var ed = temp.datagrid('getEditor', {
		index : 0,
		field : 'borrowInfoId'
	});
	$(ed.target).val(borrowInfoId);
	
	var ed = temp.datagrid('getEditor', {
		index : 0,
		field : 'sex'
	});
	$(ed.target).combobox('loadData', this.sex);
	
	
	
	
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */

};
// 保存功能
HdkfSupportPersonDetail.prototype.save = function() {
	if (!this.endEdit()) {
		$.messager.alert('提示', '不能保存，请确保上一条数据填写完整', 'warning');
		return false;
	}
	var rows = this._datagrid.datagrid('getChanges');
	//var phoneReg = /^1[3,4,5,8]{1}[0-9]{1}[0-9]{8}$/;
	var phoneReg = /^1[3-8]+\d{9}$/;
	var cardIdReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	var flag = false;
	for(var i = 0; i < rows.length; i++){
		if(!phoneReg.test(rows[i].phone) || !cardIdReg.test(rows[i].cardId)){
			flag = true;
			break;
		}
	}
	if(flag){
		alert('请正确填写身份证号和手机号！');
		return;
	}
	var data = JSON.stringify(rows);
	var _self = this;
	if (rows.length > 0) {
		_self._indexEditing = -1;
		$.ajax({
			url : this._url + '/save.json',
			data : {
				datas : data
			},
			type : 'post',
			dataType : 'json',
			success : function(r) {
				if (r.flag == "success") {
					_self._datagrid.datagrid('reload', {});// 刷新当前页
					_self._datagrid.datagrid('uncheckAll').datagrid(
							'unselectAll').datagrid('clearSelections');

					$.messager.show({
						title : '提示',
						msg : '保存成功！'
					});
				} else {
					$.messager.show({
						title : '提示',
						msg : r.e
					});
				}
			}
		});
	} else {
		$.messager.show({
			title : '提示',
			msg : '没有要提交的数据！'
		});
	}
};

// 编辑
/*HdkfSupportPersonDetail.prototype.edit = function() {
	var temp = this._datagrid;
	var rows = temp.datagrid('getChecked');
	var index = temp.datagrid('getRowIndex', rows[0]);
	// 编辑正在编辑的数据
	if (this._indexEditing === index)
		return true;

	if (!this.endEdit()) {
		$.messager.alert('提示', '不能编辑，请确保上一条数据填写完整', 'warning');
		return false;
	}
	var l = rows.length;
	if (l !== 1) {
		$.messager.alert('提示', '请选择一条数据！', 'warning');
		return false;
	}
	temp.datagrid('beginEdit', index);
	this._indexEditing = index;
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	var ed = temp.datagrid('getEditor', {
		index : index,
		field : 'sex'
	});
	$(ed.target).combobox('loadData', this.sex);

	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
	*//**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 *//*
};*/

// 删除
HdkfSupportPersonDetail.prototype.del = function() {
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l = rows.length;
	if (l > 0) {

		$.messager.confirm('请确认', '您确定要删除当前所选的数据？', function(b) {
			if (b) {
				_self._indexEditing = -1;
				for (; l--;) {
					ids.push(rows[l].id);
				}
				if (ids.length == 0)
					return;
				$.ajax({
					url : _self._url + '/delete.json',
					data : {
						ids : ids.join(',')
					},
					type : 'post',
					dataType : 'json',
					success : function(r) {
						if (r.flag == "success") {
							_self._datagrid.datagrid('reload', {});// 刷新当前页
							_self._datagrid.datagrid('uncheckAll').datagrid(
									'unselectAll').datagrid('clearSelections');
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
							});
						} else {
							$.messager.show({
								title : '提示',
								msg : r.e
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

// 结束当前编辑行
HdkfSupportPersonDetail.prototype.endEdit = function() {
	if (this._indexEditing === -1)
		return true;
	this._isEndEdit = false;
	this._datagrid.datagrid('endEdit', this._indexEditing);
	return this._isEndEdit;
};

// 打开查询框
HdkfSupportPersonDetail.prototype.openSearchForm = function() {
	this.searchDialog.dialog('open', true);
};
// 去后台查询
HdkfSupportPersonDetail.prototype.searchData = function() {
/*	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', {
		param : JSON.stringify(serializeObject(this.searchForm))
	});*/
	
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
// 隐藏查询框
HdkfSupportPersonDetail.prototype.hideSearchForm = function() {
	this.searchDialog.dialog('close', true);
};
/* 清空查询条件 */
HdkfSupportPersonDetail.prototype.clearData = function() {
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfSupportPersonDetail.prototype.formate = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportPersonDetail.prototype.formateDateTime = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportPersonDetail.prototype.searchDataBySfn = function(conditions) {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', conditions);
};
HdkfSupportPersonDetail.prototype.sex = [];
Platform6.fn.lookup.getLookupType('PLATFORM_SEX', function(r) {
	r && (HdkfSupportPersonDetail.prototype.sex = r);
});
