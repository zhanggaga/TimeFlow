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

public partial class ForgetPsw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterBLL registerbll = new RegisterBLL();
        string str_mail = Request.Form["email"].ToString();//传入用户输入的邮箱
        //string str_mail = "1032135644@qq.com";//测试用户输入的邮箱
        DataSet ds_user = registerbll.getUserByUserMail(str_mail);
        if(ds_user.Tables[0].Rows.Count > 0)  //注册过此邮箱
        {
            string strSmtpServer = "smtp.qq.com";
            string strFrom = "1421636811@qq.com";
            string strFromPass = "rhjklvxccmdmidfd";

            string strto = str_mail;
            string strto_mi = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(strto, "md5");
            string strSubject = "TimeFlow重置密码";
            System.Text.StringBuilder strBody = new System.Text.StringBuilder();
            strBody.Append("你好，我们收到了一个重置你 TimeFlow 账户密码的请求，请点击下面的链接重置密码</br>");
            strBody.Append("<a href='http://localhost:10259/reset_2.html?userMail=" + strto_mi + "'>点击这里</a></br>");
            strBody.Append("如未能反应请点击下面链接：<a href='http://localhost:10259/reset_2.html?userMail=" + strto_mi + "'>http://localhost:10259/reset_2.html?userMail=" + strto_mi + "</a></br>");
            SendSMTPEMail(strSmtpServer, strFrom, strFromPass, strto, strSubject, strBody.ToString());
            Response.Write("success");

        }
        else
        {
            Response.Write("not_exist");
        }

    }
    //发送邮件
    public void SendSMTPEMail(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
    {
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(strSmtpServer);
        client.Port = 25;
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
        client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(strFrom, strto, strSubject, strBody);
        message.BodyEncoding = System.Text.Encoding.UTF8;
        client.EnableSsl = true;
        message.IsBodyHtml = true;
        client.Send(message);
    }

}