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

public partial class MaPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //返回所有用户的图片信息
        ManagementInfoBLL managementbll = new ManagementInfoBLL();
        DataSet ds_photo = managementbll.getPhoto();
        string all_photo = JsonHelper.ToJson(ds_photo);
        Response.Write(all_photo);

       
    }
}