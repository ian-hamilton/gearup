using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.questionaire_document")]
    public class Questionaire_document : IDataItem
    {

        private System.Int64 _documentId;
        private System.DateTime _requestDate = DateTime.Now;
        private System.String _parentFirstName = String.Empty;
        private System.String _parentLastName = String.Empty;
        private System.String _parentPhoneNumber = String.Empty;
        private System.String _address = String.Empty;
        private System.String _city = String.Empty;
        private System.String _zip = String.Empty;
        private System.String _studentFirstName = String.Empty;
        private System.String _studentMiddleName = String.Empty;
        private System.String _studentLastName = String.Empty;
        private System.DateTime? _studentDob = null;
        private System.String _studentSchool = String.Empty;
        private System.Int32? _grade = null;
        private System.Byte _invalidFlag = 0;
        private System.String _parent2FirstName = String.Empty;
        private System.String _parent2LastName = String.Empty;
       


        [ENC_Column("document_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 document_id
        {
            get { return _documentId; }
            set { _documentId = value; }
        }
        [ENC_Column("request_date")]
        public System.DateTime requestDate
        {
            get { return _requestDate; }
            set { _requestDate = value; }
        }
        [ENC_Column("parent_first_name")]
        public System.String parentFirstName
        {
            get { return _parentFirstName; }
            set { _parentFirstName = value; }
        }
        [ENC_Column("parent_last_name")]
        public System.String parentLastName
        {
            get { return _parentLastName; }
            set { _parentLastName = value; }
        }
        [ENC_Column("parent_phone_number")]
        public System.String parentPhoneNumber
        {
            get { return _parentPhoneNumber; }
            set { _parentPhoneNumber = value; }
        }
        [ENC_Column("address")]
        public System.String address
        {
            get { return _address; }
            set { _address = value; }
        }
        [ENC_Column("city")]
        public System.String city
        {
            get { return _city; }
            set { _city = value; }
        }
        [ENC_Column("zip")]
        public System.String zip
        {
            get { return _zip; }
            set { _zip = value; }
        }
        [ENC_Column("student_first_name")]
        public System.String studentFirstName
        {
            get { return _studentFirstName; }
            set { _studentFirstName = value; }
        }
        [ENC_Column("student_middle_name")]
        public System.String studentMiddleName
        {
            get { return _studentMiddleName; }
            set { _studentMiddleName = value; }
        }
        [ENC_Column("student_last_name")]
        public System.String studentLastName
        {
            get { return _studentLastName; }
            set { _studentLastName = value; }
        }
        [ENC_Column("student_dob")]
        public System.DateTime? studentDob
        {
            get { return _studentDob; }
            set { _studentDob = value; }
        }
        [ENC_Column("student_school")]
        public System.String studentSchool
        {
            get { return _studentSchool; }
            set { _studentSchool = value; }
        }
        [ENC_Column("grade")]
        public System.Int32? grade
        {
            get { return _grade; }
            set { _grade = value; }
        }
        [ENC_Column("invalid_flag")]
        public System.Byte invalidFlag
        {
            get { return _invalidFlag; }
            set { _invalidFlag = value; }
        }
        [ENC_Column("parent2_first_name")]
        public System.String parent2FirstName
        {
            get { return _parent2FirstName; }
            set { _parent2FirstName = value; }
        }
        [ENC_Column("parent2_last_name")]
        public System.String parent2LastName
        {
            get { return _parent2LastName; }
            set { _parent2LastName = value; }
        }
    
    }
}