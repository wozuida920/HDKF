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

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


import avicit.csmp.basicData.hdkfbdcoderule.dto.HdkfBdCodeRuleDTO;
import avicit.hdkf.support.hdkfoapublicsheet.service.HdkfOaPublicsheetService;
import avicit.hdkf.support.hdkfsupporttaskarchive.dao.HdkfSupportTaskArchiveDao;
import avicit.hdkf.support.hdkfsupporttaskarchive.dto.HdkfSupportTaskArchiveDTO;
import avicit.hdkf.support.hdkfsupporttaskarchive.service.HdkfSupportTaskArchiveService;
import avicit.hdkf.support.hdkfsupporttriptask.dto.HdkfSupportTripTaskDTO;
import avicit.hdkf.support.hdkfsupporttriptask.service.HdkfSupportTripTaskService;
import avicit.platform6.bpm.web.service.BpmOperateService;
import avicit.platform6.bpmclient.bpm.service.BpmDisplayService;
import avicit.platform6.bpmclient.dto.sys.TrackVo;
import avicit.platform6.core.properties.PlatformConstant.OpResult;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.platform6.core.spring.SpringFactory;

public class TripTaskView extends AbstractView{

	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {		
		HdkfSupportTripTaskDTO dto= (HdkfSupportTripTaskDTO)model.get("dto");
		
		QueryReqBean<HdkfSupportTaskArchiveDTO> queryReqBean = new QueryReqBean<HdkfSupportTaskArchiveDTO>();
		
		HdkfSupportTaskArchiveDTO searchParams=new HdkfSupportTaskArchiveDTO();
		searchParams.setTaskNo(dto.getTaskNo());
		queryReqBean.setSearchParams(searchParams);
		HdkfSupportTaskArchiveService hdkfSupportTaskArchiveService=SpringFactory.getBean(HdkfSupportTaskArchiveService.class);
		QueryRespBean<HdkfSupportTaskArchiveDTO> dtoTask=hdkfSupportTaskArchiveService.searchHdkfSupportTaskArchiveByPage(queryReqBean, "");
		avicit.platform6.core.mybatis.pagehelper.Page<HdkfSupportTaskArchiveDTO> page = dtoTask.getResult();
		String att1="";
		String att2="";
		if (page.size() > 0) {
			if(page.get(0).getAttribute01()!=null){
				att1=page.get(0).getAttribute01();
			}
			if(page.get(0).getAttribute02()!=null){
				att2=page.get(0).getAttribute02();
			}		
		} 		
		BpmOperateService bpmOperateService = SpringFactory.getBean(BpmOperateService.class);
		String processInstanceId = bpmOperateService.getInstanceIdByFormid(dto.getId());
		int loc = processInstanceId.indexOf(".");
		String temp = processInstanceId.substring(loc+1);
		BpmDisplayService bpmDisplayService = SpringFactory.getBean(BpmDisplayService.class);
		List<TrackVo> list1 = 	bpmDisplayService.getCharacterTracks(temp);
/*		for(TrackVo o:list1){
			System.out.println(o.getCurrentActiveName()+"&&&&&&&"+o.getAssigneeName()+"@@@@"+o.getEndTime()+"%%%%%%%%");
		}

*/
		
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
	if(comptask!=list1.size()){
		for(;times<tasknull;times++){
			if(newtaskold.compareTo(list1.get(times).getCurrentActiveName())==0){
				tasknum1--;
			}
		}
	}
	if(comptask==list1.size()){
		tasknum1=list1.size();
		//表示流程走完
	}
	//流程在第一个节点，或者返回到拟稿处,则tasknum1=0
	
	//tasknum1表示已经走了的节点总次数
	//初始化参照数
	List<String> listname=new ArrayList<String>();
	Date newdatetemp=list1.get(0).getEndTime();	
	int timesTask2=0;
	//int timesTask22=0;
	for(times1=1;times1<tasknum1;times1++){
		if(list1.get(times1).getCurrentActiveName().compareTo("task2")==0){
			if(list1.get(times1).getEndTime().compareTo(newdatetemp)>=0){
				newdatetemp=list1.get(times1).getEndTime();
				timesTask2++;
			}			
		}
	}
	listname.add(list1.get(timesTask2).getOperateUserName());
	int timesTask3=timesTask2;
	for(times1=1;times1<tasknum1;times1++){
		if(list1.get(times1).getCurrentActiveName().compareTo("task3")==0){
			if(list1.get(times1).getEndTime().compareTo(newdatetemp)>=0){
				newdatetemp=list1.get(times1).getEndTime();
				timesTask3++;
			}			
		}
	}
	listname.add(list1.get(timesTask3).getOperateUserName());
	
	

	
	
	response.setContentType( "application/pdf" );
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		Document document = new Document(PageSize.A4, 50, 50,50, 50);
		PdfWriter writer =PdfWriter.getInstance(document, buffer);
		
		 Font headfont=null ;// 设置字体大小 
		 Font keyfont = null;// 设置字体大小 
		 Font textfont = null;// 设置字体大小 
		Font textfont1 =null;

		try{
		    BaseFont bfChinese=null; 
        
            bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED); 
            headfont = new Font(bfChinese, 25, Font.NORMAL);// 设置字体大小 
            keyfont = new Font(bfChinese, 20, Font.NORMAL);// 设置字体大小 
            textfont = new Font(bfChinese, 17, Font.NORMAL);// 设置字体大小
            textfont1 = new Font(bfChinese, 17, Font.NORMAL);

             
		}catch (IOException e) {
			e.printStackTrace();
		}

