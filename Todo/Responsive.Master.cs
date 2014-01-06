using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Todo
{
    public partial class Responsive : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["Culture"] == null)
            {
                HttpCookie cookie = new HttpCookie("Culture");
                cookie.Value = "en-GB";
                Response.Cookies.Add(cookie);
            }

            UsernameLabel.Text = Session["Name"] as string;
            if (!Page.IsPostBack)
            {
                LanguageDropDownList.SelectedValue = Request.Cookies["Culture"].Value;
            }
        }

        protected void LogOfButton_Click(object sender, EventArgs e)
        {
            if (LogOfButton.BackColor == System.Drawing.Color.Red)
            {
                LogOfButton.BackColor = System.Drawing.Color.Green;
                LogOfButton.Text = GetGlobalResourceObject("MasterPage","ReallyButton").ToString();
            }
            else
            {
                FormsAuthentication.SignOut();
                Response.Redirect("LogIn.aspx");
            }
        }
        
        protected void ChangeLanguage(object sender, EventArgs e)
        {
                 {
                     UsernameLabel.Text = LanguageDropDownList.SelectedValue;
                     CultureInfo culture = new CultureInfo(LanguageDropDownList.SelectedValue);
                     System.Threading.Thread.CurrentThread.CurrentUICulture = culture;
                     System.Threading.Thread.CurrentThread.CurrentCulture = culture;
                     HttpCookie cookie = new HttpCookie("Culture");
                     cookie.Value = LanguageDropDownList.SelectedValue;
                     Response.Cookies.Add(cookie);
                     Response.Redirect(Request.Path);
                 }
        }
        
    }
}