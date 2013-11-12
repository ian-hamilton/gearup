using System;
using System.Collections.Generic;
using EnterpriseNETClass;
using CTC.DAL;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.facility_programs")]
    public class Facility_programs : IDataItem
    {

        private System.Int64 _facility_programs_id = 0;
        private System.Int64 _facility_id = 0;
        private System.Int64 _program_id = 0;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        public CTC.DAL.Entities.Program _program;


        [ENC_Column("facility_programs_id", ENC_ColumnAttribute.keyType.primaryKey,"@@IDENTITY")]
        public System.Int64 facility_programs_id
        {
            get { return _facility_programs_id; }
            set { _facility_programs_id = value; }
        }
        [ENC_Column("facility_id",  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 facility_id
        {
            get { return _facility_id; }
            set { _facility_id = value;}
        }
        [ENC_Column("program_id", true)]
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

        [ENC_Column("status_flag", true)]
        public System.Int32 status_flag
        {
            get { return _status_flag; }
            set { _status_flag = value; }
        }
        [ENC_Column("row_created", true)]
        public System.DateTime row_created
        {
            get { return _row_created; }
            set { _row_created = value; }
        }
        [ENC_Column("row_updated", true)]
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