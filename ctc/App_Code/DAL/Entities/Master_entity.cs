using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.master_entity")]
    public class Master_entity : IDataItem
    {

        private System.Int64 _master_entity_id = 0;
        private System.Int64 _ctc_id = 0;
        private System.Int64 _entity_id = 0;
        private System.Int32 _view_sequence = 0;
        private System.Int32 _reside_flag = 0;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        private Entity _entity;


        [ENC_Column("master_entity_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 master_entity_id
        {
            get { return _master_entity_id; }
            set { _master_entity_id = value; }
        }
        [ENC_Column("ctc_id",  ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 ctc_id
        {
            get { return _ctc_id; }
            set { _ctc_id = value; }
        }
        [ENC_Column("entity_id")]
        public System.Int64 entity_id
        {
            get { return _entity_id; }
            set 
            {
                _entity_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._entity = (Entity)doa.selectObjects(typeof(Entity), "@entity_id = " + value, "")[0];

                doa.Dispose();
            
            
            }
        }
        public string first_name
        {
            get
            {
                if (this._entity == null) { return String.Empty; }
                else { return this._entity.first_name; }
            }
        }
        public string last_name
        {
            get
            {
                if (this._entity == null) { return String.Empty; }
                else { return this._entity.last_name; }
            }
        }
        public string full_name
        {
            get
            {
                if (this._entity == null) { return string.Empty; }
                else { return this._entity.first_name.Trim() + " " + this._entity.last_name.Trim(); }
            }
        }
        public string display_reverse_full_name
        {
            get
            {
                if (this._entity == null) { return String.Empty; }
                else { return this._entity.display_reverse_full_name; }
            }
        }

        public long? type_id
        {
            get
            {
                if (this._entity == null) { return -1; }
                else { return this._entity.entity_type_id; }
            }
        }

        [ENC_Column("view_sequence")]
        public System.Int32 view_sequence
        {
            get { return _view_sequence; }
            set { _view_sequence = value; }
        }
        [ENC_Column("reside_flag")]
        public System.Int32 reside_flag
        {
            get { return _reside_flag; }
            set { _reside_flag = value; }
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