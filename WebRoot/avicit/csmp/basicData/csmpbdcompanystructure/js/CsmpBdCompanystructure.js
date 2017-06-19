/**
 * 
 */
function CsmpBdCompanystructure(tree,url,searchId){
	if(!tree || typeof(tree)!=='string'&&tree.trim()!==''){
		throw new Error("tree不能为空！");
	}
	var _selectId='';
    var	_url=url;
   
    this.level={};//级别
    this.getUrl = function(){
    	return _url;
    };
    this._searchId = "#"+searchId;
	this._treeId="#"+tree;
	this._tree={};
	this._doc = document;
	this._rootId='';
	//当前选中的node
	this._selectNode={};
	
	/***********************封装各种事件***********/
	var _onLoadSuccess=function(){};
	this.getOnLoadSuccess=function(){
		return _onLoadSuccess;
	};
	this.setOnLoadSuccess=function(func){
		_onLoadSuccess=func;
	};
	var _onSelect=function(){};
	this.getOnSelect=function(){
		return _onSelect;
	};
	this.setOnSelect=function(func){
		_onSelect=func;
	};
	var _onClick=function(){};
	this.getOnClick=function(){
		return _onClick;
	};
	this.setOnClick=function(func){
		_onClick=func;
	};
};
//初始化操作
CsmpBdCompanystructure.prototype.init=function(){
	var _self = this;
	$(this._searchId).searchbox({
	 	width: 200,
        searcher: function (value) {
        	if(value==null||value==""){
        		_self._tree.tree('reload');
        	}
        	$.ajax({
                cache: true,
                type: "post",
                url:_self.getUrl()+"/search",
                dataType:"json",
                data:{search_text:value},
                async: false,
                error: function(request) {
                	throw new Error('操作失败，服务请求状态：'+request.status+' '+request.statusText+' 请检查服务是否可用！');
                },
                success: function(data) {
					if(data){
						_self._tree.tree('loadData',data);
						_self.selectRootNode(_self);
					}else{
						_self._tree.tree('loadData',{});
					}
                }
            });
        },
        prompt: "请输入树节点名称！"
    });
	//this.setOnLoadSuccess(this.selectRootNode);
	this._tree=$(this._treeId).tree({    
		url:this.getUrl()+"/gettree/2",
		formatter:function(node){
			if(node._parentId ==="-1"){
				_self._rootId=node.id;
			}
			if(node.attributes && node.attributes.s){
				return '<a style="color:#fff;font-weight:normal;background:#3399ff;padding:0 4px;">' + node.text + '</a>';
			}else{
				return node.text;
			}
		},
		onSelect:function(node){
			_self._selectNode=node;
			_self.getOnSelect()(_self,node);
			this._datagrid=$(this._datagridId).datagrid({
				url:'platform/csmp/basicData/csmpbdcompanyinfo/CsmpBdCompanyinfoController/operation/getCsmpBdCompanyinfosByPage/'+this._pid
			});
			},
		onClick:function(node){
			_self.getOnClick()(_self,node);
			},
		onLoadSuccess:function(node, data){
			if(!node){
				_self.selectRootNode(_self);
				_self.getOnLoadSuccess()(_self,node,data);
			}
		}
	});
};
//选择根节点
CsmpBdCompanystructure.prototype.selectRootNode=function(self){

	var node = self._tree.tree('find', self._rootId);
	if(node){
		self._tree.tree('select', node.target);
	}else{
		throw new Error('根节点丢失');
	}
};
CsmpBdCompanystructure.prototype.loadNodeById=function(_self,node){
};
//添加平级菜单
/*CsmpBdCompanystructure.prototype.insert=function(){
	if(this._selectNode._parentId=== '-1'){
		alert('不能添加与'+this._selectNode.text+'平级的节点');
		return;
	}
	this._iDg = new CommonDialog("insert","700","400",this.getUrl()+'/operation/add/'+this._selectNode._parentId,"添加节点",false,true,false);
	this._iDg.show();
};*/
//添加子菜单
CsmpBdCompanystructure.prototype.insertsub=function(){
	var catalogTypeV =  $("#catalogType").combobox('getValue');
	//alert(catalogTypeV);
	$("#saveButton").linkbutton('enable');
	$("#treeManageform").form('clear'); 
	//alert("1");
	$("#catalogType").combobox('setValue',catalogTypeV);
//	alert("2");
	$("#isValid1").attr("checked",true);
	$("#isValid1").removeAttr("disabled");
	//alert("3");
	$("#isValid2").removeAttr("disabled");
	//alert("4");
	$("#treeManageform input").attr("readonly",false);
	$("#treeManageform input").attr("disabled",false);
	//alert("5");
	$("#treeManageform textarea").attr("readonly",false);
	//$("#catalogType").attr("editable",false);
	$("#catalogType").combobox({ disabled: true });
	//alert("6");
};

