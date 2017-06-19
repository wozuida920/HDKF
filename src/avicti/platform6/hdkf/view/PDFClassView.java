package avicti.platform6.hdkf.view;

import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;




public class PDFClassView {
	private static Font headfont ;// 设置字体大小 
    private static Font keyfont;// 设置字体大小 
    private static Font textfont;// 设置字体大小    
    static{ 
        BaseFont bfChinese; 
        try { 
            bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED); 
            headfont = new Font(bfChinese, 20, Font.BOLD);// 设置字体大小 
            keyfont = new Font(bfChinese, 10, Font.BOLD);// 设置字体大小 
            textfont = new Font(bfChinese, 14, Font.NORMAL);// 设置字体大小 
        } catch (Exception e) {          
            e.printStackTrace(); 
        }  
    } 
    
    
    int maxWidth = 520; 
    public PdfPCell createCell(String value,Font font,int align){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);         
        cell.setHorizontalAlignment(align); 
       // cell.setMinimumHeight(30);
        cell.setPhrase(new Phrase(value,font)); 
        cell.setFixedHeight(30);
       return cell; 
   } 
    
    public PdfPCell createCell(String value,Font font){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);  
        cell.setPhrase(new Phrase(value,font)); 
       return cell; 
   } 
    
    
    public PdfPCell createCell(String value,int colspan,int hight){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setFixedHeight(hight);
        cell.setPhrase(new Phrase(value,textfont)); 
       return cell; 
   } 
    public PdfPCell createCell(String value,int colspan,int hight,int pation1,int pation2){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(pation1); 
        cell.setHorizontalAlignment(pation1);
        cell.setColspan(colspan);
        cell.setFixedHeight(hight);
        cell.setPhrase(new Phrase(value,textfont)); 
       return cell; 
   }
    public PdfPCell createCell(String value,Font font,int align,int colspan){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
       // cell.setMinimumHeight(30);
        cell.setFixedHeight(30);
        cell.setHorizontalAlignment(align);     
        cell.setColspan(colspan); 
        cell.setPhrase(new Phrase(value,font)); 
       return cell; 
   } 
    //一行一列
   public PdfPCell createCell(String value,Font font,int align,int colspan,boolean boderFlag){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(align); 
        //cell.setMinimumHeight();
        cell.setColspan(colspan); 
        cell.setPhrase(new Phrase(value,font)); 
        cell.setPadding(3.0f); 
        if(!boderFlag){ 
            cell.setBorder(0); 
            cell.setPaddingTop(1.0f); 
            cell.setPaddingBottom(5.0f); 
        } 
       return cell; 
   } 
   //一行多列
    public PdfPTable createTable(int colNumber){ 
       PdfPTable table = new PdfPTable(colNumber); 
       try{ 
           table.setTotalWidth(maxWidth); 
           table.setLockedWidth(true); 
           table.setHorizontalAlignment(Element.ALIGN_CENTER);      
           table.getDefaultCell().setBorder(1); 
       }catch(Exception e){ 
           e.printStackTrace(); 
       } 
       return table; 
   } 
    public PdfPTable createTable(float[] widths){ 
           PdfPTable table = new PdfPTable(widths); 
           try{ 
               table.setTotalWidth(maxWidth); 
               table.setLockedWidth(true); 
               table.setHorizontalAlignment(Element.ALIGN_CENTER);      
               table.getDefaultCell().setBorder(1); 
           }catch(Exception e){ 
               e.printStackTrace(); 
           } 
           return table; 
       } 
    
    public PdfPCell createCell(String value,int hight,Font font){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
       // cell.setColspan(colspan);
        cell.setFixedHeight(hight);
        cell.setPhrase(new Phrase(value,font));
        cell.setPadding(0);
       return cell; 
   } 
    
    public PdfPCell createCell(String value,int hight,Font font,int rowspan){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(hight);
        cell.setPhrase(new Phrase(value,font));
        cell.setPadding(0);
       return cell; 
   } 
    
    public PdfPCell createCell(String value,int hight,int colspan,Font font){ 
        PdfPCell cell = new PdfPCell(); 
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE); 
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setFixedHeight(hight);
        cell.setPhrase(new Phrase(value,font));
        cell.setPadding(0);
       return cell; 
   } 
    
    
    public PdfPTable createBlankTable(){ 
        PdfPTable table = new PdfPTable(1); 
        table.getDefaultCell().setBorder(0); 
        table.addCell(createCell("", keyfont));          
        table.setSpacingAfter(20.0f); 
        table.setSpacingBefore(20.0f); 
        return table; 
    } 
    
}
