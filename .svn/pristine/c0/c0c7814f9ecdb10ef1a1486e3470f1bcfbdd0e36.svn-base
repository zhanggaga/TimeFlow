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
using System.Text;
using System.Net.Mail;
using System.Net;


public partial class JQ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //注册
        RegisterBLL registerbll = new RegisterBLL();
        LoginBLL mybll = new LoginBLL();
        Client myUser = new Client();
        ClientInfo user_info = new ClientInfo();
        string strFuncName = Request.Form["type"].Trim();
        string strPsw = Request.Form["password"].ToString();
        string newPsw = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(strPsw, "MD5");//加密
        myUser.Password = newPsw;
    
        switch (strFuncName)
        {
            case "email":
                    myUser.Mail = Request.Form["username"].ToString();

                    //邮箱验证：验证码，用户状态，注册时间
                    Random random = new Random();
                    string checkCode = "";
                    for (int i = 0; i <= 4; i++)
                    {
                        int num = random.Next(1, 10);
                        checkCode += num.ToString();
                    }
                    string validataCode = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(checkCode, "md5");
                    myUser.validateCode = validataCode;  //生成验证码
                    myUser.UserState = 0;//用户状态默认为未激活
                    myUser.LockState = 1;//用户注册时默认为未封锁状态
                    myUser.addData = System.DateTime.Now;//获得当前用户注册的时间

                    //用户注册时赋值默认信息
                    user_info.FollowerNum = 0;
                    user_info.FolloweeNum = 0;
                    user_info.NickName = myUser.Mail;
                    user_info.Pic = "Portrait/default.jpg";

                    

                    int add_mail = registerbll.addMail(myUser);
                    if (add_mail == 1)                          //注册成功就发送邮件
                    {
                        DataSet ds_user = mybll.getUserMail(myUser);
                        user_info.ID = Convert.ToInt32(ds_user.Tables[0].Rows[0]["ID"]);
                        int add_info = registerbll.addInfo(user_info);
                        Response.Write("success");

                     //发邮箱参数配置
                    string strSmtpServer = "smtp.qq.com";
                    string strFrom = "1421636811@qq.com";
                    string strFromPass = "rhjklvxccmdmidfd";

                    string strto = myUser.Mail;
                    string strSubject = "账号激活";
                    System.Text.StringBuilder strBody = new System.Text.StringBuilder();
                    strBody.Append("点击下面链接激活账号，12小时有效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
                    strBody.Append("<a href='http://localhost:10259/active.aspx?userMail=" + myUser.Mail + "&validateCode=" + myUser.validateCode + "'>点击这里</a></br>");
                    strBody.Append("如未能激活请点击下面链接：<a href='http://localhost:10259/active.aspx?userMail=" + myUser.Mail + "&validateCode=" + myUser.validateCode + "'>http://localhost:10259/active.aspx?userMail=" + myUser.Mail + "&validateCode=" + myUser.validateCode + "</a></br>");
                    SendSMTPEMail(strSmtpServer, strFrom, strFromPass, strto, strSubject, strBody.ToString());


                    
                    }
                    else
                    {
                        if (add_mail == 2)
                        {
                           Response.Write("takeup");

                        }
                        else
                        {
                           Response.Write("fail");
                        }
                    }
                    break;
                
            //case "phone":
            //     myUser.Phone = Request.Form["username"].ToString();
            //     int add_phone = registerbll.addPhone(myUser);
            //     if (add_phone == 1)
            //        {
            //            Response.Write("success");
            //        }
            //        else
            //        {
            //            if (add_phone == 2)
            //            {
            //                Response.Write("takeup");
            //            }
            //            else
            //            {
            //               Response.Write("fail");
            //            }
            //        }
            //        break;
        }
    }


    //发送邮件
    public void SendSMTPEMail(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
    {
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(strSmtpServer);
        client.Port = 25;
        client.UseDefaultCredentials = false;
        client.Credentials =new System.Net.NetworkCredential(strFrom, strFromPass);
        client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(strFrom, strto, strSubject, strBody);
        message.BodyEncoding = System.Text.Encoding.UTF8;
        client.EnableSsl = true;
        message.IsBodyHtml = true;
        client.Send(message);
    }

}





  


