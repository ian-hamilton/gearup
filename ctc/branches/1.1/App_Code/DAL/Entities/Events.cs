using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.events")]
    public class Events : IDataItem
    {

        private System.Int64? _event_id = null;
        private System.String _event_title = String.Empty;
        private System.String _apr_code = String.Empty;
        private System.DateTime _date_of_service = DateTime.Now;
        private System.DateTime? _start_time = null;
        private System.DateTime? _end_time = null;
        private System.Int64? _host_facility_id = null;
        private System.String _event_comment = String.Empty;
        private System.Int64? _responsible_entity_id = null; 
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        private Apr _apr = null;
        private Facility _host_facility = null;
        private Entity _responsible_entity = null;

        private System.Collections.Generic.List<Event_attendance> _event_attendance = null;
        private System.Collections.Generic.List<Event_facility> _event_facility = null;
        private System.Collections.Generic.List<Event_program> _event_program = null;
        private System.Collections.Generic.List<Attendance_exception> _attendance_exception = null;

       

        public Events()
        {
            this._event_attendance = new List<Event_attendance>();
            this._event_facility = new List<Event_facility>();
            this._event_program = new List<Event_program>();
            this._attendance_exception = new List<Attendance_exception>();
        }

        [ENC_ChildTable("event_id")]
        public System.Collections.Generic.List<Attendance_exception> Attendance_exception
        {
            get { return _attendance_exception; }
            set { _attendance_exception = value; }
        }

        [ENC_ChildTable("event_id")]
        public System.Collections.Generic.List<Event_program> Event_program
        {
            get { return _event_program; }
            set { _event_program = value; }
        }

        [ENC_ChildTable("event_id")]
        public System.Collections.Generic.List<Event_facility> Event_facility
        {
            get { return _event_facility; }
            set { _event_facility = value; }
        }

        [ENC_ChildTable("event_id")]
        public System.Collections.Generic.List<Event_attendance> Event_attendance
        {
            get { return _event_attendance; }
            set { _event_attendance = value; }
        }

        

        [ENC_Column("event_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64? event_id
        {
            get { return _event_id; }
            set { _event_id = value; }
        }
        [ENC_Column("event_title")]
        public System.String event_title
        {
            get { return _event_title; }
            set { _event_title = value; }
        }
        [ENC_Column("apr_code")]
        public System.String apr_code
        {
            get { return _apr_code; }
            set 
            { 
                _apr_code = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._apr = (Apr)doa.selectObjects(typeof(Apr), "apr_code = '" + value + "'", "")[0];

                doa.Dispose();
            
            }
        }

        public string display_apr_desc
        {
            get 
            {
                if (this._apr == null) { return String.Empty; }
                return this._apr.apr_desc; 
            }
        }

        [ENC_Column("date_of_service")]
        public System.DateTime date_of_service
        {
            get { return _date_of_service; }
            set { _date_of_service = value; }
        }
        [ENC_Column("start_time")]
        public System.DateTime? start_time
        {
            get { return _start_time; }
            set { _start_time = value; }
        }
        [ENC_Column("end_time")]
        public System.DateTime? end_time
        {
            get { return _end_time; }
            set { _end_time = value; }
        }
        [ENC_Column("host_facility_id")]
        public System.Int64? host_facility_id
        {
            get { return _host_facility_id; }
            set 
            { 
                _host_facility_id = value;

                if (value != null)
                {

                    DatabaseObjectAccess doa = DataAccess.createDOA();

                    this._host_facility = (Facility)doa.selectObjects(typeof(Facility), "@facility_id = " + value, "")[0];

                    doa.Dispose();
                }
                else
                {
                    this._host_facility = null;
                }
            
            }
        }

        public string display_host_facility_name
        {
            get
            {
                if (this._host_facility == null) { return String.Empty; }
                return this._host_facility.facility_name;
            }

        }

        public Int32? display_host_unit
        {
            get 
            {
                if (this._host_facility == null) { return null; }
                return this._host_facility.unit; 
            }
        }

        [ENC_Column("event_comment")]
        public System.String event_comment
        {
            get { return _event_comment; }
            set { _event_comment = value; }
        }
        [ENC_Column("responsible_entity_id")]
        public System.Int64? responsible_entity_id
        {
            get { return _responsible_entity_id; }
            set 
            {
                _responsible_entity_id = value;

                if (this._responsible_entity_id.HasValue)
                {
                    DatabaseObjectAccess doa = DataAccess.createDOA();

                    this._responsible_entity = (Entity)doa.selectObjects(typeof(Entity), "@entity_id = " + value, "")[0];

                    doa.Dispose();
                }
            
            }
        }
        public string display_responsible_entity_name
        {
            get
            {
                if (this._responsible_entity == null) { return String.Empty; }
                return this._responsible_entity.first_name + " " + this._responsible_entity.last_name;
            }
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