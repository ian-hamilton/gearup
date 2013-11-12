using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.apr")]
    public class Apr : IDataItem
    {

        private System.String _apr_code = String.Empty;
        private System.String _apr_desc = String.Empty;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;


        [ENC_Column("apr_code", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.String apr_code
        {
            get { return _apr_code; }
            set { _apr_code = value; }
        }
        [ENC_Column("apr_desc")]
        public System.String apr_desc
        {
            get { return _apr_desc; }
            set { _apr_desc = value; }
        }
        [ENC_Column("status_flag")]
        public System.Int32 status_flag
        {
            get { return _status_flag; }
            set { _status_flag = value; }
        }
        [ENC_Column("row_created")]
        public System.DateTime row_created
        {
            get { return _row_created; }
            set { _row_created = value; }
        }
        [ENC_Column("row_updated")]
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