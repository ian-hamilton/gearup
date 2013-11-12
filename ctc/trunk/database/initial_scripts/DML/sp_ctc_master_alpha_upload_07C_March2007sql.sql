IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'master_alpha_upload_07C_March2007'
)
DROP PROCEDURE ctc.master_alpha_upload_07C_March2007
go
---------------------------------------------------------

create procedure ctc.master_alpha_upload_07C_March2007
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

	declare @programid bigint

begin

	begin transaction

	delete from ctc.IT_import_stage_alpha_16

	commit transaction

	bulk
	insert ctc.IT_import_stage_alpha_16
	from 'c:\ctc_mount_point\07C_March2007Mod3.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	begin transaction

	insert into ctc.upload(upload_file, upload_date, row_created_by_user_id, row_updated_by_user_id)
	values('07C_March2007Mod3.txt', getDate(), 'csystem', 'csystem')

	commit transaction	

	set @uploadid = (select max(upload_id)
	from ctc.upload)

	set @programid = (select max(program_id) from ctc.program where ctc.program.program_name = 'Gear Up 3')

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select [field1], [field2], [field3], [field4], [field5], [field6], [field7], [field8], [field9], [field10], [field11], [field12], [field13], [field14], [field15], [field16]
	from ctc.IT_import_stage_alpha_16

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
		
		set @ctcid = (select ISNULL(max(ctc_id), -1)
		from ctc.ctc_master
		where cps_id = @myfield4)
				
		if @ctcid=-1
		begin

			begin transaction

			insert into ctc.ctc_master (cps_id, row_created_by_user_id, row_updated_by_user_id)
			select ltrim(rtrim(@myfield4)), 'csystem', 'csystem'
		
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

					

			insert into ctc.alpha_student (ctc_id, division, first_name, last_name, gender, ethnicity, iep, lep, grade, unit, relation_code, relation_name, dob, upload_id, row_created_by_user_id, row_updated_by_user_id)
			values(@ctcid, @myfield7, @myfield2, @myfield1, @myfield14, @myfield13, @myfield11, @myfield12, @myfield8, @myfield5, @myfield9, @myfield10, convert(varchar, substring(@myfield15, 1, 2) + '/' + substring(@myfield15, 3,2) + '/' + substring(@myfield15, 5,2), 101), @uploadid, 'csystem', 'csystem') 

			
		end try
		begin catch
			ROLLBACK  TRANSACTION 
			begin transaction

			insert into ctc.import_row_error (upload_id,row_error,cps_id,row_created_by_user_id,row_updated_by_user_id)
			values(@uploadid, ERROR_MESSAGE(), @myfield4, 'csystem', 'csystem')
		end catch	

		commit transaction	

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