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

public partial class reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterBLL resetbll = new RegisterBLL();
        string user_email = Request.Form["userMail"].ToString();
        if (user_email != null)//从前端链接字符中得到需要重置密码的用户的邮箱
            {
                string re_psw = Request.Form["newpwd"].ToString();//得到用户重置的密码
              //  string re_psw = ("666666");//测试用户输入的重置密码
                string new_repsw = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(re_psw, "MD5");//加密

                int reset = resetbll.resetPsw(new_repsw, user_email);
                if (reset == 1)                          //重置成功
                {
                    Response.Write("success");
                }
                else
                {
                    Response.Write("fail");
                }
               
            }
        
    }

 
}