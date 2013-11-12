IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'test_type_upload'
)
DROP PROCEDURE ctc.test_type_upload
go
---------------------------------------------------------

create procedure ctc.test_type_upload
as
begin

	begin transaction

	delete from ctc.IT_import_stage_1

	delete from ctc.test_type

	commit transaction

	bulk
	insert ctc.IT_import_stage_1
	from 'c:\ctc_mount_point\test_types.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	insert into test_type(test_type_desc, row_created_by_user_id, row_updated_by_user_id)
	select rtrim(ltrim(field1)), 'csystem', 'csystem'
	from ctc.IT_import_stage_1

end