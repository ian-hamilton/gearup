/* drop tables for re-build */

drop table ctc.master_entity

drop table ctc.master_programs

--drop table ctc.event_entity

drop table ctc.attendance_exception
drop table ctc.facility_programs

drop table ctc.event_facility

drop table ctc.event_funding

drop table ctc.attendance_profile

drop table ctc.test_scores
drop table ctc.annual_tests

drop table ctc.import_row_error
drop table ctc.upload

drop table ctc.security_user_facility

drop table ctc.security_user
drop table ctc.security_group
 
drop table ctc.grades

drop table ctc.event_attendance
drop table ctc.entity



drop table ctc.alpha_student
drop table ctc.ctc_master


drop table ctc.events
drop table ctc.apr
drop table ctc.funding

drop table ctc.profile_descriptor

drop table ctc.facility



drop table ctc.facility_type
drop table ctc.entity_type
drop table ctc.test_type
drop table ctc.program


/* ------------ master ----------------*/

create table ctc.ctc_master
(ctc_id bigint identity(1,1),
cps_id bigint not null,
address_1 varchar(30) null,
address_2 varchar(30) null,
city varchar(7) null,
state varchar(2) null,
zip varchar(10) null,
phone_1 varchar(11) null,
phone_2 varchar(11) null,
status_comment varchar(1000),
start_semester int,
primary_language int,
alternate_fall_id int,
original_guid int,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
)

go

