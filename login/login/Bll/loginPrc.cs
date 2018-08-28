using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace login.Model
{
    class loginPrc
    {
        //引用dbhelper成员
        private DbHelper dbh = new DbHelper();

        //后期用于验证输入的密码格式是否正确
        public bool Is_formatpwd(string pwd)
        {
            if (pwd == null)
                return false;
            return true;
        }

        //获取combobox 里的数据 
        //@ return  List
        public List<string> getUsermae()
        {
            List<string> lst = new List<string>();
            try
            {

                MySqlDataReader dr = dbh.getDr("call Getalluser()");//调用数据操作方法
                while (dr.Read()) //不断的读数据
                {
                    if (!Convert.IsDBNull("Name"))
                        lst.Add(dr["Name"].ToString());
                }
                dbh.dbClose();

            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return lst;
            }
        
        //判断账户密码是否匹配
        public bool Is_Pwd(string UserName, string UserPwd)
        {
            string str = null;
            try
            {
                //使用mysql 存储过程获取密码
                MySqlDataReader dr = dbh.getDr1(UserName); 
                //MySqlDataReader dr = dbh.getDr(Sqlstr);
                while (dr.Read()) //不断的读数据
                {
                    if (!Convert.IsDBNull("Pwd"))
                       str = dr["Pwd"].ToString();
                    //str = Encoding.UTF8.GetString(Encoding.UTF8.GetBytes(dr["Pwd"].ToString()));
                }
            }
            catch(Exception ex)
            {
                throw (ex);
            }

            // ？存储过程获取失败
            //尝试使用mysql连接获取
            if (str == null)
            {
                try
                {
                    string Sqlstr = "SELECT Pwd FROM `dbo.管理员` WHERE Name='" + UserName + "'";
                    MySqlDataReader dr = dbh.getDr(Sqlstr);//调用数据操作方法
                    while (dr.Read()) //不断的读数据
                    {
                        if (!Convert.IsDBNull("Pwd"))
                            str = dr["Pwd"].ToString();
                    }
                    dbh.dbClose();
                }
                catch(Exception ex)
                {
                    throw (ex);
                }
            }
           
            if (str == UserPwd)
                return true;
            else
                return false;
        }

    }
}
