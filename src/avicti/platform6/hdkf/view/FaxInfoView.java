package avicti.platform6.hdkf.view;

import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.AbstractView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import avicit.hdkf.support.hdkfsupportfaxinfo.dto.HdkfSupportFaxInfoDTO;
import avicit.platform6.api.sysuser.SysUserAPI;

public class FaxInfoView extends AbstractView {

	private final static int HEAD_FONT_SIZE = 20;// 标题
	private final static int CONTENT_FONT_SIZE = 12;// 内容

	@Autowired
	private SysUserAPI sysUserApi;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.servlet.view.AbstractView#renderMergedOutputModel
	 * (java.util.Map, javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HdkfSupportFaxInfoDTO dto = (HdkfSupportFaxInfoDTO) model.get("dto");
		response.setContentType("application/pdf");
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		Document document = new Document(PageSize.A4, 50, 50, 50, 50);
		PdfWriter writer = PdfWriter.getInstance(document, buffer);

		document.open();
		PdfPTable table = new PdfPTable(2);
		table.setWidthPercentage(100);
		PdfPCell cell;
		cell = new PdfPCell(FaxInfoView.getChinese("编号：" + dto.getFaxNo(),
				CONTENT_FONT_SIZE));
		cell.setColspan(2);
		cell.setFixedHeight(20);
		cell.setHorizontalAlignment(Element.ALIGN_RIGHT);// 靠右显示
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);
		cell = new PdfPCell(FaxInfoView.getChinese("中航工业洪都客户服务部",
				HEAD_FONT_SIZE));
		cell.setFixedHeight(25);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中cell.setBorderWidthBottom(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		StringBuffer sbuffer = new StringBuffer();
		sbuffer.append("地址：").append(dto.getFromAddr()).append("  ")
				.append("邮政编码：").append(dto.getFromZipcode());
		cell = new PdfPCell(FaxInfoView.getChinese(sbuffer.toString(),
				CONTENT_FONT_SIZE));
		cell.setFixedHeight(25);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		cell = new PdfPCell();
		cell.addElement(FaxInfoView.getChinese("AVIC HONGDU GROUP",
				CONTENT_FONT_SIZE));
		cell.addElement(FaxInfoView.getChinese("Customers Service Department",
				CONTENT_FONT_SIZE));
		cell.setFixedHeight(80);
		cell.setUseAscender(true);// 文本自动换行
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		cell = new PdfPCell();
		cell.addElement(FaxInfoView.getChinese(dto.getFromEnAddr(),
				CONTENT_FONT_SIZE));
		cell.addElement(new Paragraph(FaxInfoView.getChinese(
				"电话TEL：" + dto.getFromTel(), CONTENT_FONT_SIZE)));
		cell.addElement(new Paragraph(FaxInfoView.getChinese(
				"传真FAX：" + dto.getFromFax(), CONTENT_FONT_SIZE)));
		cell.setFixedHeight(80);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		cell = new PdfPCell(FaxInfoView.getChinese("NAMC FACSIMILE",
				HEAD_FONT_SIZE));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setFixedHeight(25);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthBottom(0);
		table.addCell(cell);

		cell = new PdfPCell(FaxInfoView.getChinese("TRANSMISSION",
				HEAD_FONT_SIZE));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setFixedHeight(25);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthBottom(0);
		table.addCell(cell);

		cell = new PdfPCell();
		cell.addElement(FaxInfoView.getChinese("发往单位（To）：" + dto.getToUuit(),
				CONTENT_FONT_SIZE));
		cell.addElement(new Paragraph(FaxInfoView.getChinese(
				"传真号（Fax）：" + dto.getToFax(), CONTENT_FONT_SIZE)));
		cell.addElement(new Paragraph(FaxInfoView.getChinese(
				"收件人（Attn）：" + dto.getToUser(), CONTENT_FONT_SIZE)));
		cell.setFixedHeight(80);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthTop(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		table.addCell(cell);

		cell = new PdfPCell();
		String sendDate = "";
		if (dto.getSendDate() != null && !dto.getSendDate().equals("")) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
			sendDate = dateFormat.format(dto.getSendDate());
		}
		cell.addElement(FaxInfoView.getChinese("日期（Date）：" + sendDate,
				CONTENT_FONT_SIZE));
		cell.addElement(new Paragraph(FaxInfoView.getChinese(
				"页数（Page）：" + dto.getFaxPages(), CONTENT_FONT_SIZE)));
		if (dto.getFromUser() != null && !dto.getFromUser().equals("")) {
			dto.setFromUserAlias(sysUserApi.getSysUserNameById(dto
					.getFromUser()));
		} else {
			dto.setFromUserAlias("");
		}
		cell.addElement(new Paragraph(FaxInfoView.getChinese(
				"发件人（From）：" + dto.getFromUserAlias(), CONTENT_FONT_SIZE)));
		cell.setFixedHeight(80);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 水平居中
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthTop(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		table.addCell(cell);

		cell = new PdfPCell(FaxInfoView.getChinese(dto.getToUuit(),
				CONTENT_FONT_SIZE));
		cell.setColspan(2);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);// 靠左显示
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		table.addCell(cell);

		cell = new PdfPCell(FaxInfoView.getChinese("  " + dto.getFaxContent(),
				CONTENT_FONT_SIZE));
		cell.setColspan(2);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);// 靠左显示
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		cell = new PdfPCell(FaxInfoView.getChinese("中航工业洪都客户服务部",
				CONTENT_FONT_SIZE));
		cell.setColspan(2);
		cell.setHorizontalAlignment(Element.ALIGN_RIGHT);// 靠左显示
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		cell = new PdfPCell(FaxInfoView.getChinese(sendDate, CONTENT_FONT_SIZE));
		cell.setColspan(2);
		cell.setHorizontalAlignment(Element.ALIGN_RIGHT);// 靠左显示
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);// 垂直居中
		cell.setBorderWidthBottom(0);
		cell.setBorderWidthLeft(0);
		cell.setBorderWidthRight(0);
		cell.setBorderWidthTop(0);
		table.addCell(cell);

		document.add(table);
		document.close();

		response.addHeader("Content-Disposition", "inline;filename=传真.pdf");
		DataOutput output = new DataOutputStream(response.getOutputStream());
		byte[] bytes = buffer.toByteArray();
		response.setContentLength(bytes.length);
		for (int i = 0; i < bytes.length; i++) {
			output.writeByte(bytes[i]);
		}
	}

	private static Paragraph getChinese(String str, int fontSize)
			throws DocumentException, IOException {
		// 设置为中文
		BaseFont bfChinese = BaseFont.createFont(
				"avicti/platform6/hdkf/view/SIMFANG.TTF", BaseFont.IDENTITY_H,
				BaseFont.NOT_EMBEDDED);
		Font FontChinese = new Font(bfChinese, fontSize, Font.NORMAL);
		Paragraph pragraph = new Paragraph(str, FontChinese);
		return pragraph;
	}
}
