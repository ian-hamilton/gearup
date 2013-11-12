

drop table ctc.event_attendance_type

create table ctc.event_attendance_type
(event_attendance_type_id bigint primary key,
event_attendance_name varchar(50) not null,
status_flag int not null)


alter table ctc.event_attendance
drop column attendance_type

alter table ctc.event_attendance
add event_attendance_type_id bigint null


alter table ctc.event_attendance
with check
add constraint fk_ctc_event_attendance_4
foreign key (event_attendance_type_id)
references ctc.event_attendance_type(event_attendance_type_id)

go

create nonclustered
index ix_ctc_attendance_4
on ctc.event_attendance(event_attendance_type_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


begin transaction

insert into ctc.event_attendance_type values (1, 'family', 1)
insert into ctc.event_attendance_type values (2, 'staff', 1)
insert into ctc.event_attendance_type values (3, 'facilitator', 1)
insert into ctc.event_attendance_type values (4, 'volunteer', 1)


commit transaction