		document.open();
   	 PdfPCell cell;
   	 PdfPTable table;
   	PdfPCell cell1;
   	PdfPTable header = new PdfPTable(1);
    header.setWidthPercentage(100);
    cell = new PdfPCell(new Phrase("(2001)质管 13",textfont));
    cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
    cell.setBorder(0);
 
    header.addCell(cell);
    document.add(header);

    //第一页
    PdfPTable table1 = new PdfPTable(1);	                 
    table1.setWidthPercentage(100);
    PdfPTable table2 = new PdfPTable(2);
    float[] with5={1f,1f};
    table2.setWidths(with5);
    table2.setWidthPercentage(100);
    cell1 = new PdfPCell(new Phrase(" ",headfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell1.setColspan(2);
    cell1.setBorder(0);
    cell1.setFixedHeight(130);
    table2.addCell(cell1);
     
    cell1 = new PdfPCell(new Phrase("出    差    任    务    书",headfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell1.setBorder(0);
    cell1.setColspan(2);
    cell1.setFixedHeight(100);
    table2.addCell(cell1);
    
    
    cell1 = new PdfPCell(new Phrase("编    号: ",keyfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
    cell1.setBorder(0);	          
    cell1.setFixedHeight(80);
    table2.addCell(cell1);

	 String TaskNo=dto.getTaskNo();

	 if(TaskNo==null){
		 //num1="_______________";
		 cell1 = new PdfPCell(new Phrase("",textfont));//underlinefont1));
	 }
	 else{
		 
		 //Chunk chunk1 = new Chunk("This text is underlined", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE)); 
		 cell1 = new PdfPCell(new Phrase(TaskNo,textfont));
		 
	 }              
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell1.setBorder(0);
    cell1.setFixedHeight(80);
    table2.addCell(cell1);  
    cell1 = new PdfPCell(new Phrase("填    写: ",keyfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
    cell1.setBorder(0);	          
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
//填写人
    String WriteManName1=null;
	 if(tasknum1==0){
		 cell1 = new PdfPCell(new Phrase("",keyfont));
	 }else{
		 WriteManName1=dto.getWriteManName();
		 cell1 = new PdfPCell(new Phrase(WriteManName1,keyfont));
	 }
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell1.setBorder(0);
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
    
    cell1 = new PdfPCell(new Phrase("室主任: ",keyfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
    cell1.setBorder(0);	          
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
    
     String Director1=null;
     
     if(listname.size()>=1){
    	 Director1=listname.get(0);
    	 if(Director1==null){ 	 
    		 cell1 = new PdfPCell(new Phrase("",keyfont));//underlinefont1));
    	 }
    	 else{
    		 cell1 = new PdfPCell(new Phrase(Director1,keyfont));
  		}
     }
     else
     {
    	 cell1 = new PdfPCell(new Phrase("",keyfont));
     }

    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell1.setBorder(0);
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
    
    cell1 = new PdfPCell(new Phrase("部    长: ",keyfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
    cell1.setBorder(0);	          
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
     String Head1="";
     
     if(listname.size()>=2){
    	 Head1=listname.get(1);
    	 if(Head1==null){ 	 
    		 cell1 = new PdfPCell(new Phrase("",keyfont));//underlinefont1));
    	 }
    	 else{
    		 cell1 = new PdfPCell(new Phrase(Head1,keyfont));
  		}
     }
     else
     {
    	 cell1 = new PdfPCell(new Phrase("",keyfont));
     }
     

    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell1.setBorder(0);            
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
    
    cell1 = new PdfPCell(new Phrase("二0        年         月",textfont1));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell1.setBorder(0);
    cell1.setColspan(2);
    cell1.setFixedHeight(80);
    table2.addCell(cell1);
    
    cell=new PdfPCell(table2);
    cell.setPadding(0);
    cell.setFixedHeight(720);
    table1.addCell(cell);	            
    
    document.add(table1);
    
    //第二页表
   // document.newPage();
    PdfPTable table_2 = new PdfPTable(1);
    table_2.setWidthPercentage(100);
    
    PdfPTable table3 = new PdfPTable(2);
    float[] with={2.5F,1.5F};
    table3.setWidths(with);
    String ContentDemand=dto.getContentDemand();
    if(ContentDemand==null){
    	cell1 = new PdfPCell(new Phrase("任务内容与要求:\n",textfont));
    }
    else
    {
    	cell1 = new PdfPCell(new Phrase("任务内容与要求:\n"+dto.getContentDemand(),textfont));
    }
   // cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell1.setBorder(0);
    cell1.setFixedHeight(530);
    cell1.setColspan(2);
    table3.addCell(cell1);
    
    cell1 = new PdfPCell(new Phrase("",textfont));
       // cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
    cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
    cell1.setBorder(0);
    cell1.setFixedHeight(40);		              
    table3.addCell(cell1);
    String FeeNo=dto.getFeeNo();
    if(FeeNo==null){
    	cell1 = new PdfPCell(new Phrase("费用编号: ",textfont));
    }else
    {
    	cell1 = new PdfPCell(new Phrase("费用编号: "+FeeNo,textfont));
    }
   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
            //cell1.setBorder(0);
   cell1.setFixedHeight(40);		            
   table3.addCell(cell1);
   
   cell=new PdfPCell(table3);
   table_2.addCell(cell);			      
   //cell.setPadding(0);
   cell.setFixedHeight(170);
   document.add(table_2);
   
   PdfPTable table_3 = new PdfPTable(4);
   float[] with3={1F,1F,1F,1F};
   table_3.setWidthPercentage(100);
   table_3.setWidths(with3);
   
   cell1 = new PdfPCell(new Phrase("排故所去部队",textfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(40);		            
   table_3.addCell(cell1);
   String ArmyName=dto.getToArmyName();
   if(ArmyName==null){
	   cell1 = new PdfPCell(new Phrase("",textfont));
   }else
   {
	   cell1 = new PdfPCell(new Phrase(ArmyName,textfont));
   }
   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(40);
   cell1.setColspan(3);
   table_3.addCell(cell1);
   document.add(table_3);
   
   PdfPTable table_4 = new PdfPTable(2);
   float[] with_4={1F,3f};
   table_4.setWidthPercentage(100);
   table_4.setWidths(with_4);
   table=new PdfPTable(1);
   cell1 = new PdfPCell(new Phrase("执行者",textfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(80);		            
   table.addCell(cell1);
   
   cell= new PdfPCell(table);
   table_4.addCell(cell1);   
   table=new PdfPTable(1);
   String Executors=dto.getExecutors();
   if(Executors==null || Executors.length()<=19){
	   if(Executors==null){
		   Executors="";
	   }
	   cell1 = new PdfPCell(new Phrase(Executors,textfont));
	   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	    //cell1.setBorder(0);
	   cell1.setFixedHeight(40);	            
	   table.addCell(cell1);
	   cell1 = new PdfPCell(new Phrase("",textfont));
	    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	    //cell1.setBorder(0);
	   cell1.setFixedHeight(40);	            
	   table.addCell(cell1);
	   cell=new PdfPCell(table);
	   table_4.addCell(cell);
	   document.add(table_4);
   }else{
	  // String[] sourceStrArray=Executors.split("、");
	   String[] sourceStrArray=Executors.split("、",2);
	   cell1 = new PdfPCell(new Phrase(sourceStrArray[0],textfont));
	   cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	    //cell1.setBorder(0);
	   cell1.setFixedHeight(40);	            
	   table.addCell(cell1);
	   cell1 = new PdfPCell(new Phrase(sourceStrArray[1],textfont));
	    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
	   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	    //cell1.setBorder(0);
	   cell1.setFixedHeight(40);	            
	   table.addCell(cell1);
	   cell=new PdfPCell(table);
	   table_4.addCell(cell);
	   document.add(table_4);
   }
    
   PdfPTable table_5 = new PdfPTable(4);
   float[] with_5={1F,1F,1F,1F};
   table_5.setWidthPercentage(100);
   table_5.setWidths(with_5);
   
   cell1 = new PdfPCell(new Phrase("总任务完成时间",textfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(40);		            
   table_5.addCell(cell1);
   String TotalHours=String.valueOf(dto.getTotalHours());
   if(TotalHours==null){
	   cell1 = new PdfPCell(new Phrase("",textfont));
   }else{
	   cell1 = new PdfPCell(new Phrase(TotalHours,textfont));
   }
   
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(40);
   
   table_5.addCell(cell1);
   
   cell1 = new PdfPCell(new Phrase("实际完成时间",textfont));
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(30);		            
   table_5.addCell(cell1);
   if(dto.getEndDate()==null){  
	   cell1 = new PdfPCell(new Phrase("",textfont));
   }else{
	   String EndDate=new SimpleDateFormat("yyyy.MM.dd").format(dto.getEndDate());
	   cell1 = new PdfPCell(new Phrase(EndDate,textfont));
   }
   
    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE); 
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    //cell1.setBorder(0);
   cell1.setFixedHeight(30);
   
   table_5.addCell(cell1);
   
   document.add(table_5);
   
   //document.newPage();
   table=new PdfPTable(1);
   table.setWidthPercentage(100);
   String TaskDetails=dto.getTaskDetails();
   if(TaskDetails==null){
	   cell = new PdfPCell(new Phrase("任务完成详细说明:\n",textfont));
   }else{
	   cell = new PdfPCell(new Phrase("任务完成详细说明:\n"+TaskDetails,textfont));
   }
   
    cell.setVerticalAlignment(Element.ALIGN_TOP); 
    cell.setHorizontalAlignment(Element.ALIGN_LEFT);	             
    cell.setFixedHeight(740);
    table.addCell(cell);
    document.add(table);
  		 
String SuggestionDemand=dto.getSuggestionDemand();

if(SuggestionDemand==null){
		SuggestionDemand="";
	    table=new PdfPTable(1);
	    table.setWidthPercentage(100);

	    cell = new PdfPCell(new Phrase("部门领导队工厂执行任务的意见和要求:\n"+SuggestionDemand,textfont));
	    cell.setVerticalAlignment(Element.ALIGN_TOP); 
	    cell.setHorizontalAlignment(Element.ALIGN_LEFT);	             
	    cell.setFixedHeight(530);
	    table.addCell(cell);
	    document.add(table);
}else if (dto.getSuggestionDemand().length()>0&&dto.getSuggestionDemand().length()<=400){
    	    table=new PdfPTable(1);
    	     table.setWidthPercentage(100);

     cell = new PdfPCell(new Phrase("部门领导队工厂执行任务的意见和要求:\n"+SuggestionDemand,textfont));
      cell.setVerticalAlignment(Element.ALIGN_TOP); 
      cell.setHorizontalAlignment(Element.ALIGN_LEFT);	             
      cell.setFixedHeight(530);
        table.addCell(cell);
        document.add(table);
     }else if (dto.getSuggestionDemand().length()>400){
    	 String[] sourceStrArray=SuggestionDemand.split("。",2);
             table=new PdfPTable(1);
             table.setWidthPercentage(100);
             cell = new PdfPCell(new Phrase("部门领导队工厂执行任务的意见和要求:\n"+sourceStrArray[0],textfont));
             cell.setVerticalAlignment(Element.ALIGN_TOP); 
             cell.setHorizontalAlignment(Element.ALIGN_LEFT);
             //cell.setColspan(2);
             cell.setFixedHeight(740);
             table.addCell(cell);		              
             document.add(table);
             
             table=new PdfPTable(1);
    	     table.setWidthPercentage(100);
     
     cell = new PdfPCell(new Phrase("部门领导队工厂执行任务的意见和要求:\n"+sourceStrArray[1],textfont));
      cell.setVerticalAlignment(Element.ALIGN_TOP); 
      cell.setHorizontalAlignment(Element.ALIGN_LEFT);	             
      cell.setFixedHeight(530);
        table.addCell(cell);
        document.add(table);             
         }

     PdfPTable table_A=new PdfPTable(2);
     float[] with_t={1F,1F};        
     table_A.setWidths(with_t);
     table_A.setWidthPercentage(100);

     table = new PdfPTable(1);			          		            
     if(att1==null){
    	 cell = new PdfPCell(new Phrase("对执行任务的评价:\n",textfont));
     }else
     {
    	 cell = new PdfPCell(new Phrase("对执行任务的评价:\n"+att1,textfont));
     }
     cell.setVerticalAlignment(Element.ALIGN_TOP); 
     cell.setHorizontalAlignment(Element.ALIGN_LEFT);
     cell.setFixedHeight(110);
     cell.setBorder(0);			           
     table.addCell(cell);
     

     if(Director1==null){
    	 cell = new PdfPCell(new Phrase("技术室主任: "+"",textfont));
     }else{
    	 cell = new PdfPCell(new Phrase("技术室主任: "+Director1,textfont));
     }
     
     cell.setVerticalAlignment(Element.ALIGN_BOTTOM); 
     cell.setHorizontalAlignment(Element.ALIGN_LEFT);
     cell.setFixedHeight(80);
     cell.setBorder(0);
     cell.setPaddingBottom(8.0f);
     table.addCell(cell);
     cell1 = new PdfPCell(table);
     cell1.setFixedHeight(200);
     
     table_A.addCell(cell1);
     
     table = new PdfPTable(1);
     if(att2==null){
    	 cell = new PdfPCell(new Phrase("对执行任务的评价:\n",textfont));
     }else
     {
    	 cell = new PdfPCell(new Phrase("对执行任务的评价:\n"+att2,textfont));
     }
     cell.setVerticalAlignment(Element.ALIGN_TOP); 
     cell.setHorizontalAlignment(Element.ALIGN_LEFT);
     cell.setFixedHeight(110);
     cell.setBorder(0);			           
     table.addCell(cell);
     
     if(Head1==null){
    	 Head1="";
     }
     cell = new PdfPCell(new Phrase("部长: "+Head1,textfont)); 
/*     cell.setHorizontalAlignment(Element.ALIGN_LEFT);
     //cell.setPadding(0);
     cell.setFixedHeight(200);*/
     cell.setVerticalAlignment(Element.ALIGN_BOTTOM); 
     cell.setHorizontalAlignment(Element.ALIGN_LEFT);
     cell.setFixedHeight(80);
     cell.setBorder(0);
     cell.setPaddingBottom(8.0f);
     table.addCell(cell);
     cell1 = new PdfPCell(table);
     cell1.setFixedHeight(200);
     table_A.addCell(cell1);
       
     document.add(table_A);
     
   
         document.close();
         
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
