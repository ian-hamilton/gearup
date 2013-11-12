using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.event_attendance")]
    public class Event_attendance : IDataItem
    {

        private System.Int64 _event_attendance_id = 0;
        private System.Int64 _event_id = 0;
        private System.Int64? _ctc_id = null;
        private System.Int64? _entity_id = null;
        private System.Int64? _event_attendance_type_id = null;
        private System.Int32? _approval_flag = null;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

         private Alpha_student_current _alpha = null;
        private Entity _entity = null;

        [ENC_Column("event_attendance_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 event_attendance_id
        {
            get { return _event_attendance_id; }
            set { _event_attendance_id = value; }
        }
        [ENC_Column("event_id",  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 event_id
        {
            get { return _event_id; }
            set { _event_id = value; }
        }
        [ENC_Column("ctc_id")]
        public System.Int64? ctc_id
        {
            get { return _ctc_id; }
            set 
            { 
                _ctc_id = value;

                if (value != null)
                {
                    DatabaseObjectAccess doa = DataAccess.createDOA();

                    try
                    {
                        this._alpha = (Alpha_student_current)doa.selectObjects(typeof(Alpha_student_current), "@ctc_id = " + value, "")[0];
                    }
                    catch{}

                    doa.Dispose();
                }            
            
            }
        }

        public string full_reverse_name
        {
            get 
            {
                if(this._alpha == null) { return String.Empty; }
                return this._alpha.full_reverse_name;
            }
        }
        [ENC_Column("entity_id")]
        public System.Int64? entity_id
        {
            get { return _entity_id; }
            set 
            { 
                _entity_id = value; 

                if(value != null)
                {
                    DatabaseObjectAccess doa = DataAccess.createDOA();

                    this._entity = (Entity)doa.selectObjects(typeof(Entity), "@entity_id = " + value, "")[0];

                    doa.Dispose();
                }
            
            }
        }
        public string display_reverse_full_name
        {
            get
            {
                if (this._entity == null) { return String.Empty; }
                return this._entity.display_reverse_full_name;
            }
        }
        public System.Int32? display_unit
        {
            get
            {
                if (this._entity == null) { return null; }
                return this._entity.unit;
            }
        }
        [ENC_Column("event_attendance_type_id")]
        public System.Int64? event_attendance_type_id
        {
            get { return _event_attendance_type_id; }
            set { _event_attendance_type_id = value; }
        }
        [ENC_Column("approval_flag")]
        public System.Int32? approval_flag
        {
            get { return _approval_flag; }
            set { _approval_flag = value; }
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