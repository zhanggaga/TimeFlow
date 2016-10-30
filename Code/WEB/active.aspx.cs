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

public partial class active : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["userMail"] != null && Request.QueryString["validateCode"] != null)
            {
                string userMail = Request.QueryString["userMail"].ToString();
                string validateCode = Request.QueryString["validateCode"].ToString();
                operateLink(userMail, validateCode);
            }
        }
    }

    public void operateLink(string userMail, string validateCode)
    {
        RegisterBLL regbll = new RegisterBLL();

        Client myUser = new Client();

        myUser.Mail = userMail;

        DataSet ds_user = regbll.getUserByUserMail(userMail);

        if (ds_user.Tables[0].Rows.Count == 0)
        {
            Response.Write("该注册信息已不存在，验证失败");
        }
        else
        {
            //验证过期
            DateTime ZCTime = Convert.ToDateTime(ds_user.Tables[0].Rows[0]["addData"]);
            DateTime NowTime = DateTime.Now;

            TimeSpan time1 = new TimeSpan(ZCTime.Ticks);
            TimeSpan time2 = new TimeSpan(NowTime.Ticks);

            string diff = time2.Subtract(time1).TotalHours.ToString();
            double time = Convert.ToDouble(diff);

            //验证是否过期
            if (time > 12)
            {
                Response.Write("验证码已经过期，验证失败");
                return;
            }
            //验证链接是否用过
            if (ds_user.Tables[0].Rows[0]["validateCode"].ToString() == "")
            {
                Response.Write("已经验证过了，请返回到登录页面，登录体验吧");
                return;
            }
            //验证激活账号，修改账号状态
            if (validateCode == ds_user.Tables[0].Rows[0]["validateCode"].ToString())
            {
                int update = regbll.updateValidateCode(myUser);
                if (update == 1)                          //验证成功并且修改数据库用户状态
                {
                    Response.Write("验证成功，请返回到登录页面，登录体验吧");
                }
                else
                {
                    Response.Write("状态未改变，未激活");
                }
            }
        }
    }
}