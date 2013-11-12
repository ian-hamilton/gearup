IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'event_upload'
)
DROP PROCEDURE ctc.event_upload
go
---------------------------------------------------------

create procedure ctc.event_upload --aka: Ninja upload
as


	declare @mycursor CURSOR

	declare @attendCursor CURSOR

	declare @facCursor CURSOR

	declare @programCursor CURSOR

	declare @targetCursor CURSOR

-----------------------------------------------
	declare @fileCursor CURSOR
	declare @filename varchar(500)
	declare @event_type varchar(30)

	declare @errmessage varchar(max)
---------------------------------------------
	
	declare @target_facilityid bigint

	declare @eventid bigint

	declare @programid bigint

	declare @facilityid bigint

	declare @ctc_id bigint



	declare @count int

	declare @facEntityId bigint

	--declare @programid bigint

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

	declare @attendField1 varchar(max)
	declare @attendField2 varchar(max)
	declare @attendField3 varchar(max)
	declare @attendField4 varchar(max)

	declare @facField1 varchar(max)
	declare @facField2 varchar(max)
	declare @facField3 varchar(max)

	declare @proField1 varchar(max)
	declare @proField2 varchar(max)

	declare @targetField1 varchar(max)
	declare @targetField2 varchar(max)

	declare @bulk_string varchar(max)
	declare @executeString varchar(max)

------------parent event info ------------------

	declare @unit int
	declare @parentEntityId bigint
	declare @parentTypeId bigint

begin


	

	set @bulk_string  = 'bulk
	insert ?tableName
	from ''c:\ctc_mount_point\events\?fileName''
	with
	(
		fieldterminator = ''\t'',
		rowterminator=''\n'',
		KEEPNULLS
	)'

-------------------------------------------------------------------------
	

	SET @fileCursor = CURSOR FAST_FORWARD
	FOR
	select filename, event_type
	from ctc.it_eventfilemounts
	where status_flag = 1
	and event_type in ('student_event', 'prof_dev', 'parent_event')

	OPEN  @fileCursor

	fetch next from @fileCursor
	into @filename,
		@event_type


	while @@FETCH_STATUS = 0
	BEGIN

			begin try

			begin transaction

			delete from ctc.it_event_stage

			delete from ctc.it_event_attend_stage

			delete from ctc.it_event_attend_stage_parents

			delete from ctc.it_event_facilitators_stage

			delete from ctc.it_event_target_stage

			delete from ctc.it_event_programs_stage

			commit transaction

			set @executeString = replace(replace(@bulk_string, '?tableName', 'ctc.it_event_stage'), '?fileName', @filename + '.txt')
			exec(@executeString)

			if @event_type = 'parent_event' begin

				set @executeString = replace(replace(@bulk_string, '?tableName', 'ctc.it_event_attend_stage_parents'), '?fileName', @filename + '_attendance.txt')
				exec(@executeString)
		
			end
			if @event_type != 'parent_event' begin
				
				set @executeString = replace(replace(@bulk_string, '?tableName', 'ctc.it_event_attend_stage'), '?fileName', @filename + '_attendance.txt')
				exec(@executeString)

			end
		
			set @executeString = replace(replace(@bulk_string, '?tableName', 'ctc.it_event_facilitators_stage'), '?fileName', @filename + '_facilitators.txt')
			exec(@executeString)

			set @executeString = replace(replace(@bulk_string, '?tableName', 'ctc.it_event_target_stage'), '?fileName', @filename + '_target.txt')
			exec(@executeString)


			set @executeString = replace(replace(@bulk_string, '?tableName', 'ctc.it_event_programs_stage'), '?fileName', @filename + '_programs.txt')
			exec(@executeString)


			set @count = (select count(facility_id) from ctc.facility where unit = 0)

			if @count <= 0 begin

				begin transaction
				
				insert into ctc.facility(unit, facility_name, facility_type_id, row_created_by_user_id, row_updated_by_user_id)
				select 0,'unknown',max(t.facility_type_id), 'csystem', 'csystem'
				from ctc.facility_type t where t.facility_type_name = 'Other' 

				commit transaction

			end


			SET @mycursor = CURSOR FAST_FORWARD
			FOR
			select ltrim(rtrim(field1)),ltrim(rtrim(field2)),ltrim(rtrim(field3)),ltrim(rtrim(field4)),ltrim(rtrim(field5)),ltrim(rtrim(field6)),ltrim(rtrim(field7)),ltrim(rtrim(field8)),ltrim(rtrim(field9)),ltrim(rtrim(field10)),ltrim(rtrim(field11)),ltrim(rtrim(field12)),ltrim(rtrim(field13))
			from ctc.it_event_stage


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
				 @myfield13
				

			begin transaction

			SAVE TRANSACTION event_save

			while @@FETCH_STATUS = 0
			BEGIN
			

					set @facilityid = (select t.facility_id from ctc.facility t where lower(t.facility_name) = lower(@myfield12))

					if @facilityid is null begin

						set @facilityid = (select t.facility_id from ctc.facility t where t.unit = 0)
				
					end

					set @programid = (select t.program_id from ctc.program t where lower(t.program_name) = lower(@myfield7))
						

					if @myfield8 is null or @myfield9 is null begin
						set @myfield8 = convert(varchar, @myfield5, 101)
						set @myfield9 = convert(varchar,dateadd(mi, (convert(numeric(4,2), @myfield10)*60),convert(datetime, @myfield5, 101)))
					end

					insert into ctc.events(event_title, apr_code, date_of_service, start_time, end_time, host_facility_id, row_created_by_user_id, row_updated_by_user_id)
					values(@myfield4, @myfield11, convert(varchar, @myfield5, 101), 
					@myfield8,
					@myfield9,
					@facilityid, 'csystem', 'csystem')

					--dateadd(mi, (convert(numeric(4,2), field10)*60),convert(datetime, field5, 101))

					set @eventid = (select max(event_id) from ctc.events)
					
