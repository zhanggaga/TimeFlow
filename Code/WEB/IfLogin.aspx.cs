using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IfLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取Session  
        if (Session["CID"] == null)
        {
            Response.Write("null");
        }
        else
        {
            Response.Write("not_null");
        }
    }
}