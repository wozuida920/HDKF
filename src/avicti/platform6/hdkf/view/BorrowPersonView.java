package avicti.platform6.hdkf.view;

import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.view.AbstractView;

import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
import avicit.hdkf.support.hdkfsupportpersondetail.dto.HdkfSupportPersonDetailDTO;
import avicit.platform6.api.syslookup.SysLookupAPI;
import avicit.platform6.api.syslookup.impl.SysLookupAPImpl;
import avicit.platform6.api.sysuser.SysDeptAPI;
import avicit.platform6.bpm.web.service.BpmOperateService;
import avicit.platform6.core.spring.SpringFactory;
import avicit.platform6.modules.system.sysorguser.sysdept.domain.SysDept;
import avicit.platform6.modules.system.sysorguser.sysdept.service.SysDeptService;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;

import com.itextpdf.text.pdf.BaseFont;

import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mysql.fabric.xmlrpc.base.Data;


public class BorrowPersonView extends AbstractView{	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		for(String sto:model.keySet()){
			System.out.println(sto);
		}
				
		HdkfSupportBorrowPersonInfDTO dto = (HdkfSupportBorrowPersonInfDTO)model.get("dto");				
		List<HdkfSupportPersonDetailDTO> child = (List<HdkfSupportPersonDetailDTO>)model.get("childto");

		 Font headfont = null ;// 设置字体大小 
		    Font keyfont = null;// 设置字体大小 
		    Font textfont = null;// 设置字体大小    
		 
