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

	--declare @myfield4 varchar(max)

	declare @myprogramid varchar(10)


	declare @myentityid bigint
	

begin

	begin transaction

	delete from ctc.IT_import_stage_5

	commit transaction

	bulk
	insert ctc.IT_import_stage_5
	from 'c:\ctc_mount_point\tutors.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	set @myEntityType = (select e.entity_type_id from ctc.entity_type e where e.entity_type_desc = 'Tutor')

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select distinct ltrim(rtrim(field1)), ltrim(rtrim(field2)), ltrim(rtrim(field3))
	from ctc.it_import_stage_5
	
	OPEN  @mycursor
	fetch next from @mycursor
	into @myfield1,
		 @myfield2,
		 @myfield3

	while @@FETCH_STATUS = 0
	BEGIN
	
			begin transaction

			insert into ctc.entity (entity_type_id, first_name, last_name, middle_initial, row_created_by_user_id, row_updated_by_user_id)
			values(@myEntityType, @myfield2, @myfield1, @myfield3, 'csystem', 'csystem')

			commit transaction
		
			set @myentityid = (select max(entity_id) from ctc.entity)

			SET @myinnercursor = CURSOR FAST_FORWARD
			FOR
			select distinct ctc.program.program_id
			from ctc.it_import_stage_5,
			ctc.program
			where ctc.program.initial_code = ctc.it_import_stage_5.field4
			and rtrim(ltrim(field1)) = @myfield1
			and rtrim(ltrim(field2)) = @myfield2
		
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

		fetch next from @mycursor
		into @myfield1,
			 @myfield2,
			 @myfield3


	end

end