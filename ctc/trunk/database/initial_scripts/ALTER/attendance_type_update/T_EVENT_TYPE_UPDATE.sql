begin transaction

update ctc.event_attendance
set event_attendance_type_id = 2

where event_id in(select e.event_id
from ctc.events e
where upper(substring(e.apr_code,1,1)) in ('T', 'M'))


and ctc_id is null

commit transaction