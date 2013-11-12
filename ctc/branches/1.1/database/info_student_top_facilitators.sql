IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_student_top_facilitators'
)
DROP PROCEDURE ctc.info_student_top_facilitators
go
---------------------------------------------------------

create procedure ctc.info_student_top_facilitators @id bigint
as
begin

	select top 4
	facilitator,
	number_of_contacts
	from
	(select
		facilitator,
		count(facilitator) as number_of_contacts

	from ctc.mv_student_info_gearup_events
	where ctc_id = @id
	group by facilitator)info

end

go