create table ctc.ethnicity
(ethnicity int not null,
ethnicity_desc varchar(30) not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)


go

ALTER TABLE ctc.ethnicity
ADD CONSTRAINT
pk_ctc_ethnicity PRIMARY KEY NONCLUSTERED
(
ethnicity
)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

go



create nonclustered
index ix_ctc_entity_1
on ctc.entity(entity_type_id asc)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go

------------------------------------------------------------------------------------------------

begin transaction

	delete from ctc.IT_import_stage_2

commit transaction

bulk
insert ctc.IT_import_stage_2
from 'c:\ctc_mount_point\ethnicity.txt'
with
(
	fieldterminator = '\t',
	rowterminator='\n',
	KEEPNULLS
)



begin transaction

	insert into ctc.ethnicity(ethnicity, ethnicity_desc, row_created_by_user_id, row_updated_by_user_id)
	select rtrim(ltrim(field1)), rtrim(ltrim(field2)), 'csystem', 'csystem' 
	from ctc.IT_import_stage_2


commit transaction

begin transaction

	update ctc.entity
	set ethnicity = (select distinct ethnicity from ctc.ethnicity where ethnicity_desc = 'Unknown')
	where ethnicity is null

commit transaction




--------------------------------------------------------------------------------------------

alter table ctc.entity
alter column ethnicity int not null

go

alter table ctc.entity
add constraint fk_ctc_entity_2
foreign key (ethnicity)
references ctc.ethnicity(ethnicity)

go


create nonclustered 
index ix_ctc_entity_2
on ctc.entity(ethnicity)
WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

go