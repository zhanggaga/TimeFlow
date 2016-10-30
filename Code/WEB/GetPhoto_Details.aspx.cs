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

public partial class GetPhoto_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetPhotoBLL getPhotoBLL = new GetPhotoBLL();

        string photoID = Request.Form["p_id"].Trim();
        string action = Request.Form["action"].Trim();

        //string photoID = "1";   //测试用
        //string action = "2";  //测试用

        switch (action)
        { 
            case "0":
                 DataSet ds_photo_client = new DataSet();
                 ds_photo_client = getPhotoBLL.getClient_Photo(photoID);
                 string json_photoClient = JsonHelper.ToJson(ds_photo_client);
                 Response.Write(json_photoClient);
                 break;

            case "1":
                 DataSet ds_photo_comment = new DataSet();
                 ds_photo_comment = getPhotoBLL.getComment_Photo(photoID);
                 string json_photoComment = JsonHelper.ToJson(ds_photo_comment);
                 Response.Write(json_photoComment);
                 break;

            case "2":
                 DataSet ds_photo_label = new DataSet();
                 ds_photo_label = getPhotoBLL.getLabel_Photo(photoID);
                 string json_photoLabel = JsonHelper.ToJson(ds_photo_label);
                 Response.Write(json_photoLabel);
                 break;

        }

       
        

    }
}