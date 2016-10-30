﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using BLL;
using System.Data;

public partial class Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //返回所有用户的基本信息
        ManagementInfoBLL managementbll = new ManagementInfoBLL();
        DataSet ds_cinfo = managementbll.getClientInfo();
        string all_cinfo = JsonHelper.ToJson(ds_cinfo);
        Response.Write(all_cinfo);
    }
}