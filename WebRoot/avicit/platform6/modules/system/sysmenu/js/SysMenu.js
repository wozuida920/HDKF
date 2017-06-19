function SysMenu(i,b,a,c){if(!i||typeof(i)!=="string"&&i.trim()!==""){throw new Error("tree不能为空！")}var e="";var f=b;this.level={};this.getUrl=function(){return f};this._searchId="#"+a;this._treeId="#"+i;this._tree={};this._doc=document;this._formId="#"+c;this._rootId="";this._selectNode={};this._iDg={};this._eDg={};this._cData={};var d=function(){};this.getOnLoadSuccess=function(){return d};this.setOnLoadSuccess=function(j){d=j};var h=function(){};this.getOnSelect=function(){return h};this.setOnSelect=function(j){h=j};var g=function(){};this.getOnClick=function(){return g};this.setOnClick=function(j){g=j};this.init.call(this)}SysMenu.prototype.init=function(){var a=this;$(this._searchId).searchbox({width:200,searcher:function(b){if(b==null||b==""){a._tree.tree("reload");return}$.ajax({cache:true,type:"post",url:a.getUrl()+"/search",dataType:"json",data:{search_text:b},async:false,error:function(c){throw new Error("操作失败，服务请求状态："+c.status+" "+c.statusText+" 请检查服务是否可用！")},success:function(c){if(c){a._tree.tree("loadData",c)}else{a._tree.tree("loadData",{})}}})},prompt:"请输入菜单名称！"});this.setOnLoadSuccess(this.selectRootNode);this.setOnSelect(this.loadMenuById);this._tree=$(this._treeId).tree({url:this.getUrl()+"/sysmenutree/2",formatter:function(b){if(b._parentId==="-1"){a._rootId=b.id}if(b.attributes.va==="0"&&b.attributes.s){return'<a style="color:red;font-weight:normal;background:#3399ff;padding:0 4px;">'+b.text+"</a>"}else{if(b.attributes.va==="1"&&b.attributes.s){return'<a style="color:#fff;font-weight:normal;background:#3399ff;padding:0 4px;">'+b.text+"</a>"}else{if(b.attributes.va==="0"){return'<a style="color:red;">'+b.text+"</a>"}else{return b.text}}}},onSelect:function(b){a._selectNode=b;if(b.attributes.isMenu=="0"){$(".res").css("display","none")}else{$(".res").css("display","table-row")}a.getOnSelect()(a,b)},onClick:function(b){a.getOnClick()(a,b)},onLoadSuccess:function(b,c){if(!b){a.getOnLoadSuccess()(a,b,c)}}})};SysMenu.prototype.selectRootNode=function(a){var b=a._tree.tree("find",a._rootId);if(b){a._tree.tree("select",b.target)}};SysMenu.prototype.loadMenuById=function(a,b){$.ajax({cache:true,type:"get",url:a.getUrl()+"/sysmenu/"+b.id,dataType:"json",async:false,error:function(c){throw new Error("操作失败，服务请求状态："+c.status+" "+c.statusText+" 请检查服务是否可用！")},success:function(c){$(a._formId).form("load",c)}})};SysMenu.prototype.insert=function(){if(this._selectNode._parentId==="-1"){alert("不能添加与"+this._selectNode.text+"平级的菜单");return}this._iDg=new CommonDialog("insert","700","400",this.getUrl()+"/operation/add/"+this._selectNode._parentId,"添加菜单",false,true,false);this._iDg.show()};SysMenu.prototype.insertsub=function(){if(this._selectNode.attributes.isMenu=="0"){alert("资源下面不能在添加菜单!");return}this._iDg=new CommonDialog("insert","700","400",this.getUrl()+"/operation/add/"+this._selectNode.id,"添加菜单",false,true,false);this._iDg.show()};SysMenu.prototype.insertRes=function(){if(this._selectNode.attributes.isMenu=="0"){alert("资源下面不能在添加资源!");return}this._iDg=new CommonDialog("insertRes","700","400",this.getUrl()+"/res/add/"+this._selectNode.id,"添加资源",false,true,false);this._iDg.show()};SysMenu.prototype.modify=function(){if(this._selectNode.attributes.isMenu=="0"){alert("不能编辑资源!");return}this._eDg=new CommonDialog("modify","700","400",this.getUrl()+"/operation/modify/"+this._selectNode.id,"编辑菜单",false,true,false);this._eDg.show()};SysMenu.prototype.modifyRes=function(){if(this._selectNode.attributes.isMenu=="1"){alert("不能编辑菜单!");return}this._eDg=new CommonDialog("modifyRes","700","400",this.getUrl()+"/res/modify/"+this._selectNode.id,"编辑资源",false,true,false);this._eDg.show()};SysMenu.prototype.openLanguageForm=function(){if(this._selectNode.attributes.isMenu=="0"){alert("资源没有多语言!");return}this._cData=new CommonDialog("chooseL","700","400",this.getUrl()+"/chooseLanguage/"+this._selectNode.id,"多语言设置",false,true,false);this._cData.show()};SysMenu.prototype.afterSaveLanguage=function(b,d,c){var a=this;if(typeof(b)=="string"){$(this._formId).form("load",{name:b,comments:d});this._tree.tree("update",{target:a._selectNode.target,text:b})}$(c).dialog("close")};SysMenu.prototype.save=function(d,b,c,e){var a=this;$.ajax({url:b,data:JSON.stringify(d),type:"post",contentType:"application/json",dataType:"json",async:false,success:function(g){if(g.flag=="success"){if(g.type=="1"){var f=a._tree.tree("find",g.pid);a._tree.tree("append",{parent:f.target,data:[g.data]});f.state="open"}else{if(g.type=="2"){d.menuGroupName=g.menuGroupName;$(a._formId).form("load",d);a._tree.tree("update",{target:a._selectNode.target,text:d.name})}}$(c).dialog("close");$.messager.show({title:"提示",msg:"保存成功！"})}else{$.messager.show({title:"提示",msg:g.error})}}})};SysMenu.prototype.del=function(){if(this._selectNode.attributes.count>0){$.messager.show({title:"提示",msg:"当前选中菜单含有子菜单项，请先删除子菜单！"});return}var a=this;var b=[];b.push(this._selectNode.id);$.messager.confirm("请确认","您确定要删除当前节点？",function(c){if(c){$.ajax({url:"platform/sysmenu/operation/sysmenu/delete",data:JSON.stringify(b),contentType:"application/json",type:"post",dataType:"json",success:function(e){if(e.flag=="success"){a._tree.tree("remove",a._selectNode.target);$.messager.show({title:"提示",msg:"删除成功！"});var d=a._tree.tree("find",a._selectNode._parentId);d.attributes.count--;a._tree.tree("select",d.target)}else{$.messager.show({title:"提示",msg:e.error})}}})}})};SysMenu.prototype.closeDialog=function(a){$(a).dialog("close")};SysMenu.prototype.reload=function(){$.ajax({url:"platform/sysmenu/reload",type:"get",dataType:"json",success:function(a){if(a.flag=="success"){$.messager.show({title:"提示",msg:"刷新成功！"})}else{$.messager.show({title:"提示",msg:a.e})}}})};