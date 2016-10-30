using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
    public class GetPhotoBLL
    {
        GetPhotoDAL getPhotoDAL = new GetPhotoDAL();        

        //////////////////////////////////////////////////////////////////浏览个人中心////////////////////////////////

        //个人相册和照片的信息
        public DataSet getAlbumPhoto_self(string clientID)
        {
            return getPhotoDAL.getAlbumPhoto_self(clientID);
        }

        //获取当前用户的nickName,photoNum,like_num,follow_num,followeeNum,album_num
        public DataSet getClient(string clientID)
        {
            return getPhotoDAL.getClient(clientID);
        }

        /////////////////////////////////////////////////////////////////END//////////////////////////////////////////


        //////////////////////////////////////////////////////////////浏览页（推荐用户，推荐照片）////////////////////////////////////////////

        //获取推荐的用户的clientID
        public DataSet getClientInfo(string clientID)
        {
            return getPhotoDAL.getClientInfo(clientID);
        }

        //获取按Label频率推荐的照片的photoID,LikeNum,CommentNum,Pic
        public DataSet getPhotoByLabel(string clientID)
        {
            return getPhotoDAL.getPhotoByLabel(clientID);
        }

        ////获取根据最近时间推荐的Photo的ID,,LikeNum,CommentNum,Pic
        //public DataSet getPhotoByTime(string clientID)
        //{
        //    return getPhotoDAL.getPhotoByTime(clientID);
        //}

        ///////////////////////////////////////////////////////////////////////END//////////////////////////////////////////////////////////



        /////////////////////////////////////////////////////获取评论与存入评论//////////////////////////////////////////////////

        //每张照片的评论信息
        public DataSet getPhoto_comment(string photoID)
        {
            return getPhotoDAL.getPhoto_comment(photoID);
        }

        //添加评论信息存入数据库
        public int addComment(Comment comment)
        {
            return getPhotoDAL.addComment(comment);
        }

        /////////////////////////////////////////////////////END////////////////////////////////////////////////////////////////


        ////////////////////////////////////////////////////////点赞与取消点赞//////////////////////////////////////////////////        

        public int handleLike(string photoId, string clientID)
        {
            return getPhotoDAL.handleLike(photoId, clientID);
        }

        //判断是否点过赞
        public DataSet getIfLiked(string clientID) 
        {
            return getPhotoDAL.GetIfLiked(clientID);
        }

        ////////////////////////////////////////////////////////END//////////////////////////////////////////////////////////


        //////////////////////////////////////////////////////////////首页显示关注的用户及其发布的照片///////////////////////////

        public DataSet getFollowee_Photo(string clientID)
        {
            return getPhotoDAL.getFollowee_Photo(clientID);
        }

        public DataSet getPhoto_Comment_Home(string photoID)
        {
            return getPhotoDAL.getPhoto_Comment_homepage(photoID);
        }

       ///////////////////////////////////////////////////////END////////////////////////////////////////////////// 


        ////////////////////////////////////////////////点开一张照片，跳转到照片详细信息////////////////////////////////////////////////////////
        public DataSet getClient_Photo(string photoID) 
        {
            return getPhotoDAL.getClient_Photo(photoID);
        }

        public DataSet getComment_Photo(string photoID)
        {
            return getPhotoDAL.getComment_Photo(photoID);
        }

        public DataSet getLabel_Photo(string photoID)
        {
            return getPhotoDAL.getLabel_Photo(photoID);
        }

        //////////////////////////////////////////////////////END////////////////////////////////////////////////////////////////////////////////

    }
}
