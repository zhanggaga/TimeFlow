using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logoff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CID"] != null || Session["Vcode"] != null)
        {
            Session["CID"] = null;
            Session["Vcode"] = null;
            Session.Clear();
            Session.Abandon();  //取消当前Session
        }

        Response.Redirect("Login.aspx");  //重定向到登录页面

    }
}