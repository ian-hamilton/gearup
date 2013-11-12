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
	
	drop table ctc.A1_IT_import_stage

	delete from ctc.entity_type

	create table ctc.A1_IT_import_stage
	(field1 varchar(max),
	)

	bulk
	insert ctc.A1_IT_import_stage
	from 'c:\ctc_mount_point\entity_types.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	

	insert into ctc.entity_type (entity_type_desc, row_created_by_user_id, row_updated_by_user_id)
	select field1, 'ctc_system', 'ctc_system' 
	from ctc.A1_IT_import_stage


end 