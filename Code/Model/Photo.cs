using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// Photo:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class Photo
    {
        public Photo()
        { }
        #region Model
        private int _id;
        private DateTime _time;
        private string _pic;
        private int _commentsnum = 0;
        private int _likenum = 0;
        private int? _albumid;
        private int _clientid;
        private string _ifpublic;
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
        public string Pic
        {
            set { _pic = value; }
            get { return _pic; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int CommentsNum
        {
            set { _commentsnum = value; }
            get { return _commentsnum; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int LikeNum
        {
            set { _likenum = value; }
            get { return _likenum; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? AlbumID
        {
            set { _albumid = value; }
            get { return _albumid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int ClientID
        {
            set { _clientid = value; }
            get { return _clientid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string IfPublic
        {
            set { _ifpublic = value; }
            get { return _ifpublic; }
        }
        #endregion Model

    }
}
