IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'programs_upload'
)
DROP PROCEDURE ctc.programs_upload
go
---------------------------------------------------------

create procedure ctc.programs_upload
as
begin

	begin transaction

	delete from ctc.IT_import_stage_1

	commit transaction

	bulk
	insert ctc.IT_import_stage_1
	from 'c:\ctc_mount_point\CTC_Programs.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	begin transaction

	insert into ctc.program (program_name, row_created_by_user_id, row_updated_by_user_id)
	select rtrim(ltrim(field1)), 'csystem', 'csystem' 
	from ctc.IT_import_stage_1
	--order by field2

	commit transaction

end