package avicit.csmp.basicData.csmpbdsparepart.service;

import avicit.platform6.core.excel.imp.entity.ExcelHeader;
import avicit.platform6.core.excel.imp.executor.AbstractExcutor;

public class ExcelExcutorImpl extends  AbstractExcutor {
	private String name;
	
	public ExcelExcutorImpl(String name) {
		this.name = name;
		this.initHeader();
	}
	
	private void initHeader(){
		headers.add(new ExcelHeader("productName", "产品名称"));
		headers.add(new ExcelHeader("drawingNo", "图号"));
		headers.add(new ExcelHeader("unit", "单位"));
		headers.add(new ExcelHeader("quantity", "数量"));
		headers.add(new ExcelHeader("specification", "规格"));
		headers.add(new ExcelHeader("dutyFreePrice", "免税单价"));
		headers.add(new ExcelHeader("taxPrice", "含税单价"));
		headers.add(new ExcelHeader("liabilityUnit", "责任单位"));
		headers.add(new ExcelHeader("validFlag", "有效性"));
		headers.add(new ExcelHeader("category", "类别"));
		headers.add(new ExcelHeader("isRandompart", "是否随机件"));
		headers.add(new ExcelHeader("classifyDept", "分类公司"));
		headers.add(new ExcelHeader("remark", "备注"));
	}
	
	public void addHeader(ExcelHeader header){
		headers.add(header);
	}
	
	@Override
	public String getName() {
		return this.name;
	}

}
