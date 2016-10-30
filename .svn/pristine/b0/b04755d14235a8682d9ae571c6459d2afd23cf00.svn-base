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

public partial class TimeAxis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string client_id;
        string clientID = Session["CID"].ToString();

        AddPhotoBLL mybll = new AddPhotoBLL();
        //int client_id = Convert.ToInt32(Session["CID"]);
        if (Request.Form["c_id"] != "")
            client_id = Request.Form["c_id"].ToString();
        else
            client_id = clientID;
        //根据用户ID生成时间轴
        DataSet ds_axis = mybll.timeAxis(client_id);
        string time_axis = JsonHelper.ToJson(ds_axis);
        Response.Write(time_axis);
    }
}