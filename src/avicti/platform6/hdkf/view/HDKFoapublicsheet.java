package avicti.platform6.hdkf.view;

import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.view.AbstractView;



import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


import avicit.hdkf.support.hdkfoapublicsheet.dto.HdkfOaPublicsheetDTO;
import avicit.platform6.api.sysuser.SysDeptAPI;
import avicit.platform6.bpm.web.service.BpmOperateService;
import avicit.platform6.bpmclient.bpm.service.BpmDisplayService;
import avicit.platform6.bpmclient.dto.sys.HistoryActivityVo;
import avicit.platform6.bpmclient.dto.sys.TrackVo;
import avicit.platform6.core.spring.SpringFactory;

public class HDKFoapublicsheet extends AbstractView{
	//@SuppressWarnings("null")
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {	
		
		HdkfOaPublicsheetDTO dto=(HdkfOaPublicsheetDTO)model.get("dto");
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
		int times=0;
		int times1;
		int tasknum=0;
		int tasknull=0;
		int tasknum1=0;
		newdate=list1.get(0).getEndTime();
		//流程是否走完判断
		while(list1.get(tasknull).getEndTime()!=null&&tasknull<list1.size()-1){
			newdate=list1.get(tasknull).getEndTime();
			newtaskold=list1.get(tasknull).getCurrentActiveName();
			tasknum1++;
			tasknull++;
		}
		

		//tasknum1表示历史流程的次数
		//流程未走完
		int comptask=tasknull+1;
		if(comptask!=list1.size()&&tasknull!=0){
			tasknum1++;
		}
		
/*		if(newtaskold!=null){
			for(;times<tasknull;times++){
				if(newtaskold.compareTo(list1.get(times).getCurrentActiveName())==0){
					tasknum1--;
				}
			}
		}*/
		//流程在第一个节点，或者返回到拟稿处,则tasknum1=0
		
		
		response.setContentType( "application/pdf" );
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();

	/*	System.out.println(list1.size());
		*/
		Document document = new Document(PageSize.A4, 50, 50,50, 50);
		PdfWriter writer =PdfWriter.getInstance(document, buffer);
		String sheetNo=null;
        if(dto.getSheetno()==null){
        	sheetNo="";
        }else{
        	sheetNo=dto.getSheetno();
        }
        
           
        String sendReason=null;
        if(dto.getSendreason()==null){
      	  sendReason="";
        }else{
      	  sendReason=dto.getSendreason();
        }
        //制定人    
        String recorder=null;
        String proofreader=null;
        String reviewer=null;
        String approver=null; 
        if(tasknum1==0){
            recorder="";
            proofreader="";
            reviewer="";
            approver="";         
        }else{
        	if(dto.getRecorder()==null){
            	recorder="";
            }else{
            	recorder=dto.getRecorder();
            }
            if(dto.getProofreader()==null){
            	proofreader="";
            }else{
            	proofreader=dto.getProofreader();
            }
            if(dto.getReviewer()==null){
            	reviewer="";
            }else{
            	reviewer=dto.getReviewer();
            }
            if(dto.getApprover()==null){
            	approver="";
            }else{
            	approver=dto.getApprover();
            }
        }
        
        String sendDep=null;
        
        if(dto.getSendDep()==null){
     	   sendDep="";
        }else{
        	String sendDep1=dto.getSendDep();
        	SysDeptAPI api = SpringFactory.getBean(SysDeptAPI.class);
        	String Dept= api.getSysDeptNameBySysDeptId(sendDep1, "zh_CN");
        	//System.out.println(Dept);
    	    sendDep=Dept;
    	  

        }
        
        
        String sendDate=null;
        if(dto.getSentdate()==null){
     	   sendDate="";
        }else{
     	   String time =new SimpleDateFormat("yyyy.MM.dd").format(dto.getSentdate());
     	   sendDate=time;
        }
        String planetype=null;
        if(dto.getPlanetype()==null){
     	   planetype="";
        }else{
     	   planetype=dto.getPlanetype();
        }
        String batchNo=null;
        String sortieNo=null;
        if(dto.getBatchNo()==null){
     	   batchNo="";
        }else{
     	   batchNo=dto.getBatchNo();
        }
        if(dto.getSortieNo()==null){
     	   sortieNo="";
        }else{
     	   sortieNo=dto.getSortieNo();
        }
        String receiveDep=null;
        if(dto.getReceiveDep()==null){
     	   receiveDep="";
        }else{
     	   
         	String receiveDep1=dto.getReceiveDep();
         	//System.out.println(receiveDep1);
        	SysDeptAPI api = SpringFactory.getBean(SysDeptAPI.class);
        	String Dept= api.getSysDeptNamesBySysDeptIds(receiveDep1,",", "zh_CN");
        	//System.out.println(Dept);
        	receiveDep=Dept;    	   
        }
		
		
		document.open();
		
        String sheetContent=null;
        if(dto.getSheetcontent()==null){
      	  sheetContent="";
        }else{
        	sheetContent=dto.getSheetcontent();
        }
        int needLength = 500;
        List<String> resultList = new ArrayList<String>(sheetContent.length()%needLength+1);
        String subStr;
       // String otherStr;
        int endIndex =0;
        if(sheetContent.length()>0){
        	endIndex=sheetContent.length() > needLength ? needLength : sheetContent.length();
        	subStr = sheetContent.substring(0,endIndex);
        	sheetContent = sheetContent.substring(endIndex);
        	resultList.add(subStr);
        }
        else{
        	resultList.add("");
        }
        
    	/*String sheetContentArry[]=sheetContent.split("。");*/
    	
		for(int r=0;r<resultList.size();r++){
			int page=r+1;
			pdfsheet(document, sheetNo,page ,resultList.size(), sendDep, sendDate, planetype, batchNo, sortieNo, receiveDep, resultList.get(r), sendReason, recorder, proofreader, reviewer, approver);
		}
		
		document.close();
        response.addHeader("Content-Disposition","inline;filename=公用笺.pdf");
			DataOutput output = new DataOutputStream(response.getOutputStream());
			byte[] bytes = buffer.toByteArray();
			response.setContentLength(bytes.length);
			for( int i = 0;i < bytes.length;i++ )
			{
				output.writeByte( bytes[i] );
			}
}

	
	public void pdfsheet(Document document,String sheetNo,int page,int pageall,String sendDep,String sendDate,String planetype,String batchNo,String sortieNo,String receiveDep,String sheetContent,String sendReason,String recorder,String proofreader,String reviewer,String approver) throws DocumentException{
		
		 Font headfont=null ;// 设置字体大小 
		 Font keyfont = null;// 设置字体大小 
		 Font textfont = null;// 设置字体大小 
		BaseFont bfChinese=null; 
		try{
		      
           bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED); 
           headfont = new Font(bfChinese, 25, Font.NORMAL);// 设置字体大小 
           keyfont = new Font(bfChinese, 20, Font.NORMAL);// 设置字体大小 
           textfont = new Font(bfChinese, 14, Font.NORMAL);// 设置字体大小
		}catch (IOException e) {
			e.printStackTrace();
		}
		PdfPCell cell;
		PdfPTable iTable;
		PdfPCell cell1;
		PdfPTable iTable1;
		PDFClassView pdfclass=new PDFClassView();	
		PdfPTable header = new PdfPTable(1);	
        header.setWidthPercentage(100);
        header.addCell(pdfclass.createCell("(89)标艺24", textfont,Element.ALIGN_RIGHT,0,false));
        document.add(header);
        
