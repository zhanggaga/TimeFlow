using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using BLL;
using System.Data;

public partial class GetFan_FolloweeInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientID = Session["CID"].ToString();
        //string clientID = "1";  //测试用
        GetFan_FolloweeInfoBLL fan_followeeInfoBLL = new GetFan_FolloweeInfoBLL();

        string action = Request.Form["action"].Trim();
        //string action = "0";  //测试用
        string client_id;
        switch (action)
        { 
            case "0":
                //获取粉丝的Info
                //string client_id;
                if(Request.Form["c_id"]!="")
                    client_id = Request.Form["c_id"].ToString();
                else
                    client_id = clientID;

                DataSet ds_fan = new DataSet();
                ds_fan = fan_followeeInfoBLL.getFanInfo(client_id);
                string json_fan = JsonHelper.ToJson(ds_fan);
                Response.Write(json_fan);
                break;

            case  "1":
                //获取当前用户关注的人的Info
                 
                if(Request.Form["c_id"]!="")
                    client_id = Request.Form["c_id"].ToString();
                else
                    client_id = clientID;
                DataSet ds_followee = new DataSet();
                ds_followee = fan_followeeInfoBLL.getFolloweeInfo(client_id);                
                string json_followee = JsonHelper.ToJson(ds_followee);
                Response.Write(json_followee);
                break;

            case "2":
                //关注别人
                
                string followeeID = Request.Form["f_id"].ToString(); //从前台获取要关注的用户的ID
                //string followeeID = "4";  //测试用，关注的用户的ID

                int follow_signal = fan_followeeInfoBLL.followOther(clientID, followeeID);
                if (follow_signal == 1)
                {
                    Response.Write("Succeed");
                }
                else if (follow_signal == 0)
                {
                    Response.Write("Failed");
                }
                else
                {
                    Response.Write("Already");  //已关注
                }
                break;

            case "3":
                //取消关注别人
              
                string followeeID_1 = Request.Form["c_id"].ToString();//从前台获要取消关注的用户的ID
                //string followeeID_1 = "4"; //测试用

                int cancelFollow_signal = fan_followeeInfoBLL.cancelFollowee(clientID, followeeID_1);
                if (cancelFollow_signal == 1)
                {
                    Response.Write("Succeed");
                }
                else
                {
                    Response.Write("Failed");
                }
                break;

            case "4":    //查询我是否关注某个用户           
               
                //string followeeID_2 = "4"; //测试用

                 string followeeID_2 = Request.Form["if_id"].ToString();

                int if_followed = fan_followeeInfoBLL.getIfFollowed(clientID, followeeID_2);
                if (if_followed == 1)
                {
                    Response.Write("followed");
                }
                else
                {
                    Response.Write("notfollowed");
                }
                break;


        }      
    }
}