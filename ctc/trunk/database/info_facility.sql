IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_facility'
)
DROP PROCEDURE ctc.info_facility
go
---------------------------------------------------------

create procedure ctc.info_facility @id bigint
as
begin

	select facility_id,
	unit,
	facility_name,
	facility_desc,
	address_1,
	address_2,
	city,
	state,
	zip,
	misc_contact_name,
	phone,
	phone_alt,
	fax,
	lunchroom,
	engineering,
	url,
	grades,
	school_focus,
	facility_comment,
	long_school_name,
	schl_id,
	typ.facility_type_name
	from ctc.facility fac
	inner join ctc.facility_type typ
	on fac.facility_type_id = typ.facility_type_id
	and facility_id = @id

end