ALTER TABLE ctc.ctc_master
ADD CONSTRAINT
pk_ctc_ctc_master PRIMARY KEY NONCLUSTERED
(
ctc_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go
----------------------progam types ----------------
create table ctc.program
(program_id bigint identity(1,1),
program_name varchar(50) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.program
ADD CONSTRAINT
pk_ctc_program_type PRIMARY KEY NONCLUSTERED
(
program_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go
------------------- CTC progam ---------------
create table ctc.master_programs
(master_programs_id bigint identity(1,1),
ctc_id bigint not null,
program_id bigint not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)


ALTER TABLE ctc.master_programs
ADD CONSTRAINT
pk_ctc_master_progams PRIMARY KEY NONCLUSTERED
(
master_programs_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.master_programs
add constraint fk_ctc_master_programs_1
foreign key (ctc_id)
references ctc.ctc_master(ctc_id)
on delete cascade

go

alter table ctc.master_programs
add constraint fk_ctc_master_programs_2
foreign key (program_id)
references ctc.program(program_id)

go

create nonclustered 
index ix_ctc_master_programs_1
on ctc.master_programs(ctc_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_master_programs_2
on ctc.master_programs(program_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


/* ----------- alpha student ---------- */
create table ctc.alpha_student
(alpha_student_id	bigint identity(1,1),
ctc_id bigint NOT NULL,
division int not null,
first_name varchar(18) not null,
middle_initial varchar(1) null,
last_name varchar(18) not null,
gender varchar(1) not null,
ethnicity int null,
iep varchar(1) null,
lep int null,
grade int not null,
unit int not null,
relation_code int null,
relation_name varchar(30) null,
dob datetime null,
loss_code int null,
cps_status varchar(2) null,
upload_id bigint not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.alpha_student
ADD CONSTRAINT
pk_ctc_alpha_student PRIMARY KEY NONCLUSTERED
(
alpha_student_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.alpha_student
with nocheck
add constraint fk_ctc_alpha_student_1
foreign key (ctc_id)
references ctc.ctc_master(ctc_id)
on delete cascade

go

create nonclustered
index ix_ctc_alpha_student_1
on ctc.alpha_student(ctc_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

-------------------- entity type --------------
create table ctc.entity_type
(entity_type_id bigint identity(1,1),
entity_type_desc varchar(200) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
) 

go

ALTER TABLE ctc.entity_type
ADD CONSTRAINT
pk_ctc_entity_type PRIMARY KEY NONCLUSTERED
(
entity_type_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

--------------- entity -------------------------
create table ctc.entity
(entity_id bigint identity(1,1),
entity_type_id bigint not null,
first_name varchar(18) not null,
middle_initial varchar(1) null,
last_name varchar(18) not null,
gender varchar(1) not null,
ethnicity int null,
dob datetime null,
relation varchar(10) null,
unit int null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.entity
ADD CONSTRAINT
pk_ctc_entity PRIMARY KEY NONCLUSTERED
(
entity_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.entity
with nocheck
add constraint fk_ctc_entity_1
foreign key (entity_type_id)
references ctc.entity_type(entity_type_id)
on delete cascade

go

create nonclustered
index ix_ctc_entity_1
on ctc.entity(entity_type_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

------------------- master_entity (parent)-----------------
create table ctc.master_entity
(master_entity_id bigint identity(1,1),
ctc_id bigint not null,
entity_id bigint not null,
view_sequence int not null default 0,
reside_flag int not null default 0,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.master_entity
ADD CONSTRAINT
pk_ctc_master_entity PRIMARY KEY NONCLUSTERED
(
master_entity_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.master_entity
add constraint fk_ctc_master_entity_1
foreign key (ctc_id)
references ctc.ctc_master(ctc_id)
on delete cascade

go

alter table ctc.master_entity
add constraint fk_ctc_master_entity_2
foreign key (entity_id)
references ctc.entity(entity_id)
on delete cascade

go

create nonclustered
index ix_ctc_master_entity_1
on ctc.master_entity(ctc_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_master_entity_2
on ctc.master_entity(entity_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


------------------ grades -----------------------

create table ctc.grades
(alpha_grade_id bigint identity(1,1),
ctc_id bigint not null,
course_grade varchar(1) not null,
course_number int not null,
course_name varchar(30) not null,
unit_number int not null,
section_number int not null,
period_number int not null,
class_absences int null,
cumulative_absences int null,
GPA numeric(3,2) null,
school_year int not null,
semester int not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.grades
ADD CONSTRAINT
pk_ctc_grades PRIMARY KEY NONCLUSTERED
(
alpha_grade_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.grades
with check
add constraint fk_ctc_grades_1
foreign key (ctc_id)
references ctc.ctc_master(ctc_id)
on delete cascade

go

create nonclustered 
index ix_ctc_grades_1
on ctc.grades(ctc_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


-------------------- test type ----------------

create table ctc.test_type
(test_type_id bigint identity(1,1),
test_type_desc varchar(200) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
)

go

ALTER TABLE ctc.test_type
ADD CONSTRAINT
pk_ctc_test_type PRIMARY KEY NONCLUSTERED
(
test_type_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

-------------------- annual test -----------------
create table ctc.annual_tests
(annual_test_id bigint identity(1,1),
ctc_id bigint not null,
school_year int not null,
test_type_id bigint not null,
comment varchar(max) null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
)

go

ALTER TABLE ctc.annual_tests
ADD CONSTRAINT
pk_ctc_annual_tests PRIMARY KEY NONCLUSTERED
(
annual_test_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.annual_tests
with check
add constraint fk_ctc_annual_tests_1
foreign key(test_type_id)
references ctc.test_type(test_type_id)
on delete cascade

go

alter table ctc.annual_tests
with check
add constraint fk_ctc_annual_tests_2
foreign key(ctc_id)
references ctc.ctc_master(ctc_id)
on delete cascade

go

create nonclustered
index ix_ctc_annual_tests_1
on ctc.annual_tests(test_type_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_annual_tests_2
on ctc.annual_tests(ctc_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)


-------------------- scores -------------------------
create table ctc.test_scores
(test_score_id bigint identity(1,1),
annual_test_id bigint null,
alpha_test_id bigint null,
score_category varchar(100) not null,
test_score varchar(10) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
)

ALTER TABLE ctc.test_scores
ADD CONSTRAINT
pk_ctc_test_scores PRIMARY KEY NONCLUSTERED
(
test_score_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

go

alter table ctc.test_scores
with check 
add constraint fk_ctc_test_scores_1
foreign key(annual_test_id)
references ctc.annual_tests(annual_test_id)
on delete cascade

go

create nonclustered
index ix_ctc_test_scores_1
on ctc.test_scores(annual_test_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

------------------ apr table -------------------------
create table ctc.apr
(apr_code varchar(6) not null,
apr_desc varchar(1000) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.apr
ADD CONSTRAINT
pk_ctc_apr PRIMARY KEY NONCLUSTERED
(
apr_code
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

------------------- facility type ----------------
create table ctc.facility_type
(facility_type_id bigint identity(1,1),
facility_type_name varchar(30) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.facility_type
ADD CONSTRAINT
pk_ctc_facility_type PRIMARY KEY NONCLUSTERED
(
facility_type_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

--------------------- facility --------------------
create table ctc.facility
(facility_id bigint identity(1,1),
facility_name varchar(100) not null,
facility_desc varchar(1000) null,
facility_type bigint not null,
address_1 varchar(30) null,
address_2 varchar(30) null,
city varchar(7) null,
state varchar(2) null,
zip varchar(10) null,
phone_1 varchar(11) null,
phone_2 varchar(11) null,
is_warning_list int not null default 0,
facility_comment varchar(1000) null,
principal_entity_id bigint null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.facility
ADD CONSTRAINT
pk_ctc_facility PRIMARY KEY NONCLUSTERED
(
facility_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.facility
with check 
add constraint fk_ctc_facility_1
foreign key (facility_type)
references ctc.facility_type(facility_type_id)
on delete cascade

go

create nonclustered
index ix_ctc_facility_1
on ctc.facility(facility_type asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go



-------------------- facility programs ---------
create table ctc.facility_programs
(facility_programs_id bigint identity(1,1),
facility_id bigint not null,
program_id bigint not null,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.facility_programs
ADD CONSTRAINT
pk_ctc_facility_programs PRIMARY KEY NONCLUSTERED
(
facility_programs_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.facility_programs
add constraint fk_ctc_facility_programs_1
foreign key (facility_id)
references ctc.facility(facility_id)
on delete cascade

go

alter table ctc.facility_programs
add constraint fk_ctc_facility_progams_2
foreign key (program_id)
references ctc.program(program_id)

go

create nonclustered
index ix_ctc_facility_programs_1
on ctc.facility_programs(facility_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_facility_programs_2
on ctc.facility_programs(program_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


---------------------- events -------------------------
create table ctc.events
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

ALTER TABLE ctc.events
ADD CONSTRAINT
pk_ctc_events PRIMARY KEY NONCLUSTERED
(
event_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.events
with check
add constraint fk_ctc_events_1
foreign key (apr_code)
references ctc.apr(apr_code)
on delete cascade

go

alter table ctc.events
with check
add constraint fk_ctc_events_2
foreign key (host_facility_id)
references ctc.facility(facility_id)
on delete cascade

go

create nonclustered
index ix_gerarup_events_1
on ctc.events(apr_code asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index is_ctc_events_2
on ctc.events(host_facility_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)


--------------------- funding ----------------

create table ctc.funding
(funding_id bigint identity(1,1),
funding_name varchar(30) not null,
funding_comment varchar(1000) null,
match_flag int not null default 0,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.funding
ADD CONSTRAINT
pk_ctc_funding PRIMARY KEY NONCLUSTERED
(
funding_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

---------------------event x-refs -----------------------
--create table ctc.event_entity
--(event_entity_id bigint identity(1,1),
--event_id bigint not null,
--entity_id bigint not null,
--status_flag int not null default 1,
--row_created datetime not null default getdate(),
--row_updated datetime not null default getdate(),
--row_created_by_user_id varchar(15) not null,
--row_updated_by_user_id varchar(15) not null)
--
--go
--
--ALTER TABLE ctc.event_entity
--ADD CONSTRAINT
--pk_ctc_event_entity PRIMARY KEY NONCLUSTERED
--(
--event_entity_id 
--)
--WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
--ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
--
--go
--
--alter table ctc.event_entity
--with check
--add constraint fk_ctc_event_entity_1
--foreign key (event_id)
--references ctc.events(event_id)
--on delete cascade
--
--go
--
--alter table ctc.event_entity
--with check
--add constraint fk_ctc_event_entity_2
--foreign key (entity_id)
--references ctc.entity(entity_id)
--on delete cascade
--
--go
--
--create nonclustered
--index ix_ctc_event_entity_1
--on ctc.event_entity(event_id asc)
--WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
--DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
--ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
--
--go
--
--create nonclustered
--index ix_ctc_event_entity_2
--on ctc.event_entity(entity_id asc)
--WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
--DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
--ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
--
--go

----------------------------attendance --------------------------
create table ctc.event_attendance
(event_attendance_id bigint identity(1,1),
event_id bigint not null,
ctc_id bigint null,
entity_id bigint null,
approval_flag int default 0,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.event_attendance
ADD CONSTRAINT
pk_ctc_event_attendance PRIMARY KEY NONCLUSTERED
(
event_attendance_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.event_attendance
with check
add constraint fk_ctc_event_attendance_1
foreign key (event_id)
references ctc.events(event_id)
on delete cascade

go

alter table ctc.event_attendance
with check
add constraint fk_ctc_event_attendance_2
foreign key (ctc_id)
references ctc.ctc_master(ctc_id)
on delete cascade

go

alter table ctc.event_attendance
with check
add constraint fk_ctc_event_attendance_3
foreign key (entity_id)
references ctc.entity(entity_id)

go

create nonclustered 
index ix_ctc_attendance_1
on ctc.event_attendance(event_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_attendance_2
on ctc.event_attendance(ctc_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_attendance_3
on ctc.event_attendance(entity_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)



------------------------ event facility --------------------------
create table ctc.event_facility
(event_facility_id bigint identity(1,1),
event_id bigint not null,
facility_id bigint not null,
unit int null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.event_facility
ADD CONSTRAINT
pk_ctc_event_facility PRIMARY KEY NONCLUSTERED
(
event_facility_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go
alter table ctc.event_facility
with check
add constraint fk_ctc_event_facility_1
foreign key (event_id)
references ctc.events(event_id)
on delete cascade

go

alter table ctc.event_facility
with check
add constraint fk_ctc_event_facility_2
foreign key(facility_id)
references ctc.facility(facility_id)

go

create nonclustered
index ix_ctc_event_facility_1
on ctc.event_facility(event_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_event_facility_2
on ctc.event_facility(facility_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go
--------------------- funding x-ref ----------------------
create table ctc.event_funding
(event_funding_id bigint identity(1,1),
event_id bigint not null,
funding_id bigint not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.event_funding
ADD CONSTRAINT
pk_ctc_event_funding PRIMARY KEY NONCLUSTERED
(
event_funding_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.event_funding
with check 
add constraint fk_ctc_event_funding_1
foreign key (event_id)
references ctc.events(event_id)
on delete cascade

go

alter table ctc.event_funding
with check
add constraint fk_ctc_event_funding_2
foreign key (funding_id)
references ctc.funding(funding_id)
on delete cascade

go

create nonclustered
index ix_ctc_event_funding_1
on ctc.event_funding(event_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_event_funding_2
on ctc.event_funding(funding_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

----------------------------profile desciptors ---------------
create table ctc.profile_descriptor
(profile_descriptor_id bigint identity(1,1),
descriptor_display varchar(50) not null,
desctiptor_description varchar(1000) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.profile_descriptor
ADD CONSTRAINT
pk_ctc_profile_descriptor PRIMARY KEY NONCLUSTERED
(
profile_descriptor_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

---------------------------- Tutor/teacher Comments --------------------
create table ctc.attendance_profile
(attendance_profile_id bigint identity(1,1),
event_attendance_id bigint not null,
profile_descriptor_id bigint not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.attendance_profile
ADD CONSTRAINT
pk_ctc_attendance_profile PRIMARY KEY NONCLUSTERED
(
attendance_profile_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.attendance_profile
with check
add constraint fk_ctc_attendance_profile_1
foreign key (event_attendance_id)
references ctc.event_attendance(event_attendance_id)
on delete cascade

go

alter table ctc.attendance_profile
with check
add constraint fk_ctc_attendance_profile_2
foreign key (profile_descriptor_id)
references ctc.profile_descriptor(profile_descriptor_id)
on delete cascade

go

create nonclustered
index ix_ctc_attendance_profile_1
on ctc.attendance_profile(event_attendance_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_attendance_profile_2
on ctc.attendance_profile(profile_descriptor_id)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go



---------------------------- security group ---------------------
create table ctc.security_group
(security_group_id bigint identity(1,1),
group_name varchar(50) not null,
group_information varchar(1000) null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.security_group
ADD CONSTRAINT
pk_ctc_security_group PRIMARY KEY NONCLUSTERED
(
security_group_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go
------------------------- security user ---------------------------
create table ctc.security_user
(security_id bigint identity(1,1),
security_user_id  varchar(15) not null unique,
first_name varchar(50) not null,
last_name varchar(50) not null,
middle_initial varchar(1) null,
email_address varchar(50) not null,
phone_number varchar(11) not null,
password_expiration_flag int default 1,
idle_expiration_flag int default 1,
--facility_id bigint not null,
security_group_id bigint not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.security_user
ADD CONSTRAINT
pk_ctc_security_user PRIMARY KEY NONCLUSTERED
(
security_id 
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.security_user
with check
add constraint fk_ctc_security_user_1
foreign key (security_group_id)
references ctc.security_group(security_group_id)
on delete cascade

go

create nonclustered
index ix_ctc_security_user_1
on ctc.security_user(security_group_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

------------------------ security facility -----------------
create table ctc.security_user_facility
(security_user_facility bigint identity(1,1),
security_id bigint not null,
facility_id bigint not null,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.security_user_facility
ADD CONSTRAINT
pk_ctc_security_user_facility PRIMARY KEY NONCLUSTERED
(
security_user_facility
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.security_user_facility
with check
add constraint fk_ctc_security_user_facility_1
foreign key (security_id)
references ctc.security_user(security_id)
on delete cascade

go

alter table ctc.security_user_facility
with check
add constraint fk_ctc_security_user_facility_2
foreign key (facility_id)
references ctc.facility(facility_id)
on delete cascade

go

create nonclustered
index ix_ctc_security_user_facility_1
on ctc.security_user_facility(security_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

create nonclustered
index ix_ctc_security_user_facility_2
on ctc.security_user_facility(facility_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go


------------------------ upload ----------------------
create table ctc.upload
(upload_id bigint identity(1,1),
upload_file varchar(500) null,
semester varchar(4) null,
comment varchar(1000) null,
upload_date datetime null,
import_start_date datetime null,
import_end_date datetime null,
database_process_start_date datetime null,
database_process_end_date datetime null,
error varchar(1000) null,
import_row_count int not null default 0,
rejected_row_count int not null default 0,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.upload
ADD CONSTRAINT
pk_ctc_upload PRIMARY KEY NONCLUSTERED
(
upload_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go


------------------ row error -----------------------
create table ctc.import_row_error
(import_row_error_id bigint identity(1,1),
upload_id bigint not null,
row_error varchar(4000) not null,
cps_id bigint null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

ALTER TABLE ctc.import_row_error
ADD CONSTRAINT
pk_ctc_import_row_error PRIMARY KEY NONCLUSTERED
(
import_row_error_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go

alter table ctc.import_row_error
with check
add constraint fk_ctc_import_row_error_1
foreign key (upload_id)
references ctc.upload(upload_id)
on delete cascade

go

create nonclustered
index ix_geaup_import_row_error_1
on ctc.import_row_error(upload_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

------------------ event cps exception table ---------------
create table ctc.attendance_exception
(attendance_excpetion_id bigint identity(1,1),
cps_id bigint not null,
ctc_id bigint null,
retrieved_flag int not null default 0,
retrieved_by varchar(15) null,
upload_dt datetime null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

ALTER TABLE ctc.attendance_exception
ADD CONSTRAINT
pk_ctc_attendance_exception PRIMARY KEY NONCLUSTERED
(
attendance_excpetion_id
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


