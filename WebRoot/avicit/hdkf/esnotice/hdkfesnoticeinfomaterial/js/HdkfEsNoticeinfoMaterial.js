/**
 * 
 */
function HdkfEsNoticeinfoMaterial(datagrid,searchD,url,form){
	if(!datagrid || typeof(datagrid)!=='string'&&datagrid.trim()!==''){
		throw new Error("datagrid不能为空！");
	}
	if(!searchD || typeof(searchD)!=='string'&&searchD.trim()!==''){
		throw new Error("查询id不能为空！");
	}
	this._datagridId="#"+datagrid;
	this._formId="#"+form;
	this._searchDiaId ="#"+searchD;
	this._doc = document;
	this._url=url;
	this.comboData ={};
	//正在编辑的行
	this._indexEditing=-1;
	//是否可以结束编辑
	this._isEndEdit=true;
	this.init.call(this);
};
//初始化操作
//通用代码 待定
/**
DemoSingleForm.prototype.validFlag=[];
Platform6.fn.lookup.getLookupType('PLATFORM_VALID_FLAG',function(r){r&&(DemoSingleForm.prototype.validFlag=r);});	
**/
HdkfEsNoticeinfoMaterial.prototype.init=function(){
	var _self = this;
	this._datagrid=$(this._datagridId).datagrid({
		url:this._url +'getHdkfEsNoticeinfoMaterialsByPage/'+bulletinIdR,
		onAfterEdit :function(rowIndex, rowData, changes){
			var rows = dg.datagrid('getRows');
			var l = rows.length;
			_self._isEndEdit=true;
		},
		onClickRow :function(rowIndex, rowData){
			if(_self._indexEditing != rowIndex &&_self.endEdit())
				_self._indexEditing=-1;
			_self.edit();
		}
	});
	var dg =this._datagrid;
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

};

function setSparePartTextAndChapter(rows) {
	$("#model3").dialog("close");
	
	
	 var dataRow= $(hdkfEsNoticeinfoMaterial._datagridId).datagrid('getData');
	 var esNoticeinfoMaterialRows = dataRow.rows;
	// alert(esNoticeinfoMaterialRows.length);
	for(var i = 0;i<esNoticeinfoMaterialRows.length;i++){
			if(esNoticeinfoMaterialRows[i].sparepartId == rows.id){
				$.messager.show({
					 title : '提示',
					 msg : '所选择的数据存在！'
				 });
				return false;
				break;
		}
	}
	
	if(true){
	//alert("1");
	$(ed2.target).val(rows.drawingNo);
	//alert("2");
	$(ed3.target).val(rows.id);
	$(ed5.target).val(rows.productName);
//	alert("3");
	//alert(rows.category);
	
	var catagoryR = rows.category;
	var  categoryR1="";
	 if(catagoryR=='国产成品')
		 categoryR1='chainProduct';
	    else if(catagoryR=='进口成品')
	    	categoryR1='importsProduct';
	    else if(catagoryR=='自制件')
	    	categoryR1='selfMadeComponent';
	    else if(catagoryR=='标准件')
	    	categoryR1='standardComponent';
	    else if(catagoryR=='消耗件')
	    	categoryR1='consumptivePart';
	//alert("categoryR1="+categoryR1);
	
	$(ed6.target).combobox({
		disabled : true
	}).combobox('loadData', hdkfEsNoticeinfoMaterial.sortKind)
			.combobox('select', categoryR1);
	$(ed7.target).combobox({
		disabled : true
	}).combobox('loadData', hdkfEsNoticeinfoMaterial.unitName).combobox(
			'select', rows.unit);
	
	}
}
 //添加
var ed;
var ed1;
var ed2;
var ed3;

var ed5;
var ed6;
var ed7;
HdkfEsNoticeinfoMaterial.prototype.insert=function(){
	if(!this.endEdit()){
		$.messager.alert('提示','不能编辑，请确保上一条数据填写完整','warning');
		return false;
	}
	var temp = this._datagrid;
	temp.datagrid('insertRow',{
		index: 0,
		row:{bulletinId:bulletinIdR,bulletinNo:bulletinNoR}
	});
	temp.datagrid('selectRow', 0).datagrid('beginEdit',0);
	this._indexEditing=0;
					

   ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
$(ed.target).combobox( 'loadData' , this.validFlag);

				 ed1 = temp.datagrid('getEditor',{index:0,field: 'equippedByUser' });
                $(ed1.target).combobox( 'loadData' , this.equippedByUser);
                
              //弹出框
            	ed2 = temp.datagrid('getEditor',{index:0,field: 'pmodel' });
            	$(ed2.target).bind("click", function(){
            		var path = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdSparepartInfoSelect";
            		var comm = new CommonDialog("model3", "700", "420", path, "备件信息选择框",false, true, false);
            		comm.show();
            		});
            	$(ed2.target).focus(); 
            	
            	ed3 = temp.datagrid('getEditor',{index:0,field: 'sparepartId' });
            	$(ed3.target).focus(); 
            	
            
            	ed5 = temp.datagrid('getEditor',{index:0,field: 'sparepartName' });
            	$(ed5.target).attr("readonly","readonly");
            	$(ed5.target).focus(); 
            	
            	ed6 = temp.datagrid('getEditor',{index:0,field: 'sortKind' });
            	$(ed6.target).focus(); 
            	
            	ed7 = temp.datagrid('getEditor',{index:0,field: 'unitName' });
            	$(ed7.target).focus(); 	
															
														
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
							
};
//保存功能
HdkfEsNoticeinfoMaterial.prototype.save=function(){
	if(!this.endEdit()){
		$.messager.alert('提示','不能保存，请确保上一条数据填写完整','warning');
		return false;
	}
	var rows = this._datagrid.datagrid('getChanges');
	var data =JSON.stringify(rows);
	var _self = this;
	if(rows.length > 0){
		 _self._indexEditing=-1;
		 $.ajax({
			 url: this._url+'/save.json',
			 data : {datas : data},
			 type : 'post',
			 dataType : 'json',
			 success : function(r){
				 if (r.flag == "success"){
					 _self._datagrid.datagrid('reload',{});//刷新当前页
					 _self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
					 
					 $.messager.show({
						 title : '提示',
						 msg : '保存成功！'
					 });
				 }else{
					 $.messager.show({
						 title : '提示',
						 msg : r.e
					});
				 } 
			 }
		 });
	 }else{
		 $.messager.show({
			 title : '提示',
			 msg : '没有要提交的数据！'
		});
	 } 
};

