
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_event_target'
)
DROP PROCEDURE ctc.info_event_target
go
---------------------------------------------------------

create procedure ctc.info_event_target @id bigint
as
begin

	select fac.facility_name

	from ctc.event_facility ef
	inner join ctc.facility fac
	on ef.facility_id = fac.facility_id
	where ef.event_id = @id
	and ef.status_flag = 1
	order by fac.facility_name

end