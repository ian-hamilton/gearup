IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'testscores_upload'
)
DROP PROCEDURE ctc.testscores_upload
go
---------------------------------------------------------

create procedure ctc.testscores_upload
as
begin

	declare @myfield1 varchar(max)
	declare @myfield2 varchar(max)
	declare @myfield3 varchar(max)
	declare @myfield4 varchar(max)
	declare @myfield5 varchar(max)

	declare @mycursor CURSOR

	declare @ctcid bigint
	declare @testtypeid bigint

	
	declare @bulk_string varchar(max)
	declare @executeString varchar(max)
-----------------------------------------------
	declare @fileCursor CURSOR
	declare @filename varchar(500)

	declare @errmessage varchar(max)
---------------------------------------------


		set @bulk_string  = 'bulk
	insert ctc.it_test_stage
	from ''c:\ctc_mount_point\tests\?fileName''
	with
	(
		fieldterminator = ''\t'',
		rowterminator=''\n'',
		KEEPNULLS
	)'

-------------------------------------------------------------------------
	

	SET @fileCursor = CURSOR FAST_FORWARD
	FOR
	select filename
	from ctc.it_testfilemounts
	where status_flag = 1

	OPEN  @fileCursor

	fetch next from @fileCursor
	into @filename


	while @@FETCH_STATUS = 0
	BEGIN

			begin try

			begin transaction

			delete from ctc.it_test_stage

			commit transaction

			set @executeString = replace(@bulk_string, '?fileName', @filename + '.txt')
			exec(@executeString)

			begin transaction

			SAVE TRANSACTION test_save

--inner loop

			
				SET @mycursor = CURSOR FAST_FORWARD
			FOR
			select ltrim(rtrim(field1)),ltrim(rtrim(field2)),ltrim(rtrim(field3)),ltrim(rtrim(field4)),ltrim(rtrim(field5))
			from ctc.it_test_stage


			OPEN  @mycursor
			fetch next from @mycursor
			into @myfield1,
				 @myfield2,
				 @myfield3,
				 @myfield4,
				 @myfield5
				

			begin transaction

			while @@FETCH_STATUS = 0
			BEGIN


				set @ctcid = (select ctc_id from ctc.ctc_master where cps_id = @myfield1)

				if @ctcid  is not NULL begin

					set @testtypeid = (select test_type_id from ctc.test_type where lower(test_type_desc) = lower(@myfield3))

					insert into ctc.test_scores(ctc_id,school_year,test_type_id,score_category,test_score,row_created_by_user_id,row_updated_by_user_id)
					values(@ctcid,@myfield2,@testtypeid,@myfield4,@myfield5,'csystem','csystem')				


					fetch next from @mycursor
					into @myfield1,
					 @myfield2,
					 @myfield3,
					 @myfield4,
					 @myfield5

				end

			end


			update ctc.IT_testfilemounts
			set import_dt = getDate(),
			status_flag = 0
			where [filename] = @filename


			commit transaction


			end try
			begin catch
					
				set @errmessage = Error_Message();

				ROLLBACK  TRANSACTION test_save
				
				begin transaction

				update ctc.IT_testfilemounts
				set error_message = @errmessage,
				status_flag = 0
				where [filename] = @filename	
			
				commit transaction

				PRINT @errmessage			

			end catch

		fetch next from @fileCursor
		into @filename	

	end

end