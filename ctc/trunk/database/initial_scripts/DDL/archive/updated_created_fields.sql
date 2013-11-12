status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null
