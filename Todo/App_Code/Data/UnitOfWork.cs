using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Todo.App_Code.Data
{
    public class UnitOfWork
    {
        private Database db = new Database();

        public TaskRepository taskRepository { get; set; }
        public TaskListRepository taskListRepository { get; set; }
        public UserRepository userRepository { get; set; }

        public UnitOfWork()
        {
            taskListRepository = new TaskListRepository(db);
            taskRepository = new TaskRepository(db);
            userRepository = new UserRepository(db);
        }

    }
}