using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.facility")]
    public class Facility : IDataItem
    {

        private System.Int64? _facility_id;
        private System.Int32? _unit;
        private System.Int32? _area;
        private System.String _facility_name = String.Empty;
        private System.String _facility_desc = String.Empty;
        private System.Int64 _facility_type_id = 0;
        private System.String _address_1 = String.Empty;
        private System.String _address_2 = String.Empty;
        private System.String _city = String.Empty;
        private System.String _state = String.Empty;
        private System.String _zip = String.Empty;
        private System.String _misc_contact_name = String.Empty;
        private System.String _phone = String.Empty;
        private System.String _phone_alt = String.Empty;
        private System.String _fax = String.Empty;
        private System.String _lunchroom = String.Empty;
        private System.String _engineering = String.Empty;
        private System.String _url = String.Empty;
        private System.String _grades = String.Empty;
        private System.String _school_focus = String.Empty;
        private System.Int32 _is_warning_list = 0;
        private System.String _facility_comment = String.Empty;
        private System.Int32 _status_flag = 1;
        private System.DateTime _row_created = DateTime.Now;
        private System.DateTime _row_updated = DateTime.Now;
        private System.String _row_created_by_user_id = String.Empty;
        private System.String _row_updated_by_user_id = String.Empty;

        private Facility_type _facilityType;

        private System.Collections.Generic.List<Facility_programs> _facility_programs;

        [ENC_ChildTableAttribute("facility_id")]
        public System.Collections.Generic.List<Facility_programs> Facility_programs
        {
            get { return _facility_programs; }
            set { _facility_programs = value; }
        }

        public Facility()
        {

            this._facility_programs = new List<Facility_programs>();

        }


        [ENC_Column("facility_id", ENC_ColumnAttribute.keyType.primaryKey,"@@IDENTITY")]
        public System.Int64? facility_id
        {
            get { return _facility_id; }
            set { _facility_id = value; }
        }
        [ENC_Column("unit")]
        public System.Int32? unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        [ENC_Column("area")]
        public System.Int32? area
        {
            get { return _area; }
            set { _area = value; }
        }
        [ENC_Column("facility_name")]
        public System.String facility_name
        {
            get { return _facility_name; }
            set { _facility_name = value; }
        }
        [ENC_Column("facility_desc")]
        public System.String facility_desc
        {
            get { return _facility_desc; }
            set { _facility_desc = value; }
        }
        [ENC_Column("facility_type_id")]
        public System.Int64 facility_type_id
        {
            get { return _facility_type_id; }
            set 
            {
                _facility_type_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._facilityType = (Facility_type)doa.selectObjects(typeof(CTC.DAL.Entities.Facility_type), "facility_type_id = " + value, "")[0];

                doa.Dispose();
            
            }
        }

        public System.String display_facility_type_name
        {
            get
            {
                if (this._facilityType == null) { return String.Empty; }
                return this._facilityType.facility_type_name;
            }
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
        [ENC_Column("misc_contact_name")]
        public System.String misc_contact_name
        {
            get { return _misc_contact_name; }
            set { _misc_contact_name = value; }
        }
        [ENC_Column("phone")]
        public System.String phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        [ENC_Column("phone_alt")]
        public System.String phone_alt
        {
            get { return _phone_alt; }
            set { _phone_alt = value; }
        }
        [ENC_Column("fax")]
        public System.String fax
        {
            get { return _fax; }
            set { _fax = value; }
        }
        [ENC_Column("lunchroom")]
        public System.String lunchroom
        {
            get { return _lunchroom; }
            set { _lunchroom = value; }
        }
        [ENC_Column("engineering")]
        public System.String engineering
        {
            get { return _engineering; }
            set { _engineering = value; }
        }
        [ENC_Column("url")]
        public System.String url
        {
            get { return _url; }
            set { _url = value; }
        }
        [ENC_Column("grades")]
        public System.String grades
        {
            get { return _grades; }
            set { _grades = value; }
        }
        [ENC_Column("school_focus")]
        public System.String school_focus
        {
            get { return _school_focus; }
            set { _school_focus = value; }
        }
        [ENC_Column("is_warning_list")]
        public System.Int32 is_warning_list
        {
            get { return _is_warning_list; }
            set { _is_warning_list = value; }
        }
        [ENC_Column("facility_comment")]
        public System.String facility_comment
        {
            get { return _facility_comment; }
            set { _facility_comment = value; }
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
        [ENC_Column("row_updated",true)]
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