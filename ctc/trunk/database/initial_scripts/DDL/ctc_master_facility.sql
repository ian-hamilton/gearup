

--drop table ctc.master_facilty
--go

create table ctc.master_facility
(master_facility_id bigint identity(1,1) not null,
ctc_id bigint not null,
facility_id bigint not null,
acceptance_letter_flag int not null default 0,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
)
go

alter table ctc.master_facility
add constraint pk_master_facility
primary key (master_facility_id)
go

alter table ctc.master_facility
add constraint fk_master_facility_1
foreign key (ctc_id)
references ctc.ctc_master(ctc_id)
go

create nonclustered 
index ix_master_facility_1
on ctc.master_facility(ctc_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
go

alter table ctc.master_facility
add constraint fk_master_facility_2
foreign key (facility_id)
references ctc.facility(facility_id)
go

create nonclustered 
index ix_master_facility_2
on ctc.master_facility(facility_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
go