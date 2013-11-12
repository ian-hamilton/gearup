IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'uploads_maintenance'
)
DROP PROCEDURE ctc.uploads_maintenance
go
---------------------------------------------------------

create procedure ctc.uploads_maintenance
as



begin

------------------------------------------------------------
	begin transaction

	update ctc.alpha_student
	set ctc.alpha_student.dob = stuff.dob
	from

	(select b.ctc_id,  min_dates.dob
	from ctc.alpha_student b,
	(select a.ctc_id, min(a.dob) dob
	from ctc.alpha_student a
	where a.dob is not null
	group by a.ctc_id) min_dates
	where b.dob is null
	and b.ctc_id = min_dates.ctc_id)stuff

	where ctc.alpha_student.ctc_id = stuff.ctc_id

	commit transaction
----------------------------------------------------------------

	begin transaction

	delete from ctc.alpha_student_current

	insert ctc.alpha_student_current (ctc_id, first_name, last_name, dob, unit, grade, gpa, cps_status, row_created)
	select als.ctc_id, first_name, last_name, dob, unit, grade, gpa, cps_status, last_date
	from ctc.alpha_student als,
	(select ctc_id, max(row_created) last_date
	from ctc.alpha_student
	group by ctc_id) latest
	where latest.ctc_id = als.ctc_id
	and latest.last_date = als.row_created

	commit transaction

--------------------------------------------------------------

	begin transaction
	
		update ctc.upload set semester='06-2' where upload_file = '06C_Feb2006Mod2.txt'
		update ctc.upload set semester='07-0' where upload_file = '07A_Sept2006Mod2.txt'
		update ctc.upload set semester='07-1' where upload_file = '07B_Oct2006Mod2.txt'
		update ctc.upload set semester='07-2' where upload_file = '07C_March2007Mod3.txt'
		update ctc.upload set semester='08-0' where upload_file = '08A_Sept2007Mod.txt'
		update ctc.upload set semester='08-1' where upload_file = '08B_Oct2007Mod1.txt'
		update ctc.upload set semester='08-2' where upload_file = '08C_March2008Mod1.txt'

	commit transaction


end