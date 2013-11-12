using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.alpha_student_current")]
    public class Alpha_student_current : IDataItem
    {

        private System.Int64? _ctc_id = null;
        private System.String _first_name = String.Empty;
        private System.String _last_name = String.Empty;
        private System.DateTime? _dob = null;
        private System.Int32? _unit = null;
        private System.Int32? _grade = null;
        private System.Decimal? _gpa = null;
        private System.String _cps_status = String.Empty;
        private System.DateTime _row_created = DateTime.Now;
        private System.String _middle_initial = String.Empty;

       

        [ENC_Column("ctc_id")]
        public System.Int64? ctc_id
        {
            get { return _ctc_id; }
            set { _ctc_id = value;}
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
        [ENC_Column("middle_initial")]
        public System.String middle_initial
        {
            get { return _middle_initial; }
            set { _middle_initial = value; }
        }

        public string full_reverse_name
        {
            get { return this.last_name + ", " + this.first_name + " " + this.middle_initial; }
        }
        [ENC_Column("dob")]
        public System.DateTime? dob
        {
            get { return _dob; }
            set { _dob = value; }
        }
        [ENC_Column("unit")]
        public System.Int32? unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        [ENC_Column("grade")]
        public System.Int32? grade
        {
            get { return _grade; }
            set { _grade = value; }
        }
        [ENC_Column("gpa")]
        public System.Decimal? gpa
        {
            get { return _gpa; }
            set { _gpa = value; }
        }
        [ENC_Column("cps_status")]
        public System.String cps_status
        {
            get { return _cps_status; }
            set { _cps_status = value; }
        }
        [ENC_Column("row_created")]
        public System.DateTime row_created
        {
            get { return _row_created; }
            set { _row_created = value; }
        }
    }
}