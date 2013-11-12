using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.user_unit")]
    public class User_unit : IDataItem
    {

        private System.Int64 _user_unit_id = 0;
        private System.Int32 _unit = 0;
        private System.String _username = String.Empty;
        private System.Int32 _status_flag = 0;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;


        [ENC_Column("user_unit_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 user_unit_id
        {
            get { return _user_unit_id; }
            set { _user_unit_id = value; }
        }
        [ENC_Column("unit")]
        public System.Int32 unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        [ENC_Column("username")]
        public System.String username
        {
            get { return _username; }
            set { _username = value; }
        }
        [ENC_Column("status_flag", true)]
        public System.Int32 status_flag
        {
            get { return _status_flag; }
            set { _status_flag = value; }
        }
        [ENC_Column("row_created", true)]
        public System.DateTime row_created
        {
            get { return _row_created; }
            set { _row_created = value; }
        }
        [ENC_Column("row_updated", true)]
        public System.DateTime row_updated
        {
            get { return _row_updated; }
            set { _row_updated = value; }
        }
        [ENC_Column("row_created_by_user_id")]
        public System.String row_created_by_user_id
        {
            get { return _row_created_by_user_id; }
            set { _row_created_by_user_id = value; }
        }
        [ENC_Column("row_updated_by_user_id")]
        public System.String row_updated_by_user_id
        {
            get { return _row_updated_by_user_id; }
            set { _row_updated_by_user_id = value; }
        }
    }
}


