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

public partial class ModifyInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddPhotoBLL mybll = new AddPhotoBLL();
        Client client = new Client();
        ClientInfo clientinfo = new ClientInfo();

        client.ID = int.Parse(Session["CID"].ToString());
        //client.ID = 12;//测试

        //string portrait_url = Request.Form["imageurl"].ToString();
        //string db_url = IMGPath(portrait_url, client.ID);
        //clientinfo.Pic = db_url;

        clientinfo.NickName = Request.Form["nickname"].ToString();//从前端获取
        clientinfo.Sex = Request.Form["sex"].ToString();
        clientinfo.Country = Request.Form["countrySelect"].ToString();
        clientinfo.Province = Request.Form["provSelect"].ToString();
        clientinfo.City = Request.Form["citySelect"].ToString();
        string habbit_name = Request.Form["label"].ToString();

     

        string[] habbit_nam = habbit_name.Split(',');
        int modify = mybll.modifyInfo(clientinfo, client, habbit_nam);
        if (modify == 0)
        {
            Response.Write("no_modify");//没有修改任何信息
        }
        else
        {
            Response.Write("success");//修改成功
        }

    }


    private string IMGPath(string base64,int client_id)
    {
        byte[] bytes = Convert.FromBase64String(base64);
        MemoryStream ms = new MemoryStream(bytes);
        Bitmap bmp = new Bitmap(ms);
        Directory.CreateDirectory(System.Web.HttpContext.Current.Request.MapPath("portrait/"));
        string imgUrl = System.Web.HttpContext.Current.Request.MapPath("portrait/") + client_id + ".jpg";
        bmp.Save(imgUrl, System.Drawing.Imaging.ImageFormat.Jpeg);
        string db_url = "portrait/" + client_id + ".jpg";
        return db_url;
    }
}