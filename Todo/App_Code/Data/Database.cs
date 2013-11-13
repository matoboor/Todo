using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace Todo.App_Code.Data
{
    public class Database
    {
        private SqlConnection connection;
        private static String CONNECTION_STRING = ConfigurationManager.ConnectionStrings["appharbor"].ConnectionString;
    
        public Database()
        {
            connection = new SqlConnection();
        }

        public bool Connect(String conString)
        {
            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.ConnectionString = conString;
                connection.Open();
            }
            return true;
        }

        public bool Connect()
        {
            bool ret = true;
            if (connection.State != System.Data.ConnectionState.Open)
            {
                ret = Connect(CONNECTION_STRING);
            }
            return ret;
        }

        public void Close()
        {
            connection.Close();
        }


        public SqlCommand CreateCommand(string strCommand)
        {
            SqlCommand command = new SqlCommand(strCommand, connection);
            return command;
        }

        //NONQUERY
        public int ExecuteNonQuery(SqlCommand command)
        {
            int rowNumber = 0;
            try
            {
                command.Prepare();
                rowNumber = command.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                Close();
            }
            return rowNumber;
        }

        //QUERY
        public SqlDataReader Select(SqlCommand command)
        {
            command.Prepare();
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }
    }
}