--					insert into ctc.event_program(event_id, program_id, row_created_by_user_id, row_updated_by_user_id)
--					values(@eventid, @programid, 'csystem', 'csystem')


---------------------------------------attendance block--------------------------------------------------------------------------------
						--parent block
						if @event_type = 'parent_event' begin



							SET @attendCursor = CURSOR FAST_FORWARD
							FOR
							select ltrim(rtrim(field1)),ltrim(rtrim(field2)),ltrim(rtrim(field3)),ltrim(rtrim(field4))   
							from ctc.it_event_attend_stage_parents
							where ltrim(rtrim(field4)) = @myfield1

							set @parentTypeId = (select entity_type_id from ctc.entity_type where entity_type_desc = 'Parent')
							
							OPEN  @attendCursor
							fetch next from @attendCursor
							into @attendField1,
								 @attendField2,
								 @attendField3,
								 @attendField4
									

							while @@FETCH_STATUS = 0
							BEGIN
			
									set @unit = (select unit from ctc.facility where lower(facility_name) = lower(ltrim(rtrim(@attendfield3))))
										
									if @unit is null begin
										RAISERROR('No unit was found for provided facility name', 16, 1)
									end 	

									set @parentEntityId = (select entity_id from ctc.entity where unit = @unit and lower(first_name) = lower(ltrim(rtrim(@attendField1))) and lower(last_name) = lower(ltrim(rtrim(@attendField2))))

									if @parentEntityId is null begin

										insert into ctc.entity (entity_type_id, first_name, last_name, unit, row_created_by_user_id, row_updated_by_user_id)
										values(@parentTypeId, ltrim(rtrim(@attendField1)), ltrim(rtrim(@attendField2)), @unit, 'csystem', 'csystem')

										set @parentEntityId = (select max(entity_id) from ctc.entity)
									end

									insert into ctc.event_attendance (event_id, entity_id, row_created_by_user_id, row_updated_by_user_id)
									values(@eventid, @parentEntityId, 'csystem', 'csystem')	


							fetch next from @attendCursor
							into @attendField1,
								 @attendField2,
								 @attendField3,
								 @attendField4

							END
						end

						if @event_type != 'parent_event' begin




							SET @attendCursor = CURSOR FAST_FORWARD
							FOR
							select ltrim(rtrim(field1)),ltrim(rtrim(field2)) 
							from ctc.it_event_attend_stage
							where ltrim(rtrim(field2)) = @myfield1
							
							OPEN  @attendCursor
							fetch next from @attendCursor
							into @attendField1,
								 @attendField2

							while @@FETCH_STATUS = 0
							BEGIN

								if @event_type = 'student_event' begin

										set @ctc_id = (select ctc_id from ctc.ctc_master where cps_id = @attendField1)

										if @ctc_id is null begin
							
											insert into ctc.ctc_master (cps_id, row_created_by_user_id, row_updated_by_user_id)
											values(@attendField1, 'csystem', 'csystem')

											set @ctc_id = (select max(ctc_id) from ctc.ctc_master)

										end							

										insert into ctc.event_attendance (event_id, ctc_id, row_created_by_user_id, row_updated_by_user_id)
										values(@eventid, @ctc_id, 'csystem', 'csystem')
								end
								
								else if @event_type = 'prof_dev' begin

										insert into ctc.event_attendance (event_id, entity_id, row_created_by_user_id, row_updated_by_user_id)
										values(@eventid, @attendField1, 'csystem', 'csystem')							


								end

								fetch next from @attendCursor
								into @attendField1,
								 @attendField2

					end

					end
