using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.registration_document")]
    public class RegistrationDocument : IDataItem
    {

        private System.Int64? _documentId = null;
        private System.DateTime _dateEntered = DateTime.Now;
        private System.String _parentFirstName = String.Empty;
        private System.String _parentLastName = String.Empty;
        private System.String _parentPhoneNumber = String.Empty;
        private System.String _homePhoneNumber = String.Empty;
        private System.String _address = String.Empty;
        private System.String _city = String.Empty;
        private System.String _zip = String.Empty;
        private System.String _studentFirstName = String.Empty;
        private System.String _studentMiddleName = String.Empty;
        private System.String _studentLastName = String.Empty;
        private System.DateTime _studentDob = DateTime.Now;
        private System.String _studentSchool = String.Empty;
        private System.Int32? _grade = null;
        private System.String _division = String.Empty;
        private System.String _email = String.Empty;
        private System.Byte? _invalidFlag = null;
        private System.String _parent2FirstName = String.Empty;
        private System.String _parent2LastName = String.Empty;
        private System.String _parent2PhoneNumber = String.Empty;
        private System.String _relation = String.Empty;
        private System.String _medcond = String.Empty;
        private System.String _medication = String.Empty;
        private System.String _allergies = String.Empty;
        private System.String _drname = String.Empty;
        private System.String _drphone = String.Empty;
        private System.String _clinloc = String.Empty;
        private System.String _regiscomment = String.Empty;
        private System.Byte? _statusFlag = null;
        private System.Byte? _medcondFlag = null;
        private System.Byte? _medicationFlag = null;
        private System.Byte? _allergiesFlag = null;
        private System.Byte? _parentWorkFlag = null;
        private System.Byte? _parentCellFlag = null;
        private System.Byte? _parentOtherFlag = null;
        private System.Byte? _parent2WorkFlag = null;
        private System.Byte? _parent2CellFlag = null;
        private System.Byte? _parent2OtherFlag = null;
        private System.Int64? _eventId = null;
        private System.String _dep1 = String.Empty;
        private System.String _dep2 = String.Empty;
        private System.String _dep3 = String.Empty;
        private System.DateTime _rowCreated = DateTime.Now;
        private System.DateTime _rowUpdated = DateTime.Now;
       


        [ENC_Column("document_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64? documentId
        {
            get { return _documentId; }
            set { _documentId = value; }
        }
        [ENC_Column("date_entered")]
        public System.DateTime dateEntered
        {
            get { return _dateEntered; }
            set { _dateEntered = value; }
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
        [ENC_Column("home_phone_number")]
        public System.String homePhoneNumber
        {
            get { return _homePhoneNumber; }
            set { _homePhoneNumber = value; }
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
        public System.DateTime studentDob
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
        [ENC_Column("division")]
        public System.String division
        {
            get { return _division; }
            set { _division = value; }
        }
        [ENC_Column("email")]
        public System.String email
        {
            get { return _email; }
            set { _email = value; }
        }
        [ENC_Column("invalid_flag")]
        public System.Byte? invalidFlag
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
        [ENC_Column("parent2_phone_number")]
        public System.String parent2PhoneNumber
        {
            get { return _parent2PhoneNumber; }
            set { _parent2PhoneNumber = value; }
        }
        [ENC_Column("relation")]
        public System.String relation
        {
            get { return _relation; }
            set { _relation = value; }
        }
        [ENC_Column("medCond")]
        public System.String medcond
        {
            get { return _medcond; }
            set { _medcond = value; }
        }
        [ENC_Column("medication")]
        public System.String medication
        {
            get { return _medication; }
            set { _medication = value; }
        }
        [ENC_Column("allergies")]
        public System.String allergies
        {
            get { return _allergies; }
            set { _allergies = value; }
        }
        [ENC_Column("DrName")]
        public System.String drname
        {
            get { return _drname; }
            set { _drname = value; }
        }
        [ENC_Column("DrPhone")]
        public System.String drphone
        {
            get { return _drphone; }
            set { _drphone = value; }
        }
        [ENC_Column("ClinLoc")]
        public System.String clinloc
        {
            get { return _clinloc; }
            set { _clinloc = value; }
        }
        [ENC_Column("regisComment")]
        public System.String regiscomment
        {
            get { return _regiscomment; }
            set { _regiscomment = value; }
        }
        [ENC_Column("status_flag")]
        public System.Byte? statusFlag
        {
            get { return _statusFlag; }
            set { _statusFlag = value; }
        }
        [ENC_Column("medCond_flag")]
        public System.Byte? medcondFlag
        {
            get { return _medcondFlag; }
            set { _medcondFlag = value; }
        }
        [ENC_Column("medication_flag")]
        public System.Byte? medicationFlag
        {
            get { return _medicationFlag; }
            set { _medicationFlag = value; }
        }
        [ENC_Column("allergies_flag")]
        public System.Byte? allergiesFlag
        {
            get { return _allergiesFlag; }
            set { _allergiesFlag = value; }
        }
        [ENC_Column("parent_work_flag")]
        public System.Byte? parentWorkFlag
        {
            get { return _parentWorkFlag; }
            set { _parentWorkFlag = value; }
        }
        [ENC_Column("parent_cell_flag")]
        public System.Byte? parentCellFlag
        {
            get { return _parentCellFlag; }
            set { _parentCellFlag = value; }
        }
        [ENC_Column("parent_other_flag")]
        public System.Byte? parentOtherFlag
        {
            get { return _parentOtherFlag; }
            set { _parentOtherFlag = value; }
        }
        [ENC_Column("parent2_work_flag")]
        public System.Byte? parent2WorkFlag
        {
            get { return _parent2WorkFlag; }
            set { _parent2WorkFlag = value; }
        }
        [ENC_Column("parent2_cell_flag")]
        public System.Byte? parent2CellFlag
        {
            get { return _parent2CellFlag; }
            set { _parent2CellFlag = value; }
        }
        [ENC_Column("parent2_other_flag")]
        public System.Byte? parent2OtherFlag
        {
            get { return _parent2OtherFlag; }
            set { _parent2OtherFlag = value; }
        }
        [ENC_Column("event_id")]
        public System.Int64? eventId
        {
            get { return _eventId; }
            set { _eventId = value; }
        }
        [ENC_Column("dep1")]
        public System.String dep1
        {
            get { return _dep1; }
            set { _dep1 = value; }
        }
        [ENC_Column("dep2")]
        public System.String dep2
        {
            get { return _dep2; }
            set { _dep2 = value; }
        }
        [ENC_Column("dep3")]
        public System.String dep3
        {
            get { return _dep3; }
            set { _dep3 = value; }
        }
        [ENC_Column("row_created")]
        public System.DateTime rowCreated
        {
            get { return _rowCreated; }
            set { _rowCreated = value; }
        }
        [ENC_Column("row_updated")]
        public System.DateTime rowUpdated
        {
            get { return _rowUpdated; }
            set { _rowUpdated = value; }
        }
      
    }
}