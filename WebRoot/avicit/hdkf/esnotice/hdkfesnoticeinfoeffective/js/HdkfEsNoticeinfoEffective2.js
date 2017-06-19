/**
 * 
 */
function HdkfEsNoticeinfoEffective(datagrid,searchD,url,form){
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
HdkfEsNoticeinfoEffective.prototype.init=function(){
	var _self = this;
	this._datagrid=$(this._datagridId).datagrid({
		url:this._url +'getHdkfEsNoticeinfoEffectivesByPage/'+bulletinIdR+'/getPage',
		onAfterEdit :function(rowIndex, rowData, changes){
			var rows = dg.datagrid('getRows');
			var l = rows.length;
			_self._isEndEdit=true;
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
HdkfEsNoticeinfoEffective.prototype.closeDialog=function(id){
	$(id).dialog('close');
};
 //添加
HdkfEsNoticeinfoEffective.prototype.insert=function(){
	if(!this.endEdit()){
		$.messager.alert('提示','不能编辑，请确保上一条数据填写完整','warning');
		return false;
	}
	var temp = this._datagrid;
	temp.datagrid('insertRow',{
		index: 0,
		row:{}
	});
	temp.datagrid('selectRow', 0).datagrid('beginEdit',0);
	this._indexEditing=0;
																/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
											                var ed = temp.datagrid('getEditor',{index:0,field: 'doFlag' });
                $(ed.target).combobox( 'loadData' , this.doFlag);
                
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
							
};
//保存功能
HdkfEsNoticeinfoEffective.prototype.save=function(){
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


function parseDate(dateStr){  
    var strArray = dateStr.split("-");  
    if(strArray.length == 3){  
    	var month = parseInt(strArray[1])-1;
        return new Date(strArray[0], month, strArray[2]);  
    }else{  
        return new Date();  
    }  
} 

//清空
HdkfEsNoticeinfoEffective.prototype.clear=function(){
	var rows = this._datagrid.datagrid('getChecked');
	var _self = this;
	var ids = [];
	var l =rows.length;
  	if(l > 0){
  		
	  $.messager.confirm('请确认','您确定要清空当前所选的执行数据？',function(b){
		 if(b){
			 _self._indexEditing=-1;
			 for(;l--;){
				 ids.push(rows[l].id);
			 }
			 if(ids.length ==0) return;
			 $.ajax({
				 url:_self._url+'/reset.json',
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
							 msg : '清空成功！'
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
	  $.messager.alert('提示','请选择要清空的记录！','warning');
  	}
	
};
//编辑
HdkfEsNoticeinfoEffective.prototype.edit=function(){
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
	if(!rows[0].doFlag){
	temp.datagrid('beginEdit',index);
	this._indexEditing=index;
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:index,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',index);
				**/
                var ed = temp.datagrid('getEditor',{index:index,field: 'doFlag' });
                $(ed.target).combobox( 'loadData' , this.doFlag);
           
				
            	var ed1 = temp.datagrid('getEditor', {
					index : index,
					field : 'doTime'
				});
              
            	var ed2 = temp.datagrid('getEditor', {
					index : index,
					field : 'writeName'
				});
             
            	var ed3 = temp.datagrid('getEditor', {
					index : index,
					field : 'completeDate'
				});
            
            	var ed4 = temp.datagrid('getEditor', {
					index : index,
					field : 'undoReason'
				});
                
            	var ed5 = temp.datagrid('getEditor', {
					index : index,
					field : 'userComments'
				});
               

				var ed6 = temp.datagrid('getEditor', {
					index : index,
					field : 'remarks'
				});
			
				
				
			
				
//				var doTimes= $(ed1.target).datebox('getValue');
//				  //alert("doTimes-->"+doTimes);
//				var doTime_date = parseDate(doTimes);
//				 alert("doTime_date-->"+doTime_date);
//               var completeDates= $(ed3.target).datebox('getValue');	
//               //alert("completeDates-->"+completeDates);
//				var completeDate_date = parseDate(completeDates);
//				alert("completeDate_date--->"+completeDate_date);
				
				//alert("0");
//				$(ed1.target).datebox({
//					disabled : true
//				}).datebox('setValue',doTime_date);	//这样写法是错误的，不执行
				
			//	$(ed1.target).datebox('setValue',doTime_date);	//这样写法也是错误的
//				
			//	alert("1");
//				$(ed3.target).datebox({
//					disabled : true
//				}).datebox('setValue',completeDate_date);//这样写法是错误的
				
			//	$(ed3.target).datebox('setValue',completeDate_date);//这样写法也是错误的
			//	alert("3");
//				$(ed1.target).datebox({
//					disabled : true
//				});
//				$(ed3.target).datebox({
//					disabled : true
//				});
				
				$(ed2.target).attr("disabled", true);	
				//$(ed3.target).attr("disabled", true);
				
				$(ed4.target).attr("disabled", true);	
				$(ed5.target).attr("disabled", true);	
				$(ed6.target).attr("disabled", true);	
            	
            	
				var  ynFlagVal=	$(ed.target).combobox('getValue');
				if(ynFlagVal)
					alert(ynFlagVal);
				
				else{
				//	alert("是否贯彻未赋值......");
				$(ed.target).combobox({onSelect:function(r){
					
				var  ynFlag=	$(ed.target).combobox('getValue');
					if(ynFlag=='Y'){
						alert("Y......");
						$(ed1.target).datebox({
							disabled : false
						}).datebox('setValue', planTime);
					
						$(ed2.target).val(name);
						$(ed2.target).attr("readonly", "readonly");
						
						$(ed3.target).datebox('setValue', this.completeDate).datebox(
								'setValue', completeDate);
						$(ed4.target).val("");
						$(ed4.target).attr("disabled", true);	
						$(ed5.target).attr("disabled", false);
						$(ed6.target).attr("disabled", false);
						$(ed5.target).val("");
						$(ed6.target).val("");
						
					}
					else if(ynFlag=='N'){
						$(ed1.target).datebox({
							disabled : false
						}).datebox('setValue', planTime);
					
						$(ed2.target).val(name);
						$(ed2.target).attr("readonly", "readonly");
						
						$(ed3.target).datebox('setValue', this.completeDate).datebox(
								'setValue', completeDate);
						$(ed4.target).attr("disabled", false);
						$(ed5.target).attr("disabled", false);
						$(ed6.target).attr("disabled", false);
						$(ed5.target).val("");
						$(ed6.target).val("");
					}
					}});
				}
				
				
				
				
				
            	
//				$(ed1.target).datebox({
//					disabled : true
//				}).datebox('setValue', planTime);
//			
//				$(ed2.target).val(name);
//				$(ed2.target).attr("readonly", "readonly");
//				
//				$(ed3.target).datebox('setValue', this.completeDate).datebox(
//						'setValue', completeDate);
//				
//				var valKN=  $(ed.target).combobox('getValue');
//
//
//				if (valKN == 'Y') {				
//					$(ed4.target).val("");
//					$(ed4.target).attr("disabled", true);					
//					$(ed5.target).val("");
//					$(ed6.target).val("");
//				} else if (valKN == 'N') {
//					$(ed4.target).attr("disabled", false);
//					$(ed5.target).val("");
//					$(ed6.target).val("");
//
//				}
	}//if  是否贯彻已经赋值
	else{
		
			$.messager.alert('提示','请选择一条未执行的数据！','warning');
			return false;
		
	}
			
						};

//删除
HdkfEsNoticeinfoEffective.prototype.del=function(){
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



//提交
HdkfEsNoticeinfoEffective.prototype.submit=function(){
	if(!this.endEdit()){
		
		$.messager.alert('提示','in tiijao不能保存，请确保上一条数据填写完整','warning');
		return false;
	}
	var rows = this._datagrid.datagrid('getChanges');
	
	if(rows.length>0){
		 this._indexEditing=-1;
		$.messager.alert('提示','请先保存数据','warning');
		//this.save();
	}else
	{
	//alert("0.....");	
	parent.hdkfEsNoticeinfo.reLoad();
	//alert("1");
    parent.hdkfEsNoticeinfo.closeDialog("#implement");

	
	//alert("2");
	}
	
};


//结束当前编辑行
HdkfEsNoticeinfoEffective.prototype.endEdit=function(){
	if(this._indexEditing === -1) return true;
	this._isEndEdit=false;
	this._datagrid.datagrid('endEdit',this._indexEditing);
	return this._isEndEdit;
};

//打开查询框
HdkfEsNoticeinfoEffective.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfEsNoticeinfoEffective.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfEsNoticeinfoEffective.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfEsNoticeinfoEffective.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfEsNoticeinfoEffective.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfEsNoticeinfoEffective.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfEsNoticeinfoEffective.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                                    HdkfEsNoticeinfoEffective.prototype.doFlag=[];
Platform6.fn.lookup.getLookupType('PLATFORM_YES_NO_FLAG',function(r){r&&( HdkfEsNoticeinfoEffective.prototype.doFlag=r);},true);  
                                                                                                                