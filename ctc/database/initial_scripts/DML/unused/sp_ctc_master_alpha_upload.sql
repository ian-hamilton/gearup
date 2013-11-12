IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'master_alpha_upload'
)
DROP PROCEDURE ctc.master_alpha_upload
go
---------------------------------------------------------

create procedure ctc.master_alpha_upload
as

	declare @mycursor CURSOR
	
	declare @myfield1 varchar(max)
	declare @myfield2 varchar(max)
	declare @myfield3 varchar(max)
	declare @myfield4 varchar(max)
	declare @myfield5 varchar(max)
	declare @myfield6 varchar(max)
	declare @myfield7 varchar(max)
	declare @myfield8 varchar(max)
	declare @myfield9 varchar(max)
	declare @myfield10 varchar(max)
	declare @myfield11 varchar(max)
	declare @myfield12 varchar(max)
	declare @myfield13 varchar(max)
	declare @myfield14 varchar(max)
	declare @myfield15 varchar(max)
	declare @myfield16 varchar(max)

	declare @ctcid bigint

	declare @uploadid bigint

begin

	drop table ctc.A1_IT_import_stage_alpha

	delete from ctc.ctc_master
	--commit
	delete from ctc.alpha_student
	--commit
	delete from ctc.upload
	--commit

	create table ctc.A1_IT_import_stage_alpha
	(field1 varchar(max),
		field2 varchar(max),
		field3 varchar(max),
		field4 varchar(max),
		field5 varchar(max),
		field6 varchar(max),
		field7 varchar(max),
		field8 varchar(max),
		field9 varchar(max),
		field10 varchar(max),
		field11 varchar(max),
		field12 varchar(max),
		field13 varchar(max),
		field14 varchar(max),
		field15 varchar(max),
		field16 varchar(max))

	bulk
	insert ctc.A1_IT_import_stage_alpha
	from 'c:\ctc_mount_point\06C_Feb2006Mod2.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)



	--commit

	insert into ctc.upload(upload_file, upload_date, row_created_by_user_id, row_updated_by_user_id)
	values('06C_Feb2006Mod2.txt', getDate(), 'csystem', 'csystem')

	--commit

	set @uploadid = (select max(upload_id)
	from ctc.upload)

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select [field1], [field2], [field3], [field4], [field5], [field6], [field7], [field8], [field9], [field10], [field11], [field12], [field13], [field14], [field15], [field16]
	from ctc.A1_IT_import_stage_alpha

	OPEN  @mycursor
	fetch next from @mycursor
	into @myfield1,
		@myfield2,
		@myfield3,
		@myfield4,
		@myfield5,
		@myfield6,
		@myfield7,
		@myfield8,
		@myfield9,
		@myfield10,
		@myfield11,
		@myfield12,
		@myfield13,
		@myfield14,
		@myfield15,
		@myfield16

	while @@FETCH_STATUS = 0
	BEGIN
		

		insert into ctc.ctc_master (cps_id, row_created_by_user_id, row_updated_by_user_id)
		select ltrim(rtrim(@myfield4)), 'csystem', 'csystem'
	

		commit

		set @ctcid = (select max(ctc_id)
		from ctc.ctc_master)

		insert into ctc.alpha_student (ctc_id, division, first_name, last_name, gender, ethnicity, iep, lep, grade, unit, relation_code, relation_name, dob, upload_id, row_created_by_user_id, row_updated_by_user_id)
		values(@ctcid, @myfield7, @myfield2, @myfield1, @myfield14, @myfield13, @myfield11, @myfield12, @myfield8, @myfield5, @myfield9, @myfield10, convert(varchar, substring(@myfield15, 1, 2) + '/' + substring(@myfield15, 3,2) + '/' + substring(@myfield15, 5,2), 101), @uploadid, 'csystem', 'csystem') 

--		insert into ctc.alpha_student (ctc_id, division, first_name, last_name, gender, ethnicity, iep, lep, grade, unit, relation_code, relation_name, upload_id, row_created_by_user_id, row_updated_by_user_id)
--		values(@ctcid, @myfield7, @myfield2, @myfield1, @myfield14, @myfield13, @myfield11, @myfield12, @myfield8, @myfield5, @myfield9, @myfield10, @uploadid, 'csystem', 'csystem') 
		
	

		FETCH NEXT FROM @mycursor
		into @myfield1,
		@myfield2,
		@myfield3,
		@myfield4,
		@myfield5,
		@myfield6,
		@myfield7,
		@myfield8,
		@myfield9,
		@myfield10,
		@myfield11,
		@myfield12,
		@myfield13,
		@myfield14,
		@myfield15,
		@myfield16


	end

end