drop table ctc.it_pre_event_program
drop table ctc.it_pre_events

------------------------------------------------------------------

create table ctc.it_pre_events
(event_id bigint identity(1,1),
event_title varchar(100) not null,
apr_code varchar(6) not null,
date_of_service datetime not null,
start_time datetime null,
end_time datetime null,
--location varchar(30) null,
host_facility_id bigint not null,
event_comment varchar(1000) null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.it_pre_events
ADD CONSTRAINT
pk_ctc_it_pre_events PRIMARY KEY NONCLUSTERED
(
event_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.it_pre_events
with check
add constraint fk_ctc_it_pre_events_1
foreign key (apr_code)
references ctc.apr(apr_code)
on delete cascade

go

alter table ctc.it_pre_events
with check
add constraint fk_ctc_it_pre_events_2
foreign key (host_facility_id)
references ctc.facility(facility_id)
on delete cascade

go

create nonclustered
index ix_ctc_it_pre_events_1
on ctc.it_pre_events(apr_code asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index is_ctc_it_pre_events_2
on ctc.it_pre_events(host_facility_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)


-------------------------------------------------------------------

create table ctc.it_pre_event_program
(event_program_id bigint identity(1,1),
event_id bigint not null,
program_id bigint not null,
amount float,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.it_pre_event_program
ADD CONSTRAINT
pk_ctc_it_pre_event_program PRIMARY KEY NONCLUSTERED
(
event_program_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.it_pre_event_program
with check 
add constraint fk_ctc_it_pre_event_program_1
foreign key (event_id)
references ctc.events(event_id)
on delete cascade

go

alter table ctc.it_pre_event_program
with check
add constraint fk_ctc_it_pre_event_program_2
foreign key (program_id)
references ctc.program(program_id)
on delete cascade

go

create nonclustered
index ix_ctc_it_pre_event_program_1
on ctc.it_pre_event_program(event_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_it_pre_event_program_2
on ctc.it_pre_event_program(program_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go