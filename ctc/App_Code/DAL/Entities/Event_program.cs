using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.event_program")]
    public class Event_program : IDataItem
    {

        private System.Int64 _event_program_id = 0;
        private System.Int64 _event_id = 0;
        private System.Int64 _program_id = 0;
        private System.Double? _amount = null;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        Program _program = null;

        [ENC_Column("event_program_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 event_program_id
        {
            get { return _event_program_id; }
            set { _event_program_id = value; }
        }
        [ENC_Column("event_id", ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 event_id
        {                       
            get { return _event_id; }
            set { _event_id = value; }
        }
        [ENC_Column("program_id")]
        public System.Int64 program_id
        {
            get { return _program_id; }
            set 
            { 
                _program_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._program = (Program)doa.selectObjects(typeof(Program), "@program_id = " + value, "")[0];

                doa.Dispose();
            }
        }

        public string display_program_name
        {
            get
            {
                if (this._program == null) { return String.Empty; }
                return this._program.program_name;
            }
        }
        [ENC_Column("amount")]
        public System.Double? amount
        {
            get { return _amount; }
            set { _amount = value; }
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