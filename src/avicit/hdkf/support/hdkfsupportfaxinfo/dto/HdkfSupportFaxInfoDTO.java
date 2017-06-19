package avicit.hdkf.support.hdkfsupportfaxinfo.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportFaxInfo
 * Title: 表HDKF_SUPPORT_FAX_INFO的PoJo类，也就是数据库映射类
 * Description: 传真
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-09-22 09:44
 *
 */
 @PojoRemark(table="hdkf_support_fax_info",object="HdkfSupportFaxInfoDTO",name="传真")
 public class HdkfSupportFaxInfoDTO extends BeanDTO{
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
												
				 	@FieldRemark(column="fax_no",field="faxNo",name="传真编号")
		 	private java.lang.String faxNo;
												
				 	@FieldRemark(column="from_addr",field="fromAddr",name="我方地址")
		 	private java.lang.String fromAddr;
												
				 	@FieldRemark(column="from_zipcode",field="fromZipcode",name="我方邮编")
		 	private java.lang.String fromZipcode;
												
				 	@FieldRemark(column="from_en_addr",field="fromEnAddr",name="我方英语地址")
		 	private java.lang.String fromEnAddr;
												
				 	@FieldRemark(column="from_tel",field="fromTel",name="我方电话")
		 	private java.lang.String fromTel;
												
				 	@FieldRemark(column="from_fax",field="fromFax",name="我方传真")
		 	private java.lang.String fromFax;
												
					@FieldRemark(column="from_user",field="fromUser",name="发送人")
		 	private java.lang.String fromUser;
		 	private java.lang.String fromUserAlias;
												
		    			@FieldRemark(column="send_date",field="sendDate",name="发送日期")
    		 	private java.util.Date sendDate;
    		 	
    		 	private java.util.Date sendDateBegin;
    		 	
    		 	private java.util.Date sendDateEnd;
												
				 	@FieldRemark(column="fax_pages",field="faxPages",name="传真页数")
		 	private long faxPages;
												
				 	@FieldRemark(column="to_uuit",field="toUuit",name="发往单位")
		 	private java.lang.String toUuit;
												
				 	@FieldRemark(column="to_fax",field="toFax",name="发往单位传真号")
		 	private java.lang.String toFax;
												
				 	@FieldRemark(column="to_user",field="toUser",name="接收人")
		 	private java.lang.String toUser;
												
				 	@FieldRemark(column="fax_content",field="faxContent",name="传真内容")
		 	private java.lang.String faxContent;
												
				 	@FieldRemark(column="request_deal_id",field="requestDealId",name="请求处理ID")
		 	private java.lang.String requestDealId;
												
				 	@FieldRemark(column="deal_name",field="dealName",name="处理单名称")
		 	private java.lang.String dealName;
												
				 	@FieldRemark(column="request_id",field="requestId",name="求援请求ID")
		 	private java.lang.String requestId;
												
				 	@FieldRemark(column="request_no",field="requestNo",name="信息处理卡编号")
		 	private java.lang.String requestNo;
																		
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
		 	private java.lang.String attribute11;
												
				 	@FieldRemark(column="attribute_12",field="attribute12",name="扩展字段12")
		 	private long attribute12;
												
				 	@FieldRemark(column="attribute_13",field="attribute13",name="扩展字段13")
		 	private long attribute13;
												
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
						
								
							public java.lang.String getFaxNo(){
		  			return faxNo;
				}
			
				public void setFaxNo(java.lang.String faxNo){
		  			this.faxNo = faxNo;
				}
						
								
							public java.lang.String getFromAddr(){
		  			return fromAddr;
				}
			
				public void setFromAddr(java.lang.String fromAddr){
		  			this.fromAddr = fromAddr;
				}
						
								
							public java.lang.String getFromZipcode(){
		  			return fromZipcode;
				}
			
				public void setFromZipcode(java.lang.String fromZipcode){
		  			this.fromZipcode = fromZipcode;
				}
						
								
							public java.lang.String getFromEnAddr(){
		  			return fromEnAddr;
				}
			
				public void setFromEnAddr(java.lang.String fromEnAddr){
		  			this.fromEnAddr = fromEnAddr;
				}
						
								
							public java.lang.String getFromTel(){
		  			return fromTel;
				}
			
				public void setFromTel(java.lang.String fromTel){
		  			this.fromTel = fromTel;
				}
						
								
							public java.lang.String getFromFax(){
		  			return fromFax;
				}
			
				public void setFromFax(java.lang.String fromFax){
		  			this.fromFax = fromFax;
				}
						
								
				    		public java.lang.String getFromUser(){
		  			return fromUser;
				}
			
				public void setFromUser(java.lang.String fromUser){
		  			this.fromUser = fromUser;
				}
				
				public java.lang.String getFromUserAlias(){
		  			return fromUserAlias;
				}
			
				public void setFromUserAlias(java.lang.String fromUserAlias){
		  			this.fromUserAlias = fromUserAlias;
				}
						
								
							public java.util.Date getSendDate(){
		  			return sendDate;
				}
			
				public void setSendDate(java.util.Date sendDate){
		  			this.sendDate = sendDate;
				}
				
				public java.util.Date getSendDateBegin(){
		  			return sendDateBegin;
				}
			
				public void setSendDateBegin(java.util.Date sendDateBegin){
		  			this.sendDateBegin = sendDateBegin;
				}
				
				public java.util.Date getSendDateEnd(){
		  			return sendDateEnd;
				}
			
				public void setSendDateEnd(java.util.Date sendDateEnd){
		  			this.sendDateEnd = sendDateEnd;
				}
						
								
							public long getFaxPages(){
		  			return faxPages;
				}
			
				public void setFaxPages(long faxPages){
		  			this.faxPages = faxPages;
				}
						
								
							public java.lang.String getToUuit(){
		  			return toUuit;
				}
			
				public void setToUuit(java.lang.String toUuit){
		  			this.toUuit = toUuit;
				}
						
								
							public java.lang.String getToFax(){
		  			return toFax;
				}
			
				public void setToFax(java.lang.String toFax){
		  			this.toFax = toFax;
				}
						
								
							public java.lang.String getToUser(){
		  			return toUser;
				}
			
				public void setToUser(java.lang.String toUser){
		  			this.toUser = toUser;
				}
						
								
							public java.lang.String getFaxContent(){
		  			return faxContent;
				}
			
				public void setFaxContent(java.lang.String faxContent){
		  			this.faxContent = faxContent;
				}
						
								
							public java.lang.String getRequestDealId(){
		  			return requestDealId;
				}
			
				public void setRequestDealId(java.lang.String requestDealId){
		  			this.requestDealId = requestDealId;
				}
						
								
							public java.lang.String getDealName(){
		  			return dealName;
				}
			
				public void setDealName(java.lang.String dealName){
		  			this.dealName = dealName;
				}
						
								
							public java.lang.String getRequestId(){
		  			return requestId;
				}
			
				public void setRequestId(java.lang.String requestId){
		  			this.requestId = requestId;
				}
						
								
							public java.lang.String getRequestNo(){
		  			return requestNo;
				}
			
				public void setRequestNo(java.lang.String requestNo){
		  			this.requestNo = requestNo;
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
						
								
							public java.lang.String getAttribute11(){
		  			return attribute11;
				}
			
				public void setAttribute11(java.lang.String attribute11){
		  			this.attribute11 = attribute11;
				}
						
								
							public long getAttribute12(){
		  			return attribute12;
				}
			
				public void setAttribute12(long attribute12){
		  			this.attribute12 = attribute12;
				}
						
								
							public long getAttribute13(){
		  			return attribute13;
				}
			
				public void setAttribute13(long attribute13){
		  			this.attribute13 = attribute13;
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
			return "传真";
		}else{
			return super.logFormName;
		}
	}

	public String getLogTitle() {
		if(super.logTitle==null||super.logTitle.equals("")){
			return "传真";
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