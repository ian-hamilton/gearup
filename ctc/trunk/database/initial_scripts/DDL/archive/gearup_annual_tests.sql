create table gearup.annual_tests
(annual_test_id bigint identity(1,1) primary key,
gearup_id bigint not null,
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

alter table gearup.annual_tests
with check
add constraint fk_gearup_annual_tests_1
foreign key(test_type_id)
references gearup.test_type(test_type_id)

go

alter table gearup.annual_tests
with check
add constraint fk_gearup_annual_tests_2
foreign key(gearup_id)
references gearup.gearup_master(gearup_id)

go

