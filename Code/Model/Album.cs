using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// Album:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class Album
    {
        public Album()
        { }
        #region Model
        private int _id;
        private string _albumname;
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
        public string AlbumName
        {
            set { _albumname = value; }
            get { return _albumname; }
        }
        #endregion Model

    }
}
