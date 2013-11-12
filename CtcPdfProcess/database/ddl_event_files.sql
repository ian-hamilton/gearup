create table ctc.file_repository
(file_repository_id bigint identity(1,1) not null,
file_name varchar(128)  not null,
file_blob varbinary(max) null,
status_flag int default 1 not null,
row_created datetime not null,
row_updated datetime not null,
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)


alter table ctc.file_repository
add constraint pk_file_repository
primary key (file_repository_id)
go


create table ctc.event_file
(event_file_id bigint identity(1,1) not null,
event_id bigint not null,
file_repository_id bigint not null,
status_flag int default 1 not null,
row_created datetime not null,
row_updated datetime not null,
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

alter table ctc.event_file
add constraint pk_event_file
primary key(event_file_id)

alter table ctc.event_file
add constraint fk_event_file_1
foreign key (event_id)
references ctc.events(event_id)

create nonclustered index
ix_event_file_1
on ctc.event_file(event_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

alter table ctc.event_file
add constraint fk_event_file_2
foreign key (file_repository_id)
references ctc.file_repository(file_repository_id)

create nonclustered index
ix_event_file_2
on ctc.event_file(file_repository_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
go