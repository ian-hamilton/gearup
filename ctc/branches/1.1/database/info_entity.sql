IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_entity'
)
DROP PROCEDURE ctc.info_entity
go
---------------------------------------------------------

create procedure ctc.info_entity @id bigint
as
begin

	SELECT entity_id
      ,entity_type_desc
      ,title
      ,salutation
      ,first_name
      ,middle_initial
      ,last_name
      ,address_1
      ,address_2
      ,city
      ,state
      ,zip
      ,phone
      ,phone_mobile
	  ,phone_work
	  ,fax
	  ,phone_other
      ,email
      ,case lower(ltrim(rtrim(gender))) when 'f' then 'Female' else 'Male' end gender
      ,ethnicity_desc as ethnicity
      ,dob
      ,relation
      ,unit
      ,e.row_created
      ,e.row_created_by_user_id
      ,grade
	  FROM CTC.ctc.entity e
	inner join ctc.entity_type et
	on e.entity_type_id = et.entity_type_id
	inner join ctc.ethnicity eth
	on e.ethnicity = eth.ethnicity
		where e.entity_id = @id

end