using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.rpt_report_process")]
    public class Rpt_report_process : IDataItem
    {

        private System.Int64 _report_id = 0;
        private System.String _report_name = String.Empty;
        private System.String _report_desc = String.Empty;
        private System.String _report_function_name = String.Empty;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        System.Collections.Generic.List<Rpt_report_detail> _rpt_report_detail = null;


        [ENC_ChildTable("report_id")]
        public System.Collections.Generic.List<Rpt_report_detail> Rpt_report_detail
        {
            get
            {
                _rpt_report_detail.Sort(delegate(Rpt_report_detail r1, Rpt_report_detail r2)
                {
                    return r1.control_sequence.CompareTo(r2.control_sequence);
                });

                return _rpt_report_detail.FindAll(delegate(Rpt_report_detail rpt) { return rpt.status_flag == 1; });//_rpt_report_detail;


            }
            set { _rpt_report_detail = value; }
        }

        public Rpt_report_process()
        {

            this._rpt_report_detail = new List<Rpt_report_detail>();
        }

        [ENC_Column("report_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 report_id
        {
            get { return _report_id; }
            set { _report_id = value; }
        }
        [ENC_Column("report_name")]
        public System.String report_name
        {
            get { return _report_name; }
            set { _report_name = value; }
        }
        [ENC_Column("report_desc")]
        public System.String report_desc
        {
            get { return _report_desc; }
            set { _report_desc = value; }
        }
        [ENC_Column("report_function_name")]
        public System.String report_function_name
        {
            get { return _report_function_name; }
            set { _report_function_name = value; }
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