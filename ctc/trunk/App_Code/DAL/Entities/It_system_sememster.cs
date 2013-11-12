using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.it_system_semesters")]
    public class It_system_semesters : IDataItem
    {

        private System.String _semester_code = String.Empty;
        private System.String _school_year = String.Empty;
        private System.Int32? _actual_year;
        private System.Int32? _semester_number;


        [ENC_Column("semester_code", ENC_ColumnAttribute.keyType.primaryKey)]
        public System.String semester_code
        {
            get { return _semester_code; }
            set { _semester_code = value; }
        }
        [ENC_Column("school_year")]
        public System.String school_year
        {
            get { return _school_year; }
            set { _school_year = value; }
        }
        [ENC_Column("actual_year")]
        public System.Int32? actual_year
        {
            get { return _actual_year; }
            set { _actual_year = value; }
        }
        [ENC_Column("semester_number")]
        public System.Int32? semester_number
        {
            get { return _semester_number; }
            set { _semester_number = value; }
        }
    }
}