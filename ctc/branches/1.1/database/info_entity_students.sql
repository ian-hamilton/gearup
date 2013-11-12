IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_entity_student'
)
DROP PROCEDURE ctc.info_entity_student
go

create procedure ctc.info_entity_student @id bigint
as
begin

	select alpha.ctc_id,
	alpha.first_name + ' ' + ltrim(rtrim(Coalesce(alpha.middle_initial, '') + ' ' + alpha.last_name)) student_name 
	from ctc.entity e
	inner join ctc.master_entity me on me.entity_id = e.entity_id
	inner join ctc.alpha_student_current alpha on alpha.ctc_id = me.ctc_id
	where e.entity_id = @id and me.status_flag = 1
	order by alpha.first_name
	

end