
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_event'
)
DROP PROCEDURE ctc.info_event
go
---------------------------------------------------------

create procedure ctc.info_event @id bigint
as
begin


	SELECT event_id
      ,event_title
      ,apr_desc
      ,date_of_service
      ,start_time
      ,end_time
      ,fac.facility_name
      ,event_comment
      ,ev.status_flag
      ,ev.row_created
      ,ev.row_created_by_user_id
      ,en.first_name + ' ' + en.last_name as 'ResponsibleEntity'
  FROM CTC.ctc.events ev
inner join ctc.apr
on ev.apr_code = apr.apr_code
left outer join ctc.entity en
on  ev.responsible_entity_id = en.entity_id 
left outer join ctc.facility fac
on ev.host_facility_id = fac.facility_id
	where event_id = @id

end