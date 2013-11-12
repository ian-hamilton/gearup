using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.rpt_report_detail")]
    public class Rpt_report_detail : IDataItem
    {

        private System.Int64 _report_detail_id = 0;
        private System.Int64 _report_id = 0;
        private System.String _parameter_name = String.Empty;
        private System.String _parameter_type = String.Empty;
        private System.Int64 _control_type_id = 0;
        private System.String _parameter_control_id = String.Empty;
        private System.String _display_label = String.Empty; 
        private System.Int32 _control_sequence = 0;
        private System.String _options_sql = String.Empty; 
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        private System.String _postback_value = String.Empty;

        public System.String Postback_value
        {
            get { return _postback_value; }
            set { _postback_value = value; }
        }


        private Rpt_control_type _control_type = null;

        public Rpt_control_type Control_type
        {
            get { return _control_type; }
            set { _control_type = value; }
        }

       

        public Rpt_report_detail()
        {
        }

        [ENC_Column("report_detail_id", ENC_ColumnAttribute.keyType.primaryKey)]
        public System.Int64 report_detail_id
        {
            get { return _report_detail_id; }
            set { _report_detail_id = value; }
        }
        [ENC_Column("report_id",  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 report_id
        {
            get { return _report_id; }
            set { _report_id = value; }
        }
        [ENC_Column("parameter_name")]
        public System.String parameter_name
        {
            get { return _parameter_name; }
            set { _parameter_name = value; }
        }
        [ENC_Column("parameter_type")]
        public System.String parameter_type
        {
            get { return _parameter_type; }
            set { _parameter_type = value; }
        }
        [ENC_Column("display_label")]
        public System.String display_label
        {
            get { return _display_label; }
            set { _display_label = value; }
        }
        [ENC_Column("control_type_id")]
        public System.Int64 control_type_id
        {
            get { return _control_type_id; }
            set { _control_type_id = value;

            DatabaseObjectAccess doa = DataAccess.createDOA();

            this._control_type = (Rpt_control_type)doa.selectObjects(typeof(Rpt_control_type), "control_type_id = " + value, "")[0];

            doa.Dispose();
            
            }
        }
        [ENC_Column("parameter_control_id")]
        public System.String parameter_control_id
        {
            get { return _parameter_control_id; }
            set { _parameter_control_id = value; }
        }
        [ENC_Column("control_sequence")]
        public System.Int32 control_sequence
        {
            get { return _control_sequence; }
            set { _control_sequence = value; }
        }
        [ENC_Column("options_sql")]
        public System.String options_sql
        {
            get { return _options_sql; }
            set { _options_sql = value; }
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