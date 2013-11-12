IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_student_parent_participation'
)
DROP PROCEDURE ctc.info_student_parent_participation
go
---------------------------------------------------------

create procedure ctc.info_student_parent_participation @id bigint
as
begin

	select 
	apr_desc,
	most_recent

	from ctc.mv_student_info_parent_participation
	where ctc_id = @id
	order by apr_desc

end

go