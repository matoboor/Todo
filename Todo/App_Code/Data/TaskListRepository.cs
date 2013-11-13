using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Todo.App_Code.Model;

namespace Todo.App_Code.Data
{
    public class TaskListRepository
    {
        private Database db;

        private static string SQL_SELECT = "SELECT * FROM Tasklist";
        private static string SQL_SELECT_ID = "SELECT * FROM Tasklist WHERE id=@id";
        private static string SQL_INSERT = "INSERT INTO Tasklist VALUES(@title)";
        private static string SQL_UPDATE = "UPDATE Tasklist SET title=@title WHERE id=@id";
        private string SQL_DELETE = "DELETE FROM Tasklist WHERE id=@id";

        public TaskListRepository(Database database)
        {
            this.db = database;
        }

        public TaskListRepository()
        {
            this.db = new Database();
        }

        private static IList<TaskList> Read(SqlDataReader reader)
        {
            IList<TaskList> taskLists = new List<TaskList>();

            while (reader.Read())
            {
                TaskList list = new TaskList();
                list.Id = reader.GetInt32(0);
                list.Title = reader.GetString(1);

                taskLists.Add(list);
            }
            return taskLists;
        }

        public IList<TaskList> GetAll()
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT);
            SqlDataReader reader = db.Select(command);
            IList<TaskList> ret = Read(reader);
            reader.Close();
            db.Close();
            return ret;
        }

        public TaskList Get(int id)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_ID);

            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = id;

            SqlDataReader reader = db.Select(command);
            IList<TaskList> list = Read(reader);
            TaskList ret = null;
            if (list.Count == 1)
            {
                ret = list[0];
            }
            reader.Close();
            db.Close();
            return ret;
        }

        public static TaskList Get2(int id)
        {
            Database database = new Database();
            database.Connect();
            SqlCommand command = database.CreateCommand(SQL_SELECT_ID);

            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = id;

            SqlDataReader reader = database.Select(command);
            IList<TaskList> list = Read(reader);
            TaskList ret = null;
            if (list.Count == 1)
            {
                ret = list[0];
            }
            reader.Close();
            database.Close();
            return ret;
        }

        public int Save(TaskList entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            command.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, entity.Title.Length));
            command.Parameters["@title"].Value = entity.Title;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public int Update(TaskList entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = entity.Id;

            command.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, entity.Title.Length));
            command.Parameters["@title"].Value = entity.Title;

            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public int Delete(TaskList entity)
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