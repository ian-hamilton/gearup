IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_entity_programs'
)
DROP PROCEDURE ctc.info_entity_programs
go
---------------------------------------------------------

create procedure ctc.info_entity_programs @id bigint
as
begin

	select p.program_name

	from ctc.entity_program ep
		inner join ctc.program p
	on ep.program_id = p.program_id

	where ep.entity_id = @id
	and ep.status_flag = 1

end