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

public partial class Scan_MyPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientID = Session["CID"].ToString();
        //string clientID = "4";  //测试用
        GetPhotoBLL getPhotoBLL = new GetPhotoBLL();

        string action = Request.Form["action"].Trim();
        //string action = "1";  //测试用
        /////////////////////////////////////////////////浏览个人中心/////////////////////////////////////

        string client_id;
        switch (action)
        { 
            case "0":    //返回用户的相册及照片信息

                //用户个人Album的Name及照片的photo_id,pic,like_num,comment_num,album_name,album_id
                if (Request.Form["c_id"] != "")
                    client_id = Request.Form["c_id"].ToString();
                else
                    client_id = clientID;
                DataSet ds_albumPhoto_self = new DataSet();
                ds_albumPhoto_self = getPhotoBLL.getAlbumPhoto_self(client_id); 
                string json_albumPhotoSelf = JsonHelper.ToJson(ds_albumPhoto_self);
                Response.Write(json_albumPhotoSelf);
                break;

            case "1":  //返回用户信息（相册数，照片数，粉丝数，关注数）

                //用户浏览页个人信息
                if (Request.Form["c_id"] != "")
                    client_id = Request.Form["c_id"].ToString();
                else
                    client_id = clientID;
                DataSet ds_client = new DataSet();                
                ds_client = getPhotoBLL.getClient(client_id);
                string json_clientSelf = JsonHelper.ToJson(ds_client);
                Response.Write(json_clientSelf);
                break;           

        }           

        /////////////////////////////////////////////////END///////////////////////////////////////////////       

    }
}