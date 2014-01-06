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
    public partial class EditUser : GlobalizedPage
    {
        private UserRepository userDb = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request["id"]!=null)
            {
                if (!Page.IsPostBack)
                {
                    Delete.ForeColor = System.Drawing.Color.White;
                    Delete.BackColor = System.Drawing.Color.Red;

                    User user = userDb.Get(Int32.Parse(Request["id"]));
                    if (user != null)
                    {
                        UserIdLabel.Text = user.Id.ToString();
                        NameTextBox.Text = user.Name;
                        UsernameTextBox.Text = user.Username;
                        PasswordTextBox.Attributes.Add("value", user.Password);
                        changePasswordRow.Visible = false;
                    }
                    else
                    {
                        string redirectWithErrorURL = "Team.aspx?err=User with id " + Request["id"] + " no exists";
                        Response.Redirect(redirectWithErrorURL);
                    }
                }
            }
            else
            {
                Response.Redirect("Team.aspx");
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Team.aspx");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            PasswordTextBox.ReadOnly = false;
            PasswordTextBox.Focus();
            changePasswordRow.Visible = true;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            User user = userDb.Get(Int32.Parse(Request["id"]));
            user.Name = NameTextBox.Text;
            user.Username = UsernameTextBox.Text;
            if (!PasswordTextBox.ReadOnly)
            {
                user.Password = PasswordTextBox.Text;
            }
            userDb.Update(user);
            Response.Redirect("Team.aspx?err=Updated user ID: "+user.Id);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (Delete.BackColor == System.Drawing.Color.Red)
            {
                Delete.BackColor = System.Drawing.Color.ForestGreen;
                Delete.ForeColor = System.Drawing.Color.Black;
                Delete.Text = "Realy?";
            }
            else
            {
                User user = userDb.Get(Int32.Parse(Request["id"]));
                userDb.Delete(user);
                Response.Redirect("Team.aspx");
            }
        }
    }
}