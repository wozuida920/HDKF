package avicti.platform6.hdkf.view;

import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;
import avicit.platform6.api.syslookup.SysLookupAPI;
import avicit.platform6.bpm.web.service.BpmOperateService;
import avicit.platform6.bpmclient.bpm.service.BpmDisplayService;
import avicit.platform6.bpmclient.dto.sys.TrackVo;
import avicit.platform6.core.spring.SpringFactory;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


public class ExqualityTemtView extends AbstractView{
	@SuppressWarnings("deprecation")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HdkfSupportOutfieldCardDTO dto = (HdkfSupportOutfieldCardDTO)model.get("dto");
				
		BpmOperateService bpmOperateService = SpringFactory.getBean(BpmOperateService.class);
		String processInstanceId = bpmOperateService.getInstanceIdByFormid(dto.getId());
		int loc = processInstanceId.indexOf(".");
        String temp = processInstanceId.substring(loc+1);
	    BpmDisplayService bpmDisplayService = SpringFactory.getBean(BpmDisplayService.class);
		List<TrackVo> list1 = 	bpmDisplayService.getCharacterTracks(temp);
/*		for(TrackVo o:list1){
			System.out.println(o.getCurrentActiveName()+"&&&&&&&"+o.getAssigneeName()+"@@@@"+o.getEndTime()+"%%%%%%%%");
		}*/
		Date newdate=null;
		String newtaskold=null;
		int times;
		int times1=0; 
		int times2;
		int times3;
		int tasknum=0;
		int tasknull=0;
		int tasknum1=0;
		
		newdate=list1.get(0).getEndTime();
		//流程是否走完判断
		while(list1.get(tasknull).getEndTime()!=null&&tasknull<list1.size()-1){
			newdate=list1.get(tasknull).getEndTime();
			newtaskold=list1.get(tasknull).getCurrentActiveName();

			tasknull++;
		}
		int comptask=tasknull+1;
		//第一个节点为开始，或者流程返回到第一个节点
        List<String> listname=new ArrayList<String>();
        List<String> listmessage=new ArrayList<String>();
        List<Date>   listtime=new ArrayList<Date>();
        int task1times=0;
        int task8times=0;
        int task9times=0;
        int task11times=0;
		if(comptask!=list1.size()&&tasknull!=0){
			for(times=0;times<list1.size();times++){
				Date newdatetemp=list1.get(0).getEndTime();
				if(list1.get(times).getCurrentActiveName().compareTo("task1")==0&&list1.get(times).getEndTime().compareTo(newdatetemp)>=0){
					newdatetemp=list1.get(times).getEndTime();
					task1times=times;
					task11times++;
					
				}
				if(list1.get(times).getCurrentActiveName().compareTo("task8")==0&&list1.get(times).getEndTime().compareTo(newdatetemp)>=0){
					newdatetemp=list1.get(times).getEndTime();
					
					task8times=times;
				}
				if(list1.get(times).getCurrentActiveName().compareTo("task9")==0&&list1.get(times).getEndTime().compareTo(newdatetemp)>=0){
					newdatetemp=list1.get(times).getEndTime();
					task9times=times;
				}
				
			}			
		}
		if(task1times==0&&task11times!=0){
			listname.add(list1.get(task1times).getOperateUserName());				
		}
		if(task8times!=0){
			listname.add(list1.get(task8times).getOperateUserName());
		}
		if(task9times!=0){
			listname.add(list1.get(task9times).getOperateUserName());
			listmessage.add(list1.get(task9times).getMessage());
			listtime.add(list1.get(task9times).getEndTime());
		}
		int times11=0;
		int times22=0;
		int nottask=0;
		if(comptask==list1.size()){
			for(times=1;times<list1.size();times++){
				if(list1.get(times).getCurrentActiveName().compareTo("task1")!=0&&list1.get(times).getCurrentActiveName().compareTo("task8")!=0&&list1.get(times).getCurrentActiveName().compareTo("task9")!=0){
					nottask++;
				}
			}
			Date newdatetemp=list1.get(0).getEndTime();
			for(times=1;times<list1.size();times++){
				if(list1.get(times).getCurrentActiveName().compareTo("task1")==0&&list1.get(times).getEndTime()!=null){
					if(list1.get(times).getEndTime().compareTo(newdatetemp)>=0){
						newdatetemp=list1.get(times).getEndTime();
						times1++;
					}else{
						times11++;
					}			
				}
			}
			listname.add(list1.get(times1).getOperateUserName());
			times2=times1+times11+nottask;
			
			for(times=1;times<list1.size();times++){
				if(list1.get(times).getCurrentActiveName().compareTo("task8")==0&&list1.get(times).getEndTime()!=null){
					if(list1.get(times).getEndTime().compareTo(newdatetemp)>=0){
						newdatetemp=list1.get(times).getEndTime();
						times2++;
					}else{
						 times22++;
					}			
				}
			}
			listname.add(list1.get(times2).getOperateUserName());
			times3=times2+times22;
			for(times=1;times<list1.size();times++){
				if(list1.get(times).getCurrentActiveName().compareTo("task9")==0){
					if(list1.get(times).getEndTime().compareTo(newdatetemp)>=0){
						newdatetemp=list1.get(times).getEndTime();
						times3++;
					}			
				}
			}
			listname.add(list1.get(times3).getOperateUserName());
			listmessage.add(list1.get(times3).getMessage());
			listtime.add(list1.get(times3).getEndTime());
		}
		
		
		
