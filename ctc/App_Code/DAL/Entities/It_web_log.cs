using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.it_web_log")]
    public class It_web_log : IDataItem
    {

        private System.Int64 _web_log_id = 0;
        private System.String _log_error = String.Empty;
        private System.String _log_event = String.Empty;
        private System.DateTime _log_date = DateTime.Now;
        private System.String _log_user_name = String.Empty;
        private System.Int32 _log_verified_flag = 0;


        [ENC_Column("web_log_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 web_log_id
        {
            get { return _web_log_id; }
            set { _web_log_id = value; }
        }
        [ENC_Column("log_error")]
        public System.String log_error
        {
            get { return _log_error; }
            set { _log_error = value; }
        }
        [ENC_Column("log_event")]
        public System.String log_event
        {
            get { return _log_event; }
            set { _log_event = value; }
        }
        [ENC_Column("log_date")]
        public System.DateTime log_date
        {
            get { return _log_date; }
            set { _log_date = value; }
        }
        [ENC_Column("log_user_name")]
        public System.String log_user_name
        {
            get { return _log_user_name; }
            set { _log_user_name = value; }
        }
        [ENC_Column("log_verified_flag")]
        public System.Int32 log_verified_flag
        {
            get { return _log_verified_flag; }
            set { _log_verified_flag = value; }
        }
    }
}