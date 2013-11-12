using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.profile_descriptor")]
    public class Profile_descriptor : IDataItem
    {

        private System.Int64 _profile_descriptor_id = 0;
        private System.String _descriptor_display = String.Empty;
        private System.String _descriptor_description = String.Empty;
        private System.Int32 _descriptor_order = 0;
        private System.String _descriptor_event_type = String.Empty;
        private System.String _descriptor_target_type = String.Empty;
        private System.Int32 _multi_option_flag = 0; 
        private System.Int32 _status_flag = 0;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        System.Collections.Generic.List<Profile_options> _options;

        [ENC_ChildTable("profile_descriptor_id")]
        public System.Collections.Generic.List<Profile_options> Options
        {
            get { return _options; }
            set { _options = value; }
        }


        public Profile_descriptor()
        {
            this._options = new List<Profile_options>();
        }


        [ENC_Column("profile_descriptor_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 profile_descriptor_id
        {
            get { return _profile_descriptor_id; }
            set { _profile_descriptor_id = value; }
        }
        [ENC_Column("descriptor_display")]
        public System.String descriptor_display
        {
            get { return _descriptor_display; }
            set { _descriptor_display = value; }
        }
        [ENC_Column("descriptor_description")]
        public System.String descriptor_description
        {
            get { return _descriptor_description; }
            set { _descriptor_description = value; }
        }
        [ENC_Column("descriptor_order")]
        public System.Int32 descriptor_order
        {
            get { return _descriptor_order; }
            set { _descriptor_order = value; }
        }
        [ENC_Column("descriptor_event_type")]
        public System.String descriptor_event_type
        {
            get { return _descriptor_event_type; }
            set { _descriptor_event_type = value; }
        }
        [ENC_Column("descriptor_target_type")]
        public System.String descriptor_target_type
        {
            get { return _descriptor_target_type; }
            set { _descriptor_target_type = value; }
        }
        [ENC_Column("multi_option_flag")]
        public System.Int32 multi_option_flag
        {
            get { return _multi_option_flag; }
            set { _multi_option_flag = value; }
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