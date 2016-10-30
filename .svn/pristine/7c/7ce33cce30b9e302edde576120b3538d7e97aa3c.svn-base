using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class AddPhotoDAL
    {
        //数据库链接字符串
        private string conn_string = System.Configuration.ConfigurationSettings.AppSettings["strConn"];

        //上传照片
        public int addPhoto(Photo photo, string[] label_nam)
        {

            string comTxt_photo = string.Format("INSERT INTO [TimeFlow].[dbo].[Photo]([Time],[Pic],[CommentsNum],[LikeNum],[ClientID],[IfPublic]) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}')", photo.Time, photo.Pic, photo.CommentsNum, photo.LikeNum, photo.ClientID, photo.IfPublic);
            int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comTxt_photo, null);
            if (i == 1)
            {

                for (int t = 0; t < label_nam.Length; t++)
                {
                    int k = addTag(photo.Time, photo.Pic, photo.ClientID, label_nam[t]);
                }
                return 1;
            }
            else
            {
                return 0;
            }

        }

        //上传照片
        public int addPortrait(string url,int client_id)
        {

            string comTxt_por = string.Format("update ClientInfo set Pic='{0}' where ID='{1}'", url, client_id);
            int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comTxt_por, null);
            if (i == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }

        //完善个人信息
        public int modifyInfo(ClientInfo clientinfo, Client client, string[] habbit_nam)
        {
            string com_info = string.Format("insert into [TimeFlow].[dbo].[ClientInfo](ID,FollowerNum,FolloweeNum,NickName,Sex,Country,Province,City) values ( '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", client.ID, clientinfo.NickName, 0, 0, clientinfo.Sex, clientinfo.Country, clientinfo.Province, clientinfo.City);
            int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, com_info, null);

            for (int t = 0; t < habbit_nam.Length; t++)
            {
                int k = modifyHabbit(habbit_nam[t], client.ID);
            }
            if (i == 0)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }


        //根据用户ID返回用户添加次数最频繁标签
        public DataSet getMostTag(int client_id)
        {
            DataSet ds_tag = new DataSet();

            string comTxt_tag = string.Format("select top 3 label_id,label_name from fun_get_similiar_Label_getLabels_Count('{0}') ", client_id);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_tag, ds_tag, null);

            return ds_tag;
        }

        //给用户推送爱好
        public DataSet getHabbit()
        {
            DataSet ds_habbit = new DataSet();

            string comTxt_tag = string.Format("select top 3 * from Habbit");

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_tag, ds_habbit, null);

            return ds_habbit;
        }

        //显示默认的头像
        public DataSet getPortrait(int client_id)
        {
            DataSet ds_portrait = new DataSet();

            string comTxt_pic = string.Format("select NickName,Pic from ClientInfo where ID={0}", client_id);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_pic, ds_portrait, null);

            return ds_portrait;
        }

        //给照片添加推荐的标签存进数据库
        public int addTag(DateTime tag_time, string photo_url, int client_id, string label_nam)
        {

            //根据photo_url找到photoid
            int photo_id = toPicID(photo_url);


            DataSet ds_label = new DataSet();

            string comTxt_habb = string.Format("select * from Label where LabelName='{0}'", label_nam);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_habb, ds_label, null);

            if (ds_label.Tables[0].Rows.Count == 0) //Label表中没有该标签名字
            {
                string comtxt_addtag = string.Format("insert into Label values ('{0}')", label_nam);//给Label表增加一条标签记录
                int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_addtag, null);
                if (i == 1)
                {
                    DataSet ds_label_inc = new DataSet();

                    string comTxt_label_inc = string.Format("select * from Label where LabelName='{0}'", label_nam);

                    SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_label_inc, ds_label_inc, null);//根据标签名找到LabelID

                    string comtxt_add_labelphoto1 = string.Format("insert into Label_Photo(Time,LabelID,PhotoID,ClientID) values ('{0}','{1}','{2}','{3}')", tag_time, Convert.ToInt32(ds_label_inc.Tables[0].Rows[0]["ID"]), photo_id, client_id);//给habbit_user表增加一条记录
                    int j = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_add_labelphoto1, null);
                    if (j == 1)
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                string comtxt_add_labelphoto2 = string.Format("insert into Label_Photo(Time,LabelID,PhotoID,ClientID) values ('{0}','{1}','{2}','{3}')", tag_time, Convert.ToInt32(ds_label.Tables[0].Rows[0]["ID"]), photo_id, client_id); ;//给habbit_user表增加一条记录
                int k = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_add_labelphoto2, null);
                if (k == 1)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }

        }

        //根据photo_url找到photoid
        public int toPicID(string photo_url)
        {
            DataSet ds_photo = new DataSet();

            string comTxt_photo = string.Format("select ID from Photo where Pic='{0}'", photo_url);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_photo, ds_photo, null);

            return Convert.ToInt32(ds_photo.Tables[0].Rows[0]["ID"]);
        }

        //根据用户ID生成时间轴
        public DataSet timeAxis(string client_id)
        {
            DataSet ds_axis = new DataSet();

            string comTxt_axis = string.Format("select ID,[Time],Pic from Photo where ClientID='{0}'order by [Time] desc ", client_id);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_axis, ds_axis, null);

            return ds_axis;
        }


        //根据获取的爱好名字，用户ID修改habbit,habbit_user表
        public int modifyHabbit(string habb_name, int client_id)
        {
            DataSet ds_habb = new DataSet();

            string comTxt_habb = string.Format("select * from Habbit where Name='{0}'", habb_name);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_habb, ds_habb, null);

            if (ds_habb.Tables[0].Rows.Count == 0) //habbit表中没有改爱好名字
            {
                string comtxt_addhabb = string.Format("insert into Habbit values ('{0}')", habb_name);//给habbit表增加一条爱好记录
                int i = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_addhabb, null);
                if (i == 1)
                {
                    DataSet ds_habb_inc = new DataSet();

                    string comTxt_habb_inc = string.Format("select * from Habbit where Name='{0}'", habb_name);

                    SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_habb_inc, ds_habb_inc, null);//根据爱好名找到HABBITID

                    string comtxt_add_habbuser1 = string.Format("insert into Habbit_User(HabbitID,ClientID) values ('{0}','{1}')", Convert.ToInt32(ds_habb_inc.Tables[0].Rows[0]["ID"]), client_id);//给habbit_user表增加一条记录
                    int j = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_add_habbuser1, null);
                    if (j == 1)
                    {
                        return 1;
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                string comtxt_add_habbuser2 = string.Format("insert into Habbit_User(HabbitID,ClientID) values ('{0}','{1}')", Convert.ToInt32(ds_habb.Tables[0].Rows[0]["ID"]), client_id);//给habbit_user表增加一条记录
                int k = SqlHelper.ExecuteNonQuery(conn_string, System.Data.CommandType.Text, comtxt_add_habbuser2, null);
                if (k == 1)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        }


        //通过输入的单个字符搜索，返回标签集
        public DataSet searchLabel(string temp)
        {
            DataSet ds_sear_label = new DataSet();

            string comTxt_label = string.Format("select PhotoID, Photo.Pic,Photo.[Time],Photo.CommentsNum,Photo.LikeNum from Label_Photo a,Photo where Photo.ID = a.PhotoID and a.LabelID in(select Label.ID from Label where Labelname like '%{0}%')", temp);

            SqlHelper.FillDataSet(conn_string, System.Data.CommandType.Text, comTxt_label, ds_sear_label, null);

            return ds_sear_label;

        }


    }
}
