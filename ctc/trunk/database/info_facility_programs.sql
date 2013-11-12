IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_facility_programs'
)
DROP PROCEDURE ctc.info_facility_programs
go
---------------------------------------------------------

create procedure ctc.info_facility_programs @id bigint
as
begin

	select p.program_name

	from ctc.facility_programs fp
	inner join ctc.program p
		on fp.program_id = p.program_id

	where facility_id = @id
	and fp.status_flag = 1

	group by p.program_name

end