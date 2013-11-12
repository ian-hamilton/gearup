using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.attendance_profile")]
    class Attendance_profile : IDataItem
    {

        private System.Int64 _attendance_profile_id = 0;
        private System.Int64? _event_attendance_id = null;
        private System.Int64? _event_id = null;
        private System.Int64? _profile_descriptor_id = null;
        private System.Int64 _profile_option_id = 0;
        //private System.String _questionaire_name = String.Empty; 
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;
        private System.Int64? _cps_id = null;
        private System.Int64? _document_id = null; 

       


        [ENC_Column("attendance_profile_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 attendance_profile_id
        {
            get { return _attendance_profile_id; }
            set { _attendance_profile_id = value; }
        }
        [ENC_Column("event_attendance_id")]
        public System.Int64? event_attendance_id
        {
            get { return _event_attendance_id; }
            set { _event_attendance_id = value; }
        }
        [ENC_Column("event_id")]
        public System.Int64? event_id
        {
            get { return _event_id; }
            set { _event_id = value; }
        }
        [ENC_Column("profile_descriptor_id")]
        public System.Int64? profile_descriptor_id
        {
            get { return _profile_descriptor_id; }
            set { _profile_descriptor_id = value; }
        }
        [ENC_Column("profile_option_id")]
        public System.Int64 profile_option_id
        {
            get { return _profile_option_id; }
            set { _profile_option_id = value; }
        }
        //[ENC_Column("questionaire_name")]
        //public System.String questionaire_name
        //{
        //    get { return _questionaire_name; }
        //    set { _questionaire_name = value; }
        //}
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
        [ENC_Column("cps_id")]
        public System.Int64? Cps_id
        {
            get { return _cps_id; }
            set { _cps_id = value; }
        }
        [ENC_Column("document_id")]
        public System.Int64? document_id
        {
            get { return _document_id; }
            set { _document_id = value; }
        }
    }
}