using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.IT_link_manager")]
    public class It_link_manager : IDataItem
    {

        private System.String _module_name = String.Empty;
        private System.String _link_url = String.Empty;
        private System.String _link_display = String.Empty;
        private System.Int32 _link_sequence = 0;


        [ENC_Column("module_name")]
        public System.String module_name
        {
            get { return _module_name; }
            set { _module_name = value; }
        }
        [ENC_Column("link_url")]
        public System.String link_url
        {
            get { return _link_url; }
            set { _link_url = value; }
        }
        [ENC_Column("link_display")]
        public System.String link_display
        {
            get { return _link_display; }
            set { _link_display = value; }
        }
        [ENC_Column("link_sequence")]
        public System.Int32 link_sequence
        {
            get { return _link_sequence; }
            set { _link_sequence = value; }
        }
    }
}