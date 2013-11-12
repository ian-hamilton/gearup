using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.language_register")]
    public class Language_register_entity : IDataItem
    {

        private System.Int64 _language_register_id = 0;
        private System.Int64 _entity_id = 0;
        private System.Int64 _ctc_id = 0;
        private System.Int64 _language_id = 0; 
        private System.Int32 _home_language_flag = 0;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        Language _language;

        [ENC_Column("language_register_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 language_register_id
        {
            get { return _language_register_id; }
            set { _language_register_id = value; }
        }
        [ENC_Column("entity_id",  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 entity_id
        {
            get { return _entity_id; }
            set { _entity_id = value;}
        }
        //[ENC_Column("ctc_id")]
        //public System.Int64 ctc_id
        //{
        //    get { return _ctc_id; }
        //    set { _ctc_id = value; }
        //}
        [ENC_Column("language_id")]
		public System.Int64 language_id
		 { 
			get { return _language_id; }
			set 
            {
                _language_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._language = (Language)doa.selectObjects(typeof(Language), "language_id = " + value, "")[0];

                doa.Dispose();
            }
		 }
        public string DisplayLanguageName
        {
            get
            {
                if (this._language == null) { return String.Empty; }
                else { return this._language.language_name; }
            }
        }
        public string display_home_language
        {
            get
            {
                if (this._home_language_flag == 0) { return String.Empty; }
                else { return "Home"; }
            }
        }
        [ENC_Column("home_language_flag")]
        public System.Int32 home_language_flag
        {
            get { return _home_language_flag; }
            set { _home_language_flag = value; }
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