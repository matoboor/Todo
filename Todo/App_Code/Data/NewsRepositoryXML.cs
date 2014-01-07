using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Linq;
using Todo.App_Code.Model;

namespace Todo.App_Code.Data
{
    public class NewsRepositoryXML
    {
        private string FileName = System.Web.HttpContext.Current.Server.MapPath("~/App_Data/News.xml");

        public NewsRepositoryXML()
        {
            if (!File.Exists(FileName))
            {
                // If file does not exist in the database path, create and store an empty Employees node
                XmlTextWriter textWritter = new XmlTextWriter(FileName, null);
                textWritter.WriteStartDocument();
                textWritter.WriteStartElement("News");
                textWritter.WriteEndElement();
                textWritter.Close();
            }
        }

        public void SortByDate()
        {
            XElement root = XElement.Load(FileName);
            var orderedtabs = root.Elements("Notice")
                      .OrderByDescending(xtab => (DateTime)xtab.Element("Date"))
                      .ToArray();
            root.RemoveAll();
            foreach (XElement tab in orderedtabs)
                root.Add(tab);
            root.Save(FileName);
        }

        public void Insert(Notice notice)
        {
            try
            {

                XmlDocument document = new XmlDocument();
                document.Load(FileName);

                XmlElement newRecord = document.CreateElement("Notice");

                int Id = XmlHelper.GetMaxValue(document, "News" + "/" + "Notice" + "/" + "Id");
                newRecord.AppendChild(XmlHelper.CreateXMLElement(document, "Id", Id.ToString()));
                document.DocumentElement.AppendChild(newRecord);

                newRecord.AppendChild(XmlHelper.CreateXMLElement(document, "Title", notice.Title));
                document.DocumentElement.AppendChild(newRecord);

                newRecord.AppendChild(XmlHelper.CreateXMLElement(document, "Text", notice.Text));
                document.DocumentElement.AppendChild(newRecord);

                newRecord.AppendChild(XmlHelper.CreateXMLElement(document, "Date", DateTime.Now.ToString(@"dd/MM/yyyy hh:mm:ss")));
                document.DocumentElement.AppendChild(newRecord);

                document.Save(FileName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Notice notice)
        {
            try
            {
                XmlDocument document = new XmlDocument();
                document.Load(FileName);

                XmlNode node = document.SelectSingleNode("//Notice[Id='" + notice.Id + "']");

                if (node != null)
                {
                    node.SelectNodes("Title").Item(0).FirstChild.Value = notice.Title;
                    node.SelectNodes("Text").Item(0).FirstChild.Value = notice.Text;
                    node.SelectNodes("Date").Item(0).FirstChild.Value = notice.Date.ToString(@"dd/MM/yyyy hh:mm:ss");
                }
                document.Save(FileName);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void Delete(Notice notice)
        {
            try
            {
                XmlDocument document = new XmlDocument();
                document.Load(FileName);

                XmlNode node = document.SelectSingleNode("//Notice[Id='" + notice.Id + "']");

                if (node != null)
                {
                    document.ChildNodes[1].RemoveChild(node);
                }
                document.Save(FileName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Notice Get(int id)
        {
            Notice notice = null;
            try
            {
                XmlDocument document = new XmlDocument();
                document.Load(FileName);

                XmlNode node = document.SelectSingleNode("//Notice[Id='" + id + "']");
                if (node != null)
                {
                    notice = new Notice();
                    notice.Id = Convert.ToInt32(node.SelectNodes("Id").Item(0).FirstChild.Value);
                    notice.Title = node.SelectNodes("Title").Item(0).FirstChild.Value;
                    notice.Text = node.SelectNodes("Text").Item(0).FirstChild.Value;
                    notice.Date = DateTime.Parse(node.SelectNodes("Date").Item(0).FirstChild.Value);
                    return notice;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return notice;
        }

        public IList<Notice> GetAll()
        {
            IList<Notice> result = new List<Notice>();
            try
            {
                XmlDocument document = new XmlDocument();
                document.Load(FileName);
                foreach (XmlNode node in document.ChildNodes[1].ChildNodes)
                {

                    Notice notice = new Notice();
                    notice.Id = Convert.ToInt32(node.SelectNodes("Id").Item(0).FirstChild.Value);
                    notice.Title = node.SelectNodes("Title").Item(0).FirstChild.Value;
                    notice.Text = node.SelectNodes("Text").Item(0).FirstChild.Value;
                    notice.Date = DateTime.Parse(node.SelectNodes("Date").Item(0).FirstChild.Value);
                    result.Add(notice);
                }
                return result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}