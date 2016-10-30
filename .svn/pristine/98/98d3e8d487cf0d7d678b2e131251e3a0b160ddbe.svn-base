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
    public class RegisterDAL
    {
        //数据库链接字符串
        private string conn_string = System.Configuration.ConfigurationSettings.AppSettings["strConn"];


        //验证邮箱
        public int mailTest(Client user)
        {
            string comTxt_mail = string.Format("select * from Client where Mail='{0}'", user.Mail);
            SqlDataReader list_mail = SqlHelper.ExecuteReader(conn_string, System.Data.CommandType.Text, comTxt_mail, null);

            if (list_mail.HasRows == true)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }

        //验证电话号码
        public int phoneTest(Client user)
        {

            string comTxt_phone = string.Format("select * from Client where Phone='{0}'", user.Phone);
            SqlDataReader list_phone = SqlHelper.ExecuteReader(conn_string, System.Data.CommandType.Text, comTxt_phone, null);

            if (list_phone.HasRows == true)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }

        //验证邮箱验证码
        public int codeTest(Client user)
        {

            string comTxt_phone = string.Format("select * from Client where UserState = '{0}'and validateCode='{1}'", 0,user.validateCode);
            SqlDataReader list_phone = SqlHelper.ExecuteReader(conn_string, System.Data.CommandType.Text, comTxt_phone, null);

            if (list_phone.HasRows == true)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }


        //邮箱注册
        public int addMail(Client user)
        {
            string comTxt_email = string.Format("INSERT INTO [TimeFlow].[dbo].[Client]([Mail],[Password],[addData],[validateCode],[UserState],[LockState]) VALUES ('{0}','{1}','{2}','{3}','{4}',{5})", user.Mail, user.Password,user.addData,user.validateCode,user.UserState,user.LockState);
            int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comTxt_email, null);
            if (i == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }


        //添加默认用户信息
        public int addInfo(ClientInfo user_info)
        {
            string comtxt_info = string.Format("INSERT INTO [TimeFlow].[dbo].[ClientInfo]([ID],[FollowerNum],[FolloweeNum],[NickName],[Pic]) VALUES ('{0}','{1}','{2}','{3}','{4}')", user_info.ID, user_info.FollowerNum, user_info.FolloweeNum, user_info.NickName, user_info.Pic);
            int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_info, null);
            if (i == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }


        //电话号码注册
        public int addPhone(Client user)
        {
            string comTxt_phone = string.Format("INSERT INTO [TimeFlow].[dbo].[Client]([Phone],[Password]) VALUES ('{0}','{1}')", user.Phone, user.Password);
            int j = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comTxt_phone, null);
            if (j == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }


        public DataSet getUserID(Client user)
        {
            DataSet ds_id = new DataSet();

            string comTxt_id = string.Format("select * from Client where Mail='{0}' and Password='{1}'", user.Mail, user.Password);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_id, ds_id, null);

            return ds_id;
        }

        //通过邮箱返回用户数据集
        public DataSet getUserByUserMail(string usermail)
        {
            DataSet ds_user = new DataSet();

            string comTxt_user = string.Format("select * from Client where Mail='{0}'", usermail);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_user, ds_user, null);

            return ds_user;
        }

        //邮箱验证改变激活状态
        public int updateValidateCode(Client user)
        {
            string com_txt = string.Format("UPDATE [TimeFlow].[dbo].[Client] set [UserState]=1,[validateCode] ='' where Mail='{0}'", user.Mail);
            int j = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, com_txt, null);
            if (j == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }


        //重置密码
        public int resetPsw(string new_psw, string mail)
        {
            string com_txt = string.Format("UPDATE [TimeFlow].[dbo].[Client] set [Password]= '{0}' where Mail='{1}'", new_psw,mail);
            int j = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, com_txt, null);
            if (j == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }
       

    }
}