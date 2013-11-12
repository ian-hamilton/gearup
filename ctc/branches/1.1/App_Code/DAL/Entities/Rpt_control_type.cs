using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.rpt_control_type")]
    public class Rpt_control_type : IDataItem
    {

        private System.Int64 _control_type_id = 0;
        private System.String _control_type = String.Empty;
        private System.Int32 _status_flag = 1;


        [ENC_Column("control_type_id", ENC_ColumnAttribute.keyType.primaryKey)]
        public System.Int64 control_type_id
        {
            get { return _control_type_id; }
            set { _control_type_id = value; }
        }
        [ENC_Column("control_type")]
        public System.String control_type
        {
            get { return _control_type; }
            set { _control_type = value; }
        }
        [ENC_Column("status_flag")]
        public System.Int32 status_flag
        {
            get { return _status_flag; }
            set { _status_flag = value; }
        }
    }
}