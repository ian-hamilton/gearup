IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_attendance_facilitator'
)
DROP PROCEDURE ctc.info_attendance_facilitator
go
---------------------------------------------------------

create procedure ctc.info_attendance_facilitator @id bigint
as
begin

	select e.entity_id,
	isnull(e.last_name,'') + ', ' + ltrim(rtrim(isnull(e.first_name,'') + ' ' + isnull(e.middle_initial,''))) as "names"

	from ctc.event_attendance ea
	inner join ctc.entity e
	on ea.entity_id = e.entity_id
	inner join ctc.event_attendance_type t
	on ea.event_attendance_type_id = t.event_attendance_type_id

	where ea.event_id = @id
	and ea.status_flag = 1
	and event_attendance_name = 'facilitator'

	group by  e.entity_id,
	isnull(e.last_name,'') + ', ' + ltrim(rtrim(isnull(e.first_name,'') + ' ' + isnull(e.middle_initial,'')))

	order by names asc

end