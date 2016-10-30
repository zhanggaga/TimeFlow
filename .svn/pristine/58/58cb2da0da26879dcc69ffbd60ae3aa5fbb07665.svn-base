using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class ManagementInfoDAL
    {
        //数据库链接字符串
        private string ConnString = System.Configuration.ConfigurationSettings.AppSettings["strConn"];

        //管理员获取所有用户的基本信息
        public DataSet getClientInfo()
        {
            DataSet ds_cinfo = new DataSet();

            string com_txt = string.Format("select a.ID,a.Mail,a.Phone,b.NickName,b.Pic,b.Sex,b.Country,b.Province,b.City,b.FolloweeNum,b.FollowerNum,a.LockState from Client a,ClientInfo b where a.ID=b.ID");

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, com_txt, ds_cinfo, null);

            return ds_cinfo;
        }

        //根据用户ID封锁用户
        public int lockClient(int clientID)
        {
            string com_txt = string.Format("UPDATE [TimeFlow].[dbo].[Client] set [LockState]=0 where ID='{0}'", clientID);
            int i = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, com_txt, null);
            if (i == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //根据用户ID解锁用户
        public int unlockClient(int clientID)
        {
            string com_txt = string.Format("UPDATE [TimeFlow].[dbo].[Client] set [LockState]=1 where ID='{0}'", clientID);
            int i = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, com_txt, null);
            if (i == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //通过用户ID得到用户的封锁状态
        public DataSet getLockState(int client_id)
        {
            DataSet ds_lock = new DataSet();

            string comTxt_mail = string.Format("select * from Client where ID='{0}'", client_id);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_mail, ds_lock, null);

            return ds_lock;
        }


        //管理员获取所有用户的评论
        public DataSet getComment()
        {
            DataSet ds_comment = new DataSet();

            string com_txt = string.Format("select a.ID,a.PrintUserID,a.Content,a.Time from Comment a ");

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, com_txt, ds_comment, null);

            return ds_comment;
        }

        //根据评论ID删除不和谐用户的评论
        public int deletComent(int commentID)
        {
            string com_txt = string.Format("DELETE FROM [Comment] where [ID]='{0}'", commentID);
            int i = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, com_txt, null);
            if (i == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //管理员获取所有用户的图片
        public DataSet getPhoto()
        {
            DataSet ds_photo = new DataSet();

            string com_txt = string.Format("select a.ID,a.Pic from Photo a ");

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, com_txt, ds_photo, null);

            return ds_photo;
        }


        //根据图片ID删除不和谐照片
        public int deletPhoto(int photoID)
        {
            //删除有关照片的基本信息，标签，评论，点赞信息
            string comtxt_label = string.Format("delete from [Label_Photo] where [PhotoID]='{0}'", photoID);
            string comtxt_comment = string.Format("delete from [Comment] where [PhotoID]='{0}'", photoID);
            string comtxt_like = string.Format("delete from [Like] where [PhotoID]='{0}'", photoID);
            string comtxt_photo = string.Format("delete from [Photo] where [ID]='{0}'", photoID);
            int j = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comtxt_label, null);
            int m = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comtxt_comment, null);
            int n = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comtxt_like, null);
            int i = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comtxt_photo, null);
            if (j==0&&m==0&&n==0&&i==0)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        
    }
}