//编辑子菜单
CsmpBdCompanystructure.prototype.modify=function(){
	
	$("#saveButton").linkbutton('enable');
	$("#treeManageform input").attr("readonly",false);
	$("#treeManageform input").attr("disabled",false);
	$("#treeManageform textarea").attr("readonly",false);
	
	
};

CsmpBdCompanystructure.prototype.save=function(form,url,dialog,id){
	var _self = this;
	$.ajax({
		 url:url,
		 data : JSON.stringify(form),
		 type : 'post',
		 contentType : 'application/json',
		 dataType : 'json',
		 success : function(r){
			 if (r.flag == "success"){
				 if(r.type =='1'){//新建成功
					 var selected = _self._tree.tree('find',r.pid);
					 _self._tree.tree('append', {
					 	parent: selected.target,
					 	data: [r.data]
					 });
					 selected.state='open';
					 _self._tree.tree('reload');
				 }else if(r.type =='2'){//修改成功
					 $(_self._formId).form('load', form);
					 _self._tree.tree('reload');
					/*_self._tree.tree('update', {
						target : _self._selectNode.target,
						text : form.name
					});*/
					_self.closeDialog("#modify");
					
				}
				 $.messager.show({
					 title : '提示',
					 msg : '保存成功！'
				 });
				 $("#saveButton").linkbutton('disable');
				 $("#remarkAdd").attr("readonly",true);
				 $("#treeManageform input").attr("readonly",true);
				 $("#treeManageform input").attr("disabled",true);
				$("#treeManageform input[name ='isValid'] ").attr("readonly",true);
				
			 }else{
				 $.messager.show({
					 title : '提示',
					 msg : r.error
				});
			 } 
		 }
	 });
};
CsmpBdCompanystructure.prototype.del=function(){
	var node = $("#tree").tree('getSelected');
	if(node.attributes.count > 0){
		 $.messager.show({
			 title : '提示',
			 msg : '当前选中菜单含有子菜单项，请先删除子菜单！'
		});
		return;
	}
	var _self = this;
	var ids = [];
	ids.push(this._selectNode.id);
	
	  $.messager.confirm('请确认','您确定要删除当前节点？',function(b){
		 if(b){
			 $.ajax({
				 url:_self.getUrl()+'/delete',
				 data:	JSON.stringify(ids),
				 contentType : 'application/json',
				 type : 'post',
				 dataType : 'json',
				 success : function(r){
					 if (r.flag == "success") {
						 _self._tree.tree('remove',_self._selectNode.target);
						 $.messager.show({
							 title : '提示',
							 msg : '删除成功！'
						 });
						 //删除当前节点，选择父节点
						 var node =_self._tree.tree('find',_self._selectNode._parentId);
						 node.attributes.count--;
						 _self._tree.tree('select', node.target);
					}else  if(r.flag=="failed"){
						$.messager.show({
							 title : '提示',
							 msg :'删除失败，当前节点下信息表中有数据,请先删除信息表中的数据！'
						});
					}else{
						$.messager.show({
							 title : '提示',
							 msg : r.error
						});
					}
				 }
			 });
		 } 
	  });
};
//关闭对话框
CsmpBdCompanystructure.prototype.closeDialog=function(id){
	$(id).dialog('close');
};
