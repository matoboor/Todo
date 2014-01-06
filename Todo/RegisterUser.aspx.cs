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
    public partial class RegisterUser : GlobalizedPage
    {
        private UserRepository userDb = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Team.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.Name = NameTextBox.Text;
            user.Username = UsernameTextBox.Text;
            user.Password = PasswordTextBox.Text;
            userDb.Save(user);
            Response.Redirect("Team.aspx");
        }
    }
}