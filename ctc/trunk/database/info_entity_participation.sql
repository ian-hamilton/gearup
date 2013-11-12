IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_entity_participation'
)
DROP PROCEDURE ctc.info_entity_participation
go
---------------------------------------------------------

create procedure ctc.info_entity_participation @id bigint
as
begin


	select apr.apr_desc, count(ev.event_id) event_counts

		from ctc.events ev
		inner join ctc.apr apr
			on ev.apr_code = apr.apr_code
		inner join
		(select e.event_id

		from ctc.events e
		inner join ctc.event_attendance ea
			on e.event_id = ea.event_id

		where ea.entity_id = @id
		and ea.status_flag = 1
		and e.status_flag = 1)selected_events
			on ev.event_id = selected_events.event_id

		group by apr.apr_desc

		order by apr.apr_desc

end