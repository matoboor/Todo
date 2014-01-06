using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Todo
{
    public partial class Team : GlobalizedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["err"] != null)
            {
                MessageBox.Text = Request["err"];
            }
        }
    }
}