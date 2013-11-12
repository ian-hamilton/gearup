IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'entity_type_upload'
)
DROP PROCEDURE ctc.entity_type_upload
go
---------------------------------------------------------

create procedure ctc.entity_type_upload
as

begin
	
	begin transaction

	delete from ctc.IT_import_stage_2

	commit transaction

	bulk
	insert ctc.IT_import_stage_2
	from 'c:\ctc_mount_point\entity_types.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	

	insert into ctc.entity_type (entity_type_desc, entity_group, row_created_by_user_id, row_updated_by_user_id)
	select rtrim(ltrim(field1)), rtrim(ltrim(field2)), 'csystem', 'csystem' 
	from ctc.IT_import_stage_2


end 