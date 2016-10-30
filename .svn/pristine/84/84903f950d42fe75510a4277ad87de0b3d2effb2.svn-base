using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class SqlHelper
    {
        #region PrepareCommand
        /// <summary>
        /// 设置Command对象的属性
        /// </summary>
        /// <param name="command">命令对象</param>
        /// <param name="connection">连接对象</param>
        /// <param name="commandType">命令类型(存储过程、文本等等)</param>
        /// <param name="commandText">存储过程名或T-SQL语句</param>
        /// <param name="commandParameters">命令的参数</param>
        private static void PrepareCommand(SqlCommand command, SqlConnection connection, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            if (command == null)
                throw new ArgumentNullException("command");
            if (connection == null)
                throw new ArgumentNullException("connection");
            if (commandText == null || commandText.Length == 0)
                throw new ArgumentNullException("commandText");

            command.Connection = connection;
            command.CommandType = commandType;
            command.CommandText = commandText;
            if (commandParameters != null)
                foreach (SqlParameter para in commandParameters)
                    command.Parameters.Add(para);
        }
        #endregion

        #region ExecuteNonQuery
        /// <summary>
        /// 在指定的连接上用指定的参数执行SQL命令(不返回任何行)
        /// 一般用语执行执行 UPDATE、INSERT 或 DELETE 语句。
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="commandType">命令类型(存储过程、文本等等)</param>
        /// <param name="commandText">存储过程名或T-SQL语句</param>
        /// <param name="commandParameters">命令的参数</param></param>
        /// <returns>该命令影响的行数</returns>
        public static int ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0)
                throw new ArgumentNullException("connectionString");
            if (commandText == null || commandText.Length == 0)
                throw new ArgumentNullException("commandText");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand();
                PrepareCommand(command, connection, commandType, commandText, commandParameters);
                int retval = command.ExecuteNonQuery();

                //connection.Close();

                return retval;
            }
        }
        #endregion

        #region ExecuteReader
        /// <summary>
        /// 在指定的连接上用指定的参数执行SQL命令
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="commandType">命令类型(存储过程、文本等等)</param>
        /// <param name="commandText">存储过程名或T-SQL语句</param>
        /// <param name="commandParameters">命令的参数</param>
        /// <returns>返回一个SqlDataReader对象</returns>
        public static SqlDataReader ExecuteReader(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0)
                throw new ArgumentNullException("connectionString");
            if (commandText == null || commandText.Length == 0)
                throw new ArgumentNullException("commandText");

            SqlConnection connection = null;
            try
            {
                connection = new SqlConnection(connectionString);
                connection.Open();

                SqlCommand command = new SqlCommand();
                PrepareCommand(command, connection, commandType, commandText, commandParameters);
                SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection);

                return dataReader;
            }
            catch
            {
                if (connection != null)
                    connection.Close();

                return null;
            }
        }

        #endregion

        #region ExecuteScalar
        /// <summary>
        /// 在指定的连接上用指定的参数执行SQL命令
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="commandType">命令类型(存储过程、文本等等)</param>
        /// <param name="commandText">存储过程名或T-SQL语句</param>
        /// <param name="commandParameters">命令的参数</param>
        /// <returns>返回一个单值</returns>
        public static object ExecuteScalar(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0)
                throw new ArgumentNullException("connectionString");
            if (commandText == null || commandText.Length == 0)
                throw new ArgumentNullException("commandText");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand();
                PrepareCommand(command, connection, commandType, commandText, commandParameters);
                object obj = command.ExecuteScalar();

                //connection.Close();

                return obj;
            }
        }
        #endregion

        #region FillDataSet
        /// <summary>
        /// 填充数据集
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        /// <param name="commandType">命令类型(存储过程、文本等等)</param>
        /// <param name="commandText">存储过程名或T-SQL语句</param>
        /// <param name="dataSet">要填充的数据集</param>
        /// <param name="tableNames">数据集中的表名</param>
        /// <param name="commandParameters">命令的参数</param>
        public static void FillDataSet(string connectionString, CommandType commandType,
            string commandText, DataSet dataSet, string[] tableNames,
            params SqlParameter[] commandParameters)
        {
            if (connectionString == null || connectionString.Length == 0)
                throw new ArgumentNullException("connectionString");
            if (commandText == null || commandText.Length == 0)
                throw new ArgumentNullException("commandText");
            if (dataSet == null)
                throw new ArgumentNullException("dataSet");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand();
                PrepareCommand(command, connection, commandType, commandText, commandParameters);

                SqlDataAdapter da = new SqlDataAdapter(command);
                if ((tableNames != null) && (tableNames.Length > 0))
                {
                    string srcTableName = "Table";
                    for (int i = 0; i < tableNames.Length; i++)
                    {
                        da.TableMappings.Add(srcTableName, tableNames[i]);
                        srcTableName = "Table" + (i + 1).ToString();
                    }
                }

                da.Fill(dataSet);

                //connection.Close();
            }
        }
        #endregion

        #region UpdateDataSet
        /// <summary>
        /// 更新数据集
        /// </summary>
        /// <param name="insertCommand">插入命令对象</param>
        /// <param name="deleteCommand">删除命令对象</param>
        /// <param name="updateCommand">更新命令对象</param>
        /// <param name="dataSet">用作更新数据源的数据集</param>
        /// <param name="tableName">用作更新数据源的数据表</param>
        public static void UpdateDataSet(SqlCommand insertCommand, SqlCommand deleteCommand,
            SqlCommand updateCommand, DataSet dataSet, string tableName)
        {
            if (insertCommand == null) throw new ArgumentNullException("insertCommand");
            if (deleteCommand == null) throw new ArgumentNullException("deleteCommand");
            if (updateCommand == null) throw new ArgumentNullException("updateCommand");
            if (tableName == null || tableName.Length == 0) throw new ArgumentNullException("tableName");

            using (SqlDataAdapter dataAdapter = new SqlDataAdapter())
            {
                dataAdapter.UpdateCommand = updateCommand;
                dataAdapter.InsertCommand = insertCommand;
                dataAdapter.DeleteCommand = deleteCommand;

                dataAdapter.Update(dataSet, tableName);

                dataSet.AcceptChanges();
            }
        }
        #endregion

        internal static int ExecuteNonQuery(string p, CommandType commandType, StringBuilder strSql, SqlParameter[] parameters)
        {
            throw new NotImplementedException();
        }
    }
}
