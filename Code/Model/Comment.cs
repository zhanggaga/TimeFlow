using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// Comment:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class Comment
    {
        public Comment()
        { }
        #region Model
        private int _id;
        private DateTime _time;
        private string _content;
        private int _printuserid;
        private int _receiveuserid;
        private int _photoid;
        /// <summary>
        /// 
        /// </summary>
        public int ID
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime Time
        {
            set { _time = value; }
            get { return _time; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Content
        {
            set { _content = value; }
            get { return _content; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int PrintUserID
        {
            set { _printuserid = value; }
            get { return _printuserid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int ReceiveUserID
        {
            set { _receiveuserid = value; }
            get { return _receiveuserid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int PhotoID
        {
            set { _photoid = value; }
            get { return _photoid; }
        }
        #endregion Model

    }
}
