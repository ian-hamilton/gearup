using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
    [ENC_TableName("ctc.event_file")]
    public class EventFile : IDataItem
    {

        private System.Int64? _eventFileId = null;
        private System.Int64? _eventId = null;
        private System.Int64? _fileRepositoryId = null;
        private System.Int32? _statusFlag = null;
        private System.DateTime _rowCreated = DateTime.Now;
        private System.DateTime _rowUpdated = DateTime.Now;
        private System.String _rowCreatedByUserId = String.Empty;
        private System.String _rowUpdatedByUserId = String.Empty;


        private FileRepository _fileRepository;

        public FileRepository FileRepository
        {
            get { return _fileRepository; }
            set { _fileRepository = value; }
        }




        [ENC_Column("event_file_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
        public System.Int64? eventFileId
        {
            get { return _eventFileId; }
            set { _eventFileId = value; }
        }
        [ENC_Column("event_id")]
        public System.Int64? eventId
        {
            get { return _eventId; }
            set { _eventId = value; }
        }
        [ENC_Column("file_repository_id")]
        public System.Int64? fileRepositoryId
        {
            get { return _fileRepositoryId; }
            set
            {
                _fileRepositoryId = value;

                DatabaseObjectAccess doa = DataAccess.createDOA();
                _fileRepository = (FileRepository)doa.selectObjects(typeof(FileRepository), "file_repository_id = " + value, "")[0];
                doa.Dispose();
            }
        

        }
        [ENC_Column("status_flag")]
        public System.Int32? statusFlag
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