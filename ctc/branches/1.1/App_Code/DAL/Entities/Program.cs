using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.program")]
    public class Program : IDataItem
    {

        private System.Int64 _program_id = 0;
        private System.String _program_name = String.Empty;
        private System.String _initial_code = String.Empty;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;


        [ENC_Column("program_id", ENC_ColumnAttribute.keyType.primaryKey,"@@IDENTITY")]
        public System.Int64 program_id
        {
            get { return _program_id; }
            set { _program_id = value; }
        }
        [ENC_Column("program_name")]
        public System.String program_name
        {
            get { return _program_name; }
            set { _program_name = value; }
        }
        [ENC_Column("initial_code")]
        public System.String initial_code
        {
            get { return _initial_code; }
            set { _initial_code = value; }
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