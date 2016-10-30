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

public partial class MaComent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //返回所有用户的评论信息
        ManagementInfoBLL managementbll = new ManagementInfoBLL();
        DataSet ds_comment = managementbll.getComment();
        string all_comment = JsonHelper.ToJson(ds_comment);
        Response.Write(all_comment);

    }
}