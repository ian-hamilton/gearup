IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_student_test_performance'
)
DROP PROCEDURE ctc.info_student_test_performance
go
---------------------------------------------------------

create procedure ctc.info_student_test_performance @id bigint
as
begin

		select 
		test_type_desc,
		score_category,
		test_score

		from ctc.mv_student_info_performance
		where ctc_id = @id
		and score_category like '%Performance Level'
		order by score_category

end

go