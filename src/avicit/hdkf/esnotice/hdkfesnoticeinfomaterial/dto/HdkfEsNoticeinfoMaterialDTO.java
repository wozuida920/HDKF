package avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.dto;

import javax.persistence.Id;
//import javax.persistence.Transient;

import avicit.platform6.core.domain.BeanDTO;
import avicit.platform6.core.properties.PlatformConstant.LogType;
import avicit.platform6.core.annotation.log.LogField;
import avicit.platform6.core.annotation.log.FieldRemark;
import avicit.platform6.core.annotation.log.PojoRemark;
/**
 * bean HdkfEsNoticeinfoMaterial
 * Title: 表HDKF_ES_NOTICEINFO_MATERIAL的PoJo类，也就是数据库映射类
 * Description: 技术通报涉及材料表
 * Copyriht: Copyright (c) 2012
 * Company: AVICIT Co., Ltd
 * @author AVICIT DEV
 * @version 1.0 Date: 2016-11-02 14:39
 *
 */
 @PojoRemark(table="hdkf_es_noticeinfo_material",object="HdkfEsNoticeinfoMaterialDTO",name="技术通报涉及材料表")
 public class HdkfEsNoticeinfoMaterialDTO extends BeanDTO{
    private static final long serialVersionUID = 1L;
    
                                            @Id
                                        @LogField
                    
            
                            @FieldRemark(column="id",field="id",name="主键")
                private java.lang.String id;
                                                                            
            
                            @FieldRemark(column="bulletin_id",field="bulletinId",name="技术通报详细表ID")
                private java.lang.String bulletinId;
                                                                            
            
                            @FieldRemark(column="bulletin_no",field="bulletinNo",name="通告编号")
                private java.lang.String bulletinNo;
                                                                            
            
                            @FieldRemark(column="sparepart_id",field="sparepartId",name="备件信息表ID")
                private java.lang.String sparepartId;
                                                                            
            
                            @FieldRemark(column="sparepart_name",field="sparepartName",name="备件名称")
                private java.lang.String sparepartName;
                                                                            
            
                            @FieldRemark(column="qty",field="qty",name="数量")
                private Long qty;
                                                                            
            
                            @FieldRemark(column="seq",field="seq",name="序号")
                private Long seq;
                                                                            
            
                            @FieldRemark(column="pmodel",field="pmodel",name="型号")
                private java.lang.String pmodel;
                                                                            
            
                            @FieldRemark(column="pname",field="pname",name="名称")
                private java.lang.String pname;
                                                                            
            
                            @FieldRemark(column="unit_price",field="unitPrice",name="单价")
                private Float unitPrice;
                                                                            
            
                            @FieldRemark(column="equipped_by_user",field="equippedByUser",name="用户自备")
                private java.lang.String equippedByUser;
                                                                            
            
                            @FieldRemark(column="old_pmodel",field="oldPmodel",name="旧产品型号")
                private java.lang.String oldPmodel;
                                                                            
            
                            @FieldRemark(column="disposition",field="disposition",name="处置说明")
                private java.lang.String disposition;
                                                                            
            
                            @FieldRemark(column="process_route",field="processRoute",name="工艺路线")
                private java.lang.String processRoute;
                                                                            
            
                            @FieldRemark(column="unit_name",field="unitName",name="单位")
                private java.lang.String unitName;
                                                                            
            
                            @FieldRemark(column="sort_kind",field="sortKind",name="器材类别")
                private java.lang.String sortKind;
                                                                            
            
                            @FieldRemark(column="valid_flag",field="validFlag",name="有效性")
                private java.lang.String validFlag;
                                                                            
            
                            @FieldRemark(column="remark",field="remark",name="备注")
                private java.lang.String remark;
                                                                                                                                                    
            
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
                        
                                
                            public java.lang.String getBulletinId(){
                    return bulletinId;
                }
            
                public void setBulletinId(java.lang.String bulletinId){
                    this.bulletinId = bulletinId;
                }
                        
                                
                            public java.lang.String getBulletinNo(){
                    return bulletinNo;
                }
            
                public void setBulletinNo(java.lang.String bulletinNo){
                    this.bulletinNo = bulletinNo;
                }
                        
                                
                            public java.lang.String getSparepartId(){
                    return sparepartId;
                }
            
                public void setSparepartId(java.lang.String sparepartId){
                    this.sparepartId = sparepartId;
                }
                        
                                
                            public java.lang.String getSparepartName(){
                    return sparepartName;
                }
            
                public void setSparepartName(java.lang.String sparepartName){
                    this.sparepartName = sparepartName;
                }
                        
                                
                            public Long getQty(){
                    return qty;
                }
            
                public void setQty(Long qty){
                    this.qty = qty;
                }
                        
                                
                            public Long getSeq(){
                    return seq;
                }
            
                public void setSeq(Long seq){
                    this.seq = seq;
                }
                        
                                
                            public java.lang.String getPmodel(){
                    return pmodel;
                }
            
                public void setPmodel(java.lang.String pmodel){
                    this.pmodel = pmodel;
                }
                        
                                
                            public java.lang.String getPname(){
                    return pname;
                }
            
                public void setPname(java.lang.String pname){
                    this.pname = pname;
                }
                        
                                
                            public Float getUnitPrice(){
                    return unitPrice;
                }
            
                public void setUnitPrice(Float unitPrice){
                    this.unitPrice = unitPrice;
                }
                        
                                
                            public java.lang.String getEquippedByUser(){
                    return equippedByUser;
                }
            
                public void setEquippedByUser(java.lang.String equippedByUser){
                    this.equippedByUser = equippedByUser;
                }
                        
                                
                            public java.lang.String getOldPmodel(){
                    return oldPmodel;
                }
            
                public void setOldPmodel(java.lang.String oldPmodel){
                    this.oldPmodel = oldPmodel;
                }
                        
                                
                            public java.lang.String getDisposition(){
                    return disposition;
                }
            
                public void setDisposition(java.lang.String disposition){
                    this.disposition = disposition;
                }
                        
                                
                            public java.lang.String getProcessRoute(){
                    return processRoute;
                }
            
                public void setProcessRoute(java.lang.String processRoute){
                    this.processRoute = processRoute;
                }
                        
                                
                            public java.lang.String getUnitName(){
                    return unitName;
                }
            
                public void setUnitName(java.lang.String unitName){
                    this.unitName = unitName;
                }
                        
                                
                            public java.lang.String getSortKind(){
                    return sortKind;
                }
            
                public void setSortKind(java.lang.String sortKind){
                    this.sortKind = sortKind;
                }
                        
                                
                            public java.lang.String getValidFlag(){
                    return validFlag;
                }
            
                public void setValidFlag(java.lang.String validFlag){
                    this.validFlag = validFlag;
                }
                        
                                
                            public java.lang.String getRemark(){
                    return remark;
                }
            
                public void setRemark(java.lang.String remark){
                    this.remark = remark;
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
            return "技术通报涉及材料表";
        }else{
            return super.logFormName;
        }
    }

    public String getLogTitle() {
        if(super.logTitle==null||super.logTitle.equals("")){
            return "技术通报涉及材料表";
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