using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
    public class ManagementInfoBLL
    {
        ManagementInfoDAL managementDAL = new ManagementInfoDAL();

        //返回所有用户的基本信息
        public DataSet getClientInfo()
        {
            return managementDAL.getClientInfo();
        }

        //返回所有用户的评论信息
        public DataSet getComment()
        {
            return managementDAL.getComment();
        }

        //返回所有用户的图片信息
        public DataSet getPhoto()
        {
            return managementDAL.getPhoto();
        }

        //根据评论ID删除不和谐用户的评论
        public int deletComent(int commentID)
        {
            return managementDAL.deletComent(commentID);
        }

        //根据照片ID删除不和谐照片
        public int deletPhoto(int photoID)
        {
            return managementDAL.deletPhoto(photoID);
        }


        //根据用户ID封锁用户
        public int lockClient(int clientID)
        {
            return managementDAL.lockClient(clientID);
        }


        //根据用户ID解锁用户
        public int unlockClient(int clientID)
        {
            return managementDAL.unlockClient(clientID);
        }

        //通过用户ID得到用户的封锁状态
        public DataSet getLockState(int client_id)
        {
            return managementDAL.getLockState(client_id);
        }
    }
}
