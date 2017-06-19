package avicit.csmp.operateMonitor.csmpomaircraftdynamics.dto;

public class CsmpOMDTO {
	private  String cusid;  //定义的客户id
	private  String arimol; //机型的id
	private double totls;  //记录的总的条数
	private double normals;//记录正常的飞机条数
	private String ariid;//飞机的id
	private String btno;//飞机的批架次

	private String Uname;//别名
	public String getUname() {
		return Uname;
	}
	public void setUname(String uname) {
		Uname = uname;
	}
	private double baifenbi;//百分比
	private String comName;//公司的名字
	private String mnum;//机型的编号
	private String mname;//机型的名字
	
	
	public String getCusid() {
		return cusid;
	}
	public void setCusid(String cusid) {
		this.cusid = cusid;
	}
	public String getArimol() {
		return arimol;
	}
	public void setArimol(String arimol) {
		this.arimol = arimol;
	}
	public double getTotls() {
		return totls;
	}
	public void setTotls(double totls) {
		this.totls = totls;
	}
	public double getNormals() {
		return normals;
	}
	public void setNormals(double normals) {
		this.normals = normals;
	}
	public String getAriid() {
		return ariid;
	}
	public void setAriid(String ariid) {
		this.ariid = ariid;
	}
	public String getBtno() {
		return btno;
	}
	public void setBtno(String btno) {
		this.btno = btno;
	}
	public double getBaifenbi() {
		return baifenbi;
	}
	public void setBaifenbi(double baifenbi) {
		this.baifenbi = baifenbi;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getMnum() {
		return mnum;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public CsmpOMDTO() {
		
	}
	@Override
	public String toString() {
		return "CsmpOMDTO [cusid=" + cusid + ", arimol=" + arimol + ", totls="
				+ totls + ", normals=" + normals + ", ariid=" + ariid
				+ ", btno=" + btno + ", baifenbi=" + baifenbi + ", comName="
				+ comName + ", mnum=" + mnum + ", mname=" + mname + "]";
	}
	
	

}
