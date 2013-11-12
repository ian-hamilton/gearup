using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.ethnicity")]
    public class Ethnicity : IDataItem
    {

        private System.Int32 _ethnicity = 0;
        private System.String _ethnicity_desc = String.Empty;
        private System.Int32 _status_flag = 0;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;


        [ENC_Column("ethnicity", ENC_ColumnAttribute.keyType.primaryKey)]
        public System.Int32 ethnicity
        {
            get { return _ethnicity; }
            set { _ethnicity = value; }
        }
        [ENC_Column("ethnicity_desc")]
        public System.String ethnicity_desc
        {
            get { return _ethnicity_desc; }
            set { _ethnicity_desc = value; }
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