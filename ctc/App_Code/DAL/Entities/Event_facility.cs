using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.event_facility")]
    public class Event_facility : IDataItem
    {

        private System.Int64 _event_facility_id = 0;
        private System.Int64 _event_id = 0;
        private System.Int64 _facility_id = 0;
        private System.Int32? _unit = null;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        private Facility _facility = null;

        [ENC_Column("event_facility_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 event_facility_id
        {
            get { return _event_facility_id; }
            set { _event_facility_id = value; }
        }
        [ENC_Column("event_id", ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 event_id
        {
            get { return _event_id; }
            set { _event_id = value; }
        }
        [ENC_Column("facility_id")]
        public System.Int64 facility_id
        {
            get { return _facility_id; }
            set 
            { 
                _facility_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._facility = (Facility)doa.selectObjects(typeof(Facility), "@facility_id = " + value, "")[0];

                doa.Dispose();
            
            }
        }
        public string display_facility_name
        {
            get
            {
                if (this._facility == null) { return String.Empty; } else { return this._facility.facility_name; }
            }
        }
        public string facility_name
        {
            get
            {
                return this.display_facility_name;
            }
        }
            
        [ENC_Column("unit")]
        public System.Int32? unit
        {
            get { return _unit; }
            set { _unit = value; }
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