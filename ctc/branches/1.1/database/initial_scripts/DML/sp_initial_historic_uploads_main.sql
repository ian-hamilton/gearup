IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'initial_historic_uploads_main'
)
DROP PROCEDURE ctc.initial_historic_uploads_main
go
---------------------------------------------------------

create procedure ctc.initial_historic_uploads_main
as
begin



	begin transaction

	
	delete from ctc.language
	delete from ctc.ctc_master
	delete from ctc.alpha_student
	delete from ctc.upload
	delete from ctc.program
	delete from ctc.facility
	delete from ctc.entity
	delete from ctc.entity_program
	delete from ctc.apr
	delete from ctc.grades
	delete from ctc.entity_program
	delete from ctc.entity_type
	

--	insert into ctc.program (program_name, row_created_by_user_id, row_updated_by_user_id)
--	values ('Gear Up 3','csystem', 'csystem')

	commit transaction
	
	--------------------------------------------------------

	exec ctc.grades_upload

	exec ctc.apr_upload

	exec ctc.language_upload

	exec ctc.programs_upload
	
	exec ctc.entity_type_upload

	exec ctc.facility_type_upload

	exec ctc.test_type_upload

	exec ctc.master_alpha_upload_06C_Feb2006

	exec ctc.master_alpha_upload_07A_Sept2006

	exec ctc.master_alpha_upload_07B_Oct2006

	exec ctc.master_alpha_upload_07C_March2007

	exec ctc.master_alpha_upload_08A_Sept2007

	exec ctc.master_alpha_upload_08B_Oct2007

	exec ctc.master_alpha_upload_08C_March2008

	exec ctc.facility_upload_high_school

	exec ctc.facility_upload_middle_schools

	exec ctc.facility_upload_elementary_school

	exec ctc.facility_upload_other


	exec ctc.uploads_maintenance

	exec ctc.gpa_upload

	exec ctc.staff_upload

	exec ctc.data_cleanup

end

