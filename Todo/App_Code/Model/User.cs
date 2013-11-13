using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Todo.App_Code.Model
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public IList<Task> Tasks { get; set; }
    }
}