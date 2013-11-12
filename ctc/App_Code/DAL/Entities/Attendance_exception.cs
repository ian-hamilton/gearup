using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.attendance_exception")]
    public class Attendance_exception : IDataItem
    {

        private System.Int64 _attendance_excpetion_id = 0;
        private System.Int64 _event_id = 0;
        private System.Int64? _cps_id = null;
        private System.Int64? _ctc_id = null;
        private System.String _first_name = String.Empty;
        private System.String _last_name = String.Empty;
        private System.String _comment = String.Empty;
        private System.Int32 _retrieved_flag = 0;
        private System.String _retrieved_by = String.Empty;
        private System.DateTime _upload_dt = DateTime.Now;
        private System.Int32 _student_information_flag = 0; 
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;


        [ENC_Column("attendance_excpetion_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 attendance_excpetion_id
        {
            get { return _attendance_excpetion_id; }
            set { _attendance_excpetion_id = value; }
        }
        [ENC_Column("event_id" ,  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 event_id
        {
            get { return _event_id; }
            set { _event_id = value; }
        }

        [ENC_Column("cps_id")]
        public System.Int64? cps_id
        {
            get { return _cps_id; }
            set { _cps_id = value; }
        }
        [ENC_Column("ctc_id")]
        public System.Int64? ctc_id
        {
            get { return _ctc_id; }
            set { _ctc_id = value; }
        }
        [ENC_Column("first_name")]
        public System.String first_name
        {
            get { return _first_name; }
            set { _first_name = value; }
        }
        [ENC_Column("last_name")]
        public System.String last_name
        {
            get { return _last_name; }
            set { _last_name = value; }
        }
        [ENC_Column("comment")]
        public System.String comment
        {
            get { return _comment; }
            set { _comment = value; }
        }
        [ENC_Column("retrieved_flag")]
        public System.Int32 retrieved_flag
        {
            get { return _retrieved_flag; }
            set { _retrieved_flag = value; }
        }
        [ENC_Column("retrieved_by")]
        public System.String retrieved_by
        {
            get { return _retrieved_by; }
            set { _retrieved_by = value; }
        }
        [ENC_Column("upload_dt")]
        public System.DateTime upload_dt
        {
            get { return _upload_dt; }
            set { _upload_dt = value; }
        }
        [ENC_Column("student_information_flag")]
        public System.Int32 student_information_flag
        {
            get { return _student_information_flag; }
            set { _student_information_flag = value; }
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