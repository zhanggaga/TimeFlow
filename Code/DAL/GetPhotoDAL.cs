using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class GetPhotoDAL
    {
        //数据库链接字符串
        private string ConnString = System.Configuration.ConfigurationSettings.AppSettings["strConn"];


        ////////////////////////////////////////////////////////////////////////浏览个人中心///////////////////////////////////////

        //获取当前用户自己所有Album的AlbumName,以及photo,浏览用户自己的相册和照片
        public DataSet getAlbumPhoto_self(string clientID)
        {
            DataSet ds_albumName_self = new DataSet();

            string comTxt_photo = string.Format("select photo_id,pic,like_num,comment_num,album_name,album_id from fun_Cilent_album({0}) ", clientID);
            //select * from fun_Cilent_album({0})(只是多了ID和nickname)
            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_albumName_self, null);

            return ds_albumName_self;
        }

        //获取当前用户的nickName,photoNum,like_num,follow_num,followeeNum,album_num
        public DataSet getClient(string clientID)
        {
            DataSet ds_client_self = new DataSet();

            string comTxt_photo = string.Format("select * from fun_Cilent_photo() where Client_id = '{0}'", clientID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_client_self, null);

            return ds_client_self;
        }


        /////////////////////////////////////////////////////////////////////END////////////////////////////////////////////////////////////


        /////////////////////////////////////////////////////////////////////浏览页（推荐用户，推荐照片）///////////////////////////////////

        //获取推荐还未关注的用户的ClientID,nickName,Pic
        public DataSet getClientInfo(string clientID)
        {
            DataSet ds_clientInfo = new DataSet();

            string comTxt_photo = string.Format("select * from fun_get_similar_Client_Info('{0}') where Client_id <> '{1}' and Client_id not in(select Follower.FolloweeID from Follower where Follower.FollowerID = '{2}')", clientID, clientID, clientID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_clientInfo, null);

            if (ds_clientInfo.Tables[0].Rows.Count == 0) //如果没有推荐用户，则随机获取一些还未用户推荐
            {
                DataSet ds_randomInfo = new DataSet();

                string comTxt_random = string.Format("select distinct ID Client_id,nickName Client_name,Pic from ClientInfo where ID not in(select Follower.FolloweeID from Follower where Follower.FollowerID = '{0}') and ID <> '{1}'", clientID, clientID);

                SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_random, ds_randomInfo, null);

                return ds_randomInfo;
            }
            else
            {
                return ds_clientInfo;
            }

        }

        //获取根据label频率推荐的Photo的ID,LikeNum,CommentNum,Pic
        public DataSet getPhotoByLabel(string clientID)
        {
            DataSet ds_photoInfo = new DataSet();

            string comTxt_photo = string.Format("select photo_id,LikeNum,CommentsNum,pic from fun_get_similiar_Label_detail('{0}') where IfPublic = 'Y'", clientID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_photoInfo, null);

            if (ds_photoInfo.Tables[0].Rows.Count > 0)
            {
                return ds_photoInfo;
            }
            else  //如果推荐的照片为空,则按时间推荐一些照片
            {
                DataSet ds_photo = new DataSet();

                string comTxt_photoR = string.Format("select ID photo_id,LikeNum,CommentsNum,Pic from Photo where IfPublic = 'Y'");

                SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photoR, ds_photo, null);
                return ds_photo;
            }

        }

        //获取根据最近时间推荐的Photo的ID,,LikeNum,CommentNum,Pic
        public DataSet getPhotoByTime(string clientID)
        {
            DataSet ds_photoInfo_time = new DataSet();

            string comTxt_photo = string.Format("select PhotoID,LikeNum,CommentsNum,pic from fun_get_similiar_Label_ByTime_PhotoDetail('{0}')", clientID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_photoInfo_time, null);

            return ds_photoInfo_time;

        }


        /////////////////////////////////////////////////////////////////////////////END///////////////////////////////////////////////////////


        /////////////////////////////////////////////////////////////////获取评论及存入评论/////////////////////////////////////////////////////

        //从Comment表中获取每张照片的评论信息
        public DataSet getPhoto_comment(string photoID)
        {
            DataSet ds_photo_comment = new DataSet();

            string comTxt_photo = string.Format("select * from Comment where PhotoID='{0}'", photoID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_photo_comment, null);

            return ds_photo_comment;
        }


        //将照片的评论信息包括Time，Content,PrintUser,RecieveUser,PhotoID写入数据库,并将Photo表中对应的CommentNum加1
        public int addComment(Comment comment)
        {
            string comTxt_comment = string.Format("INSERT INTO [TimeFlow].[dbo].[Comment]([Time],[Content],[PrintUserID],[ReceiveUserID],[PhotoID]) VALUES ('{0}','{1}','{2}','{3}','{4}')", comment.Time, comment.Content, comment.PrintUserID, comment.ReceiveUserID, comment.PhotoID);
            
            string addCommentNum = string.Format("update Photo set CommentsNum = CommentsNum + 1 where Photo.ID = '{0}'", comment.PhotoID);
            int comment_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comTxt_comment, null);
            int addComment_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, addCommentNum, null);

            if (comment_signal == 1 && addComment_signal == 1)
            {
                return 1;
            }           
            else
            {
                string delete_comment = string.Format("delete from Comment where PhotoID = '{0}'", comment.PhotoID);
                string decreseCommentNum = string.Format("update Photo set CommentsNum = CommentsNum - 1 where Photo.ID = '{0}'", comment.PhotoID);
                
                if (comment_signal == 0 && addComment_signal == 1)
                {
                    int dcn = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, decreseCommentNum, null);
                }
                else if (comment_signal == 1 && addComment_signal == 0)
                {
                    int dc_1 = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, delete_comment, null);
                }                
                return 0;
            }
        }

        ////////////////////////////////////////////////////////////////////////////END/////////////////////////////////////////////////


        ////////////////////////////////////////////////////////////处理点赞的信息，并对点赞的照片的Photo表中的LikeNum////////////////////////////////

        //点赞与取消点赞
        public int handleLike(string photoID, string clientID)
        {
            DataSet ds_like = new DataSet();
            string like_exist = string.Format("select * from [Like] where ClientID='{0}' and PhotoID ='{1}'", clientID, photoID);
            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, like_exist, ds_like, null);
            if (ds_like.Tables[0].Rows.Count > 0)  //若该用户已经点过赞，再次点赞则是取消点赞，点赞数减1
            {
                string comTxt_like = string.Format("delete  from [Like] where [Like].clientID = '{0}'and PhotoID ='{1}'", clientID, photoID);
                string cancelLikeNum = string.Format("update Photo set LikeNum = LikeNum - 1 where Photo.ID = '{0}'", photoID);
                int cancel_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comTxt_like, null);
                int cancelLike_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, cancelLikeNum, null);

                if (cancel_signal == 1 && cancelLike_signal == 1)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else//没有点过赞，点击则是点赞，插入信息，点赞数加1
            {
                string comTxt_like = string.Format("INSERT INTO [TimeFlow].[dbo].[Like]([PhotoID],[ClientID]) VALUES ('{0}','{1}')", photoID, clientID);
                string addLikeNum = string.Format("update Photo set LikeNum = LikeNum + 1 where Photo.ID = '{0}'", photoID);
                int like_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, comTxt_like, null);
                int addLike_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, addLikeNum, null);

                if (like_signal == 1 && addLike_signal == 1)
                {
                    return 3;
                }
                else
                {
                    return 2;
                }

            }
        }


        //判断该用户对某张照片是否已经点过赞
        public DataSet GetIfLiked(string clientID)
        {
            DataSet ds_Ifliked = new DataSet();
            string ifLiked = string.Format("select distinct Photo_id,IF_Liked from fun_get_IF_Liked('{0}')", clientID);
            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, ifLiked, ds_Ifliked, null);

            return ds_Ifliked;
        }

        //////////////////////////////////////////////////////END///////////////////////////////////////////////////      


        //////////////////////////////////////////////////首页获取我关注的用户的信息，及他发的照片的信息,按时间降序排///////////////////////////////////////////////

        //获取首页我关注的人的信息（followeeID，nickName，pic,photo_id,photo_pic,Photo_time,comment_num,likeNum order by time desc
        public DataSet getFollowee_Photo(string clientID)
        {
            DataSet ds_followee_photo = new DataSet();

            string comTxt_followee_photo = string.Format("select Follower.FolloweeID,ClientInfo.NickName,ClientInfo.Pic Followee_pic,Photo.ID Photo_id,Photo.Pic Photo_pic,Photo.[Time] Photo_time,Photo.CommentsNum,Photo.LikeNum from Follower,ClientInfo,Photo where ClientInfo.ID = Follower.FolloweeID and FollowerID = '{0}' and Follower.FolloweeID <> '{1}' and Photo.ClientID = Follower.FolloweeID and Photo.IfPublic = 'Y' order by Photo.[Time] desc", clientID, clientID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_followee_photo, ds_followee_photo, null);

            return ds_followee_photo;
        }

        //获取首页我关注的人的照片的评论信息（PhotoId,Comment_time,comment_content,comment_printuserId,comment...）
        public DataSet getPhoto_Comment_homepage(string photoID)
        {
            DataSet ds_photo_comment = new DataSet();

            string comTxt_photo_comment = string.Format("select * from fun_get_Photo_Comments_Homepage('{0}')", photoID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo_comment, ds_photo_comment, null);

            return ds_photo_comment;
        }

        //获取首页我关注的人的照片的label_name
        //同下面的getLabel_Photo(string photoID)

        ////////////////////////////////////////////////////////////////////END//////////////////////////////////////////////////////////////////


        ////////////////////////////////////////////////点开一张照片，跳转到照片详细信息////////////////////////////////////////////////////////


        //返回这张照片的pic ,time,c_num,l_num,发这张照片的人的nickname,pic
        public DataSet getClient_Photo(string photoID)
        {
            DataSet ds_photo_client = new DataSet();

            string comTxt_photo_client = string.Format("select Photo.ClientID Client_id,Photo.Pic Photo_pic,Photo.[Time] Photo_time,Photo.CommentsNum,Photo.LikeNum, ClientInfo.NickName,ClientInfo.Pic Client_pic from Photo,ClientInfo where Photo.ClientID = ClientInfo.ID and Photo.ID = ('{0}') order by Photo.[Time]", photoID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo_client, ds_photo_client, null);

            return ds_photo_client;
        }


        //返回这张照片的评论内容，评论时间，评论者和回复者
        public DataSet getComment_Photo(string photoID)
        {
            DataSet ds_photo_comment = new DataSet();

            string comTxt_photo_comments = string.Format("select * from fun_get_Photo_Comments('{0}')", photoID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo_comments, ds_photo_comment, null);

            return ds_photo_comment;

        }


        //返回这张照片添加的LabelName
        public DataSet getLabel_Photo(string photoID)
        {
            DataSet ds_photo_label = new DataSet();

            string comTxt_photo_label = string.Format("select Label.LabelName from Label,Label_Photo b where b.PhotoID = '{0}' and b.LabelID = Label.ID", photoID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo_label, ds_photo_label, null);

            return ds_photo_label;

        }

        /////////////////////////////////////////////////////////////END///////////////////////////////////////////////////////////////



    }
}