		        BaseFont bfChinese; 
		        try { 
		            bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED); 
		            headfont = new Font(bfChinese, 20, Font.BOLD);// 设置字体大小 
		            keyfont = new Font(bfChinese, 10, Font.BOLD);// 设置字体大小 
		            textfont = new Font(bfChinese, 14, Font.NORMAL);// 设置字体大小 
		        } catch (Exception e) {          
		            e.printStackTrace(); 
		        }   		        
		       		        
		        response.setContentType( "application/pdf" );
				ByteArrayOutputStream buffer = new ByteArrayOutputStream();
				Document document = new Document(PageSize.A4, 50, 50,50, 50);
				PdfWriter writer =PdfWriter.getInstance(document, buffer);
				document.open();
		        
		        PDFClassView pdfclass=new PDFClassView();
	 PdfPTable table = pdfclass.createTable(8); 

     table.addCell(pdfclass.createCell("公开", keyfont,Element.ALIGN_LEFT,1,false)); 
     table.addCell(pdfclass.createCell("(2015)人管 35", keyfont,Element.ALIGN_RIGHT,7,false));
     table.addCell(pdfclass.createCell("客服服务部出差人员借用通知单", headfont,Element.ALIGN_CENTER,8,false));
     
     table.addCell(pdfclass.createCell("单  位", textfont, Element.ALIGN_CENTER)); 
     if(dto.getBorrowDept()==null){
    	 table.addCell(pdfclass.createCell("", textfont, Element.ALIGN_CENTER)); 
     }else{
         String deptId = dto.getBorrowDept();
         SysDeptAPI deptAPI = SpringFactory.getBean(SysDeptAPI.class);
         String deptName = deptAPI.getSysDeptNameBySysDeptId(deptId, "zh_CN");
         table.addCell(pdfclass.createCell(deptName, textfont, Element.ALIGN_CENTER)); 
     }

     table.addCell(pdfclass.createCell("人数", textfont, Element.ALIGN_CENTER));
     if(dto.getBorrowNumber()==0){
    	 table.addCell(pdfclass.createCell("0", textfont, Element.ALIGN_CENTER));
     }else{
    	 table.addCell(pdfclass.createCell(String.valueOf(dto.getBorrowNumber()), textfont, Element.ALIGN_CENTER));
     }
     
     table.addCell(pdfclass.createCell("地点", textfont, Element.ALIGN_CENTER));
     if(dto.getAddress()==null){
    	 table.addCell(pdfclass.createCell("", textfont, Element.ALIGN_CENTER));
     }else{
    	 table.addCell(pdfclass.createCell(dto.getAddress(), textfont, Element.ALIGN_CENTER));
     }
     
     table.addCell(pdfclass.createCell("预计时间", textfont, Element.ALIGN_CENTER)); 
    // Data data=dto.getEstimateDateBegin();
     //
     //预计时间
     
     if(dto.getEstimateDate()==null){
    	 table.addCell(pdfclass.createCell("", textfont, Element.ALIGN_CENTER)); 
     }else{
    	 String time =new SimpleDateFormat("yyyy.MM.dd").format(dto.getEstimateDate());
    	 table.addCell(pdfclass.createCell(time, textfont, Element.ALIGN_CENTER));
     }
     
     table.addCell(pdfclass.createCell("专业", textfont,Element.ALIGN_CENTER,1));
     if(dto.getMajor()==null){
    	 table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,8));
     }else{
    	 table.addCell(pdfclass.createCell(dto.getMajor(), textfont,Element.ALIGN_CENTER,8));
     }
     

     if(dto.getTaskDemand()==null){
    	 table.addCell(pdfclass.createCell("出差任务与要求：\n"+"",8, 180,Element.ALIGN_TOP,Element.ALIGN_LEFT));
     }else{
    	 table.addCell(pdfclass.createCell("出差任务与要求：\n"+dto.getTaskDemand(),8, 180,Element.ALIGN_TOP,Element.ALIGN_LEFT));
     }
    
     
     table.addCell(pdfclass.createCell("客户服务部经办人及联系电话", textfont,Element.ALIGN_CENTER,4));
     table.addCell(pdfclass.createCell("客户服务部领导签字(公章)", textfont,Element.ALIGN_CENTER,4));
     if(dto.getLinkManKf()==null){
    	 table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,2));
     }else{
    	 table.addCell(pdfclass.createCell(dto.getLinkManKf(), textfont,Element.ALIGN_CENTER,2));
     }
     if(dto.getLinkPhoneKf()==null){
    	 table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,2)); 
     }else{
    	 table.addCell(pdfclass.createCell(dto.getLinkPhoneKf(), textfont,Element.ALIGN_CENTER,2));
     }
     
     
     table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,4));//签字
     
     
     table.addCell(pdfclass.createCell("借出单位推荐人员名单及基本情况:",textfont,Element.ALIGN_LEFT,8));
     
     table.addCell(pdfclass.createCell("姓名", textfont,Element.ALIGN_CENTER,1));
     table.addCell(pdfclass.createCell("性别", textfont,Element.ALIGN_CENTER,1));
     table.addCell(pdfclass.createCell("身份证号", textfont,Element.ALIGN_CENTER,2));
     table.addCell(pdfclass.createCell("工号", textfont,Element.ALIGN_CENTER,1));
     table.addCell(pdfclass.createCell("专业", textfont,Element.ALIGN_CENTER,1));
     table.addCell(pdfclass.createCell("手机号码", textfont,Element.ALIGN_CENTER,2));           
    // dto1.
     int childSize=0;
     
     childSize=child.size();
     

    	 for(int i=0;i<childSize;i++){

    	 	table.addCell(pdfclass.createCell(child.get(i).getPersonName(), 1,30));	
    	 	String sex = child.get(i).getSex();
    	 	SysLookupAPI api = SpringFactory.getBean(SysLookupAPI.class);
    	 	String gender = api.getNameByLooupTypeCodeAndLooupCode("PLATFORM_SEX", sex);
    	 	
			table.addCell(pdfclass.createCell(gender, 1,30));
			table.addCell(pdfclass.createCell(child.get(i).getCardId(), 2,30));
			table.addCell(pdfclass.createCell(child.get(i).getWorkNum(), 1,30));

			table.addCell(pdfclass.createCell(child.get(i).getMajors(), 1,30));
			table.addCell(pdfclass.createCell(child.get(i).getPhone(), 2,30));  
    	 }
    	 int aec=childSize;
    	 for(;aec<8;aec++){                      
   			table.addCell(pdfclass.createCell("", 1,30));
   			table.addCell(pdfclass.createCell("", 1,30));
   			table.addCell(pdfclass.createCell("", 2,30));
   			table.addCell(pdfclass.createCell("", 1,30));
   			table.addCell(pdfclass.createCell("", 1,30));
   			table.addCell(pdfclass.createCell("", 2,30));     
     	}

     table.addCell(pdfclass.createCell("", 8,30));
     
     
     
     table.addCell(pdfclass.createCell("借出单位经办人及联系电话", textfont,Element.ALIGN_CENTER,4));
     table.addCell(pdfclass.createCell("借出单位领导签字(公章)", textfont,Element.ALIGN_CENTER,4));
     if(dto.getLinkManBorrowed()==null){
    	 table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,2));
     }else{
    	 table.addCell(pdfclass.createCell(dto.getLinkManBorrowed(), textfont,Element.ALIGN_CENTER,2));
     }
     if(dto.getLinkPhoneBorrowed()==null){
    	 table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,2));
    	 }else{
    		 table.addCell(pdfclass.createCell(dto.getLinkPhoneBorrowed(), textfont,Element.ALIGN_CENTER,2));
    	 }
     
     
     table.addCell(pdfclass.createCell("", textfont,Element.ALIGN_CENTER,4));    //签字   
     document.add(table);          
     document.close(); 

    
    response.addHeader("Content-Disposition","inline;filename=借人任务书.pdf");
		DataOutput output = new DataOutputStream(response.getOutputStream());
		byte[] bytes = buffer.toByteArray();
		response.setContentLength(bytes.length);
		for( int i = 0;i < bytes.length;i++ )
		{
			output.writeByte( bytes[i] );
		}

	}
}
