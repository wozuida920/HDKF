/**


 * 
 */


var selectDeviceNo,selectDeviceName,selectType,selectUnit,selectPrice,
selectSpecification,selectLiabilityUnit,selectCategory,selectIsRandompart,selectValidate,
selectRemark;
var selectTaskNo,selectTaskId;
function timestamp(url){  
    //  var getTimestamp=Math.random();  
      var getTimestamp=new Date().getTime();  
     if(url.indexOf("?")>-1){  
       url=url+"&tamp="+getTimestamp;
     }else{  
       url=url+"?timestamp="+getTimestamp;
     }  
    // alert(url);
     return url;  
   }

function HdkfSupportDeviceDetail(datagrid,searchD,url,form){
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
HdkfSupportDeviceDetail.prototype.init=function(){
	var _self = this;
	this._datagrid=$(this._datagridId).datagrid({
		url:timestamp(this._url +'getHdkfSupportDeviceDetailsByPage1.json'),
		queryParams:{"taskId":taskIdR},
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
//打开任务书选择页面
function openDialogTripTask() {
	this.nData = new CommonDialog("model4", "790", "600", 
			"hdkf/support/hdkfsupportdevicedetail/HdkfSupportDeviceDetailController/HdkfSupportTripTaskSelect",
			"任务书选择", false, true, false);
	this.nData.show();
};
function setTripTaskData(data) {
	$("#model4").dialog("close");

    $(selectTaskId).val(data.id);
    
    $(selectTaskNo).val(data.taskNo);
   

};


//打开选择产品名称页面
function openDialogSparePart() {
	this.nData = new CommonDialog("model3", "790", "600", "hdkf/support/hdkfsupportrequestinfo/HdkfSupportRequestInfoController/HdkfBdSparepartInfoSelect", "产品选择", false, true, false);
	this.nData.show();
};
function setSparePartTextAndChapter(data) {
$("#model3").dialog("close");
	
	
    $(selectDeviceNo).val(data.drawingNo);
    
    $(selectDeviceName).val(data.productName);
    
  
    var classifyDeptV = data.classifyDept;
    if(classifyDeptV=='成品')
      $(selectType).combobox('setValue', 'engineering');
    else if(classifyDeptV=='材料')
        $(selectType).combobox('setValue', 'quality');
    else  if(classifyDeptV=='转包')
        $(selectType).combobox('setValue', 'purchase');
    
 
    $(selectUnit).combobox('setValue', data.unit);
   // $(selectPrice).val(data.taxPrice);
    $(selectSpecification).val(data.specification);
    $(selectLiabilityUnit).val(data.liabilityUnit);
   // $(selectCategory).val(data.category);
    
    var catagoryR = data.category;
    //alert("catagoryR-->"+catagoryR);
    if(catagoryR=='国产成品')
       $(selectCategory).combobox('setValue', 'chainProduct');
    else if(catagoryR=='进口成品')
       $(selectCategory).combobox('setValue', 'importsProduct');
    else if(catagoryR=='自制件')
        $(selectCategory).combobox('setValue', 'selfMadeComponent');
    else if(catagoryR=='标准件')
        $(selectCategory).combobox('setValue', 'standardComponent');
    else if(catagoryR=='消耗件')
        $(selectCategory).combobox('setValue', 'consumptivePart');
   // $(selectIsRandompart).val(data.isRandompart);
    $(selectIsRandompart).combobox('setValue', data.isRandompart);
   // $(selectValidate).val(data.validFlag);
    //alert(data.validFlag);
    
    var validFlagR = data.validFlag;
    if(validFlagR=='Y')
    	$(selectValidate).combobox('setValue','1');
    else if(validFlagR=='Y')
    	$(selectValidate).combobox('setValue','0'); 
   
    $(selectRemark).val(data.remark);

};


 //添加
HdkfSupportDeviceDetail.prototype.insert=function(){
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
                var ed = temp.datagrid('getEditor',{index:0,field: 'deviceType' });
                $(ed.target).combobox( 'loadData' , this.deviceType);
                
                
                
                var taskIdCell = temp.datagrid('getEditor',{index:0,field: 'taskId' });
                var taskNoCell = temp.datagrid('getEditor',{index:0,field: 'taskNo' });
                
                
                
                
                
                var deviceNoCell = temp.datagrid('getEditor',{index:0,field: 'deviceNo' });
                var deviceNameCell = temp.datagrid('getEditor',{index:0,field: 'deviceName' });
                var typeCell = temp.datagrid('getEditor',{index:0,field: 'deviceType' });
                var unitCell =  temp.datagrid('getEditor',{index:0,field: 'unit' });
              //  var priceCell =  temp.datagrid('getEditor',{index:0,field: 'price' });
                var specificationCell = temp.datagrid('getEditor',{index:0,field: 'specifications' });
                var liabilityUnitCell = temp.datagrid('getEditor',{index:0,field: 'liabilityUnit' });
                var categoryCell =  temp.datagrid('getEditor',{index:0,field: 'categorys' });
                var isRandompartCell = temp.datagrid('getEditor',{index:0,field: 'isRandompart' });
                var validateCell = temp.datagrid('getEditor',{index:0,field: 'validateFlag' });
              //  var serOwnedCell = temp.datagrid('getEditor',{index:0,field: 'serOwned' });
                var remarkCell = temp.datagrid('getEditor',{index:0,field: 'remark' });
               // element.onfocus = 
//                $(deviceNoCell.target).onfocus=function(){
//                    // element 获得焦点之后执行这里面的代码
//                   
//                };
                
                selectTaskId = taskIdCell.target;
                selectTaskNo = taskNoCell.target;
                
              
                
                selectDeviceNo = deviceNoCell.target;
                selectDeviceName =deviceNameCell.target;
                selectType = typeCell.target;
                selectUnit = unitCell.target;
                //selectPrice = priceCell.target;
                selectSpecification = specificationCell.target;
                selectLiabilityUnit = liabilityUnitCell.target;
                selectCategory = categoryCell.target;
                selectIsRandompart= isRandompartCell.target;
                selectValidate = validateCell.target;
            //    selectSerOwned = serOwnedCell.target;
                selectRemark = remarkCell.target;
                
                $(selectTaskId).val(taskIdR);
            
                $(selectTaskNo).val(taskNoR);
                $(deviceNoCell.target).focus(function()
                {
                	 //alert('获得了焦点');
                     openDialogSparePart();
                		});
                
//                $(taskIdCell.target).focus(function()
//                {
//                	 alert('获得了焦点');
//                	  $(selectTaskId).val(taskIdR);
//                      
//                      $(selectTaskNo).val(taskNoR);
//                      
//               		});
//                
                
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
											                var ed = temp.datagrid('getEditor',{index:0,field: 'unit' });
                $(ed.target).combobox( 'loadData' , this.unit);
                
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
											                var ed = temp.datagrid('getEditor',{index:0,field: 'categorys' });
                $(ed.target).combobox( 'loadData' , this.categorys);
                
											                var ed = temp.datagrid('getEditor',{index:0,field: 'isRandompart' });
                $(ed.target).combobox( 'loadData' , this.isRandompart);
                
											                var ed = temp.datagrid('getEditor',{index:0,field: 'validateFlag' });
                $(ed.target).combobox( 'loadData' , this.validateFlag);
                
											                var ed = temp.datagrid('getEditor',{index:0,field: 'serOwned' });
                $(ed.target).combobox( 'loadData' , this.serOwned);
                
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
HdkfSupportDeviceDetail.prototype.save=function(){
	if(!this.endEdit()){
		$.messager.alert('提示','不能保存，请确保上一条数据填写完整','warning');
		return false;
	}
	var rows = this._datagrid.datagrid('getChanges');
	var data =JSON.stringify(rows);
	var _self = this;
	var numberRex = /^[0-9]*$/;
	var flag = false;
	for(var i = 0; i < rows.length; i++){
		if(!numberRex.test(rows[i].singleNumber) ){
			flag = true;
			break;
		}
	}
	if(flag){
		alert('器材数量必须为整数！');
		//_self._datagrid.datagrid('reload', {});// 刷新当前页
		 _self._datagrid.datagrid({  
			    url:timestamp(_self._url+'getHdkfSupportDeviceDetailsByPage1.json'),
			    queryParams:{  
			    	taskId:taskIdR
			    }  
			}); 
		_self._datagrid.datagrid('uncheckAll').datagrid(
		'unselectAll').datagrid('clearSelections');
		_self._indexEditing = -1;
		return false;
	}
	
	if(rows.length > 0){
		 _self._indexEditing=-1;
		 $.ajax({
			 url: this._url+'/save.json',
			 data : {datas : data},
			 type : 'post',
			 dataType : 'json',
			 success : function(r){
				 if (r.flag == "success"){
					 //_self._datagrid.datagrid('reload',{taskId:taskIdR});//刷新当前页
					 _self._datagrid.datagrid({  
						    url:timestamp(_self._url+'getHdkfSupportDeviceDetailsByPage1.json'),
						    queryParams:{  
						    	taskId:taskIdR
						    }  
						}); 
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
HdkfSupportDeviceDetail.prototype.edit=function(){
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
											                var ed = temp.datagrid('getEditor',{index:index,field: 'deviceType' });
                $(ed.target).combobox( 'loadData' , this.deviceType);
           
															/**通用代码
				var ed = temp.datagrid('getEditor',{index:0,field: 'validFlag' });
				$(ed.target).combobox( 'loadData' , this.validFlag).combobox('select',0);
				**/
											                var ed = temp.datagrid('getEditor',{index:index,field: 'unit' });
                $(ed.target).combobox( 'loadData' , this.unit);
           
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
											                var ed = temp.datagrid('getEditor',{index:index,field: 'categorys' });
                $(ed.target).combobox( 'loadData' , this.categorys);
           
											                var ed = temp.datagrid('getEditor',{index:index,field: 'isRandompart' });
                $(ed.target).combobox( 'loadData' , this.isRandompart);
           
											                var ed = temp.datagrid('getEditor',{index:index,field: 'validateFlag' });
                $(ed.target).combobox( 'loadData' , this.validateFlag);
           
											                var ed = temp.datagrid('getEditor',{index:index,field: 'serOwned' });
                $(ed.target).combobox( 'loadData' , this.serOwned);
           
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

//删除
HdkfSupportDeviceDetail.prototype.del=function(){
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
						 //_self._datagrid.datagrid('reload',{taskId:taskIdR});//刷新当前页
						 _self._datagrid.datagrid({  
							    url:timestamp(_self._url+'getHdkfSupportDeviceDetailsByPage1.json'),
							    queryParams:{  
							    	taskId:taskIdR
							    }  
							}); 
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
HdkfSupportDeviceDetail.prototype.endEdit=function(){
	if(this._indexEditing === -1) return true;
	this._isEndEdit=false;
	this._datagrid.datagrid('endEdit',this._indexEditing);
	return this._isEndEdit;
};

//打开查询框
HdkfSupportDeviceDetail.prototype.openSearchForm =function(){
	this.searchDialog.dialog('open',true);
};
//去后台查询
HdkfSupportDeviceDetail.prototype.searchData =function(){
	this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	this._datagrid.datagrid('load',{ param : JSON.stringify(serializeObject(this.searchForm))});
};
//隐藏查询框
HdkfSupportDeviceDetail.prototype.hideSearchForm =function(){
	this.searchDialog.dialog('close',true);
};
/*清空查询条件*/
HdkfSupportDeviceDetail.prototype.clearData =function(){
	this.searchForm.find('input').val('');
	this.searchData();
};
HdkfSupportDeviceDetail.prototype.formate=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd");
	}
	return '';
};
HdkfSupportDeviceDetail.prototype.formateDateTime=function(value){
	if(value){
		return new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
	return '';
};
HdkfSupportDeviceDetail.prototype.searchDataBySfn =function(conditions){
    this._datagrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    this._datagrid.datagrid('load',conditions);
};
                        HdkfSupportDeviceDetail.prototype.deviceType=[];
Platform6.fn.lookup.getLookupType('CSMP_BD_CLASSIFY_DEPT',function(r){r&&( HdkfSupportDeviceDetail.prototype.deviceType=r);});  
           HdkfSupportDeviceDetail.prototype.unit=[];
Platform6.fn.lookup.getLookupType('CSMP_SPM_UNIT',function(r){r&&( HdkfSupportDeviceDetail.prototype.unit=r);});  
                   HdkfSupportDeviceDetail.prototype.categorys=[];
Platform6.fn.lookup.getLookupType('CSMP_BD_GATEGORY',function(r){r&&( HdkfSupportDeviceDetail.prototype.categorys=r);});  
       HdkfSupportDeviceDetail.prototype.isRandompart=[];
Platform6.fn.lookup.getLookupType('CSMP_BD_RANDOMPART',function(r){r&&( HdkfSupportDeviceDetail.prototype.isRandompart=r);});  
       HdkfSupportDeviceDetail.prototype.validateFlag=[];
Platform6.fn.lookup.getLookupType('CSMP_ES_VALID_FLAG',function(r){r&&( HdkfSupportDeviceDetail.prototype.validateFlag=r);});  
       HdkfSupportDeviceDetail.prototype.serOwned=[];
Platform6.fn.lookup.getLookupType('CSMP_ES_EQUIPPED_BY_USER',function(r){r&&( HdkfSupportDeviceDetail.prototype.serOwned=r);});  