using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.entity")]
    public class Entity : IDataItem
    {

        //private System.Int64 _entity_id = 0;
        //private System.Int64 _entity_type_id = 0;
        //private System.String _title = String.Empty;
        //private System.String _salutation = String.Empty;
        //private System.String _first_name = String.Empty;
        //private System.String _middle_initial = String.Empty;
        //private System.String _last_name = String.Empty;
        //private System.String _address_1 = String.Empty;
        //private System.String _address_2 = String.Empty;
        //private System.String _city = String.Empty;
        //private System.String _state = String.Empty;
        //private System.String _zip = String.Empty;
        //private System.String _phone = String.Empty;
        //private System.String _phone_2 = String.Empty;
        //private System.String _email = String.Empty;
        //private System.String _gender = String.Empty;
        //private System.Int32 _ethnicity = 0;
        //private System.DateTime _dob = DateTime.MinValue;
        //private System.String _relation = String.Empty;
        //private System.Int32 _unit = int.MinValue;
        //private System.Int32 _status_flag = 0;
        //private System.DateTime _row_created = DateTime.Now;
        //private System.DateTime _row_updated = DateTime.Now;
        //private System.String _row_created_by_user_id = String.Empty;
        //private System.String _row_updated_by_user_id = String.Empty;

        //public CTC.DAL.Entities.Program _program;

        private System.Int64? _entity_id;
        private System.Int64? _entity_type_id;
        private System.String _title = String.Empty;
        private System.String _salutation = String.Empty;
        private System.String _first_name = String.Empty;
        private System.String _middle_initial = String.Empty;
        private System.String _last_name = String.Empty;
        private System.String _address_1 = String.Empty;
        private System.String _address_2 = String.Empty;
        private System.String _city = String.Empty;
        private System.String _state = String.Empty;
        private System.String _zip = String.Empty;
        private System.String _phone = String.Empty;
        private System.String _phone_mobile = String.Empty;
        private System.String _email = String.Empty;
        private System.String _gender = String.Empty;
        private System.Int32 _ethnicity;
        private System.DateTime? _dob = null;
        private System.String _relation = String.Empty;
        private System.Int32? _unit;
        private System.Int32? _grade = null;
        private System.Int64? _parent_entity_id = null; 
        private System.Int32? _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;
        private System.String _entity_comment = String.Empty;
        private System.String _phone_work = String.Empty;
        private System.String _fax = String.Empty;
        private System.String _phone_other = String.Empty; 


        private Entity _parentEntity;

     

        private Entity_type _entity_type;

        private System.Collections.Generic.List<Entity_program> _entity_programs;
        private System.Collections.Generic.List<Language_register_entity> _language_register_entity;
        private System.Collections.Generic.List<Entity_facility> _entity_facility;
     

        public Entity()
        {
            this._entity_programs = new List<Entity_program>();
            this._language_register_entity = new List<Language_register_entity>();
            this._entity_facility = new List<Entity_facility>();
        }

        [ENC_ChildTable("entity_id")]
        public System.Collections.Generic.List<Language_register_entity> Language_register_entity
        {
            get { return _language_register_entity; }
            set { _language_register_entity = value; }
        }

        [ENC_ChildTable("entity_id")]
        public System.Collections.Generic.List<Entity_program> Entity_programs
        {
            get { return _entity_programs; }
            set { _entity_programs = value; }
        }
        [ENC_ChildTable("entity_id")]
        public System.Collections.Generic.List<Entity_facility> Entity_facility
        {
            get { return _entity_facility; }
            set { _entity_facility = value; }
        }


        [ENC_Column("entity_id", ENC_ColumnAttribute.keyType.primaryKey,"@@IDENTITY")]
        public System.Int64? entity_id
        {
            get { return _entity_id; }
            set { _entity_id = value; }
        }
        [ENC_Column("entity_type_id")]
        public System.Int64? entity_type_id
        {
            get { return _entity_type_id; }
            set
            {
                _entity_type_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._entity_type = (Entity_type)doa.selectObjects(typeof(Entity_type), "@entity_type_id = " + value, "")[0];

                doa.Dispose();

            }
        }
        public string EntityTypeDesc
        {
            get
            {
                if (this._entity_type == null) { return String.Empty; }
                else { return this._entity_type.entity_type_desc; }
            }
        }
        [ENC_Column("title")]
        public System.String title
        {
            get { return _title; }
            set { _title = value; }
        }
        [ENC_Column("salutation")]
        public System.String salutation
        {
            get { return _salutation; }
            set { _salutation = value; }
        }
        [ENC_Column("first_name")]
        public System.String first_name
        {
            get { return _first_name; }
            set { _first_name = value; }
        }
        [ENC_Column("middle_initial")]
        public System.String middle_initial
        {
            get { return _middle_initial; }
            set { _middle_initial = value; }
        }
        [ENC_Column("last_name")]
        public System.String last_name
        {
            get { return _last_name; }
            set { _last_name = value; }
        }
        public string display_reverse_full_name
        {
            get { return this._last_name + ", " + this.first_name; }
        }
        [ENC_Column("address_1")]
        public System.String address_1
        {
            get { return _address_1; }
            set { _address_1 = value; }
        }
        [ENC_Column("address_2")]
        public System.String address_2
        {
            get { return _address_2; }
            set { _address_2 = value; }
        }
        [ENC_Column("city")]
        public System.String city
        {
            get { return _city; }
            set { _city = value; }
        }
        [ENC_Column("state")]
        public System.String state
        {
            get { return _state; }
            set { _state = value; }
        }
        [ENC_Column("zip")]
        public System.String zip
        {
            get { return _zip; }
            set { _zip = value; }
        }
        [ENC_Column("phone")]
        public System.String phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        [ENC_Column("phone_mobile")]
        public System.String phone_mobile
        {
            get { return _phone_mobile; }
            set { _phone_mobile = value; }
        }
        [ENC_Column("email")]
        public System.String email
        {
            get { return _email; }
            set { _email = value; }
        }
        [ENC_Column("gender")]
        public System.String gender
        {
            get { return _gender; }
            set { _gender = value; }
        }
        [ENC_Column("ethnicity")]
        public System.Int32 ethnicity
        {
            get { return _ethnicity; }
            set { _ethnicity = value; }
        }
        [ENC_Column("dob")]
        public System.DateTime? dob
        {
            get { return _dob; }
            set { _dob = value; }
        }
        [ENC_Column("relation")]
        public System.String relation
        {
            get { return _relation; }
            set { _relation = value; }
        }
        [ENC_Column("unit")]
        public System.Int32? unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        [ENC_Column("grade")]
        public System.Int32? grade
        {
            get { return _grade; }
            set { _grade = value; }
        }
        [ENC_Column("parent_entity_id")]
        public System.Int64? parent_entity_id
        {
            get { return _parent_entity_id; }
            set
            {
                if (value == this.entity_id) { return; }
                
                this._parent_entity_id = value;

                if (value != null)
                {
                    DatabaseObjectAccess doa = DataAccess.createDOA();

                    this._parentEntity = (Entity)doa.selectObjects(typeof(Entity), "@entity_id = " + value.ToString(), "")[0];

                    doa.Dispose();
                }
                else
                {
                    this._parentEntity = null;
                }

            }
        }
        public string display_parent_reverse_full_name
        {
            get
            {
                if (this._parentEntity == null) { return String.Empty; }
                return this._parentEntity.display_reverse_full_name;
            }

        }
        [ENC_Column("status_flag")]
        public System.Int32? status_flag
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

        [ENC_Column("entity_comment")]
        public System.String entity_comment
        {
            get { return _entity_comment; }
            set { _entity_comment = value; }
        }
        [ENC_Column("phone_work")]
        public System.String phone_work
        {
            get { return _phone_work; }
            set { _phone_work = value; }
        }
        [ENC_Column("fax")]
        public System.String fax
        {
            get { return _fax; }
            set { _fax = value; }
        }
        [ENC_Column("phone_other")]
        public System.String phone_other
        {
            get { return _phone_other; }
            set { _phone_other = value; }
        }
    }
}