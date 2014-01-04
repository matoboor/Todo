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
    public partial class Tasks : System.Web.UI.Page
    {
        TaskRepository TaskDb = new TaskRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList1.DataBind();
                IList<Task> tasks = TaskDb.GetByUser(Int32.Parse(DropDownList1.SelectedValue));
                uncompleted.Text = tasks.Where(t => t.Done == false).Count().ToString();
                comlpeted.Text = tasks.Where(t => t.Done == true).Count().ToString();
                total.Text = tasks.Count().ToString();
            }
            else
            {
                IList<Task> tasks = TaskDb.GetByUser(Int32.Parse(DropDownList1.SelectedValue));
                uncompleted.Text = tasks.Where(t => t.Done == false).Count().ToString();
                comlpeted.Text = tasks.Where(t => t.Done == true).Count().ToString();
                total.Text = tasks.Count().ToString();
            }
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void TaskDetailView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}