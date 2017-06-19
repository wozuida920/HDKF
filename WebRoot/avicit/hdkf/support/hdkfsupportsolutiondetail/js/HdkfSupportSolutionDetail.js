/**
 * 
 * 
 */
function formatterDate(date) {
	alert("here");
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
			+ (date.getMonth() + 1);
	return date.getFullYear() + '-' + month + '-' + day;
}
function timestamp(url) {
	// var getTimestamp=Math.random();
	var getTimestamp = new Date().getTime();
	if (url.indexOf("?") > -1) {
		url = url + "&tamp=" + getTimestamp;
	} else {
		url = url + "?timestamp=" + getTimestamp;
	}
	// alert(url);
	return url;
}
function HdkfSupportSolutionDetail(datagrid, searchD, url, form) {
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
HdkfSupportSolutionDetail.prototype.init = function() {
	var _self = this;
	this._datagrid = $(this._datagridId).datagrid(
			{
				url : timestamp(this._url
						+ 'getHdkfSupportSolutionDetailsByPage.json'),
				queryParams : {
					"infoCardNo" : infoCardNoR
				},
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

};
// 添加
HdkfSupportSolutionDetail.prototype.insert = function() {
	if (!this.endEdit()) {
		$.messager.alert('提示', '不能编辑，请确保上一条数据填写完整', 'warning');
		return false;
	}
	var temp = this._datagrid;
	temp.datagrid('insertRow', {
		index : 0,
		row : {dealUserId:dealUserIdR,dealUserName:dealUserNameR,infoCardNo:infoCardNoR}
	});
	temp.datagrid('selectRow', 0).datagrid('beginEdit', 0);
	this._indexEditing = 0;

//	var ed = temp.datagrid('getEditor', {
//		index : 0,
//		field : 'dealUserId'
//	});
//
//	$(ed.target).val(dealUserIdR);
//	$(ed.target).attr("readonly", true);
//
//	var ed = temp.datagrid('getEditor', {
//		index : 0,
//		field : 'dealUserName'
//	});
//
//	$(ed.target).val(dealUserNameR);
//
//	var ed = temp.datagrid('getEditor', {
//		index : 0,
//		field : 'infoCardNo'
//	});
//
//	$(ed.target).val(infoCardNoR);
//	$(ed.target).attr("readonly", true);

//	var ed = temp.datagrid('getEditor', {
//		index : 0,
//		field : 'doneTime'
//	});

//	var doneTime_now = new Date();
	//alert(doneTime_now);
	//alert(formatterDate(doneTime_now));
	//$(ed.target).datebox('setValue', (doneTime_now));

	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
	 * $(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
	 */
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
HdkfSupportSolutionDetail.prototype.save = function() {
	
	if (!this.endEdit()) {
		$.messager.alert('提示', '不能保存，请确保上一条数据填写完整', 'warning');
//
//		_self._datagrid.datagrid({
//			url : timestamp(_self._url
//					+ 'getHdkfSupportSolutionDetailsByPage.json'),
//			queryParams : {
//				infoCardNo : infoCardNoR
//			}
//		});
//		_self._indexEditing = -1;
		return false;
	}
	var rows = this._datagrid.datagrid('getChanges');
	var data = JSON.stringify(rows);
	var _self = this;
	
	for(var i=0;i<rows.length;i++){
		//alert(rows[i].dealUserName);
		//alert(dealUserNameR);
		if(rows[i].dealUserName!=dealUserNameR){

			
			$.messager.alert('提示', '不能保存，请确保只能更改自己的所写的意见', 'warning');
			_self._datagrid.datagrid({
				url : timestamp(_self._url
						+ 'getHdkfSupportSolutionDetailsByPage.json'),
				queryParams : {
					infoCardNo : infoCardNoR
				}
			});
			_self._datagrid.datagrid('uncheckAll').datagrid(
			'unselectAll').datagrid('clearSelections');
			_self._indexEditing = -1;
		
		    return false;
		}
	}

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
					// _self._datagrid.datagrid('reload',{});//刷新当前页

					_self._datagrid.datagrid({
						url : timestamp(_self._url
								+ 'getHdkfSupportSolutionDetailsByPage.json'),
						queryParams : {
							infoCardNo : infoCardNoR
						}
					});

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
HdkfSupportSolutionDetail.prototype.edit = function() {
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
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
	/**
	 * 通用代码 var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag'
	 * }); $(ed.target).combobox( 'loadData' ,
	 * this.validFlag).combobox('select',index);
	 */
};

// 删除
HdkfSupportSolutionDetail.prototype.del = function() {
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l = rows.length;
	
	
	for(var i=0;i<rows.length;i++){
		//alert(rows[i].dealUserName);
		//alert(dealUserNameR);
		if(rows[i].dealUserName!=dealUserNameR){

			
			$.messager.alert('提示', '不能保存，请确保只能更改自己的所写的意见', 'warning');
			_self._datagrid.datagrid({
				url : timestamp(_self._url
						+ 'getHdkfSupportSolutionDetailsByPage.json'),
				queryParams : {
					infoCardNo : infoCardNoR
				}
			});
			_self._datagrid.datagrid('uncheckAll').datagrid(
			'unselectAll').datagrid('clearSelections');
			_self._indexEditing = -1;
		
		    return false;
		}
	}
	
	
	
	if (l > 0) {

		$.messager
				.confirm(
						'请确认',
						'您确定要删除当前所选的数据？',
						function(b) {
							if (b) {
								_self._indexEditing = -1;
								for (; l--;) {
									ids.push(rows[l].id);
								}
								if (ids.length == 0)
									return;
								$
										.ajax({
											url : _self._url + '/delete.json',
											data : {
												ids : ids.join(',')
											},
											type : 'post',
											dataType : 'json',
											success : function(r) {
												if (r.flag == "success") {
													// _self._datagrid.datagrid('reload',{});//刷新当前页
													_self._datagrid
															.datagrid({
																url : timestamp(_self._url
																		+ 'getHdkfSupportSolutionDetailsByPage.json'),
																queryParams : {
																	infoCardNo : infoCardNoR
																}
															});
													_self._datagrid
															.datagrid(
																	'uncheckAll')
															.datagrid(
																	'unselectAll')
															.datagrid(
																	'clearSelections');
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
HdkfSupportSolutionDetail.prototype.endEdit = function() {
	if (this._indexEditing === -1)
		return true;
	this._isEndEdit = false;
	this._datagrid.datagrid('endEdit', this._indexEditing);
	return this._isEndEdit;
};

// 打开查询框
HdkfSupportSolutionDetail.prototype.openSearchForm = function() {
	this.searchDialog.dialog('open', true);
};
// 去后台查询
HdkfSupportSolutionDetail.prototype.searchData = function() {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', {
		param : JSON.stringify(serializeObject(this.searchForm))
	});
};
// 隐藏查询框
HdkfSupportSolutionDetail.prototype.hideSearchForm = function() {
	this.searchDialog.dialog('close', true);
};
/* 清空查询条件 */
HdkfSupportSolutionDetail.prototype.clearData = function() {
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfSupportSolutionDetail.prototype.formate = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportSolutionDetail.prototype.formateDateTime = function(value) {
	if (value) {
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportSolutionDetail.prototype.searchDataBySfn = function(conditions) {
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
			'clearSelections');
	this._datagrid.datagrid('load', conditions);
};
