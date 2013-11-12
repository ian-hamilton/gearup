IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'facility_upload_elementary_school'
)
DROP PROCEDURE ctc.facility_upload_elementary_school
go
---------------------------------------------------------

create procedure ctc.facility_upload_elementary_school
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
	declare @myfield17 varchar(max)
	declare @myfield18 varchar(max)
	declare @myfield19 varchar(max)
	declare @myfield20 varchar(max)
	declare @myfield21 varchar(max)
	declare @myfield22 varchar(max)
	declare @myfield23 varchar(max)
	declare @myfield24 varchar(max)
	declare @myfield25 varchar(max)
	declare @myfield26 varchar(max)
	declare @myfield27 varchar(max)
	declare @myfield28 varchar(max)
	declare @myfield29 varchar(max)
	declare @myfield30 varchar(max)
	declare @myfield31 varchar(max)
	declare @myfield32 varchar(max)
	declare @myfield33 varchar(max)
	declare @myfield34 varchar(max)
	declare @myfield35 varchar(max)
	declare @myfield36 varchar(max)
	declare @myfield37 varchar(max)
	declare @myfield38 varchar(max)
	declare @myfield39 varchar(max)

	declare @count bigint

	declare @ftype_id bigint

	declare @unitid int

	declare @principal_id bigint

	declare @assistant_id bigint

	declare @facility_id bigint	

	declare @programid bigint
	

begin

	begin transaction

	delete from ctc.IT_import_stage_39

	commit transaction


	bulk
	insert ctc.IT_import_stage_39
	from 'c:\ctc_mount_point\Facilities_Elementary_Other_Schools.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	set @programid = (select max(program_id) from ctc.program)
	set @ftype_id = (select facility_type_id from ctc.facility_type where facility_type_name = 'Elementary Schools')
	set @principal_id = (select entity_type_id from ctc.entity_type where entity_type_desc = 'Principal')
	set @assistant_id = (select entity_type_id from ctc.entity_type where entity_type_desc = 'Assistant Principal')

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select [field1], [field2], [field3], [field4], [field5], [field6], [field7], [field8], [field9], [field10], [field11], [field12], substring([field13],1,1) as field13, [field14], [field15], [field16], [field17], [field18], [field19], [field20], [field21], [field22], [field23]
			, [field24], [field25], [field26], [field27], [field28], [field29], [field30], [field31], [field32], [field33], [field34], [field35], [field36], [field37], [field38], [field39]
	from ctc.IT_import_stage_39

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
		@myfield16,
		@myfield17,
		@myfield18,
		@myfield19,
		@myfield20,
		@myfield21,
		@myfield22,
		@myfield23,
		@myfield24,
		@myfield25,
		@myfield26,
		@myfield27,
		@myfield28,
		@myfield29,
		@myfield30,
		@myfield31,
		@myfield32,
		@myfield33,
		@myfield34,
		@myfield35,
		@myfield36,
		@myfield37,
		@myfield38,
		@myfield39

	while @@FETCH_STATUS = 0
	BEGIN

		set @count = (select count(unit) from ctc.facility where unit = @myfield1)

		if @count <= 0 begin

			begin transaction

			insert into ctc.facility(unit, area, facility_name, facility_type_id, address_1, city, state, zip, phone, phone_alt,
				fax, lunchroom, engineering, url, grades, school_focus, row_created_by_user_id, row_updated_by_user_id)
			values(@myfield1, @myfield2, @myfield3, @ftype_id, @myfield4, 'Chicago', 'IL', @myfield5, @myfield6, @myfield7,
				@myfield8, @myfield9, @myfield10, @myfield37, @myfield39, @myfield38, 'csystem', 'csystem')
			
			

			commit transaction

			if len(@myfield12) > 0 and len(@myfield11) > 0
			begin

				set @facility_id = (select max(facility_id) from ctc.facility)

				begin transaction
		
				insert into ctc.facility_programs(facility_id, program_id, row_created_by_user_id, row_updated_by_user_id)
					values(@facility_id, @programid, 'csystem', 'csystem')
				
				insert into ctc.entity (entity_type_id, salutation, first_name, middle_initial, last_name, email, unit, row_created_by_user_id, row_updated_by_user_id)
				values(@principal_id, @myfield11, @myfield12, @myfield13, @myfield14, @myfield15, @myfield1, 'csystem', 'csystem')
			
				commit transaction
			end

			if len(@myfield17) > 0 
			begin

				begin transaction
		
				
				insert into ctc.entity (entity_type_id, salutation, first_name, middle_initial, last_name, email, unit, row_created_by_user_id, row_updated_by_user_id)
				values(@assistant_id, @myfield16, @myfield17, @myfield18, @myfield19, @myfield20, @myfield1, 'csystem', 'csystem')
			
				commit transaction
			end
			
			if len(@myfield22) > 0 
			begin

				begin transaction
		
				
				insert into ctc.entity (entity_type_id, salutation, first_name, middle_initial, last_name, email, unit, row_created_by_user_id, row_updated_by_user_id)
				values(@assistant_id, @myfield21, @myfield22, @myfield23, @myfield24, @myfield26, @myfield1, 'csystem', 'csystem')
			
				commit transaction
			end

			if len(@myfield28) > 0 
			begin

				begin transaction
		
				
				insert into ctc.entity (entity_type_id, salutation, first_name, middle_initial, last_name, email, unit, row_created_by_user_id, row_updated_by_user_id)
				values(@assistant_id, @myfield27, @myfield28, @myfield29, @myfield30, @myfield31, @myfield1, 'csystem', 'csystem')
			
				commit transaction
			end

			if len(@myfield33) > 0 
			begin

				begin transaction
		
				
				insert into ctc.entity (entity_type_id, salutation, first_name, middle_initial, last_name, email, unit, row_created_by_user_id, row_updated_by_user_id)
				values(@assistant_id, @myfield32, @myfield33, @myfield34, @myfield35, @myfield36, @myfield1, 'csystem', 'csystem')
			
				commit transaction
			end
		
		end 
		
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
		@myfield16,
		@myfield17,
		@myfield18,
		@myfield19,
		@myfield20,
		@myfield21,
		@myfield22,
		@myfield23,
		@myfield24,
		@myfield25,
		@myfield26,
		@myfield27,
		@myfield28,
		@myfield29,
		@myfield30,
		@myfield31,
		@myfield32,
		@myfield33,
		@myfield34,
		@myfield35,
		@myfield36,
		@myfield37,
		@myfield38,
		@myfield39

	end

end