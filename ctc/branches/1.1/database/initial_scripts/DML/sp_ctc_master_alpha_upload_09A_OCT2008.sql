IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'master_alpha_upload_09A_Oct2008'
)
DROP PROCEDURE ctc.master_alpha_upload_09A_Oct2008
go
---------------------------------------------------------

create procedure ctc.master_alpha_upload_09A_Oct2008
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


	declare @ctcid bigint

	declare @uploadid bigint

	declare @programid bigint

begin

	begin transaction

	delete from ctc.IT_import_stage_alpha_11

	commit transaction

	bulk
	insert ctc.IT_import_stage_alpha_11
	from 'c:\ctc_mount_point\09A_Oct2008.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	begin transaction

	insert into ctc.upload(upload_file, upload_date, row_created_by_user_id, row_updated_by_user_id)
	values('08C_09A_Oct2008.txt', getDate(), 'csystem', 'csystem')

	commit transaction	
	
	set @uploadid = (select max(upload_id)
	from ctc.upload)

	set @programid = (select max(program_id) from ctc.program where ctc.program.program_name = 'Gear Up 3')

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select [field1], [field2], [field3], [field4], [field5], [field6], [field7], [field8], [field9], [field10], [field11]
	from ctc.IT_import_stage_alpha_11

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
		@myfield11

	while @@FETCH_STATUS = 0
	BEGIN
		
		set @ctcid = (select ISNULL(max(ctc_id), -1)
		from ctc.ctc_master
		where cps_id = @myfield1)
				
		if @ctcid=-1
		begin

			begin transaction

			insert into ctc.ctc_master (cps_id, row_created_by_user_id, row_updated_by_user_id)
			select ltrim(rtrim(@myfield1)), 'csystem', 'csystem'

			commit transaction	
	
			set @ctcid = (select max(ctc_id)
			from ctc.ctc_master)

			begin transaction	
	
			insert into ctc.master_programs (ctc_id, program_id, row_created_by_user_id, row_updated_by_user_id)
			values (@ctcid, @programid, 'csystem', 'csystem')
	
			commit transaction

		end

		begin transaction
		begin try		

			insert into ctc.alpha_student (ctc_id, division, first_name, last_name, middle_initial, gender, iep, ethnicity, grade, unit, upload_id, row_created_by_user_id, row_updated_by_user_id)
			values(@ctcid, ltrim(rtrim(@myfield2)), ltrim(rtrim(@myfield3)), ltrim(rtrim(@myfield5)), SUBSTRING(@myfield4,1,1), ltrim(rtrim(@myfield6)), ltrim(rtrim(@myfield8)), ltrim(rtrim(@myfield7)), ltrim(rtrim(@myfield9)), ltrim(rtrim(@myfield10)), @uploadid, 'csystem', 'csystem') 

			
		end try
		begin catch
			
			ROLLBACK  TRANSACTION 
			begin transaction

			insert into ctc.import_row_error (upload_id,row_error,cps_id,row_created_by_user_id,row_updated_by_user_id)
			values(@uploadid, ERROR_MESSAGE(), @myfield4, 'csystem', 'csystem')

		end catch	

		commit transaction
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
		@myfield11


	end

end