        PdfPTable headerTable = new PdfPTable(3);
        float[] with={6F,1.2F,0.8F};
        headerTable.setWidths(with);
        headerTable.setWidthPercentage(100);
        
        iTable = new PdfPTable(2);
        float[] with1={2.84F,3.06F};
        iTable.setWidths(with1);
        iTable.addCell(pdfclass.createCell("洪都航空工业集团",40,keyfont));
        iTable.addCell(pdfclass.createCell("公   用   笺",40,headfont));
        cell1 = new PdfPCell(iTable);
        cell1.setPadding(0);
        headerTable.addCell(cell1);	
       
        
        iTable1 = new PdfPTable(1);
        iTable1.addCell(pdfclass.createCell("编           号",20,textfont));
        
        iTable1.addCell(pdfclass.createCell(sheetNo,20,textfont));
       cell = new PdfPCell(iTable1);
       cell.setPadding(0);
       headerTable.addCell(cell);
       
      
       iTable1 = new PdfPTable(1);
       iTable1.addCell(pdfclass.createCell("第"+page+"页",20,textfont));
       iTable1.addCell(pdfclass.createCell("共"+pageall+"页",20,textfont));
      cell = new PdfPCell(iTable1);
      cell.setPadding(0);
      headerTable.addCell(cell);
      document.add(headerTable);
 
