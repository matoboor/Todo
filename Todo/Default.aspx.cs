using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Todo.App_Code.Data;


namespace Todo
{
    public partial class Default : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Database db = new Database();
            TaskListRepository repo = new TaskListRepository(db);
            Label1.Text = "Projects";
            
            //GridView2.DataSource = repo.GetAll();
            //GridView2.DataBind();

        }

        //protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        //{
        //}

        //protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        //{
        //}

        //protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        //{
        //}

        //protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        //{
        //}

        //protected void DetailsView1_ItemCreated(object sender, EventArgs e)
        //{
        //}

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.DataBind();

        }

        protected void DetailsView2_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void DetailsView2_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void DetailsView3_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView3.DataBind();
        }

        protected void DetailsView3_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView3.DataBind();
        }

        protected void DetailsView3_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView3.DataBind();
        }

        protected void DetailsView3_ItemCreated(object sender, EventArgs e)
        {
            GridView3.DataBind();
        }

        protected void DetailsView4_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView4.DataBind();
        }

        protected void DetailsView4_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView4.DataBind();
        }

        protected void DetailsView4_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView4.DataBind();
        }

        protected void DetailsView4_ItemCreated(object sender, EventArgs e)
        {
            GridView4.DataBind();
        }
    }
}