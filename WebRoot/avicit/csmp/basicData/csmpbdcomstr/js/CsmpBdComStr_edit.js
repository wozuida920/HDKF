/**
 * 针对于维护关系表的编辑按钮功能
 */
var edit_isEdit = false;
var rows = null;//所有的选中行
var row0 = null;//第一行
var isEdit = false;//是否正在编辑
var index = -1;//编辑页面打开的索引位置
var comStrType='';
function CsmpBdComStr_edit(){
	rows = dg.datagrid('getChecked');
	if(rows.length !== 1){
		alert("请选择一条数据编辑！");
		return false;
	}
	index = dg.datagrid('getRowIndex',rows[0]);
	
	if(!isEdit&&!edit_isEdit){
		
		dg.datagrid('beginEdit',index);
		row0 = rows[0];
		a_1(row0);
		
		edit_isEdit = true;
		isEdit = true;
	}
}


//重新加载dg,防止出现无法添加行
function cancelInsert(){
	dg.datagrid('rejectChanges');
	csmpBdComStr.reLoad();
	isEdit = false;
	edit_isEdit = false;
}


//点击添加后在dg中添加一条空记录
function insertAnewRow(){
	if(isEdit!=true){
			index = 0;
			dg.datagrid('insertRow',{
				index:index,
				row:{
					companyCode:compCode,
					companyName:compName,
					comId:compId,
					id:'',
					selected:true
				}
			});
			dg.datagrid('beginEdit',index);
			dg.datagrid('selectRow',index);
			a();
			isEdit = true;
	}else{
		$.messager.show({
			title:'提示',
			msg:'有未保存的数据..'
		});
		return false;
	}
}
/************************************************/

//加载单位分类ajax
function a(){
	var ed1 = dg.datagrid('getEditor', //获取单位类型的编辑器
			{
		index : index,
		field : 'catalogType'
	});
	var ed = dg.datagrid('getEditor', //
			{
				index :index,
				field : 'catalogName'
			});
	$(ed1.target).combo('setText','');//选择之后将单位类型也手动为空
	$.ajax({
		url:'platform/csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController/loadUnitData/'+compId,
		type:'post',
		dataType : 'json',
		success:function(r){
			var data = JSON.parse(r.unitJson);
			$(ed.target).combobox({
				onSelect:function(rec){
					comStrType=rec.attributes.CatalogType;
					$.ajax({
						url:'platform/csmp/basicData/csmpbdcomstr/CsmpBdComStrController/getCustructType/'+rec.attributes.CatalogType,
						type:'post',
						dataType : 'text',
						success:function(r){
							$(ed1.target).combo('setText',r);
						}
					});
				}
			}).combobox('loadData', data);
		}
	});
}

//保存新数据到dg中
function saveNewRow(){
	if(isEdit){
	var obj = {};
	//rows = dg.datagrid('getRows');
	rows = dg.datagrid('getChecked');
	if(rows.length != 1||rows[0].id!=""){
		$.messager.show({
			title:'提示',
			msg:'请选择一条未保存的数据..'
		});
		return false;
	}
	if(!rows[0].id){
		var newRow = dg.datagrid('validateRow',0);
		if(newRow){
			dg.datagrid('endEdit',0);
			obj = {};
			obj.strId = rows[0].catalogName;
			obj.comId = rows[0].comId;
			obj.remark = rows[0].remark;
			obj.id = rows[0].id;
			obj.comType=comStrType;
		}else{
			//obj.comType="";
			return false;
		}
	}else{
		//编辑保存
		var newRow = dg.datagrid('validateRow',index);
		//return false;
		if(newRow){
			dg.datagrid('endEdit',index);
			rows = dg.datagrid('getRows');
			obj.strId = rows[index].catalogName;
			obj.comId = rows[index].comId;
			obj.remark = rows[index].remark;
			obj.id = rows[index].id;
		}else{
			return false;
		}
	}
	
	$.ajax({
		async:false,
		url:csmpBdComStr.getUrl()+"save",
	 	data : {data :JSON.stringify(obj)},
		type:'post',
		dataType : 'json',
		success:function(r){
			csmpBdComStr.init();
			isEdit = false;
			edit_isEdit = false;
			rows=[];
			parent.csmpBdCompanyinfo.init();
			//parent.csmpBdCompanyinfo.reLoad();
		}
	});	
	}
}


function a_1(rr){
	var ed1 = dg.datagrid('getEditor', //获取单位类型的编辑器
			{
		index : index,
		field : 'catalogType'
	});
	var ed = dg.datagrid('getEditor', //
			{
				index :index,
				field : 'catalogName'
			});
	//$(ed1.target).combo('setText','');//选择之后将单位类型ed也手动为空
	$.ajax({
		async:false,
		url:'platform/csmp/basicData/csmpbdcompanystructure/CsmpBdCompanystructureController/loadUnitData/'+rr.comId,
		type:'post',
		dataType : 'json',
		success:function(r){
			var data = JSON.parse(r.unitJson);
			var arr = [];
			for(var i=0;i<data.length;i++){
				arr.push(data[i]);
			}
			if(rr){
				var o = {};
				o.text = rr.catalogName;
				o.id = rr.strId;
				o.children = [];
				arr.push(o);
			}
			$(ed.target).combobox({
				onSelect:function(rec){
					$(ed1.target).combo('setText',rec.text);
				}
			}).combobox('loadData', arr).combobox('select',rr.strId);
		}
	});
}
