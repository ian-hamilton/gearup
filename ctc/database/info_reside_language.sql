IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_reside_language'
)
DROP PROCEDURE ctc.info_reside_language
go
---------------------------------------------------------

create procedure ctc.info_reside_language @id bigint
as
begin

		select 
		language_name,
		home_language_flag

		from ctc.mv_guardian_languages l
		where l.ctc_id = @id
		order by home_language_flag desc, language_name asc

end

go