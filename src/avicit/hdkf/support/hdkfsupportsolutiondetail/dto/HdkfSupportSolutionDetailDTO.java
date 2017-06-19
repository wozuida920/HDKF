package avicit.hdkf.support.hdkfsupportsolutiondetail.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfSupportSolutionDetail
 * Title: 表HDKF_SUPPORT_SOLUTION_DETAIL的PoJo类，也就是数据库映射类
 * Description: HDKF_SUPPORT_SOLUTION_DETAIL
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-10-31 09:22
 *
 */
 @PojoRemark(table="hdkf_support_solution_detail",object="HdkfSupportSolutionDetailDTO",name="HDKF_SUPPORT_SOLUTION_DETAIL")
 public class HdkfSupportSolutionDetailDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
    
                                            @Id
                                        @LogField
                    
            
                            @FieldRemark(column="id",field="id",name="主键")
                private java.lang.String id;
                                                                            
            
                            @FieldRemark(column="deal_user_id",field="dealUserId",name="承办人ID")
                private java.lang.String dealUserId;
                                                                            
            
                            @FieldRemark(column="deal_user_name",field="dealUserName",name="承办人")
                private java.lang.String dealUserName;
                                                                            
            
                            @FieldRemark(column="done_time",field="doneTime",name="方案形日期")
                private java.util.Date doneTime;
                
                private java.util.Date doneTimeBegin;
                
                private java.util.Date doneTimeEnd;
                                                                            
            
                            @FieldRemark(column="info_card_no",field="infoCardNo",name="外场信息处理卡编号")
                private java.lang.String infoCardNo;
                                                                            
            
                            @FieldRemark(column="request_id",field="requestId",name="求援请求ID")
                private java.lang.String requestId;
                                                                            
            
                            @FieldRemark(column="request_no",field="requestNo",name="信息卡编号")
                private java.lang.String requestNo;
                                                                            
            
                            @FieldRemark(column="deal_solution",field="dealSolution",name="处理结论")
                private java.lang.String dealSolution;
                                                                                                                                                    
            
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
                private Long attribute11;
                                                                            
            
                            @FieldRemark(column="attribute_12",field="attribute12",name="扩展字段12")
                private Long attribute12;
                                                                            
            
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
                        
                                
                            public java.lang.String getDealUserId(){
                    return dealUserId;
                }
            
                public void setDealUserId(java.lang.String dealUserId){
                    this.dealUserId = dealUserId;
                }
                        
                                
                            public java.lang.String getDealUserName(){
                    return dealUserName;
                }
            
                public void setDealUserName(java.lang.String dealUserName){
                    this.dealUserName = dealUserName;
                }
                        
                                
                            public java.util.Date getDoneTime(){
                    return doneTime;
                }
            
                public void setDoneTime(java.util.Date doneTime){
                    this.doneTime = doneTime;
                }
                
                public java.util.Date getDoneTimeBegin(){
                    return doneTimeBegin;
                }
            
                public void setDoneTimeBegin(java.util.Date doneTimeBegin){
                    this.doneTimeBegin = doneTimeBegin;
                }
                
                public java.util.Date getDoneTimeEnd(){
                    return doneTimeEnd;
                }
            
                public void setDoneTimeEnd(java.util.Date doneTimeEnd){
                    this.doneTimeEnd = doneTimeEnd;
                }
                        
                                
                            public java.lang.String getInfoCardNo(){
                    return infoCardNo;
                }
            
                public void setInfoCardNo(java.lang.String infoCardNo){
                    this.infoCardNo = infoCardNo;
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
                        
                                
                            public java.lang.String getDealSolution(){
                    return dealSolution;
                }
            
                public void setDealSolution(java.lang.String dealSolution){
                    this.dealSolution = dealSolution;
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
                        
                                
                            public Long getAttribute11(){
                    return attribute11;
                }
            
                public void setAttribute11(Long attribute11){
                    this.attribute11 = attribute11;
                }
                        
                                
                            public Long getAttribute12(){
                    return attribute12;
                }
            
                public void setAttribute12(Long attribute12){
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
                        
            
       
 
    public String getLogFormName() {
        if(super.logFormName==null||super.logFormName.equals("")){
            return "HDKF_SUPPORT_SOLUTION_DETAIL";
        }else{
            return super.logFormName;
        }
    }

    public String getLogTitle() {
        if(super.logTitle==null||super.logTitle.equals("")){
            return "HDKF_SUPPORT_SOLUTION_DETAIL";
        }else{
            return super.logTitle;
        }
    }
    

    public LogType getLogType() {
        if (super.logType == null || super.logType.equals("")) {
            return LogType.module_operate;
        } else {
            return super.logType;
        }
    }
        
}