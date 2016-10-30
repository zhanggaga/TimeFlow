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

public partial class Ma_DelComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ManagementInfoBLL managementbll = new ManagementInfoBLL();
        //根据评论ID删除不和谐用户的评论
        //int comment_id = 5; //测试
         int comment_id = Convert.ToInt32(Request.Form["ID"]);
        int delet = managementbll.deletComent(comment_id);
        if (delet == 1)
        {
            Response.Write("success");
        }
        else
        {
            Response.Write("fail");
        }
    }
}