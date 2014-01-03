using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Todo.App_Code.Model;

namespace Todo.App_Code.Data
{
    public class TaskRepository
    {
        private Database db;

        private static string SQL_SELECT = "SELECT * FROM Task";
        private static string SQL_SELECT_ID = "SELECT * FROM Task WHERE id=@id";
        private static string SQL_SELECT_TASKLIST_ID = "SELECT * FROM Task WHERE tasklist_id=@tasklist_id";
        private static string SQL_SELECT_USER_ID = "SELECT * FROM Task WHERE user_id=@user_id";
        private static string SQL_INSERT = "INSERT INTO Task VALUES(@text, @created, @done, @user_id, @tasklist_id)";
        private static string SQL_UPDATE = "UPDATE Task SET text=@text, created=@created, done=@done, user_id=@user_id, tasklist_id=@tasklist_id WHERE id=@id";
        private string SQL_DELETE = "DELETE FROM Task WHERE id=@id";

        public TaskRepository(Database database)
        {
            this.db = database;
        }

        public TaskRepository()
        {
            this.db = new Database();
        }

        private static IList<Task> Read(SqlDataReader reader)
        {
            IList<Task> tasks = new List<Task>();

            while (reader.Read())
            {
                Task task = new Task();
                task.Id = reader.GetInt32(0);
                task.Text = reader.GetString(1);
                task.Created = reader.GetDateTime(2);
                task.Done = reader.GetBoolean(3);
                task.UserId = reader.GetInt32(4);
                task.TaskListId = reader.GetInt32(5);
                task.Owner = UserRepository.Get2(task.UserId);
                task.Project = TaskListRepository.Get2(task.TaskListId);

                tasks.Add(task);
            }
            return tasks;
        }

        public IList<Task> GetAll()
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT);
            SqlDataReader reader = db.Select(command);
            IList<Task> ret = Read(reader);
            reader.Close();
            db.Close();
            return ret;
        }

        public IList<Task> GetByTaskList(int taskListId)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_TASKLIST_ID);

            command.Parameters.Add(new SqlParameter("@tasklist_id", SqlDbType.Int));
            command.Parameters["@tasklist_id"].Value = taskListId;

            SqlDataReader reader = db.Select(command);
            IList<Task> tasks = Read(reader);
            reader.Close();
            db.Close();
            return tasks;
        }

        public IList<Task> GetByUser(int userId)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_USER_ID);

            command.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            command.Parameters["@user_id"].Value = userId;

            SqlDataReader reader = db.Select(command);
            IList<Task> tasks = Read(reader);
            reader.Close();
            db.Close();
            return tasks;
        }


        public Task Get(int id)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_ID);

            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = id;

            SqlDataReader reader = db.Select(command);
            IList<Task> task = Read(reader);
            Task ret = null;
            if (task.Count == 1)
            {
                ret = task[0];
                ret.Owner = UserRepository.Get2(ret.UserId);
            }
            reader.Close();
            db.Close();
            return ret;
        }

        

        public static Task Get2(int id)
        {
            Database database = new Database();
            database.Connect();
            SqlCommand command = database.CreateCommand(SQL_SELECT_ID);

            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = id;

            SqlDataReader reader = database.Select(command);
            IList<Task> task = Read(reader);
            Task ret = null;
            if (task.Count == 1)
            {
                ret = task[0];
            }
            reader.Close();
            database.Close();
            return ret;
        }

        public int Save(Task entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            command.Parameters.Add(new SqlParameter("@text", SqlDbType.VarChar, entity.Text.Length));
            command.Parameters["@text"].Value = entity.Text;
            command.Parameters.Add(new SqlParameter("@created", SqlDbType.DateTime));
            command.Parameters["@created"].Value = entity.Created;
            command.Parameters.Add(new SqlParameter("@done", SqlDbType.Bit));
            command.Parameters["@done"].Value = entity.Done;
            command.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            command.Parameters["@user_id"].Value = entity.UserId;
            command.Parameters.Add(new SqlParameter("@tasklist_id", SqlDbType.Int));
            command.Parameters["@tasklist_id"].Value = entity.TaskListId;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public int Update(Task entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            command.Parameters.Add(new SqlParameter("@text", SqlDbType.VarChar, entity.Text.Length));
            command.Parameters["@text"].Value = entity.Text;
            command.Parameters.Add(new SqlParameter("@created", SqlDbType.DateTime));
            command.Parameters["@created"].Value = entity.Created;
            command.Parameters.Add(new SqlParameter("@done", SqlDbType.Bit));
            command.Parameters["@done"].Value = entity.Done;
            command.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            command.Parameters["@user_id"].Value = entity.UserId;
            command.Parameters.Add(new SqlParameter("@tasklist_id", SqlDbType.Int));
            command.Parameters["@tasklist_id"].Value = entity.TaskListId;
            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = entity.Id;

            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public int Delete(Task entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_DELETE);
            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = entity.Id;

            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }
    }
}