//编辑
HdkfEsNoticeinfoMaterial.prototype.edit=function(){
	var temp = this._datagrid;
	var rows = temp.datagrid('getChecked');
	var index = temp.datagrid('getRowIndex',rows[0]);
	//编辑正在编辑的数据
	if(this._indexEditing===index)	return true;

	if(!this.endEdit()){
		$.messager.alert('提示','不能编辑，请确保上一条数据填写完整','warning');
		return false;
	}
	var l=rows.length;
	if(l !==1){
		$.messager.alert('提示','请选择一条数据！','warning');
		return false;
	}
	temp.datagrid('beginEdit',index);
	this._indexEditing=index;
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',index);
				**/
														
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',index);
				
				**/
	ed = temp.datagrid('getEditor',{index:index,field: 'validFlag' });
	$(ed.target).combobox( 'loadData' , this.validFlag);

					 ed1 = temp.datagrid('getEditor',{index:index,field: 'equippedByUser' });
	                $(ed1.target).combobox( 'loadData' , this.equippedByUser);
	                
	              //弹出框
	            	ed2 = temp.datagrid('getEditor',{index:index,field: 'pmodel' });
	            	$(ed2.target).bind("click", function(){
	            		var path = "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdSparepartInfoSelect";
	            		var comm = new CommonDialog("model3", "700", "420", path, "备件信息选择框",false, true, false);
	            		comm.show();
	            		});
	            	$(ed2.target).focus(); 
	            	
	            	ed3 = temp.datagrid('getEditor',{index:index,field: 'sparepartId' });
	            	$(ed3.target).focus(); 
	            	
	            
	            	ed5 = temp.datagrid('getEditor',{index:index,field: 'sparepartName' });
	            	$(ed5.target).attr("readonly","readonly");
	            	$(ed5.target).focus(); 
	            	
	            	ed6 = temp.datagrid('getEditor',{index:index,field: 'sortKind' });
	            	 $(ed6.target).combobox( 'loadData' , this.sortKind);
	            	//$(ed6.target).focus(); 
	            	
	            	ed7 = temp.datagrid('getEditor',{index:index,field: 'unitName' });
	            	 $(ed7.target).combobox( 'loadData' , this.unitName);
																
															
};

//删除
HdkfEsNoticeinfoMaterial.prototype.del=function(){
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l =rows.length;
  	if(l > 0){
  		
	  $.messager.confirm('请确认','您确定要删除当前所选的数据？',function(b){
		 if(b){
			 _self._indexEditing=-1;
			 for(;l--;){
				 ids.push(rows[l].id);
			 }
			 if(ids.length ==0) return;
			 $.ajax({
				 url:_self._url+'/delete.json',
				 data:{
					 ids : ids.join(',')
				 },
				 type : 'post',
				 dataType : 'json',
				 success : function(r){
					 if (r.flag == "success") {
						 _self._datagrid.datagrid('reload',{});//刷新当前页
						 _self._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
						 $.messager.show({
							 title : '提示',
							 msg : '删除成功！'
						});
					}else{
						$.messager.show({
							 title : '提示',
							 msg : r.e
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

//结束当前编辑行
HdkfEsNoticeinfoMaterial.prototype.endEdit=function(){
	if(this._indexEditing === -1) return true;
	this._isEndEdit=false;
	this._datagrid.datagrid('endEdit',this._indexEditing);
	return this._isEndEdit;
};

//打开查询框
HdkfEsNoticeinfoMaterial.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfEsNoticeinfoMaterial.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfEsNoticeinfoMaterial.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfEsNoticeinfoMaterial.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfEsNoticeinfoMaterial.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfEsNoticeinfoMaterial.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfEsNoticeinfoMaterial.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                                            HdkfEsNoticeinfoMaterial.prototype.equippedByUser=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfEsNoticeinfoMaterial.prototype.equippedByUser=r);},true);  
                           HdkfEsNoticeinfoMaterial.prototype.validFlag=[];
Platform6.fn.lookup.getLookupType('PLATFORM_VALID_FLAG',function(r){r&&( HdkfEsNoticeinfoMaterial.prototype.validFlag=r);},true);  


//类型
HdkfEsNoticeinfoMaterial.prototype.sortKind=[];
Platform6.fn.lookup.getLookupType('CSMP_BD_GATEGORY',
		function(r){r && ( HdkfEsNoticeinfoMaterial.prototype.sortKind = r);
		});
//单位
HdkfEsNoticeinfoMaterial.prototype.unitName=[];
Platform6.fn.lookup.getLookupType('CSMP_SPM_UNIT',
		function(r){r && ( HdkfEsNoticeinfoMaterial.prototype.unitName = r);
		});  
                                                                                        