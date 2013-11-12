--drop table ctc.rpt_report_option
drop table ctc.rpt_report_detail

drop table ctc.rpt_report_process
drop table ctc.rpt_control_type

create table ctc.rpt_report_process
(report_id bigint identity(1,1) primary key,
report_name varchar(50) not null,
report_desc varchar(250) null,
report_function_name varchar(50) not null,
status_flag int NOT NULL DEFAULT ((1)),
row_created datetime NOT NULL DEFAULT (getdate()),
row_updated datetime NOT NULL DEFAULT (getdate()),
row_created_by_user_id varchar(15) NOT NULL,
row_updated_by_user_id varchar(15) NOT NULL)

go

begin transaction

insert into ctc.rpt_report_process (report_name, report_desc, report_function_name, row_created_by_user_id, row_updated_by_user_id)
values ('test_report','The kewlest dynamic report ever','ctc.f_rpt_test','csystem','csystem')

commit transaction
go


---------------------- control type for control factory ----------------------



create table ctc.rpt_control_type
(control_type_id bigint identity(1,1) primary key,
control_type varchar(100) not null,
status_flag int not null default 1)

go

begin transaction

insert into ctc.rpt_control_type (control_type) values ('ajax_calendar_extender')
insert into ctc.rpt_control_type (control_type) values ('text_box')
insert into ctc.rpt_control_type (control_type) values ('selection')
insert into ctc.rpt_control_type (control_type) values ('radio')

commit transaction


-------------------------------- parameter detail for report --------------------



create table ctc.rpt_report_detail
(report_detail_id bigint identity(1,1) primary key,
report_id bigint not null,
parameter_name varchar(50) not null,
parameter_type varchar(50) not null,
control_type_id bigint not null,
parameter_control_id varchar(50) not null,
display_label varchar(100) not null,
control_sequence int not null,
options_sql varchar(1000) null,
status_flag int NOT NULL DEFAULT ((1)),
row_created datetime NOT NULL DEFAULT (getdate()),
row_updated datetime NOT NULL DEFAULT (getdate()),
row_created_by_user_id varchar(15) NOT NULL,
row_updated_by_user_id varchar(15) NOT NULL)

ALTER TABLE [ctc].[rpt_report_detail]  
WITH CHECK 
ADD  CONSTRAINT [fk_rpt_report_detail_1] 
FOREIGN KEY([report_id])
REFERENCES [ctc].[rpt_report_process] ([report_id])

ALTER TABLE [ctc].[rpt_report_detail]  
WITH CHECK 
ADD  CONSTRAINT [fk_rpt_report_detail_2] 
FOREIGN KEY([control_type_id])
REFERENCES [ctc].[rpt_control_type] ([control_type_id])

go

begin transaction

insert into ctc.rpt_report_detail
(report_id, parameter_name, parameter_type, control_type_id, parameter_control_id, display_label, control_sequence, row_created_by_user_id, row_updated_by_user_id)
values (1, '@start_date', 'datetime',1,'calander_start_date', 'Start Date', 1, 'csystem', 'csystem')

insert into ctc.rpt_report_detail
(report_id, parameter_name, parameter_type, control_type_id, parameter_control_id, display_label, control_sequence, row_created_by_user_id, row_updated_by_user_id)
values (1, '@end_date', 'datetime',1,'calander_end_date', 'End Date', 2, 'csystem', 'csystem')


insert into ctc.rpt_report_detail
(report_id, parameter_name, parameter_type, control_type_id, parameter_control_id, display_label, control_sequence, options_sql, row_created_by_user_id, row_updated_by_user_id)
values (1, '@report_options', 'varchar',3,'test_option_box', 'Test Select', 3, 'select distinct event_attendance_name, event_attendance_type_id from ctc.event_attendance_type', 'csystem', 'csystem')


insert into ctc.rpt_report_detail
(report_id, parameter_name, parameter_type, control_type_id, parameter_control_id, display_label, control_sequence, options_sql, row_created_by_user_id, row_updated_by_user_id)
values (1, '@report_radio', 'varchar', 4, 'test_radio', 'Test Radio Box', 4, 'select distinct event_attendance_name, event_attendance_type_id from ctc.event_attendance_type', 'csystem', 'csystem')

commit transaction

go



--
--create table ctc.rpt_report_option
--(report_option_id bigint identity(1,1) primary key,
--report_detail_id bigint not null,
--option_display varchar(50) not null,
--option_value varchar(100) not null,
--option_sequence int not null,
--status_flag int NOT NULL DEFAULT ((1)),
--row_created datetime NOT NULL DEFAULT (getdate()),
--row_updated datetime NOT NULL DEFAULT (getdate()),
--row_created_by_user_id varchar(15) NOT NULL,
--row_updated_by_user_id varchar(15) NOT NULL)
--
--
--ALTER TABLE [ctc].[rpt_report_option]  
--WITH CHECK 
--ADD  CONSTRAINT [fk_rpt_report_option_2] 
--FOREIGN KEY([report_detail_id])
--REFERENCES [ctc].[rpt_report_detail] ([report_detail_id])
--
--go
--
--begin transaction
--
--insert into ctc.rpt_report_option
--(report_detail_id, option_display, option_value, option_sequence, row_created_by_user_id, row_updated_by_user_id)
--values(3, 'first_option', 'first', 1, 'csystem', 'csystem')
--
--insert into ctc.rpt_report_option
--(report_detail_id, option_display, option_value, option_sequence, row_created_by_user_id, row_updated_by_user_id)
--values(3, 'second_option', 'second', 2, 'csystem', 'csystem')
--
--commit transaction
--
--go