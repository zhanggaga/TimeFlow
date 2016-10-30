using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.Net; 


namespace BLL
{
    public class RegisterBLL
    {
        RegisterDAL myDAL = new RegisterDAL();

        /// <summary>
        /// 用户注册
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int addMail(Client user)
        {
            if (myDAL.mailTest(user) == 1)
            {
                return 2;
            }
            else
            {
                return myDAL.addMail(user);
            }
        }

        public int addInfo(ClientInfo user_info)
        {
            return myDAL.addInfo(user_info);

        }


        public int addPhone(Client user)
        {
            if (myDAL.phoneTest(user) == 1)
            {
                return 2;
            }
            else
            {
                return myDAL.addPhone(user);
            }
        }

        //改变用户激活状态
        public int updateValidateCode(Client user)
        {
            if (myDAL.codeTest(user) == 1)
            {
                return 2;
            }
            else
            {
                return myDAL.updateValidateCode(user);
            }
        }

        //重置用户密码
        public int resetPsw(string new_psw,string mail)
        {

            return myDAL.resetPsw(new_psw, mail);
            
        }

        public DataSet getUserID(Client user)
        {
            return myDAL.getUserID(user);
        }

        public DataSet getUserByUserMail(string usermail)
        {
            return myDAL.getUserByUserMail( usermail);
        }
    }
}



