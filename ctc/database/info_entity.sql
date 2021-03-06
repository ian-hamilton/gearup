USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[info_entity]    Script Date: 01/24/2011 08:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------

ALTER procedure [ctc].[info_entity] @id bigint
as
begin

	SELECT e.entity_id
      ,entity_type_desc
      ,title
      ,salutation
      ,first_name
      ,middle_initial
      ,last_name
      ,e.address_1
      ,e.address_2
      ,e.city
      ,e.state
      ,e.zip
      ,e.phone
      ,phone_mobile
	  ,phone_work
	  ,e.fax
	  ,phone_other
      ,email
	  ,entity_comment
      ,case lower(ltrim(rtrim(gender))) when 'f' then 'Female' else 'Male' end gender
      ,ethnicity_desc as ethnicity
      ,dob
      ,relation
      ,facility_name
      ,e.row_created
      ,e.row_created_by_user_id
      ,grade
	  FROM CTC.ctc.entity e
	left outer join ctc.entity_facility ef
	on e.entity_id = ef.entity_id
	left outer join ctc.facility f
	on ef.facility_id = f.facility_id
	inner join ctc.entity_type et
	on e.entity_type_id = et.entity_type_id
	inner join ctc.ethnicity eth
	on e.ethnicity = eth.ethnicity
		where (ef.status_flag = 1 OR ef.status_flag IS NULL) 
		AND e.entity_id = @id


end



--SELECT max(ef.status_flag)
--		FROM ctc.entity_facility ef
--		WHERE ef.entity_id = 83638