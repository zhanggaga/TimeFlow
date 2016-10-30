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


public partial class GetPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientID = Session["CID"].ToString();
        //string clientID = "1";  //测试用
        GetPhotoBLL getPhotoBLL = new GetPhotoBLL();

        string action = Request.Form["action"].Trim();
        //string action = "1";  //测试用

        ////////////////////////////////////////获取评论与存入评论////////////////////////////////////////

        switch (action)
        {
            case "0":  //获取某张照片的评论信息

                string photoID = Request.Form["p_id"].ToString();  //从前台得到被点击的Photo的ID
                //string photoID = "3";  //测试用

                DataSet ds_getPhoto_comment = new DataSet();
                ds_getPhoto_comment = getPhotoBLL.getPhoto_comment(photoID);

                string json_photoComment = JsonHelper.ToJson(ds_getPhoto_comment);
                Response.Write(json_photoComment);
                break;

            case "1": //将照片的评论存入数据库
                Comment myComment = new Comment();

                myComment.Time = System.DateTime.Now;
                myComment.Content = Request.Form["comment_content"].ToString();
                myComment.PrintUserID = int.Parse(clientID);
                myComment.PhotoID = int.Parse(Request.Form["p_id"].ToString());
                int ru_id = int.Parse(Request.Form["ru_id"].ToString());
                //int ru_id = -2;  //测试用
                if (ru_id < 0)
                {
                    myComment.ReceiveUserID = -1;
                }
                else
                {
                    myComment.ReceiveUserID =ru_id;
                }               
               

                /////////////////////////////测试所用，等待前台传入数据
                //myComment.Time = System.DateTime.Now;
                //myComment.Content = "测试愚蠢的错误！20";
                //myComment.PrintUserID = 1;
                //myComment.ReceiveUserID = -1;
                //myComment.PhotoID = 20;
                ////*****************************************************

                int comment_signal = getPhotoBLL.addComment(myComment);
                if (comment_signal == 1)
                {
                    Response.Write("Succeed");
                }
                else
                {
                    Response.Write("failed");
                }
                break;

            case "2":  //点赞与取消点赞

                string photoId = Request.Form["p_id"].ToString();

                //测试所用，等待前台传入PhotoID,ClientID
                //string photoId = "5";


                int like_signal = getPhotoBLL.handleLike(photoId, clientID);
                if (like_signal == 0)
                {
                    Response.Write("c_failed");
                }
                else if (like_signal == 1)
                {
                    Response.Write("c_Succeed");
                }
                else if (like_signal == 2)
                {
                    Response.Write("a_failed");
                }
                else if (like_signal == 3)
                {
                    Response.Write("a_Succeed");
                }
                break;
        }

    }
}