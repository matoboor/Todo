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
    public partial class Projects : GlobalizedPage
    {
        TaskListRepository projectsDb = new TaskListRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                DeleteButton.Visible = true;
                GridView1.Visible = true;
                projectHeader.Text = projectsDb.Get(Convert.ToInt32(Request.QueryString["Id"])).Title;
            }
            else
            {
                DeleteButton.Visible = false;
                GridView1.Visible = false;
                projectHeader.Text = "<< "+GetLocalResourceObject("SelectProject").ToString();
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

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            DetailsView1.Visible = false;
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.Visible = true;
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["TaskListId"] = Request["id"];
        }

        protected void AddTask_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            GridView1.SelectRow(-1);
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
           
        }

        protected void FirstTaskButton_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            GridView1.SelectRow(-1);
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            TaskList projectToDelete = projectsDb.Get(Int32.Parse(Request["id"]));
            if (projectToDelete != null)
            {
                projectsDb.Delete(projectToDelete);
                ProjectsMenuRepeater.DataBind();
                Response.Redirect("Projects.aspx");
            }
        }


    }
}