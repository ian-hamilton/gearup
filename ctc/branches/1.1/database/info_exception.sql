
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_exception'
)
DROP PROCEDURE ctc.info_exception
go
---------------------------------------------------------

create procedure ctc.info_exception @id bigint
as
begin


	SELECT attendance_excpetion_id
      ,event_id
      ,cps_id
      ,ctc_id
      ,first_name
      ,last_name
      ,comment
      ,retrieved_flag
      ,retrieved_by
      ,upload_dt
      ,student_information_flag
      ,row_created
      ,row_created_by_user_id
  FROM CTC.ctc.attendance_exception
	where attendance_excpetion_id = @id


end