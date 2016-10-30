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

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AdminBLL adminbll = new AdminBLL();
        Model.Admin myadmin = new Model.Admin();
        myadmin.Username = Request.Form["admin_id"].ToString(); //管理员名
        string str_psw = Request.Form["admin_pwd"].ToString();  //密码

        string new_psw = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str_psw, "MD5");//加密
        myadmin.Password = new_psw;

        DataSet ds = adminbll.getAdmin(myadmin);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Write("success");
        }
        else
        {
            Response.Write("psw_fail");
        }


    }
}