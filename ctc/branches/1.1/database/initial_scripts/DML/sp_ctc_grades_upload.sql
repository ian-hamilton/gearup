IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'grades_upload'
)
DROP PROCEDURE ctc.grades_upload
go
---------------------------------------------------------

create procedure ctc.grades_upload
as
begin

	begin transaction

	delete from ctc.IT_import_stage_6

	commit transaction


	bulk
	insert ctc.IT_import_stage_6
	from 'c:\ctc_mount_point\081courses_JTG_2008.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)


	begin transaction

	insert into ctc.grades (ctc_id, course_grade, course_number, course_name, unit_number, class_absences, semester, row_created_by_user_id, row_updated_by_user_id)
	select mst.ctc_id, rtrim(ltrim(field5)), rtrim(ltrim(field3)), rtrim(ltrim(field4)), rtrim(ltrim(field1)), rtrim(ltrim(field6)), '08-1', 'csystem', 'csystem' 
	from ctc.IT_import_stage_6, ctc.ctc_master mst
	where mst.cps_id = rtrim(ltrim(field2))

	commit transaction


end