using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Todo.App_Code.Model
{
    public class TaskList
    {
        public int Id { get; set; }
        public string Title { get; set; }

        public TaskList()
        {
        }


        public IList<Task> Tasks { get; set; }
    }
}