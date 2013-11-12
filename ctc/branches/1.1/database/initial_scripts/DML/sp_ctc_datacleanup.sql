IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'data_cleanup'
)
DROP PROCEDURE ctc.data_cleanup
go
---------------------------------------------------------

create procedure ctc.data_cleanup
as



begin

	begin transaction

	update ctc.facility
	set ctc.facility.phone = clean.phone,
	ctc.facility.phone_alt = clean.phone_alt,
	ctc.facility.fax = clean.fax,
	ctc.facility.lunchroom = clean.lunchroom,
	ctc.facility.engineering = clean.engineering

	from

	(select facility_id, 
		ltrim(rtrim(replace(replace(replace(replace(phone, '(', ''), ' ',''), '-',''), ')',''))) phone,
		ltrim(rtrim(replace(replace(replace(replace(phone_alt, '(', ''), ' ',''), '-',''), ')',''))) phone_alt,
		ltrim(rtrim(replace(replace(replace(replace(fax, '(', ''), ' ',''), '-',''), ')',''))) fax,
		ltrim(rtrim(replace(replace(replace(replace(lunchroom, '(', ''), ' ',''), '-',''), ')',''))) lunchroom,
		ltrim(rtrim(replace(replace(replace(replace(engineering, '(', ''), ' ',''), '-',''), ')',''))) engineering
		from ctc.facility) clean

	where ctc.facility.facility_id = clean.facility_id 
		

	
	commit transaction
end