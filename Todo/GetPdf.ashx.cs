using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Todo.App_Code.Data;
using Todo.App_Code.Model;

namespace Todo
{
    /// <summary>
    /// Summary description for GetPdf
    /// </summary>
    public class GetPdf : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            NewsRepositoryXML newsDB = new NewsRepositoryXML();

            Document pdfDocument = new Document(PageSize.A4, 50, 50, 50, 50);
            PdfWriter writer = PdfWriter.GetInstance(pdfDocument, context.Response.OutputStream);
            pdfDocument.Open();

            var titleFont = FontFactory.GetFont("Arial Black", 18, Font.BOLD,BaseColor.ORANGE);
            var bodyFont = FontFactory.GetFont("Arial", 13, Font.NORMAL);
            var dateFont = FontFactory.GetFont("Tahoma", 8, Font.UNDERLINE);


            pdfDocument.AddAuthor("Tasker");
            pdfDocument.Add(new Paragraph("News",titleFont));
            pdfDocument.Add(new Paragraph());
          

            foreach (Notice notice in newsDB.GetAll())
            {
                pdfDocument.Add(new Paragraph(notice.Title,titleFont));
                pdfDocument.Add(new Paragraph(notice.Date.ToShortDateString(),dateFont));
                pdfDocument.Add(new Paragraph(notice.Text,bodyFont));
                pdfDocument.Add(new Paragraph());
               
            }
            pdfDocument.Close();

            context.Response.ContentType = "application/pdf";
            context.Response.AddHeader("content-disposition", "attachment; filename=" + "News-"+DateTime.Now.Date+".pdf");
            context.Response.Write(pdfDocument);
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}