IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'staff_upload'
)
DROP PROCEDURE ctc.staff_upload
go
---------------------------------------------------------

create procedure ctc.staff_upload
as

	declare @myEntityType bigint

	declare @mycursor CURSOR

	declare @myinnercursor CURSOR
	
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

	declare @myprogramid varchar(10)

	declare @count bigint

	declare @myentityid bigint

	declare @unit int
	

begin

	begin transaction

	delete from ctc.IT_import_stage_14

	commit transaction

	bulk
	insert ctc.IT_import_stage_14
	from 'c:\ctc_mount_point\All School Staffs.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)
	bulk
	insert ctc.IT_import_stage_14
	from 'c:\ctc_mount_point\CTC_STAFF.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)
	bulk
	insert ctc.IT_import_stage_14
	from 'c:\ctc_mount_point\Other_Staff.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)
	bulk
	insert ctc.IT_import_stage_14
	from 'c:\ctc_mount_point\CPS_STAFF.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	--set @myEntityType = (select e.entity_type_id from ctc.entity_type e where e.entity_type_desc = 'Tutor')

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select distinct ltrim(rtrim(field1)), ltrim(rtrim(field2)), ltrim(rtrim(field3)), rtrim(ltrim([field4])), [field5], [field6], [field9], [field11]
	from ctc.it_import_stage_14
	where field4 is not null
	and field2 is not null
	
	OPEN  @mycursor
	fetch next from @mycursor
	into @myfield1,
		@myfield2,
		@myfield3,
		@myfield4,
		@myfield5,
		@myfield6,
		@myfield9,
		@myfield11

	while @@FETCH_STATUS = 0
	BEGIN
	
			
			set @count = (select count(entity_id) from ctc.entity where rtrim(ltrim(lower(first_name))) = rtrim(ltrim(lower(@myfield2)))
							and rtrim(ltrim(lower(last_name))) = rtrim(ltrim(lower(@myfield4))) )


			if @count <= 0 begin

				set @myEntityType = (select e.entity_type_id from ctc.entity_type e where e.entity_type_desc = rtrim(ltrim(replace(@myfield9, '"',''))))

				set @unit = (select unit from ctc.facility where rtrim(ltrim(lower(facility_name))) = rtrim(ltrim(lower(@myfield11))))

				begin transaction

				insert into ctc.entity (entity_type_id, salutation, first_name, last_name, middle_initial, phone, email, unit, row_created_by_user_id, row_updated_by_user_id)
				values(@myEntityType, @myfield1, @myfield2, @myfield4, @myfield3, replace(@myfield6,'-',''), @myfield5, @unit, 'csystem', 'csystem')

				commit transaction
			
				set @myentityid = (select max(entity_id) from ctc.entity)

				SET @myinnercursor = CURSOR FAST_FORWARD
				FOR
				select distinct ctc.program.program_id
				from ctc.it_import_stage_14,
				ctc.program
				where ctc.program.program_name = ctc.it_import_stage_14.field13
				and rtrim(ltrim(field2)) = @myfield2
				and rtrim(ltrim(field4)) = @myfield4
			
				OPEN  @myinnercursor
				fetch next from @myinnercursor
				into @myprogramid
						
				while @@FETCH_STATUS = 0
				BEGIN

					begin transaction

					insert into ctc.entity_program (entity_id, program_id, row_created_by_user_id, row_updated_by_user_id)
					values(@myentityid, @myprogramid, 'csystem', 'csystem')

					commit transaction

					fetch next from @myinnercursor
					into @myprogramid
				end
				
				close @myinnercursor
		end

		fetch next from @mycursor
		into @myfield1,
		@myfield2,
		@myfield3,
		@myfield4,
		@myfield5,
		@myfield6,
		@myfield9,
		@myfield11


	end

end