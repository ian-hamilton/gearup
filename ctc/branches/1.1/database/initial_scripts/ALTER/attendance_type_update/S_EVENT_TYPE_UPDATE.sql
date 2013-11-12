

begin transaction

update ctc.event_attendance
set event_attendance_type_id = 3

where event_id in(select e.event_id
from ctc.events e
where upper(substring(e.apr_code,1,1)) = 'S')
and ctc_id is null

commit transaction

