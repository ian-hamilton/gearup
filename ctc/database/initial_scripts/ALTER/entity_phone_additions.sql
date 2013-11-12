exec sp_rename 'ctc.entity.[phone_2]', 'phone_mobile', 'COLUMN'

alter table ctc.entity
add phone_work varchar(10) null

go

alter table ctc.entity
add fax varchar(10) null

go

alter table ctc.entity
add phone_other varchar(10) null

go