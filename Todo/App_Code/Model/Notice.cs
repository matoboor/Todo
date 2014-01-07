using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Todo.App_Code.Model
{
    public class Notice
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public DateTime Date { get; set; }

        public Notice()
        {
        }
    }
}