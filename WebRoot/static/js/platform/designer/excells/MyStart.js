/**
 * start extends MyBase
 */
function MyStart(id) {
	MyBase.call(this, id, "start");
	this.style = "image;image=static/js/platform/designer/images/48/start_event_empty.png;";
};
MyStart.prototype = new MyBase();
/**
 * 初始化属性信息
 */
MyStart.prototype.init = function() {
	this.initBase();
	this.name = this.tagName + _countUtils.getStart();
	this.labelChanged("开始");
	this.initJBXX();// 初始化基本信息
};
/**
 * 加载时初始化元素信息
 * 
 * @param xmlValue
 * @param rootXml
 */
MyStart.prototype.initLoad = function(xmlValue, rootXml) {
	this.initBase();
	this.name = xmlValue.getAttribute("name");
	this.alias = $.trim(xmlValue.getAttribute("alias"));
	this.g = xmlValue.getAttribute("g");
	_countUtils.setStart(this.resolve());// 设置自增长数字
	this.initJBXX();// 初始化基本信息
	/*****以上是公共的*******/
	this.createRemarkDom(xmlValue);
	this.createEventDom(xmlValue, "qian_zhi_shi_jian", "start");//event
	this.createEventDom(xmlValue, "hou_zhi_shi_jian", "end");//event
	/*****以下是公共的*******/
	rootXml.appendChild(this.createMxCell());// 创建mxCell
	_myLoadMap.put(this.name, this);//加载时的赋值，用于连线加载时按照name来寻找target节点
};
/**
 * 组装processXML的自定义信息
 * 
 * @param node
 */
MyStart.prototype.getOtherAttr = function(node) {
	this.createEventXml(node, "qian_zhi_shi_jian", "start");
	this.createEventXml(node, "hou_zhi_shi_jian", "end");
	this.createRemarkXml(node);//备注
};