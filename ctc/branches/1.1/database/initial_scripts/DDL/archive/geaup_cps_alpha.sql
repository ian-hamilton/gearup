create table gearup.cps_alpha
(cps_alpha_id bigint identity(1,1) primary key,
upload_file varchar(500) null,
school_year int null,
comment varchar(max) null,
upload_date datetime null,
import_start_date datetime null,
import_end_date datetime null,
database_process_start_date datetime null,
database_process_end_date datetime null,
error varchar(max) null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)



