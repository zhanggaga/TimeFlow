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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        LoginBLL loginrbll = new LoginBLL();

        Client myUser = new Client();

        string strFuncName = Request.Form["type"].Trim();  //区分邮箱和手机

        string strPsw = Request.Form["password"].ToString();  //密码

        string validate_code = Request.Form["testcode"].ToString(); //验证码

        string newPsw = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(strPsw, "MD5");
        myUser.Password = newPsw;

        //登录
        switch (strFuncName)
        {
            case "email":
                myUser.Mail = Request.Form["username"].ToString();
                DataSet ds_mail = loginrbll.getUserMail(myUser);

                if (validate_code == Session["Vcode"].ToString())
                {
                    if (ds_mail.Tables[0].Rows.Count > 0)//用户存在
                    {
                        int state = Convert.ToInt32(ds_mail.Tables[0].Rows[0]["UserState"]);
                        int lockstate = Convert.ToInt32(ds_mail.Tables[0].Rows[0]["LockState"]);
                        if (state == 1)//并已激活
                        {
                            if (lockstate == 1)//未被封锁
                            {
                                Session["CID"] = ds_mail.Tables[0].Rows[0]["ID"].ToString();
                                Response.Write("success");
                            }
                            else
                            {
                                Response.Write("locked");
                            }
                        }
                        else
                        {
                            Response.Write("active_fail");
                        }
                    }
                    else
                       {
                          Response.Write("psw_fail");
                        }
                }
                else
                {
                    Response.Write("validate_fail");
                }
                break;

            case "phone":
                myUser.Phone = Request.Form["username"].ToString();
                DataSet ds_phone = loginrbll.getUserPhone(myUser);

                if (validate_code == Session["Vcode"].ToString())
                {
                    if (ds_phone.Tables[0].Rows.Count > 0)
                    {
                        int lockstate = Convert.ToInt32(ds_phone.Tables[0].Rows[0]["LockState"]);
                        if (lockstate == 1)//未被封锁
                        {
                            Session["CID"] = ds_phone.Tables[0].Rows[0]["ID"].ToString();
                            Response.Write("success");
                        }
                        else
                        {
                            Response.Write("locked");
                        }
                        
                    }
                    else
                    {
                        Response.Write("psw_fail");
                    }
                }
                else
                {
                    Response.Write("validate_fail");
                }

                break;
        }
    }
}
