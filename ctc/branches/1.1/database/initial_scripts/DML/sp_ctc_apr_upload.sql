

IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'apr_upload'
)
DROP PROCEDURE ctc.apr_upload
go
---------------------------------------------------------

create procedure ctc.apr_upload
as
begin

	begin transaction

	delete from ctc.IT_import_stage_2

	delete from ctc.apr

	commit transaction

	bulk
	insert ctc.IT_import_stage_2
	from 'c:\ctc_mount_point\APRcodes.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	begin transaction

	insert into ctc.apr (apr_code, apr_desc, row_created_by_user_id, row_updated_by_user_id)
	select rtrim(ltrim(field1)), rtrim(ltrim(field2)), 'csystem', 'csystem' 
	from ctc.IT_import_stage_2


	commit transaction

end


