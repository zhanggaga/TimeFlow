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

public partial class Send_pic_tag : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddPhotoBLL mybll = new AddPhotoBLL();
        int client_id = int.Parse(Session["CID"].ToString());
        //int client_id = 22;
        string action = Request.Form["action"].Trim();
        //string action = "0";
        switch (action)
        {
            case "0"://显示默认头像和昵称
                DataSet ds_pic_nick = mybll.getPortrait(client_id);
                string pic_nick = JsonHelper.ToJson(ds_pic_nick);
                Response.Write(pic_nick);
                break;
            case "1"://给前端推送爱好
                DataSet ds_habbit = mybll.getHabbit();
                string habbit = JsonHelper.ToJson(ds_habbit);
                Response.Write(habbit);
                break;
           
        }
    }
}