---------------------- System tables -------------------------

drop table ctc.IT_system_variables
drop table ctc.IT_system_semesters

----------------------------------------------------------------
create table ctc.IT_system_variables
( variable_id bigint identity(1,1) primary key,
variable_group varchar(50) not null,
variable_value varchar(50) null,
variable_desc varchar(1000) null)

go

--insert into ctc.A1_IT_system_variables (variable_group, variable_value, variable_desc)
--values 

------------------------------------------------------------------
create table ctc.IT_system_semesters
(semester_code varchar(10) primary key,
school_year varchar(9) not null,
actual_year int not null,
semester_number int not null)

go 

insert into ctc.IT_system_semesters values('06-0', '2005-2006', 2005, 0)
insert into ctc.IT_system_semesters values('06-1', '2005-2006', 2005, 1)
insert into ctc.IT_system_semesters values('06-2', '2005-2006', 2006, 2)
insert into ctc.IT_system_semesters values('06-3', '2005-2006', 2006, 3)
insert into ctc.IT_system_semesters values('07-0', '2006-2007', 2006, 0)
insert into ctc.IT_system_semesters values('07-1', '2006-2007', 2006, 1)
insert into ctc.IT_system_semesters values('07-2', '2006-2007', 2007, 2)
insert into ctc.IT_system_semesters values('07-3', '2006-2007', 2007, 3)
insert into ctc.IT_system_semesters values('08-0', '2007-2008', 2007, 0)
insert into ctc.IT_system_semesters values('08-1', '2007-2008', 2007, 1)
insert into ctc.IT_system_semesters values('08-2', '2007-2008', 2008, 2)
insert into ctc.IT_system_semesters values('08-3', '2007-2008', 2008, 3)
insert into ctc.IT_system_semesters values('09-0', '2008-2009', 2008, 0)
insert into ctc.IT_system_semesters values('09-1', '2008-2009', 2008, 1)
insert into ctc.IT_system_semesters values('09-2', '2008-2009', 2009, 2)
insert into ctc.IT_system_semesters values('09-3', '2008-2009', 2009, 3)


go

-------------------------profiles and options -----------------------------



--------------------------------------------------------------------

--drop table ctc.IT_eventfilemounts
--
--create table ctc.IT_eventfilemounts
--(filename varchar(500) unique,
--comment varchar(max) null,
--status_flag int not null default 1,
--import_dt datetime null,
--event_type varchar(30) null,
--error_message varchar(max) null)


--drop table ctc.IT_testfilemounts
--
--create table ctc.IT_testfilemounts
--(filename varchar(500) unique,
--comment varchar(max) null,
--status_flag int not null default 1,
--import_dt datetime null,
--error_message varchar(max) null)