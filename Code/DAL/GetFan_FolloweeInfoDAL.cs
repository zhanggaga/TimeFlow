using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
     public class GetFan_FolloweeInfoDAL
    {
        //数据库链接字符串
        private string ConnString = System.Configuration.ConfigurationSettings.AppSettings["strConn"];    
        
        //////////////////////////////////////////////////////////获取Fan的信息，获取关注的人的信息////////////////////////////////////

        //获取当前用户的fan的信息，用于粉丝页
        public DataSet getFanInfo(String clientID)   //clientID = followeeID(我是被关注的人)
        {
            DataSet ds_fan = new DataSet();           

            string comTxt_fan = string.Format("select * from fun_get_FanInfo_NotFollowed('{0}') union select * from fun_get_FanInfo_Followed('{1}')", clientID,clientID);

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_fan, ds_fan, null);  
         
            return ds_fan; 
        }

        //获取当前用户关注的其他用户的信息，用于关注列表
        public DataSet getFolloweeInfo(String clientID)   //clientID = followerID(我是别人的fan)
        {
            DataSet ds_followee = new DataSet();

            string comTxt_photo = string.Format("select distinct ClientInfo.ID,FollowerNum,FolloweeNum,NickName,Sex,Pic,Country,Province,City from ClientInfo,Follower where ClientInfo.ID = Follower.FolloweeID and Follower.FollowerID = '{0}'", clientID);//1

            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, comTxt_photo, ds_followee, null);

            return ds_followee;

        }

         /////////////////////////////////////////////////////////////查询我(clientID)是否关注了某个人FolloweeId//////////////////////////////////

        public int getIfFollowed(string clientID, string followeeID)
        { 
            DataSet ds_Iffollowed = new DataSet();
            string If_follow = string.Format("select * from Follower where FollowerID = '{0}' and FolloweeID = '{1}'", clientID, followeeID);
            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, If_follow, ds_Iffollowed, null);
            if (ds_Iffollowed.Tables[0].Rows.Count > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }

        /////////////////////////////////////////////////////////END///////////////////////////////////////////////////////////////////////////

         ////////////////////////////////////////////////////////关注与取消关注///////////////////////////////////////////////////////

         //关注别人
        public int followOther(string followerID, string followeeID)//flollowerID是当前用户,followeeID是我关注的人
        {
            DataSet ds_follow = new DataSet();
            string follow_exist = string.Format("select * from [Follower] where FollowerID='{0}' and FolloweeID = '{1}'", followerID, followeeID);
            SqlHelper.FillDataSet(ConnString, System.Data.CommandType.Text, follow_exist, ds_follow, null);
            if (ds_follow.Tables[0].Rows.Count > 0)  //若已经关注了该用户，则不再向数据库写数据
            {
                return 2;
            }
            else
            {
                string add_follow = string.Format("INSERT INTO [TimeFlow].[dbo].[Follower]([FollowerID],[FolloweeID]) VALUES ('{0}','{1}')", followerID, followeeID);
                string addFolloweeNum = string.Format("update ClientInfo set FolloweeNum = FolloweeNum + 1 where ClientInfo.ID  = '{0}'", followerID); //当前用户的关注人数加1
                string addFollowerNum = string.Format("update ClientInfo set FollowerNum = FollowerNum + 1 where ClientInfo.ID  = '{0}'", followeeID); //被关注的用户的fan数加1
                int follow_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, add_follow, null);
                int addFollowee_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, addFolloweeNum, null);
                int addFollower_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, addFollowerNum, null);

                if (follow_signal == 1 && addFollowee_signal == 1 && addFollower_signal == 1)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }   
            }          

        }

         //取消关注别人
        public int cancelFollowee(string followerID,string followeeID)
        {
            string cancel_follow = string.Format("delete  from [Follower] where [Follower].FolloweeID = '{0}' and [Follower].FollowerID = '{1}'", followeeID, followerID);

            //string cancel_follow = string.Format("delete  from [Follower] where [Follower].FolloweeID = '{0}'", followeeID);
            string reduceFolloweeNum = string.Format("update ClientInfo set FolloweeNum = FolloweeNum - 1 where ClientInfo.ID  = '{0}'", followerID); //当前用户的关注人数减1
            string reduceFollowerNum = string.Format("update ClientInfo set FollowerNum = FollowerNum - 1 where ClientInfo.ID  = '{0}'", followeeID); //被关注的用户的fan数减1
            int cancel_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, cancel_follow, null);
            int reduceFollowee_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, reduceFolloweeNum, null);
            int reduceFollower_signal = SqlHelper.ExecuteNonQuery(ConnString, System.Data.CommandType.Text, reduceFollowerNum, null);

            if (cancel_signal != 0 && reduceFollowee_signal != 0 && reduceFollower_signal != 0)
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
