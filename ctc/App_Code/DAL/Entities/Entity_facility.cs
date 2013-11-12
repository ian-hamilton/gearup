using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.entity_facility")]
    public class Entity_facility : IDataItem
    {

        private System.Int64 _entityFacilityId;
        private System.Int64 _entityId;
        private System.Int64 _facility_id;
        private System.Int32 _statusFlag;
        private System.DateTime _rowCreated = DateTime.Now;
        private System.DateTime _rowUpdated = DateTime.Now;
        private System.String _rowCreatedByUserId = String.Empty;
        private System.String _rowUpdatedByUserId = String.Empty;

        private Facility _facility = null;

        [ENC_Column("entity_facility_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64 entityFacilityId
        {
            get { return _entityFacilityId; }
            set { _entityFacilityId = value; }
        }
        [ENC_Column("entity_id", ENC_ColumnAttribute.keyType.foreignKey)]
        public System.Int64 entityId
        {
            get { return _entityId; }
            set { _entityId = value; }
        }
        [ENC_Column("facility_id")]
        public System.Int64 facility_id
        {
            get { return _facility_id; }
            set
            {
                _facility_id = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                this._facility = (Facility)doa.selectObjects(typeof(Facility), "@facility_id = " + value, "")[0];

                doa.Dispose();

            }
        }
        public string display_facility_name
        {
            get
            {
                if (this._facility == null) { return String.Empty; } else { return this._facility.facility_name; }
            }
        }
        public string facility_name
        {
            get
            {
                return this.display_facility_name;
            }
        }
        [ENC_Column("status_flag")]
        public System.Int32 statusFlag
        {
            get { return _statusFlag; }
            set { _statusFlag = value; }
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
        [ENC_Column("row_created_by_user_id")]
        public System.String rowCreatedByUserId
        {
            get { return _rowCreatedByUserId; }
            set { _rowCreatedByUserId = value; }
        }
        [ENC_Column("row_updated_by_user_id")]
        public System.String rowUpdatedByUserId
        {
            get { return _rowUpdatedByUserId; }
            set { _rowUpdatedByUserId = value; }
        }
    }
}