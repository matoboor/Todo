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
    public partial class Projects : System.Web.UI.Page
    {
        TaskListRepository projectsDb = new TaskListRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                GridView1.Visible = true;
                projectHeader.Text = projectsDb.Get(Convert.ToInt32(Request.QueryString["Id"])).Title;
            }
            else
            {
                GridView1.Visible = false;
                projectHeader.Text = "<< Select project";
            }
        }

        protected void newProjectButton_Click(object sender, EventArgs e)
        {
            if (newProject.Text != String.Empty)
            {
                string name = newProject.Text;
                newProject.Text = String.Empty;
                TaskList project = new TaskList();
                project.Title = name;
                projectsDb.Save(project);
                ProjectsMenuRepeater.DataBind();
            }            
        }


    }
}