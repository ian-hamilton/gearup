create table gearup.alpha_student
(alpha_student_id	bigint identity(1,1) PRIMARY KEY,
gearup_id bigint NOT NULL,
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
dob datetime,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)
go

alter table gearup.alpha_student
with nocheck
add constraint fk_gearup_alpha_student_1
foreign key (gearup_id)
references gearup.gearup_master(gearup_id)
go

