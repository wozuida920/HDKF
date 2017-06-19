/**
 * initTheMessage(dgView)用于展示内容时，可以根据单元格的宽度进行内容转换，超过一定宽度时，单元格后面用【。。。】代替，
 * initTheLangField(dgView)然而在当指针移动到单元格上时，指针右边会自动创健一个隐藏的div,提供显示全部单元格的内容信息，
 * @param dgView
 */
//内容提示信息
	function initTheMessage(dgView){
		//使用平台默认的提示信息
		dgView.datagrid('doCellTipMessage',   
			{   
				onlyShowInterrupt:true,   //设置是否全部显示，【false】全部显示，【true】只显示后面有【。。。】的单元格
				position:'bottom',//设置提示消息的div方向
				//可以指定鼠标经过name列时需要显示的statusName列；
				/*specialShowFields:[{
				       field: 'status',
				       showField:'statusName',
				}],*/
				//设置显示的div样式
				tipStyler:{
					'backgroundColor':'#FFFFFF',
					'borderColor':'#B3E4F3',
					boxShadow:'1px 1px 3px #292929',
					'word-break': 'break-all',
                    'word-wrap': 'break-word',
                    width : '300px',
					height: 'auto'
				}
			}); 
	};
	 
	//内容根据单元格宽度转换多余的内容
	function initTheLangField(dgView){
		dgView.datagrid({
			onLoadSuccess:function(data){
				$.each($(this).datagrid("getColumnFields"),function(i,obj){
					var div01 = $("td[field='"+obj+"'] div");
					div01.css({
						"text-overflow":"ellipsis",
						"-o-text-overflow":"ellipsis",  
						"overflow":"hidden"
					});
				});
			}
		});
	};
	
	
	/**
	 * datagrid单元格增加tooltip提示信息：
	 * 修改平台提供的方法：
	 */
	$.extend($.fn.datagrid.methods, {      
	    /** 
	     * 开打提示功能    
	     * @param {} jq    
	     * @param {} params 提示消息框的样式    
	    * @return {}    
	     */     
		doCellTipMessage:function (jq, params) {      
	        function showTip(showParams, td, e, dg) {    
	            //无文本，不提示。      
	            if ($(td).text() == "") return;      
	           params = params || {};
	          var options = dg.data('datagrid');
	          //添加这两行代码最主要的是在页面进行特殊字符转义显示，
	          //如果不添加就会出现有的特殊字符直接输出结果,如：<img src="aa.jpg"> 输出后就会显示图片
	            var temp = $('<div>'+showParams.content+'</div>');
	            showParams.content = temp.text(showParams.content).html();
	            //生成的div里面赋值
	        	showParams.content = '<div class="tipcontent">' + showParams.content + '</div>'; 
	        	//创健提示框
	            $(td).tooltip({  
	            	//内容填充
	                content:showParams.content, 
	                //选择需要显示的列
	                trackMouse:true, 
	                //提示信息方向
	                position:params.position,
	                //提示信息销毁
	                onHide:function () {      
	                   $(this).tooltip('destroy');      
	             },   
	             //设置显示样式
	               onShow:function () {      
	                    var tip = $(this).tooltip('tip');      
	                    if(showParams.tipStyler){      
	                        tip.css(showParams.tipStyler);      
	                   }      
	                  if(showParams.contentStyler){      
	                       tip.find('div.tipcontent').css(showParams.contentStyler);
	                   }   
	              }      
	           }).tooltip('show');      
	    
	       };  
	       //定义鼠标移动到单元格时的事件操作
	        return jq.each(function () {      
	            var grid = $(this);      
	           var options = $(this).data('datagrid');   
	            if (!options.tooltip) {      
	                var panel = grid.datagrid('getPanel').panel('panel');      
	                panel.find('.datagrid-body').each(function () {      
	                  var delegateEle = $(this).find('> div.datagrid-body-inner').length ? $(this).find('> div.datagrid-body-inner')[0] : this;      
	                    $(delegateEle).undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove').delegate('td[field]', {      
	                      'mouseover':function (e) {   
	                            //if($(this).attr('field')===undefined) return;      
	                          var that = this;   
	                            var setField = null;   
	                            if(params.specialShowFields && params.specialShowFields.sort){   
	                                for(var i=0; i<params.specialShowFields.length; i++){   
	                                    if(params.specialShowFields[i].field == $(this).attr('field')){   
	                                        setField = params.specialShowFields[i];   
	                                   }   
	                               }   
	                            }   
	                           if(setField==null){   
	                                options.factContent = $(this).find('>div').clone().css({'margin-left':'-5000px', 'width':'auto', 'display':'inline', 'position':'absolute'}).appendTo('body');      
	                                var factContentWidth = options.factContent.width();      
	                               params.content = $(this).text();   
	                                if (params.onlyShowInterrupt) {      
	                                    if (factContentWidth > $(this).width()) {      
	                                       showTip(params, this, e, grid);      
	                                    }      
	                               } else {      
	                                    showTip(params, this, e, grid);      
	                                }    
	                            }else{   
	                               panel.find('.datagrid-body').each(function(){   
	                                    var trs = $(this).find('tr[datagrid-row-index="' + $(that).parent().attr('datagrid-row-index') + '"]');   
	                                    trs.each(function(){   
	                                       var td = $(this).find('> td[field="' + setField.showField + '"]');   
	                                        if(td.length){   
	                                            params.content = td.text();   
	                                       }   
	                                    });   
	                               });   
	                               showTip(params, this, e, grid);   
	                          }   
	                       },      
	                       'mouseout':function (e) {      
	                            if (options.factContent) {      
	                                options.factContent.remove();      
	                                options.factContent = null;      
	                            }      
	                       }      
	                    });      
	                });      
	            }      
	        });      
	    },      
	    /** 
	     * 关闭消息提示功能    
	    * @param {} jq    
	     * @return {}    
	     */     
	    cancelCellTip:function (jq) {      
	        return jq.each(function () {      
	            var data = $(this).data('datagrid');      
	            if (data.factContent) {      
	                data.factContent.remove();      
	                data.factContent = null;      
	            }      
	            var panel = $(this).datagrid('getPanel').panel('panel');      
	           panel.find('.datagrid-body').undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove')      
	        });      
	    }      
	});
	
	
	/**
	 * 该JS重写了length方法用于兼容字符数字字母与汉字之间的长度验证,如果不需要该方法,请注释掉即可
	 */
	$.extend($.fn.validatebox.defaults.rules, {
		length : {
			validator : function(value, param) {
				var r = /[^\u4e00-\u9fa5]/gi;
				//效验空格特殊字符 
				var pattern = /[`~#$^&()_+　<>?:"［］｛｝：{}\/;'[\] ]/im; 
				if(pattern.test(value)){
					$.fn.validatebox.defaults.rules.length.message = "输入内容不能包含英文特殊字符";
					return false;
				}
				//判断文本框输入的字符数限制【英文一个字符，中文占两个字符】
				r = value.length + value.replace(r, "").length;
				if(r >= param[0] && param[1] >= r){
					return true;
				}else{
					$.fn.validatebox.defaults.rules.length.message = "最多只能输入"+param[1]+"个英文数字或者"+param[1]/2+"个中文";
					return false;
				}
			}
		}
	});
	
	/** 
	 * 效验输入内容不能以空格开始和结束
	 */  
	$.extend($.fn.validatebox.defaults.rules, {  
				isBlackSpace: {
			        validator: function (value) {
			            return /(^[ ]+)|([ ]+$)|(^[　]+)|([　]+$)/im.test(value);
			        },
			        message: '输入内容首尾不能含有空格'
			    }
	        });
	
	/**
	 * 正则校验年份
	 */
	$.extend($.fn.validatebox.defaults.rules, {
		isYear : {
			validator : function(value) {
				var regu =/(?!0000)[0-9]{4}/;
				var re = new RegExp(regu);
				if (re.test(value)) {
					if(value>=1900&&value<=2999){
						return true;
					}
					return false;
			    }else{
			       return false;
			    }
			},
		    message:"请输入范围:(1900-2999)年"
		}
	});
	
	/**
	 * 数字校验
	 */
	$.extend($.fn.validatebox.defaults.rules, {
		isnumber : {
			validator : function(value) {
				//return /^([\d]|([1-9][\d]{1,5}))$/i.test(value);
				if(value.length-1 >= 6){
					return false;
				}
				if (value>=0 && value<=999999 ) {
					return true;
				}else{
					return false;
				}
			},
			message:"输入的内容不合法,最多只能输入6位整数"
		}
	});
	
	/** 
	 * 验证是否包含空格和非法字符
	 */  
	$.extend($.fn.validatebox.defaults.rules, {  
				unnormal: { 
			        validator: function (value) {
			            return /.+/i.test(value);
			        },
			        message: '输入值不能为空和包含其他非法字符'
			    }
	        });
	
	
	/**
	 * 效验输入的数字是正整数
	 */
	$.extend($.fn.validatebox.defaults.rules, {    
		 integer: {
             validator: function (value) {
            	 return /^[0-9]*$/.test(value);
             },
             message: '请输入0~~9的整数'
         }
	});
	
	/**
	 * telephoneCheck---固定电话或手机格式验证
	 */
	$.extend($.fn.validatebox.defaults.rules, {    
		telephoneCheck: {
	    	validator : function(value) {
	    		return /(^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,8}$)|^(13|15|18)\d{9}|^([\d]{3,4}-[\d]{4}-[\d]{4})$/i.test(value);
	    	}, 
	        message: '请输入正确格式的固话或手机号码,如（00xx-8位或7位数,<br>或者135xxxx1234或者0xxx-0000-1234）'
	    }
	 	
	}); 
	
	/**
	 * faxCheck---传真电话格式验证
	 */
	$.extend($.fn.validatebox.defaults.rules, {    
		faxCheck: {
			 validator: function (value) {
	            return /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,8}?$/i.test(value);
	        },
	        message: '请输入正确格式的传真号码,<br/>如(029-123xxxx)后面是7位数字!'
	    }
	}); 
	
	/**
	 * 验证邮政编码
	 */
	$.extend($.fn.validatebox.defaults.rules, { 
	 zip: {
	        validator: function (value) {
	            return /^[1-9]\d{5}$/i.test(value);
	        },
	        message: '邮政编码格式不正确,只能输入数字,最大不能超过6位'
	    }
	});
	
	/**
	 * 验证是否是正确网址
	 */
	 $.extend($.fn.validatebox.defaults.rules, { 
	 urls: {
	        validator: function (value) {
	            return /^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/.test(value);
	        },
	        message: '这网址不是以http://或https://开头,或者输入的不是正确网址'
	    }
	});
	 
	 /**
	  * checkNumber---效验商品金额
	  */
		$.extend($.fn.validatebox.defaults.rules, {    
			checkNumber: {
		    	validator : function(value) {
		    		if (!(value >= 0 && value <= 999999.99)) {
						return false;
					}
		    		return /^([1-7]{1}[0-6]{0,2}((\,[0-6]{3})|(\,[0-6]{4}))*(\.[0-9]{0,2})?|[1-9]{1}\d*(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/.test(value);
		    	}, 
		        message: '格式不正确，请输入有效的金额,最大输入6位整数2位小数'
		    }
		}); 
		

 /**
  * 效验开始时间和结束时间
  * @param beginTime
  * @param endTime
  */
  function checkDateTime(beginTime,endTime){
			var beginDate = $(beginTime).datebox();
			var endDate = $(endTime).datebox();
			beginDate.datebox({
				onSelect:function(){
					var etime = endDate.datebox("getValue");
					var btime = beginDate.datebox('getValue');
					if(etime!=null&&etime!=""){
						if(btime>etime){
							$.messager.show({
								title:"错误:",
								msg:"结束时间不能大于开始时间"
							});
							$(this).datebox("setValue","");
							return;
						}
					}
				}
			});
			endDate.datebox({
				onSelect:function(){
					var getBeginTime = beginDate.datebox('getValue');
					var getEndTime = $(this).datebox("getValue");
					if(getBeginTime>getEndTime){
						$.messager.show({
							title:"错误:",
							msg:"结束时间不能小于开始时间"
						});
						$(this).datebox("setValue","");
						return;
					}
				}
			});
		};
	
	