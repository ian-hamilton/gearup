IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'info_facility_event_participation'
)
DROP PROCEDURE ctc.info_facility_event_participation
go
---------------------------------------------------------

create procedure ctc.info_facility_event_participation @id bigint
as
begin

	
		select apr_desc, sum(current_period) current_period, sum(last_period) last_period
from		
(select events.apr_desc, events.date_of_service, 
current_period = CASE dates.currents when 1 then 1 else 0 end,
last_period = CASE  dates.currents when 2 then 1 else 0 end

from 

(select begin_date, end_date, 1 currents
from ctc.it_apr_period
where getdate() between begin_date and end_date

union

select begin_date, end_date, 2 currents
from ctc.it_apr_period
where dateadd(yy,-1,getdate()) between begin_date and end_date) dates,

(select ev.event_id, apr.apr_desc, ev.date_of_service

		from ctc.events ev
		inner join ctc.apr apr
			on ev.apr_code = apr.apr_code
		inner join
		(select e.event_id, date_of_service

		from ctc.events e
		inner join ctc.event_facility ef
			on e.event_id = ef.event_id

		where ef.facility_id = @id
		and ef.status_flag = 1
		and e.status_flag = 1

		union

		select e.event_id, date_of_service
		from ctc.events e
		where e.host_facility_id = @id
		and e.status_flag = 1)selected_events
			on ev.event_id = selected_events.event_id

		group by ev.event_id, apr.apr_desc, ev.date_of_service)events

where events.date_of_service between dates.begin_date and dates.end_date)base
group by apr_desc


end