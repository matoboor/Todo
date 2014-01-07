using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Todo.App_Code.Data;
using Todo.App_Code.Model;

namespace Todo
{
    public partial class News : GlobalizedPage
    {
        NewsRepositoryXML NewsDB = new NewsRepositoryXML();

        protected void Page_Load(object sender, EventArgs e)
        {
            XmlDataSource1.DataBind();
            NewsRepeater.DataBind();
            if (Request["Id"] != null)
            {
                Notice notice = NewsDB.Get(Convert.ToInt32(Request["Id"]));
                if (notice != null)
                {
                    DeleteButton.Visible = true;
                    TitleTextBox.Text = notice.Title;
                    TextBox.Text = notice.Text;
                    AddButton.Text = GetLocalResourceObject("EditButton").ToString();
                    Session["tempId"] = notice.Id;
                }
            }
            else
            {
                DeleteButton.Visible = false;
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty(TitleTextBox.Text)) && (!string.IsNullOrEmpty(TextBox.Text)))
            {
                if (AddButton.Text.Equals(GetLocalResourceObject("AddButton").ToString()))
                {
                    Notice notice = new Notice();
                    notice.Title = TitleTextBox.Text;
                    notice.Text = TextBox.Text;
                    NewsDB.Insert(notice);
                    TitleTextBox.Text = null;
                    TextBox.Text = null;
                    XmlDataSource1.DataBind();
                    NewsRepeater.DataBind();
                }
                else
                {
                    Notice notice = NewsDB.Get(Int32.Parse(Session["tempId"].ToString()));
                    notice.Title = TitleTextBox.Text;
                    notice.Text = TextBox.Text;
                    NewsDB.Update(notice);
                    TitleTextBox.Text = null;
                    TextBox.Text = null;
                    AddButton.Text = GetLocalResourceObject("AddButton").ToString();
                    XmlDataSource1.DataBind();
                    NewsRepeater.DataBind();
                }
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (DeleteButton.BackColor == System.Drawing.Color.Green)
            {
                Notice notice = new Notice();
                notice.Id = Int32.Parse(Session["tempId"].ToString());
                NewsDB.Delete(notice);
                DeleteButton.BackColor = System.Drawing.Color.Red;
                DeleteButton.Text = GetLocalResourceObject("DeleteButton").ToString();
                DeleteButton.Visible = false;
                TitleTextBox.Text = null;
                TextBox.Text = null;
                XmlDataSource1.DataBind();
                NewsRepeater.DataBind();
            }
            else
            {
                DeleteButton.Text = GetLocalResourceObject("ReallyButton").ToString();
                DeleteButton.BackColor = System.Drawing.Color.Green;
            }
        }
    }
}