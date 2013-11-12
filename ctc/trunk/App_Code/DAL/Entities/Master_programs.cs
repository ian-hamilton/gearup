using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.master_programs")]
    public class Master_programs : IDataItem
    {

        private System.Int64 _master_programs_id = 0;
        private System.Int64 _ctc_id = 0;
        private System.Int64 _program_id = 0;
        private System.String _funding_source = String.Empty;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        private CTC.DAL.Entities.Program _program;


        [ENC_Column("master_programs_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 master_programs_id
        {
            get { return _master_programs_id; }
            set { _master_programs_id = value; }
        }
        [ENC_Column("ctc_id",  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 ctc_id
        {
            get { return _ctc_id; }
            set { _ctc_id = value; }
        }
        [ENC_Column("program_id")]
        public System.Int64 program_id
        {
            get { return _program_id; }
            set 
            { 
                _program_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._program = (CTC.DAL.Entities.Program)doa.selectObjects(typeof(CTC.DAL.Entities.Program), "@program_id = " + value, "")[0];

                doa.Dispose();
            
            }
        }
        public System.String display_program_name
        {
            get
            {
                if (this._program == null) { return String.Empty; }
                return this._program.program_name;
            }
        }
        [ENC_Column("funding_source")]
        public System.String funding_source
        {
            get { return _funding_source; }
            set { _funding_source = value; }
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