		response.setContentType( "application/pdf" );
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		Document pdfDoc = new Document(PageSize.A4, 50, 50,50, 50);
		PdfWriter writer =PdfWriter.getInstance(pdfDoc, buffer);

		 Font headfont=null ;// 设置字体大小 
		 Font keyfont = null;// 设置字体大小 
		 Font keyfont1 = null;
		 Font textfont = null;// 设置字体大小 
		 Font textfont1 = null;
		try{
		    BaseFont bfChinese=null; 
		        //bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED); 
		    bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED); 
		    headfont = new Font(bfChinese, 20, Font.NORMAL);// 设置字体大小 
		    keyfont = new Font(bfChinese, 14, Font.NORMAL);// 设置字体大小 
		    keyfont1 = new Font(bfChinese, 12, Font.NORMAL);// 设置字体大小 
		    textfont = new Font(bfChinese, 10, Font.NORMAL);// 设置字体大小 
		    
		    textfont1 = new Font(bfChinese, 12, Font.NORMAL);
		}catch (IOException e) {
			e.printStackTrace();
		}


	pdfDoc.open();
	
	
	         PdfPCell cell;
	         PdfPCell cell1;
	         PdfPTable iTable;
	         PdfPTable iTable1;
	              //总表格              
	              //顶头
	              PdfPTable header = new PdfPTable(1);
	              header.setWidthPercentage(100);
	              cell = new PdfPCell(new Phrase("(2011)质管02",textfont));
	              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	              cell.setBorder(0);
	              header.addCell(cell);
	              pdfDoc.add(header);
	              
	              PdfPTable headerTable = new PdfPTable(2);
	              float[] with={3F,1F};
	              headerTable.setWidths(with);
	              headerTable.setWidthPercentage(100);
	              //子表
	              iTable = new PdfPTable(2);
	              float[] with1={0.7F,2.3F};
	              iTable.setWidths(with1);
	              cell = new PdfPCell(new Phrase("中航工业洪都",keyfont));
	              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell.setFixedHeight(40);
	              cell.setPadding(0);
	              iTable.addCell(cell);
	              
	              cell = new PdfPCell(new Phrase("外  场  质  量  信  息  处  理  卡",headfont));
	              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell.setFixedHeight(40);
	              cell.setPadding(0);
	              iTable.addCell(cell);
	              
	              cell1 = new PdfPCell(iTable);
		          cell1.setPadding(0);
		         headerTable.addCell(cell1);	         
		         iTable1 = new PdfPTable(1);
		         String infoCardNo=null;
		         if(dto.getInfoCardNo()==null){
		        	 infoCardNo="";
		         }else{
		        	 infoCardNo=dto.getInfoCardNo();
		         }
		         
		         

		         
		          
	              cell1 = new PdfPCell(new Phrase("编号: "+infoCardNo,keyfont));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_LEFT);   
	              cell1.setFixedHeight(20);
	              iTable1.addCell(cell1);
	              //dto.getModelId()
	              cell1 = new PdfPCell(new Phrase("机型: "+"",keyfont));//new Paragraph("中航工业洪都"))+num;
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_LEFT);  
	              cell1.setFixedHeight(20);
	              iTable1.addCell(cell1);

		         cell1 = new PdfPCell(iTable1);
	             cell1.setPadding(0);
	             headerTable.addCell(cell1);         
	                  
	             pdfDoc.add(headerTable);
	             
	             iTable = new PdfPTable(9);
	             float[] with2={1.635f,1F,1.7f,1.165f,1.1f,1.1f,0.5f,0.5f,0.65f};
	             iTable.setWidths(with2);
	             iTable.setWidthPercentage(100);
	             
	             cell1 = new PdfPCell(new Phrase("使用单位",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              
	              cell1 = new PdfPCell(new Phrase("批架",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("何时(大修)出厂",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("飞行时间",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("起落次数",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("信息编号",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("函",textfont1));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("电",keyfont));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	              cell1 = new PdfPCell(new Phrase("信息",keyfont));//new Paragraph("中航工业洪都"));
	              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
	              cell1.setFixedHeight(20);
	              iTable.addCell(cell1);
	             
	              pdfDoc.add(iTable);
	              iTable = new PdfPTable(9);
	              float[] with3={1.635f,1F,1.7f,1.165f,1.1f,1.1f,0.5f,0.5f,0.65f};
		             iTable.setWidths(with3);
		             iTable.setWidthPercentage(100);//dealName
		             String RequestUnit = dto.getRequestUnit();
		             if(RequestUnit==null){
		            	 RequestUnit="";
		             }
		           
		             cell1 = new PdfPCell(new Phrase(RequestUnit,textfont1));//new Paragraph("中航工业洪都"));
		              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
		              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
		              cell1.setFixedHeight(20);
		              iTable.addCell(cell1);
/*		              String BatchNo=dto.getBatchNo();
		              if (BatchNo==null){
		            	  BatchNo="";
		              }*/
		              cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
		              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
		              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
		              cell1.setFixedHeight(20);
		              iTable.addCell(cell1);
		              //dto.getFactoryTime().toString();
		              if (dto.getFactoryTime()==null){
		            	  cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
		              }else
		              {
		            	  String FactoryTime=new SimpleDateFormat("yyyy.MM.dd").format(dto.getFactoryTime());
		            	  cell1 = new PdfPCell(new Phrase(FactoryTime,textfont1));//new Paragraph("中航工业洪都"));
		              }
		              
		              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
		              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
		              cell1.setFixedHeight(20);
		              iTable.addCell(cell1);
		              
/*		              String FlightHours=String.valueOf(dto.getFlightHours());
		              if(FlightHours==null)
		              {
		            	  FlightHours=null;
		              }*/
		              cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
		              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
		              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
		              cell1.setFixedHeight(20);
		              iTable.addCell(cell1);
/*		              
		              String FlightLanding=String.valueOf(dto.getFlightLanding());
		              if(FlightLanding==null){
		            	  FlightLanding="";
		              }
		            	*/	  
		              cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
		              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
		              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
		              cell1.setFixedHeight(20);
		              iTable.addCell(cell1);
		              
		              String RequestId=dto.getRequestNo();
		              if (RequestId==null){
		            	  RequestId="";
		              }
   
		              cell1 = new PdfPCell(new Phrase(RequestId,textfont1));//new Paragraph("中航工业洪都"));
		              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
		              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
		              cell1.setFixedHeight(20);
		              iTable.addCell(cell1);
		              
		              
		             String method=dto.getRequestMethod(); 
		      	 	SysLookupAPI api = SpringFactory.getBean(SysLookupAPI.class);
		    	 	String gender = api.getNameByLooupTypeCodeAndLooupCode("SUPPORT_REQUEST_TYPE", method);
       //求援方式 做判断
		              if(dto.getRequestMethod().equals("0"))//函
		              {
			              cell1 = new PdfPCell(new Phrase(gender,textfont1));//new Paragraph("中航工业洪都"));
			              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			              cell1.setFixedHeight(20);
			              iTable.addCell(cell1);
			              
			              cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			              cell1.setFixedHeight(20);
			              iTable.addCell(cell1);
			              cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			              cell1.setFixedHeight(20);
			              iTable.addCell(cell1);
		              }
		               if(dto.getRequestMethod().equals("1"))//函
			            {
			            cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			           cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			           cell1.setFixedHeight(20);
			           iTable.addCell(cell1);
			            			              
				        cell1 = new PdfPCell(new Phrase("电",textfont1));//new Paragraph("中航工业洪都"));
			            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			            cell1.setFixedHeight(20);
			            iTable.addCell(cell1);
			            cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			            cell1.setFixedHeight(20);
			            iTable.addCell(cell1);
			          }
		               if(dto.getRequestMethod().equals("2"))//函
			            {
			            	cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			            	 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			            	cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			            	cell1.setFixedHeight(20);
			            	iTable.addCell(cell1);
			            	cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			            	cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			            	cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			            	cell1.setFixedHeight(20);
			            	iTable.addCell(cell1);
			            	cell1 = new PdfPCell(new Phrase("信息",textfont1));//new Paragraph("中航工业洪都"));
			            	cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			            	cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			            	cell1.setFixedHeight(20);
			            	iTable.addCell(cell1);

			           } else{
			        	   cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			        	   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        	   cell1.setFixedHeight(20);
			        	   iTable.addCell(cell1);
			        	   cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			        	   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        	   cell1.setFixedHeight(20);
			        	   iTable.addCell(cell1);
			        	   cell1 = new PdfPCell(new Phrase("",textfont1));//new Paragraph("中航工业洪都"));
			        	   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);;
			        	   cell1.setFixedHeight(20);
			        	   iTable.addCell(cell1);
			        	   }
	




	             
		              pdfDoc.add(iTable);	              
	             
			             iTable = new PdfPTable(2);
			             float[] with4={1.57f,7.43f};
			             iTable.setWidths(with4);
			             iTable.setWidthPercentage(100);
			             
			             cell1 = new PdfPCell(new Phrase("问题(故障)名称",textfont1));//new Paragraph("中航工业洪都"));
			              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			              cell1.setFixedHeight(20);
			              iTable.addCell(cell1);
			              String FaultName=dto.getFaultName();
			              if(FaultName==null){
			            	  FaultName="";
			              }
			              cell1 = new PdfPCell(new Phrase(FaultName,textfont1));//new Paragraph("中航工业洪都"));
			              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
			              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
			              cell1.setFixedHeight(20);
			              iTable.addCell(cell1);
			             
			              pdfDoc.add(iTable);

				             iTable = new PdfPTable(2);
				             float[] with5={1f,17f};
				             iTable.setWidths(with5);
				             iTable.setWidthPercentage(100);
				             
				             cell1 = new PdfPCell(new Phrase("情况简介",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell1.setFixedHeight(140);
				              iTable.addCell(cell1);
				              String CaseDesc=dto.getCaseDesc();
				              if(CaseDesc==null){
				            	  CaseDesc="";
				              }
				              cell1 = new PdfPCell(new Phrase(CaseDesc,keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell1.setFixedHeight(140);
				              iTable.addCell(cell1);
				             
				              pdfDoc.add(iTable);
		              
		                     //
				              PdfPTable headerTable1 = new PdfPTable(2);
				              float[] with_1={1F,17F};
				              headerTable1.setWidths(with_1);
				              headerTable1.setWidthPercentage(100);
				              
				              iTable = new PdfPTable(1);
				              cell = new PdfPCell(new Phrase("建  议  或  要  求",keyfont));
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell.setFixedHeight(140);
				              cell.setPadding(0);
				              iTable.addCell(cell);		              
				              cell1 = new PdfPCell(iTable);
					          cell1.setPadding(0);
					          headerTable1.addCell(cell1);
					          
					          iTable1 = new PdfPTable(6);
					          float[] with_2={1F,2F,1F,2F,1F,2F};
					          iTable1.setWidths(with_2);
						       //
					          String Advice=dto.getAdvice();
					          if(Advice==null){
					        	  Advice="";
					          }
				              cell1 = new PdfPCell(new Phrase(Advice,keyfont));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell1.setFixedHeight(120);
				              cell1.setColspan(6);
				              iTable1.addCell(cell1);
				              
				              cell1 = new PdfPCell(new Phrase("技术员",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(20);
				              iTable1.addCell(cell1);
				          //技术员
				             
				              String techNician="";
				              if(listname.size()>=1&&listname.get(0)!=null){				  
				            	   techNician = listname.get(0);
				            	   cell1 = new PdfPCell(new Phrase(techNician,keyfont));   
				              }else{
				            	  cell1 = new PdfPCell(new Phrase("",keyfont)); 
				              }

				            	  
				            	  
				              //listOperateUserName.get(0).toString()
				              //new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(20);
				              iTable1.addCell(cell1);
				              
				              cell1 = new PdfPCell(new Phrase("主   任",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(20);
				              iTable1.addCell(cell1);
				              //主任
				             String direCtor="";
				              if(listname.size()>=2&&listname.get(1)!=null){
				            	   direCtor=listname.get(1);
				            	cell1 = new PdfPCell(new Phrase(direCtor,keyfont));			            	   
				              }else{
				            	  cell1 = new PdfPCell(new Phrase("",keyfont));
				              }
				              
				              
				              //new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(20);
				              iTable1.addCell(cell1);
				              
				              cell1 = new PdfPCell(new Phrase("部   长",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(20);
				              iTable1.addCell(cell1);
				              //部长
				              String miniSter="";
				              if(listname.size()>=3&&listname.get(2)!=null){
				            	  miniSter=listname.get(2);
				            	  cell1 = new PdfPCell(new Phrase(miniSter,keyfont));			            	   
				              }else{
				            	  cell1 = new PdfPCell(new Phrase("",keyfont));
				              }
				              
				              
				              //new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(20);
				              iTable1.addCell(cell1);
				              
					          cell = new PdfPCell(iTable1);
				              cell.setPadding(0);
				              headerTable1.addCell(cell);         
				                  
				             pdfDoc.add(headerTable1);
				             
				             
				             PdfPTable headerTable2 = new PdfPTable(2);
				             float[] with_3={1F,17F};
				             headerTable2.setWidths(with_3);
				             headerTable2.setWidthPercentage(100);
				             
				              iTable = new PdfPTable(1);
				              cell = new PdfPCell(new Phrase("领  导  批  示",keyfont));
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell.setFixedHeight(140);
				              cell.setPadding(0);
				              iTable.addCell(cell);		              
				              cell1 = new PdfPCell(iTable);
					          cell1.setPadding(0);
				              headerTable2.addCell(cell1);
				              
				              iTable1 = new PdfPTable(4);
					          float[] with_4={1F,2F,1F,2F};
					          iTable1.setWidths(with_4);
					          //领导批示
					          String ministerMessage="";
				              if(listmessage.size()>=1&&listmessage.get(0)!=null){
				            	  ministerMessage =listmessage.get(0);
				            	  cell1 = new PdfPCell(new Phrase(ministerMessage,keyfont));
				              }else{
				            	  cell1 = new PdfPCell(new Phrase("",keyfont));
				              }
				              
				              
  			                  cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell1.setFixedHeight(120);
				              cell1.setColspan(4);
				              cell1.setBorder(0);
				              cell1.setPadding(0);
				              iTable1.addCell(cell1);

				              cell = new PdfPCell(new Phrase("",keyfont));
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell.setFixedHeight(20);
				              cell.setColspan(2);
				              cell.setBorder(0);
				              cell.setPadding(0);
				              iTable1.addCell(cell);
				             				                
				             
				              if(listname.size()>=3&&listname.get(2)!=null){
				            	 miniSter=listname.get(2);
				            	 cell = new PdfPCell(new Phrase("签字 "+miniSter,keyfont));  
				              }else{
				            	  cell = new PdfPCell(new Phrase("签字 "+"",keyfont)); 
				              }
				              
				              
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell.setFixedHeight(20);
				              cell.setBorder(0);
				              cell.setPadding(0);
				              iTable1.addCell(cell);
				              //年月日
				           
				              String dateS=null;
				              if(listtime.size()>=1&&listtime.get(0)!=null){
				            	  dateS=listtime.get(0).toString();
				            	  SimpleDateFormat sf1 = new SimpleDateFormat("EEE MMM dd hh:mm:ss z yyyy", Locale.ENGLISH);
				            	  Date dateRe=sf1.parse(dateS);
				            	  SimpleDateFormat sf2 = new SimpleDateFormat("yyyy年MM月dd日    ");
				            	  String datetime=sf2.format(dateRe);
				            	 
				            	  cell = new PdfPCell(new Phrase(datetime,keyfont));
				              }else{
				            	  cell = new PdfPCell(new Phrase("",keyfont));
				              }
				              
				              
				             
				              
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				              cell.setFixedHeight(20);
				              cell.setBorder(0);
				              cell.setPadding(0);
				              iTable1.addCell(cell);
				              cell1 = new PdfPCell(iTable1);
					          cell1.setPadding(0);
				              headerTable2.addCell(cell1);				              
				              pdfDoc.add(headerTable2);
				              
				              
				              PdfPTable headerTable3 = new PdfPTable(2);
				              float[] with_5={1F,17F};
				              headerTable3.setWidths(with_5);
				              headerTable3.setWidthPercentage(100);
				              
				              iTable = new PdfPTable(1);
				              cell = new PdfPCell(new Phrase("承  办  单  位  意  见  或  处  理  结  论",keyfont));
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				              cell.setPadding(0);
				              iTable.addCell(cell);		              
				              cell1 = new PdfPCell(iTable);
					          cell1.setPadding(0);
					          headerTable3.addCell(cell1);
					          
					          iTable1 = new PdfPTable(8);
					          float[] with_6={1F,1F,1F,1F,1F,1F,1F,1F};
					          iTable1.setWidths(with_6);
					          
					          
					          String cbComment=null;
				              if(dto.getDealSolution()!=null){/////这里做循环判断
				            	  cbComment =dto.getDealSolution();				            	
				            	  cell1 = new PdfPCell(new Phrase(cbComment,keyfont));            	   
				              }else{
				            	  cell1 = new PdfPCell(new Phrase("",keyfont));
				              }					          					          
				             
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);   
				              cell1.setFixedHeight(140);
				              cell1.setColspan(8);
				              iTable1.addCell(cell1);
				            
				              cell1 = new PdfPCell(new Phrase("承办人",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
			          
					          String cb=null;
				              if(dto.getDealUserId()!=null){/////这里做循环判断
				            	  cb =dto.getDealUserId();
				            	  cell1 = new PdfPCell(new Phrase("",keyfont));	//承办人			            		
				            	  }else{
				            	  cell1 = new PdfPCell(new Phrase("",keyfont));
				              }	

				          
				             
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
				              
				              cell1 = new PdfPCell(new Phrase("组   长",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				            //  cell1.setMinimumHeight(20);
				              iTable1.addCell(cell1);
				            cell1 = new PdfPCell(new Phrase("",keyfont));			             			              
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
				              
				              cell1 = new PdfPCell(new Phrase("主  任",keyfont));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
		            	  cell1 = new PdfPCell(new Phrase("",keyfont));
		              //new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
				              cell1 = new PdfPCell(new Phrase("总师",keyfont));//new Paragraph("中航工业洪都"));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
				             cell1 = new PdfPCell(new Phrase("",keyfont));
				              cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell1.setHorizontalAlignment(Element.ALIGN_CENTER);  
				              cell1.setFixedHeight(40);
				              iTable1.addCell(cell1);
				              
					          cell = new PdfPCell(iTable1);
				              cell.setPadding(0);
				              headerTable3.addCell(cell);         
				                  
				             pdfDoc.add(headerTable3);
				              
				             PdfPTable end = new PdfPTable(1);
				             end.setWidthPercentage(100);
				              cell = new PdfPCell(new Phrase("注:此表一式三份由承办单位解答后一份自存,两份交售后服务部",textfont));
				              cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
				              cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				              cell.setBorder(0);
				              end.addCell(cell);
				              pdfDoc.add(end);

	            
	           pdfDoc.close();
	           
			    response.addHeader("Content-Disposition","inline;filename=外场质量信息处理卡.pdf");
				DataOutput output = new DataOutputStream(response.getOutputStream());
				byte[] bytes = buffer.toByteArray();
				response.setContentLength(bytes.length);
				for( int i = 0;i < bytes.length;i++ )
				{
					output.writeByte( bytes[i] );
				}
	                    
	  
		}
	}


