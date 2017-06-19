package avicit.csmp.basicData.csmpbdcomstr.dto;

/**
 * 映射生成关系表查询数据的对应的VO信息
 */
public class CsmpBdStrVo {
	private String id;//关系表主键ID
	private String strId;//树表的treekeyId
	private String comId;//Info业务表的主键ID
	private String companyCode;//Info业务表的公司编码
	private String companyName;//Info业务表的公司中文名称
	private String remark;//关系表的备注信息
	private String catalogType;//树表的公司类型
	private String catalogName;//数表的名称
	
	public String getCatalogName() {
		return catalogName;
	}
	public void setCatalogName(String catalogName) {
		this.catalogName = catalogName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStrId() {
		return strId;
	}
	public void setStrId(String strId) {
		this.strId = strId;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCatalogType() {
		return catalogType;
	}
	public void setCatalogType(String catalogType) {
		this.catalogType = catalogType;
	}
	public CsmpBdStrVo(){
		
	}
	@Override
	public String toString() {
		return "CsmpBdStrVo [id=" + id + ", strId=" + strId + ", comId=" + comId + ", companyCode=" + companyCode + ", companyName=" + companyName + ", remark=" + remark + ", catalogType=" + catalogType + ", catalogName=" + catalogName + "]";
	}
	
	
	

}
