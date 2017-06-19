package avicit.hdkf.support.hdkfoapublicsheet.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.api.sysuser.SysDeptAPI;
import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.spring.SpringFactory;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfOaPublicsheet
 * Title: 表HDKF_OA_PUBLICSHEET的PoJo类，也就是数据库映射类
 * Description: 公用笺信息表
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-09-13 14:33
 *
 */
 @PojoRemark(table="hdkf_oa_publicsheet",object="HdkfOaPublicsheetDTO",name="公用笺信息表")
 public class HdkfOaPublicsheetDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
    private java.lang.String activityalias_; // 节点中文名称
	private java.lang.String activityname_; // 当前节点id
	private java.lang.String businessstate_; // 流程当前状态
	private java.lang.String currUserId; // 当前登录人ID
	private java.lang.String bpmType; 
    private java.lang.String bpmState; 
	
						@Id
							@LogField
				
				 	@FieldRemark(column="id",field="id",name="主键")
		 	private java.lang.String id;
												
				 	@FieldRemark(column="sheetno",field="sheetno",name="公用笺编号")
		 	private java.lang.String sheetno;
												
					@FieldRemark(column="send_dep",field="sendDep",name="发文单位")
		 	private java.lang.String sendDep;
		 	private java.lang.String sendDepAlias;
												
		    			@FieldRemark(column="sentdate",field="sentdate",name="发文日期")
    		 	private java.util.Date sentdate;
    		 	
    		 	private java.util.Date sentdateBegin;
    		 	
    		 	private java.util.Date sentdateEnd;
												
					@FieldRemark(column="receive_dep",field="receiveDep",name="分发单位")
		 	private java.lang.String receiveDep;
		 	private java.lang.String receiveDepAlias;
												
				 	@FieldRemark(column="planetype",field="planetype",name="机型")
		 	private java.lang.String planetype;
												
				 	@FieldRemark(column="batch_no",field="batchNo",name="批次")
		 	private java.lang.String batchNo;
												
				 	@FieldRemark(column="sortie_no",field="sortieNo",name="架次")
		 	private java.lang.String sortieNo;
												
				 	@FieldRemark(column="sheetcontent",field="sheetcontent",name="公用笺内容")
		 	private java.lang.String sheetcontent;
												
				 	@FieldRemark(column="sendreason",field="sendreason",name="发笺原因")
		 	private java.lang.String sendreason;
												
				 	@FieldRemark(column="recorder",field="recorder",name="编写人")
		 	private java.lang.String recorder;
												
				 	@FieldRemark(column="proofreader",field="proofreader",name="校对人")
		 	private java.lang.String proofreader;
												
				 	@FieldRemark(column="reviewer",field="reviewer",name="审核人")
		 	private java.lang.String reviewer;
												
				 	@FieldRemark(column="approver",field="approver",name="审定人")
		 	private java.lang.String approver;
												
				 	@FieldRemark(column="remarks",field="remarks",name="备注")
		 	private java.lang.String remarks;
																		
				 	@FieldRemark(column="attribute_01",field="attribute01",name="扩展字段01")
		 	private java.lang.String attribute01;
												
				 	@FieldRemark(column="attribute_02",field="attribute02",name="扩展字段02")
		 	private java.lang.String attribute02;
												
				 	@FieldRemark(column="attribute_03",field="attribute03",name="扩展字段03")
		 	private java.lang.String attribute03;
												
				 	@FieldRemark(column="attribute_04",field="attribute04",name="扩展字段04")
		 	private java.lang.String attribute04;
												
				 	@FieldRemark(column="attribute_05",field="attribute05",name="扩展字段05")
		 	private java.lang.String attribute05;
												
				 	@FieldRemark(column="attribute_06",field="attribute06",name="扩展字段06")
		 	private java.lang.String attribute06;
												
				 	@FieldRemark(column="attribute_07",field="attribute07",name="扩展字段07")
		 	private java.lang.String attribute07;
												
				 	@FieldRemark(column="attribute_08",field="attribute08",name="扩展字段08")
		 	private java.lang.String attribute08;
												
				 	@FieldRemark(column="attribute_09",field="attribute09",name="扩展字段09")
		 	private java.lang.String attribute09;
												
				 	@FieldRemark(column="attribute_10",field="attribute10",name="扩展字段10")
		 	private java.lang.String attribute10;
												
				 	@FieldRemark(column="attribute_11",field="attribute11",name="扩展字段11")
		 	private long attribute11;
												
				 	@FieldRemark(column="attribute_12",field="attribute12",name="扩展字段12")
		 	private long attribute12;
												
		    			@FieldRemark(column="attribute_13",field="attribute13",name="扩展字段13")
    		 	private java.util.Date attribute13;
    		 	
    		 	private java.util.Date attribute13Begin;
    		 	
    		 	private java.util.Date attribute13End;
												
		    			@FieldRemark(column="attribute_14",field="attribute14",name="扩展字段14")
    		 	private java.util.Date attribute14;
    		 	
    		 	private java.util.Date attribute14Begin;
    		 	
    		 	private java.util.Date attribute14End;
			

  							
							public java.lang.String getId(){
		  			return id;
				}
			
				public void setId(java.lang.String id){
		  			this.id = id;
				}
						
								
							public java.lang.String getSheetno(){
		  			return sheetno;
				}
			
				public void setSheetno(java.lang.String sheetno){
		  			this.sheetno = sheetno;
				}
						
								
				    		public java.lang.String getSendDep(){
		  			return sendDep;
				}
			
				public void setSendDep(java.lang.String sendDep){
		  			this.sendDep = sendDep;
				}
				
				public java.lang.String getSendDepAlias(){
		  			return sendDepAlias;
				}
			
				public void setSendDepAlias(java.lang.String sendDepAlias){
		  			this.sendDepAlias = sendDepAlias;
				}
						
								
							public java.util.Date getSentdate(){
		  			return sentdate;
				}
			
				public void setSentdate(java.util.Date sentdate){
		  			this.sentdate = sentdate;
				}
				
				public java.util.Date getSentdateBegin(){
		  			return sentdateBegin;
				}
			
				public void setSentdateBegin(java.util.Date sentdateBegin){
		  			this.sentdateBegin = sentdateBegin;
				}
				
				public java.util.Date getSentdateEnd(){
		  			return sentdateEnd;
				}
			
				public void setSentdateEnd(java.util.Date sentdateEnd){
		  			this.sentdateEnd = sentdateEnd;
				}
						
								
				    		public java.lang.String getReceiveDep(){
		  			return receiveDep;
				}
			
				public void setReceiveDep(java.lang.String receiveDep){
					
					
		  			this.receiveDep = receiveDep;
				}
				
				public java.lang.String getReceiveDepAlias(){
		  			return receiveDepAlias;
				}
			
				public void setReceiveDepAlias(java.lang.String receiveDepAlias){
		  			this.receiveDepAlias = receiveDepAlias;
				}
				
						
								
							public java.lang.String getPlanetype(){
		  			return planetype;
				}
			
				public void setPlanetype(java.lang.String planetype){
		  			this.planetype = planetype;
				}
						
								
							public java.lang.String getBatchNo(){
		  			return batchNo;
				}
			
				public void setBatchNo(java.lang.String batchNo){
		  			this.batchNo = batchNo;
				}
						
								
							public java.lang.String getSortieNo(){
		  			return sortieNo;
				}
			
				public void setSortieNo(java.lang.String sortieNo){
		  			this.sortieNo = sortieNo;
				}
						
								
							public java.lang.String getSheetcontent(){
		  			return sheetcontent;
				}
			
				public void setSheetcontent(java.lang.String sheetcontent){
		  			this.sheetcontent = sheetcontent;
				}
						
								
							public java.lang.String getSendreason(){
		  			return sendreason;
				}
			
				public void setSendreason(java.lang.String sendreason){
		  			this.sendreason = sendreason;
				}
						
								
							public java.lang.String getRecorder(){
		  			return recorder;
				}
			
				public void setRecorder(java.lang.String recorder){
		  			this.recorder = recorder;
				}
						
								
							public java.lang.String getProofreader(){
		  			return proofreader;
				}
			
				public void setProofreader(java.lang.String proofreader){
		  			this.proofreader = proofreader;
				}
						
								
							public java.lang.String getReviewer(){
		  			return reviewer;
				}
			
				public void setReviewer(java.lang.String reviewer){
		  			this.reviewer = reviewer;
				}
						
								
							public java.lang.String getApprover(){
		  			return approver;
				}
			
				public void setApprover(java.lang.String approver){
		  			this.approver = approver;
				}
						
								
							public java.lang.String getRemarks(){
		  			return remarks;
				}
			
				public void setRemarks(java.lang.String remarks){
		  			this.remarks = remarks;
				}
						
																										
							public java.lang.String getAttribute01(){
		  			return attribute01;
				}
			
				public void setAttribute01(java.lang.String attribute01){
		  			this.attribute01 = attribute01;
				}
						
								
							public java.lang.String getAttribute02(){
		  			return attribute02;
				}
			
				public void setAttribute02(java.lang.String attribute02){
		  			this.attribute02 = attribute02;
				}
						
								
							public java.lang.String getAttribute03(){
		  			return attribute03;
				}
			
				public void setAttribute03(java.lang.String attribute03){
		  			this.attribute03 = attribute03;
				}
						
								
							public java.lang.String getAttribute04(){
		  			return attribute04;
				}
			
				public void setAttribute04(java.lang.String attribute04){
		  			this.attribute04 = attribute04;
				}
						
								
							public java.lang.String getAttribute05(){
		  			return attribute05;
				}
			
				public void setAttribute05(java.lang.String attribute05){
		  			this.attribute05 = attribute05;
				}
						
								
							public java.lang.String getAttribute06(){
		  			return attribute06;
				}
			
				public void setAttribute06(java.lang.String attribute06){
		  			this.attribute06 = attribute06;
				}
						
								
							public java.lang.String getAttribute07(){
		  			return attribute07;
				}
			
				public void setAttribute07(java.lang.String attribute07){
		  			this.attribute07 = attribute07;
				}
						
								
							public java.lang.String getAttribute08(){
		  			return attribute08;
				}
			
				public void setAttribute08(java.lang.String attribute08){
		  			this.attribute08 = attribute08;
				}
						
								
							public java.lang.String getAttribute09(){
		  			return attribute09;
				}
			
				public void setAttribute09(java.lang.String attribute09){
		  			this.attribute09 = attribute09;
				}
						
								
							public java.lang.String getAttribute10(){
		  			return attribute10;
				}
			
				public void setAttribute10(java.lang.String attribute10){
		  			this.attribute10 = attribute10;
				}
						
								
							public long getAttribute11(){
		  			return attribute11;
				}
			
				public void setAttribute11(long attribute11){
		  			this.attribute11 = attribute11;
				}
						
								
							public long getAttribute12(){
		  			return attribute12;
				}
			
				public void setAttribute12(long attribute12){
		  			this.attribute12 = attribute12;
				}
						
								
							public java.util.Date getAttribute13(){
		  			return attribute13;
				}
			
				public void setAttribute13(java.util.Date attribute13){
		  			this.attribute13 = attribute13;
				}
				
				public java.util.Date getAttribute13Begin(){
		  			return attribute13Begin;
				}
			
				public void setAttribute13Begin(java.util.Date attribute13Begin){
		  			this.attribute13Begin = attribute13Begin;
				}
				
				public java.util.Date getAttribute13End(){
		  			return attribute13End;
				}
			
				public void setAttribute13End(java.util.Date attribute13End){
		  			this.attribute13End = attribute13End;
				}
						
								
							public java.util.Date getAttribute14(){
		  			return attribute14;
				}
			
				public void setAttribute14(java.util.Date attribute14){
		  			this.attribute14 = attribute14;
				}
				
				public java.util.Date getAttribute14Begin(){
		  			return attribute14Begin;
				}
			
				public void setAttribute14Begin(java.util.Date attribute14Begin){
		  			this.attribute14Begin = attribute14Begin;
				}
				
				public java.util.Date getAttribute14End(){
		  			return attribute14End;
				}
			
				public void setAttribute14End(java.util.Date attribute14End){
		  			this.attribute14End = attribute14End;
				}
						
			
       

  public java.lang.String getActivityalias_() {
		return activityalias_;
	}

	public void setActivityalias_(java.lang.String activityalias_) {
		this.activityalias_ = activityalias_;
	}

	public java.lang.String getActivityname_() {
		return activityname_;
	}

	public void setActivityname_(java.lang.String activityname_) {
		this.activityname_ = activityname_;
	}

	public java.lang.String getBusinessstate_() {
		return businessstate_;
	}

	public void setBusinessstate_(java.lang.String businessstate_) {
		this.businessstate_ = businessstate_;
	}
	
	public String getLogFormName() {
		if(super.logFormName==null||super.logFormName.equals("")){
			return "公用笺信息表";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "公用笺信息表";
		}else{
			return super.logTitle;
		}
	}
	
	public java.lang.String getCurrUserId() {
        return currUserId;
    }

    public void setCurrUserId(java.lang.String currUserId) {
        this.currUserId = currUserId;
    }
    public java.lang.String getBpmType() {
        return bpmType;
    }

    public void setBpmType(java.lang.String bpmType) {
        this.bpmType = bpmType;
    }

    public java.lang.String getBpmState() {
        return bpmState;
    }

    public void setBpmState(java.lang.String bpmState) {
        this.bpmState = bpmState;
    }
	public LogType getLogType() {
		if (super.logType == null || super.logType.equals("")) {
			return LogType.module_operate;
		} else {
			return super.logType;
		}
	}
        
}