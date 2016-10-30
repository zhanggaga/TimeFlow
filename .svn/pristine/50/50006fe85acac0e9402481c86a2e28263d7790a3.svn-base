//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using Model;
//using System.Data;
//using System.Data.SqlClient;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;
using Model;
using System.Data;


namespace DAL
{
    public class AdminDAL
    {
        //数据库链接字符串
        private string ConnString = System.Configuration.ConfigurationSettings.AppSettings["strConn"];


       // 管理员登录
        public int adminLogin(Admin ad)
        {
            string com_txt = string.Format("select * from Admin where Username='{0}' and Password='{1}'", ad.Username, ad.Password);
            SqlDataReader list = SqlHelper.ExecuteReader(ConnString, System.Data.CommandType.Text, com_txt, null);

            if (list.HasRows == true)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //获取管理员信息
        public DataSet getAdmin(Admin ad)
        {
            DataSet ds = new DataSet();
            string com_txt = string.Format("select * from Admin where Username='{0}' and Password='{1}'", ad.Username, ad.Password);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, com_txt, ds, null);

            return ds;
        }

    }
}
