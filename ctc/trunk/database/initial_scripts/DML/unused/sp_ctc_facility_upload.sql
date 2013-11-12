IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'facility_upload'
)
DROP PROCEDURE ctc.facility_upload
go
---------------------------------------------------------

create procedure ctc.facility_upload
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


	declare @highschool_id bigint

	declare @unitid int

begin

	begin transaction

	delete from ctc.IT_import_stage_23

	delete from ctc.facility

	commit transaction


	bulk
	insert ctc.IT_import_stage_23
	from 'c:\ctc_mount_point\Facilities_High_Schools.txt'
	with
	(
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	set @highschool_id = (select facility_type_id from ctc.facility_type where facility_type_name = 'High Schools')

	SET @mycursor = CURSOR FAST_FORWARD
	FOR
	seect [field1], [field2], [field3], [field4], [field5], [field6], [field7], [field8], [field9], [field10], [field11], [field12], [field13], [field14], [field15], [field16], [field17], [field18], [field194], [field20], [field21], [field22], [field23]
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
		@myfield16,
		@myfield17,
		@myfield18,
		@myfield19,
		@myfield20,
		@myfield21,
		@myfield22,
		@myfield23

	while @@FETCH_STATUS = 0
	BEGIN

end