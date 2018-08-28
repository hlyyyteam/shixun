using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Data;
    
namespace login
{
    class DbHelper
    {
        //从配置文件里获取 connectionString
        public static readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

        MySqlConnection conn = null;
        MySqlCommand cmd = null;

        //连接数据库
        public void dbConnection()
        {
            try
            {
                conn = new MySqlConnection(connectionString);
                conn.Open();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //断开数据库
        public void dbClose()
        {
            if (conn != null)
            {
                conn.Close();
            }
        }

        //执行数据库操作
        //@ IN Sql(String)
        //@Return MySqlDataReader

        public MySqlDataReader getDr(string Sqlstr)
        {
            dbConnection();
            cmd = new MySqlCommand(Sqlstr, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }

        //MySql 的存储过程 验证账号密码是否匹配
       public MySqlDataReader getDr1(string Username)
        {
            dbConnection();
            string sqlStr = "getPwd";
            cmd = new MySqlCommand(sqlStr, conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;//确定查询方式时存储过程（带参）
            cmd.Parameters.Add("@Name1", MySqlDbType.VarChar).Value =Username;
            MySqlDataReader mdr= cmd.ExecuteReader();
            //IDataReader dr = cmd.ExecuteReader();
            return mdr;
        }


    }
}
