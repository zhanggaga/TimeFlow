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

public partial class Ma_DelPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ManagementInfoBLL managementbll = new ManagementInfoBLL();
        //根据照片ID删除不和谐照片
        //int photo_id = 1; //测试
        int photo_id = Convert.ToInt32(Request.Form["ID"]);
        int delet = managementbll.deletPhoto(photo_id);
        if (delet == 1)
        {
            Response.Write("success");//删除照片成功
        }
        else
        {
            Response.Write("fail");//删除照片失败
        }
    }
}