using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Todo.App_Code.Model
{
    public class Task
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public DateTime Created { get; set; }
        public bool Done { get; set; }
        public int UserId { get; set; }
        public int TaskListId { get; set; }

        public User Owner { get; set; }

        public Task()
        {
            this.Created = DateTime.Now;
            this.Done = false;
        }

        public void SetDone()
        {
            this.Done = true;
        }
    }
}