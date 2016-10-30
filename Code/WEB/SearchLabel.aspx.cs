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
using System.Text.RegularExpressions;
using System.Collections;
public partial class SearchLabel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddPhotoBLL mybll = new AddPhotoBLL();
       // string str = "风好";
        string str = Request.Form["search"].ToString();
        char[] temp = str.ToCharArray();
        for(int i=0;i<temp.Length;i++)
        {
           DataSet ds_label = mybll.searchLabel( temp[i].ToString() );
           string ds_label_js = JsonHelper.ToJson(ds_label);
           Response.Write(ds_label_js);
        }
    }
}