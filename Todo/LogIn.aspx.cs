using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Todo.App_Code.Data;
using Todo.App_Code.Model;

namespace Todo
{
    public partial class LogIn : System.Web.UI.Page
    {
        private UserRepository userDb = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool ValidateUser(string username, string password)
        {
            User user = userDb.Get(username);
            if (user == null)
            {
                return false;
            }
            else
            {
                if (user.Username.Equals(username) && user.Password.Equals(password))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if(ValidateUser(UsernameTextBox.Text,PasswordTextBox.Text))
            {
                User user = userDb.Get(UsernameTextBox.Text);
                FormsAuthentication.SetAuthCookie(user.Username, RememberBox.Checked);
                Session["Username"] = user.Username;
                Session["Name"] = user.Name;
                Response.Redirect("Default.aspx");
            }
            else
            {
                ErrorLabel.Text="Username or password is incorrect";
                UsernameTextBox.Focus();
            }
        }
    }
}