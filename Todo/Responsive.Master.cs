using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Todo
{
    public partial class Responsive : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsernameLabel.Text = Session["Name"] as string;
        }

        protected void LogOfButton_Click(object sender, EventArgs e)
        {
            if (LogOfButton.BackColor == System.Drawing.Color.Red)
            {
                LogOfButton.BackColor = System.Drawing.Color.Green;
                LogOfButton.Text = "Really?";
            }
            else
            {
                FormsAuthentication.SignOut();
                Response.Redirect("LogIn.aspx");
            }
        }
    }
}