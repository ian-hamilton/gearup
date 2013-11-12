using System;
using System.Collections.Generic;
using EnterpriseNETClass;

namespace CTC.DAL.Entities
{
	[ENC_TableName("ctc.file_repository")]
	public class FileRepository : IDataItem 
	 { 

		private System.Int64? _fileRepositoryId = null; 
		private System.String _fileName = String.Empty; 
		private System.Int32? _statusFlag = null; 
		private System.DateTime _rowCreated = DateTime.Now; 
		private System.DateTime _rowUpdated = DateTime.Now; 
		private System.String _rowCreatedByUserId = String.Empty; 
		private System.String _rowUpdatedByUserId = String.Empty;


        [ENC_Column("file_repository_id", ENC_ColumnAttribute.keyType.primaryKey, "@@IDENTITY")]
		public System.Int64? fileRepositoryId
		 { 
			get { return _fileRepositoryId; }
			set { _fileRepositoryId = value; }
		 }
		[ENC_Column("file_name")]
		public System.String fileName
		 { 
			get { return _fileName; }
			set { _fileName = value; }
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