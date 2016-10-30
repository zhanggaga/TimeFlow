using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
     public class GetFan_FolloweeInfoBLL
    {
        GetFan_FolloweeInfoDAL fan_followeeDAL = new GetFan_FolloweeInfoDAL();

        //获取粉丝的信息
        public DataSet getFanInfo(string clientID)
        {
            return fan_followeeDAL.getFanInfo(clientID);
        }

        //获取我关注的人的信息
        public DataSet getFolloweeInfo(string clientID)
        {
            return fan_followeeDAL.getFolloweeInfo(clientID);
        }

         //查询是否关注别人
        public int getIfFollowed(string clientID, string followeeID)
        {
            return fan_followeeDAL.getIfFollowed(clientID, followeeID);
        }

         //关注别人
        public int followOther(string followerID, string followeeID)
        {
            return fan_followeeDAL.followOther(followerID, followeeID);
        }

         //取消关注
        public int cancelFollowee(string followerID, string followeeID)
        {
            return fan_followeeDAL.cancelFollowee(followerID, followeeID);
        }

    }
}
