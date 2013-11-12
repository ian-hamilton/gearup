
	begin transaction

	delete from ctc.IT_import_stage_4

	

	bulk
	insert ctc.IT_import_stage_4
	from 'c:\ctc_mount_point\school_id.txt'
	with
	(
		FIRSTROW = 2,
		fieldterminator = '\t',
		rowterminator='\n',
		KEEPNULLS
	)

	commit transaction

	go

	begin transaction

	

	update ctc.facility
	set long_school_name = field3,
	schl_id = field4
	from ctc.it_import_stage_4
			inner join ctc.facility
			 on field1 = unit

	


	commit transaction

	go