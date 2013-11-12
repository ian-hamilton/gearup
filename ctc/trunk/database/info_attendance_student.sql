IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_attendance_student'
)
DROP PROCEDURE ctc.info_attendance_student
go
---------------------------------------------------------

create procedure ctc.info_attendance_student @id bigint
as
begin

	select c.ctc_id, 
	c.last_name + ', ' + ltrim(rtrim(c.first_name + ' ' + isnull(c.middle_initial, ''))) as "names"

	from ctc.event_attendance ea
	inner join ctc.alpha_student_current c
	on ea.ctc_id = c.ctc_id

	where ea.event_id = @id
	and ea.status_flag = 1

	group by 
	c.ctc_id, 
	c.last_name + ', ' + ltrim(rtrim(c.first_name + ' ' + isnull(c.middle_initial, '')))

	order by names

end