using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
using System.Data;

namespace BLL
{
    public class LoginBLL
    {
        LoginDAL myloginDAL = new LoginDAL();

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="user">用户数据</param>
        /// <returns>用户登录</returns>
        public int userLoginMail(Client user)
        {
            return myloginDAL.userLoginMail(user);
        }

        public int userLoginPhone(Client user)
        {
            return myloginDAL.userLoginPhone(user);
        }

        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <param name="box"></param>
        /// <returns></returns>
        public DataSet getUserMail(Client user)
        {
            return myloginDAL.getUserMail(user);
        }


        public DataSet getUserPhone(Client user)
        {
            return myloginDAL.getUserPhone(user);
        }
    }
}