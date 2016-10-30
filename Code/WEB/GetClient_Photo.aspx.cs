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

public partial class GetClient_Photo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientID = Session["CID"].ToString();
        //string clientID = "1";  //测试用

        GetPhotoBLL getPhotoBLL = new GetPhotoBLL();      


        //////////////////////////////////////////////////浏览页（推荐用户，推荐照片）///////////////////////////

        string action = Request.Form["action"].Trim();
        //string action = "0";  //测试用
        switch (action) 
        {
            case "0":
                //获取推荐的用户的Pic,NickName,ID
                DataSet ds_clientInfo = new DataSet();
                ds_clientInfo = getPhotoBLL.getClientInfo(clientID);         

                string json_clientInfo = JsonHelper.ToJson(ds_clientInfo);
                Response.Write(json_clientInfo);
                break;

            case "1":
                //获取按Label推荐的照片的Info(pic,LikeNum,CommentNum,ID)
                DataSet ds_photoLabel = new DataSet();                
                ds_photoLabel = getPhotoBLL.getPhotoByLabel(clientID);

                string json_photo = JsonHelper.ToJson(ds_photoLabel);
                Response.Write(json_photo);
                break;
            
        }     

      ///////////////////////////////////////////////////////END////////////////////////////////////////////////////
    }
}