

begin transaction

update ctc.event_attendance
set event_attendance_type_id = 1

where event_id in(select e.event_id
from ctc.events e
where upper(substring(e.apr_code,1,1)) in ('P', 'F'))

and entity_id in
(select entity_id
from ctc.entity entity
inner join ctc.entity_type t on entity.entity_type_id = t.entity_type_id
where  t.entity_type_desc = 'Parent')


and ctc_id is null

commit transaction

---------------------------------------------------------------------------

begin transaction

update ctc.event_attendance
set event_attendance_type_id = 3

where event_id in(select e.event_id
from ctc.events e
where upper(substring(e.apr_code,1,1)) in ('P', 'F'))

and entity_id in
(select entity_id
from ctc.entity entity
inner join ctc.entity_type t on entity.entity_type_id = t.entity_type_id
where  t.entity_type_desc != 'Parent')


and ctc_id is null

commit transaction