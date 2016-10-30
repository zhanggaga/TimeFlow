using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using BLL;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Drawing;
using System.Data;

public partial class AddPortrait : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddPhotoBLL addphotobll = new AddPhotoBLL();
        //Photo myPhoto = new Photo();

        // 上传照片信息
        string url = Request.Form["imageurl"].ToString();
        //myPhoto.CommentsNum = 0;
        //myPhoto.LikeNum = 0;
        //myPhoto.ClientID = int.Parse(Session["CID"].ToString());
        ////myPhoto.ClientID = 1;
        //myPhoto.Time = System.DateTime.Now;
        int client_id = int.Parse(Session["CID"].ToString());
        string db_url = IMGPath(url, client_id);
        //myPhoto.Pic = db_url;
        //myPhoto.IfPublic = Request.Form["publicVal"].ToString();


        //上传照片时添加标签
        //string label_name = "悬疑，小说";//测试
        //string label_name = Request.Form["photoLabels"].ToString();
        //string[] label_nam = label_name.Split(',');



        int add = addphotobll.addPortrait(db_url, client_id);
        if (add == 1)
        {
            Response.Write("success");
        }
        else
        {
            Response.Write("fail");
        }
    }


    private string IMGPath(string base64,int client_id)
    {
        byte[] bytes = Convert.FromBase64String(base64);
        MemoryStream ms = new MemoryStream(bytes);
        Bitmap bmp = new Bitmap(ms);
        Directory.CreateDirectory(System.Web.HttpContext.Current.Request.MapPath("Portrait/"));
        string imgUrl = System.Web.HttpContext.Current.Request.MapPath("Portrait/") + client_id + ".jpg";
        bmp.Save(imgUrl, System.Drawing.Imaging.ImageFormat.Jpeg);
        string db_url = "Portrait/" + client_id + ".jpg";
        return db_url;
    }
}