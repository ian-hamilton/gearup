using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.IT_system_variables")]
    public class It_system_variables : IDataItem
    {

        private System.Int64 _variable_id = 0;
        private System.String _variable_group = String.Empty;
        private System.String _variable_value = String.Empty;
        private System.String _variable_desc = String.Empty;


        [ENC_Column("variable_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 variable_id
        {
            get { return _variable_id; }
            set { _variable_id = value; }
        }
        [ENC_Column("variable_group")]
        public System.String variable_group
        {
            get { return _variable_group; }
            set { _variable_group = value; }
        }
        [ENC_Column("variable_value")]
        public System.String variable_value
        {
            get { return _variable_value; }
            set { _variable_value = value; }
        }
        [ENC_Column("variable_desc")]
        public System.String variable_desc
        {
            get { return _variable_desc; }
            set { _variable_desc = value; }
        }
    }
}