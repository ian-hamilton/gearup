IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_student_event_participation'
)
DROP PROCEDURE ctc.info_student_event_participation
go
---------------------------------------------------------

create procedure ctc.info_student_event_participation @id bigint
as
begin

			select 
		
		apr_desc,
		sum(hours),
		ROW_NUMBER() OVER (order by apr_desc desc) AS ROWID 
		FROM ctc.mv_student_info_event_participation mv
		where mv.ctc_id = @id
		group by apr_desc

		union
	
		SELECT 
		convert(varchar,count(event_id)) apr_desc,
		convert(varchar,sum(hours)) hours,
		-1 as ROWID
		FROM ctc.mv_student_info_event_participation mv
		where mv.ctc_id = @id

		order by rowid desc

end 

go