----------------------------------------------------------------------------------------------------------------------------------

					--facilitator block
					SET @facCursor = CURSOR FAST_FORWARD
					FOR
					select ltrim(rtrim(field1)),ltrim(rtrim(field2)),ltrim(rtrim(field3))  
					from ctc.it_event_facilitators_stage
					where ltrim(rtrim(field3)) = @myfield1
					
					OPEN  @facCursor
					fetch next from @facCursor
					into @facField1,
						 @facField2,
						 @facField3

					while @@FETCH_STATUS = 0
					BEGIN

						set @parentTypeId = (select entity_type_id from ctc.entity_type where entity_type_desc = 'Parent')

						set @facEntityId = (select entity_id from ctc.entity where lower(rtrim(ltrim(first_name+last_name))) = lower(rtrim(ltrim(@facField1)) + rtrim(ltrim(@facField2))) and entity_type_id != @parentTypeId) 
		
						if @facEntityId is null begin
				
							RAISERROR('No facilitator was found for provided entity name', 16, 1)
					
						end

						insert into ctc.event_attendance(event_id, entity_id, row_created_by_user_id, row_updated_by_user_id)
						values(@eventid,@facEntityId,'csystem','csystem')

						fetch next from @facCursor
						into @facField1,
						 @facField2,
						 @facField3
			
					end

					--programs block
					SET @programCursor = CURSOR FAST_FORWARD
					FOR
					select ltrim(rtrim(field1)),ltrim(rtrim(field2))  
					from ctc.it_event_programs_stage
					where ltrim(rtrim(field2)) = @myfield1
					
					OPEN  @programCursor
					fetch next from @programCursor
					into @proField1,
						 @proField2

					while @@FETCH_STATUS = 0
					BEGIN

						set @programid = (select program_id from ctc.program where lower(rtrim(ltrim(program_name))) = lower(rtrim(ltrim(@proField1))))
				
						insert into ctc.event_program(event_id, program_id, row_created_by_user_id, row_updated_by_user_id)
						values(@eventid, @programid, 'csystem', 'csystem')


						fetch next from @programCursor
						into @proField1,
						 @proField2
					end

					--target block
					SET @targetCursor = CURSOR FAST_FORWARD
					FOR
					select ltrim(rtrim(field1)),ltrim(rtrim(field2))  
					from ctc.it_event_target_stage
					where ltrim(rtrim(field2)) = @myfield1
					
					OPEN  @targetCursor
					fetch next from @targetCursor
					into @targetField1,
						 @targetField2

					while @@FETCH_STATUS = 0
					BEGIN

						set @target_facilityid = (select facility_id from ctc.facility where lower(rtrim(ltrim(facility_name))) = lower(rtrim(ltrim(@targetField1))))

						insert into ctc.event_facility(event_id, facility_id, row_created_by_user_id, row_updated_by_user_id)
						values(@eventid, @target_facilityid, 'csystem', 'csystem')

				
						fetch next from @targetCursor
						into @targetField1,
						 @targetField2
				
					end

					

-----------------------------------------------------------

					
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
						 @myfield13

			end

			update ctc.IT_EventFileMounts
			set import_dt = getDate(),
			status_flag = 0
			where [filename] = @filename


			commit transaction

			end try
			begin catch
					
				set @errmessage = Error_Message();

				ROLLBACK  TRANSACTION event_save
				
				begin transaction

				update ctc.IT_EventFileMounts
				set error_message = @errmessage,
				status_flag = 0
				where [filename] = @filename	
			
				commit transaction

				PRINT @errmessage			

			end catch	

		fetch next from @fileCursor
		into @filename,
			@event_type
	
	end

end