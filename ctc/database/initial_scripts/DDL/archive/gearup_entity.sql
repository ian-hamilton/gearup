create table gearup.entity
(entity_id bigint identity(1,1) primary key,
entity_type_id bigint not null,
first_name varchar(18) not null,
middle_initial varchar(1) null,
last_name varchar(18) not null,
gender varchar(1) not null,
ethnicity int null,
dob datetime,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

alter table gearup.entity
with nocheck
add constraint fk_gearup_entity_1
foreign key (entity_type_id)
references gearup.entity_type(entity_type_id)

go