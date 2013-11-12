
--drop table ctc.user_unit
--drop table ctc.IT_link_manager
--drop table ctc.IT_web_log

create table ctc.user_unit
(user_unit_id bigint identity(1,1),
 unit int not null,
 username nvarchar(256) not null,
status_flag int null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.user_unit
ADD CONSTRAINT
pk_ctc_user_unit PRIMARY KEY NONCLUSTERED
(
user_unit_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

create nonclustered 
index ix_ctc_master_programs_1
on ctc.user_unit(unit)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered 
index ix_ctc_user_unit_2
on ctc.user_unit(username)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


-------------------------------------------------------------------------

create table ctc.IT_link_manager
(module_name varchar(50) not null,
link_url varchar(1000) not null,
link_display varchar(100) not null,
link_sequence int not null)

go

-------------------------------------------------------------------------

create table ctc.IT_content_manager
(module_name varchar(50) not null,
content_line_text varchar(1000) not null,
area varchar(100) not null,
line_sequence int not null)

go

---------------------------------------------------------------------------

create table ctc.IT_web_log
(web_log_id bigint identity(1,1) primary key,
log_error varchar(4000) null,
log_event varchar(4000) null,
log_date datetime default getdate(),
log_user_name varchar(30) null,
log_verified_flag int not null default 0)

go

---------------------------------------------------------------------------


