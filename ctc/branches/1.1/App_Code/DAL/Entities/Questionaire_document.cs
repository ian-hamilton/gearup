using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.questionaire_document")]
    public class Questionaire_document : IDataItem
    {

        private System.Int64 _document_id = 0;
        private System.DateTime _request_date = DateTime.Now;


        [ENC_Column("document_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 document_id
        {
            get { return _document_id; }
            set { _document_id = value; }
        }
        [ENC_Column("request_date")]
        public System.DateTime request_date
        {
            get { return _request_date; }
            set { _request_date = value; }
        }
    }
}