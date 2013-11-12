using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.ctc_master")]
    public class Ctc_master : IDataItem
    {

        private System.Int64? _ctc_id;
        private System.Int64? _cps_id;
        private System.String _status_comment = String.Empty;
        private System.String _start_semester = String.Empty;
        private System.Int32? _primary_language;
        //private System.Int32? _alternate_fall_id;
        //private System.Int32? _original_guid;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;
        private System.Int32 _fafsa;
        private System.Int32 _parential_permission;
        private System.Int32 _media_release;
        private System.Int32 _twenty_first;
        private System.Int32 _student_servey;
        private System.Int32 _parent_survey; 

        private CTC.DAL.Entities.Alpha_student_current _alpha_student;

        public CTC.DAL.Entities.Alpha_student_current Alpha_student
        {
            get { return _alpha_student; }
        }

        private System.Collections.Generic.List<Master_programs> _master_programs;
        private System.Collections.Generic.List<Master_entity> _master_entity;
        private System.Collections.Generic.List<Language_register_student> _language_register_student;
        private System.Collections.Generic.List<MasterFacility> _master_facility;

        [ENC_ChildTable("ctc_id")]
        public System.Collections.Generic.List<MasterFacility> Master_facility
        {
            get { return _master_facility; }
            set { _master_facility = value; }
        }

        
        [ENC_ChildTable("ctc_id")]
        public System.Collections.Generic.List<Language_register_student> Language_register_student
        {
            get { return _language_register_student; }
            set { _language_register_student = value; }
        }

        public Ctc_master()
        {
            this._master_programs = new List<Master_programs>();
            this._master_entity = new List<Master_entity>();
            this._language_register_student = new List<Language_register_student>();
            this._master_facility = new List<MasterFacility>();
        }

        [ENC_ChildTable("ctc_id")]
        public System.Collections.Generic.List<Master_entity> Master_entity
        {
            get { return _master_entity; }
            set { _master_entity = value; }
        }

        [ENC_ChildTable("ctc_id")]
        public System.Collections.Generic.List<Master_programs> Master_programs
        {
            get { return _master_programs; }
            set { _master_programs = value; }
        }


        [ENC_Column("ctc_id", ENC_ColumnAttribute.keyType.primaryKey)]
        public System.Int64? ctc_id
        {
            get { return _ctc_id; }
            set 
            {
                _ctc_id = value; 
                
                  DatabaseObjectAccess doa = DataAccess.createDOA();

                  this._alpha_student = (Alpha_student_current)doa.selectObjects(typeof(Alpha_student_current), "@ctc_id = " + value, "")[0];

                  doa.Dispose();
            
            }
        }
        //public string Alpha_Student_Name
        //{
        //    get
        //    {
        //        if (this._alpha_student == null)
        //        { return String.Empty; }
        //        else { return this._alpha_student.first_name + " " + this._alpha_student.last_name; }
        //    }
        //}
        [ENC_Column("cps_id")]
        public System.Int64? cps_id
        {
            get { return _cps_id; }
            set {_cps_id = value; }
        }
        [ENC_Column("status_comment")]
        public System.String status_comment
        {
            get { return _status_comment; }
            set { _status_comment = value; }
        }
        //[ENC_Column("start_semester")]
        //public System.String start_semester
        //{
        //    get { return _start_semester; }
        //    set { _start_semester = value; }
        //}
        [ENC_Column("primary_language")]
        public System.Int32? primary_language
        {
            get { return _primary_language; }
            set { _primary_language = value; }
        }
        //[ENC_Column("alternate_fall_id")]
        //public System.Int32? alternate_fall_id
        //{
        //    get { return _alternate_fall_id; }
        //    set { _alternate_fall_id = value; }
        //}
        //[ENC_Column("original_guid")]
        //public System.Int32? original_guid
        //{
        //    get { return _original_guid; }
        //    set { _original_guid = value; }
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
        [ENC_Column("fafsa")]
        public System.Int32 fafsa
        {
            get { return _fafsa; }
            set { _fafsa = value; }
        }
        [ENC_Column("parential_permission")]
        public System.Int32 parential_permission
        {
            get { return _parential_permission; }
            set { _parential_permission = value; }
        }
        [ENC_Column("media_release")]
        public System.Int32 media_release
        {
            get { return _media_release; }
            set { _media_release = value; }
        }
        [ENC_Column("twenty_first")]
        public System.Int32 twenty_first
        {
            get { return _twenty_first; }
            set { _twenty_first = value; }
        }
        [ENC_Column("student_servey")]
        public System.Int32 student_servey
        {
            get { return _student_servey; }
            set { _student_servey = value; }
        }
        [ENC_Column("parent_survey")]
        public System.Int32 parent_survey
        {
            get { return _parent_survey; }
            set { _parent_survey = value; }
        }
    }
}