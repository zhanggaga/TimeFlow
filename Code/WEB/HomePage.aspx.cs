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

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientID = Session["CID"].ToString();
       //string clientID = "2";  //测试用
        GetPhotoBLL getPhotoBLL = new GetPhotoBLL();

        string action = Request.Form["action"].Trim(); //从前台传来一个调用信号
        //string action = "1";  //测试用
        

        ///////////////////////////////////////////////////////首页显示关注的用户及用户发布的照片的信息///////////////////////
        switch (action)
        { 
            case "0"://获取首页我关注的人的信息（followeeID，nickName，pic,photo_id,photo_pic,Photo_time,comment_num,likeNum order by time desc

                DataSet ds_followee_photo= new DataSet();
                ds_followee_photo = getPhotoBLL.getFollowee_Photo(clientID);
                string json_followee_photo = JsonHelper.ToJson(ds_followee_photo);
                Response.Write(json_followee_photo);
                break;

            case "1":  //根据前台传回的PhotoId来获取这张照片的评论内容，按时间的降序排列
                string photoID = Request.Form["p_id"].ToString();  //从前台传回某张照片的ID
               // string photoID = "3";  //测试用
                DataSet ds_comment_photo= new DataSet();
                ds_comment_photo = getPhotoBLL.getPhoto_Comment_Home(photoID);
                string json_comment_photo = JsonHelper.ToJson(ds_comment_photo);
                Response.Write(json_comment_photo);
                break;

            case "2":  //根据前台传回的PhotoId来获取这张照片的Labelname
                string photo_ID = Request.Form["pa_id"].ToString();  //从前台传回某张照片的ID
                // string photo_ID = "3";  //测试用
                DataSet ds_photoLabel = new DataSet();
                ds_photoLabel = getPhotoBLL.getLabel_Photo(photo_ID);
                string json_photoLabel = JsonHelper.ToJson(ds_photoLabel);
                Response.Write(json_photoLabel);
                break;
        }
       
        //////////////////////////////////////////////////////////END///////////////////////////////////////////////////////////



    }
}