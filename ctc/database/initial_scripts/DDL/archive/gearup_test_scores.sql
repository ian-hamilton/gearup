create table gearup.test_scores
(test_score_id bigint identity(1,1) primary key,
annual_test_id bigint null,
alpha_test_id bigint null,
test_category varchar(100) not null,
test_score varchar(10) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
)

go

alter table gearup.test_scores
with check 
add constraint fk_gearup_test_scores_1
foreign key(annual_test_id)
references gearup.annual_tests(annual_test_id)

go