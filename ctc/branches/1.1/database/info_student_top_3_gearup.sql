IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_student_top_3_gearup'
)
DROP PROCEDURE ctc.info_student_top_3_gearup
go
---------------------------------------------------------

create procedure ctc.info_student_top_3_gearup @id bigint
as
begin

	select top 3 
	convert(varchar, date_of_service, 101) as date_of_service,
	event_title,
	facilitator
	 from
	(select
		date_of_service,
		event_title,
		facilitator

	from ctc.mv_student_info_gearup_events
	where ctc_id = @id) info

end 

go