      iTable = new PdfPTable(7);
      float[] with2={1F,1.6F,0.5F,0.9F,0.5F,0.9F,1.8F};
      
      iTable.setWidths(with2);
      iTable.setWidthPercentage(100);
      iTable.addCell(pdfclass.createCell("发文单位",20,textfont));
       iTable.addCell(pdfclass.createCell(sendDep,20,textfont));
       iTable.addCell(pdfclass.createCell("日期",20,textfont));
       //new Paragraph("中航工业洪都"));
       iTable.addCell(pdfclass.createCell(sendDate,20,textfont));
       iTable.addCell(pdfclass.createCell("机型",20,textfont));
       iTable.addCell(pdfclass.createCell(planetype,20,textfont));

       iTable.addCell(pdfclass.createCell("用于"+batchNo+"批"+sortieNo+"架",20,textfont));
       document.add(iTable);  
       //分发单位
       iTable = new PdfPTable(2);
       float[] with3={0.45F,2.8F};
       iTable.setWidths(with3);
       iTable.setWidthPercentage(100);
       iTable.addCell(pdfclass.createCell("分发单位",20,textfont,2));
       iTable.addCell(pdfclass.createCell(receiveDep,20,textfont));
       iTable.addCell(pdfclass.createCell("",20,textfont));        
      document.add(iTable);
      
      iTable = new PdfPTable(1);
      iTable.setWidthPercentage(100);
      iTable.addCell(pdfclass.createCell(sheetContent,535,textfont));
      document.add(iTable);  
      iTable = new PdfPTable(6);
      float[] with4={1F,1F,1F,1F,1F,1F};
      iTable.setWidths(with4);
      iTable.setWidthPercentage(100);    
      iTable.addCell(pdfclass.createCell("发笺原因",20,textfont));
      iTable.addCell(pdfclass.createCell(sendReason,20,5,textfont));
      iTable.addCell(pdfclass.createCell("编写",20,textfont));
      iTable.addCell(pdfclass.createCell("校对",20,textfont));
      iTable.addCell(pdfclass.createCell("审核",20,textfont));
      iTable.addCell(pdfclass.createCell("审定",20,textfont));
      iTable.addCell(pdfclass.createCell("",20,textfont));   
      iTable.addCell(pdfclass.createCell("",20,textfont));
    //recorder, proofreader, reviewer, approver
      iTable.addCell(pdfclass.createCell(recorder,30,textfont));
      iTable.addCell(pdfclass.createCell(proofreader,30,textfont));    
      iTable.addCell(pdfclass.createCell(reviewer,30,textfont));   
      iTable.addCell(pdfclass.createCell(approver,30,textfont));
      iTable.addCell(pdfclass.createCell("",30,textfont));
      iTable.addCell(pdfclass.createCell("",30,textfont));    
      document.add(iTable); 
	}
	
	
}
