using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.IT_content_manager")]
    public class It_content_manager : IDataItem
    {

        private System.String _module_name = String.Empty;
        private System.String _content_line_text = String.Empty;
        private System.String _area = String.Empty;
        private System.Int32 _line_sequence = 0;


        [ENC_Column("module_name")]
        public System.String module_name
        {
            get { return _module_name; }
            set { _module_name = value; }
        }
        [ENC_Column("content_line_text")]
        public System.String content_line_text
        {
            get { return _content_line_text; }
            set { _content_line_text = value; }
        }
        [ENC_Column("area")]
        public System.String area
        {
            get { return _area; }
            set { _area = value; }
        }
        [ENC_Column("line_sequence")]
        public System.Int32 line_sequence
        {
            get { return _line_sequence; }
            set { _line_sequence = value; }
        }
    }
}