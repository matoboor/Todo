using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Todo.App_Code.Model;

namespace Todo.App_Code.Data
{
    public class UserRepository
    {
        private Database db;

        private static string SQL_SELECT = "SELECT * FROM [dbo].[User]";
        private static string SQL_SELECT_ID = "SELECT * FROM [dbo].[User] WHERE id=@id";
        private static string SQL_SELECT_USERNAME = "SELECT * FROM [dbo].[User] WHERE username=@username";
        private static string SQL_INSERT = "INSERT INTO [dbo].[User] VALUES(@name, @username, @password)";
        private static string SQL_UPDATE = "UPDATE [dbo].[User] SET name=@name, username=@username, password=@password WHERE id=@id";
        private string SQL_DELETE = "DELETE FROM [dbo].[User] WHERE id=@id";

        public UserRepository(Database database)
        {
            this.db = database;
        }

        public UserRepository()
        {
            this.db = new Database();
        }

        private static IList<User> Read(SqlDataReader reader)
        {
            IList<User> users = new List<User>();

            while (reader.Read())
            {
                User user = new User();
                user.Id = reader.GetInt32(0);
                user.Name = reader.GetString(1);
                user.Username = reader.GetString(2);
                user.Password = reader.GetString(3);
                users.Add(user);
            }
            return users;
        }

        public IList<User> GetAll()
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT);
            SqlDataReader reader = db.Select(command);
            IList<User> ret = Read(reader);
            reader.Close();
            db.Close();
            return ret;
        }

        public User Get(int id)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_ID);

            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = id;

            SqlDataReader reader = db.Select(command);
            IList<User> users = Read(reader);
            User ret = null;
            if (users.Count == 1)
            {
                ret = users[0];
            }
            reader.Close();
            db.Close();
            return ret;
        }

        public User Get(string username)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_SELECT_USERNAME);

            command.Parameters.Add(new SqlParameter("@username", SqlDbType.VarChar, username.Length));
            command.Parameters["@username"].Value = username;

            SqlDataReader reader = db.Select(command);
            IList<User> users = Read(reader);
            User ret = null;
            if (users.Count == 1)
            {
                ret = users[0];
            }
            reader.Close();
            db.Close();
            return ret;
        }

        public static User Get2(int id)
        {
            Database database = new Database();
            database.Connect();
            SqlCommand command = database.CreateCommand(SQL_SELECT_ID);

            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = id;

            SqlDataReader reader = database.Select(command);
            IList<User> users = Read(reader);
            User ret = null;
            if (users.Count == 1)
            {
                ret = users[0];
            }
            reader.Close();
            database.Close();
            return ret;
        }

        public int Save(User entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_INSERT);
            command.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, entity.Name.Length));
            command.Parameters["@name"].Value = entity.Name;
            command.Parameters.Add(new SqlParameter("@username", SqlDbType.VarChar, entity.Username.Length));
            command.Parameters["@username"].Value = entity.Username;
            command.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, entity.Password.Length));
            command.Parameters["@password"].Value = entity.Password;
            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public int Update(User entity)
        {
            db.Connect();
            SqlCommand command = db.CreateCommand(SQL_UPDATE);
            command.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, entity.Name.Length));
            command.Parameters["@name"].Value = entity.Name;
            command.Parameters.Add(new SqlParameter("@username", SqlDbType.VarChar, entity.Username.Length));
            command.Parameters["@username"].Value = entity.Username;
            command.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, entity.Password.Length));
            command.Parameters["@password"].Value = entity.Password;
            command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int));
            command.Parameters["@id"].Value = entity.Id;

            int ret = db.ExecuteNonQuery(command);
            db.Close();
            return ret;
        }

        public int Delete(User entity)
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