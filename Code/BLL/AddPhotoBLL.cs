using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
    public class AddPhotoBLL
    {
        AddPhotoDAL addPhotoDAL = new AddPhotoDAL();

        /// <summary>
        /// 上传照片
        /// </summary>
        /// <param name="photo"></param>
        /// <returns></returns>
        public int addPhoto(Photo photo, string[] label_nam)
        {
            return addPhotoDAL.addPhoto(photo, label_nam);

        }

        public int addPortrait(string url,int client_id)
        {
            return addPhotoDAL.addPortrait(url,client_id);

        }

        //完善个人信息
        public int modifyInfo(ClientInfo clientinfo, Client client, string[] habbit_nam)
        {
            return addPhotoDAL.modifyInfo(clientinfo, client, habbit_nam);

        }

        //根据用户ID返回用户添加次数最频繁标签
        public DataSet getMostTag(int client_id)
        {
            return addPhotoDAL.getMostTag(client_id);
        }


        //给用户推送爱好
        public DataSet getHabbit()
        {
            return addPhotoDAL.getHabbit();
        }
        //显示默认的头像
        public DataSet getPortrait(int client_id)
        {
            return addPhotoDAL.getPortrait(client_id);
        }

        //给照片添加推荐的标签存进数据库
        public int addTag(DateTime tag_time, string photo_url, int client_id, string label_nam)
        {
            return addPhotoDAL.addTag(tag_time, photo_url, client_id, label_nam);
        }


        //根据用户ID生成时间轴
        public DataSet timeAxis(string client_id)
        {
            return addPhotoDAL.timeAxis(client_id);
        }

        //根据获取的爱好名字，用户ID修改habbit,habbit_user表
        public int modifyHabbit(string habb_name, int client_id)
        {
            return addPhotoDAL.modifyHabbit(habb_name, client_id);
        }


        //通过输入的单个字符搜索，返回标签集
        public DataSet searchLabel(string temp)
        {
            return addPhotoDAL.searchLabel(temp);
        }


    }
}
