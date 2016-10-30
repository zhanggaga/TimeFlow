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

public partial class LockUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ManagementInfoBLL managementbll = new ManagementInfoBLL();
        //根据用户ID封锁用户
       // int client_id = 1; //测试
        int client_id = Convert.ToInt32(Request.Form["ID"]);
        string strFuncName = Request.Form["Type"].Trim();
         switch (strFuncName)
        {
            case "lock":
                 int lock_chan = managementbll.lockClient(client_id);//封锁
                 if (lock_chan == 1)
                 {
                    Response.Write("success_lock");//封锁成功
                 }
                 else
                 {
                     Response.Write("fail"); //操作失败
                 }
            break;
             case "unlock":
                 int unlock_chan = managementbll.unlockClient(client_id);//解锁
                 if (unlock_chan == 1)
                 {
                     Response.Write("success_unlock");//解锁成功
                 }
                 else
                 {
                     Response.Write("fail");
                 }
                 break;
            
            
        } 
    }
}