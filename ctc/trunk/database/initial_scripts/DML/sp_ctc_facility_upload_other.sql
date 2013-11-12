IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'facility_upload_other'
)
DROP PROCEDURE ctc.facility_upload_other
go
---------------------------------------------------------

create procedure ctc.facility_upload_other
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

	declare @facility_type_id bigint

begin

	begin transaction

	delete from ctc.IT_import_stage_13

	commit transaction


	bulk
	insert ctc.IT_import_stage_13
	from 'c:\ctc_mount_point\Other_Facilities.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)
	
	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	select [field1], [field2], [field3], [field4], [field5], [field6], [field7], [field8], [field9], [field10], [field11], [field12], [field13]
	from ctc.IT_import_stage_13

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

	while @@FETCH_STATUS = 0
	BEGIN

		
	
			begin transaction

			set @facility_type_id = (select facility_type_id from facility_type where facility_type_name = rtrim(ltrim(@myfield3)))

			insert into ctc.facility(facility_name, facility_desc, facility_type_id, address_1, address_2, city, state, zip, misc_contact_name, phone, 
				fax, url, facility_comment, row_created_by_user_id, row_updated_by_user_id)
			values(@myfield1, @myfield2, @facility_type_id, @myfield4, @myfield5, @myfield6, @myfield7,
				@myfield8, @myfield9, @myfield10, @myfield11, @myfield12, @myfield13, 'csystem', 'csystem')
			
			

			commit transaction

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

end