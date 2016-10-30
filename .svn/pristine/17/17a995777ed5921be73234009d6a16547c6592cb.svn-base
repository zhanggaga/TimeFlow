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

public partial class If_Liked : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string clientID = Session["CID"].ToString();

        //string clientID = "1";  //测试用

        GetPhotoBLL getPhotoBLL = new GetPhotoBLL();

        DataSet ds_Ifliked = new DataSet();
         ds_Ifliked = getPhotoBLL.getIfLiked(clientID);
         string json_IfLiked = JsonHelper.ToJson(ds_Ifliked);
         Response.Write(json_IfLiked);        

    }
}