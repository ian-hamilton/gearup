IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'gpa_upload'
)
DROP PROCEDURE ctc.gpa_upload
go
---------------------------------------------------------

create procedure ctc.gpa_upload
as
begin

	begin transaction

	delete from ctc.IT_import_stage_3

	commit transaction

	bulk
	insert ctc.IT_import_stage_3
	from 'c:\ctc_mount_point\081gpa_JTG_2008.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	begin transaction


		update ctc.alpha_student
		set ctc.alpha_student.gpa = outers.gpa
		from
		(select a.alpha_student_id, stuff.ctc_id, stuff.gpa
		from
		(select   m.ctc_id, field3 gpa
		from ctc.it_import_stage_3 i  join ctc.ctc_master m 
		on i.field2 = m.cps_id)stuff,
		ctc.alpha_student a,
		ctc.upload up
		where a.ctc_id = stuff.ctc_id
		and a.upload_id = up.upload_id
		and up.semester = '08-1') outers
		where ctc.alpha_student.alpha_student_id = outers.alpha_student_id

	commit transaction

end 