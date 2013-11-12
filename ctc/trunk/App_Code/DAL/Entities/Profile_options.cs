using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.profile_options")]
    public class Profile_options : IDataItem
    {

        private System.Int64 _profile_option_id = 0;
        private System.String _profile_option_display = String.Empty;
        private System.Int64 _profile_descriptor_id = 0;
        private System.Int32 _option_order = 0;
        private System.Int32 _status_flag = 0;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;


        [ENC_Column("profile_option_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 profile_option_id
        {
            get { return _profile_option_id; }
            set { _profile_option_id = value; }
        }
        [ENC_Column("profile_option_display")]
        public System.String profile_option_display
        {
            get { return _profile_option_display; }
            set { _profile_option_display = value; }
        }
        [ENC_Column("profile_descriptor_id", ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 profile_descriptor_id
        {
            get { return _profile_descriptor_id; }
            set { _profile_descriptor_id = value; }
        }
        [ENC_Column("option_order")]
        public System.Int32 option_order
        {
            get { return _option_order; }
            set { _option_order = value; }
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