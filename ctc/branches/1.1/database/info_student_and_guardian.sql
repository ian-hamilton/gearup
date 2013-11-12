IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_student_and_guardian'
)
DROP PROCEDURE ctc.info_student_and_guardian
go
---------------------------------------------------------

create procedure ctc.info_student_and_guardian @id bigint
as
begin

	select ctc_id, 
			grade, 
			division,
			case 
			lower(ltrim(rtrim(gender))) when 'f' then 'Female' else 'Male' end gender, 
			first_name,
			middle_initial,
			last_name,
			facility_name,
			semester,
			fafsa,
			parential_permission,
			media_release,
			twenty_first,
			student_servey,
			parent_survey,
			reside_first_name,
			reside_last_name,
			case reside_phone when null then null else substring(reside_phone,1,3) + '-' + substring(reside_phone,4,3) + '-' + substring(reside_phone,7,4) end reside_phone, 
			case reside_phone_mobile when null then null else substring(reside_phone_mobile,1,3) + '-' + substring(reside_phone_mobile,4,3) + '-' + substring(reside_phone_mobile,7,4) end reside_phone_mobile, 
			case reside_fax when null then null else substring(reside_fax,1,3) + '-' + substring(reside_fax,4,3) + '-' + substring(reside_fax,7,4) end reside_fax, 
			case reside_phone_work when null then null else substring(reside_phone_work,1,3) + '-' + substring(reside_phone_work,4,3) + '-' + substring(reside_phone_work,7,4) end reside_phone_work, 
			case reside_phone_other when null then null else substring(reside_phone_other,1,3) + '-' + substring(reside_phone_other,4,3) + '-' + substring(reside_phone_other,7,4) end reside_phone_other, 
			reside_email, 
			reside_address_1, 
			reside_address_2, 
			reside_city, 
			reside_state, 
			mother, 
			father

			from ctc.mv_student_info
			where ctc_id = @id

end