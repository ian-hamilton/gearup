


	drop table ctc.alpha_student_current

	
	create table ctc.alpha_student_current
	(	[alpha_student_id] [bigint] NOT NULL,
	[ctc_id] [bigint] NOT NULL primary key,
	[division] [varchar](10) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[middle_initial] [varchar](1) NULL,
	[last_name] [varchar](30) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[ethnicity] [int] NULL,
	[iep] [varchar](1) NULL,
	[lep] [varchar](1) NULL,
	[grade] [int] NOT NULL,
	[GPA] [numeric](3, 2) NULL,
	[unit] [int] NOT NULL,
	[relation_code] [varchar](1) NULL,
	[relation_name] [varchar](30) NULL,
	[dob] [datetime] NULL,
	[loss_code] [int] NULL,
	[cps_status] [varchar](2) NULL,
	[row_created] [datetime] not null,
	[upload_id] [bigint] null)

	create nonclustered
	index ix_alpha_student_current_1
	on ctc.alpha_student_current(ctc_id)
	WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

	create nonclustered
	index ix_alpha_student_current_2
	on ctc.alpha_student_current(last_name)
	WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

	create nonclustered
	index ix_alpha_student_current_3
	on ctc.alpha_student_current(dob)
	WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)

	create nonclustered
	index ix_alpha_student_current_4
	on ctc.alpha_student_current(unit)
	WITH (STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
	DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)


begin transaction


--	insert ctc.alpha_student_current (ctc_id, first_name, last_name, dob, unit, grade, gpa, cps_status, row_created)
--	select als.ctc_id, first_name, last_name, dob, unit, grade, gpa, cps_status, last_date
--	from ctc.alpha_student als,
--	(select ctc_id, max(row_created) last_date
--	from ctc.alpha_student
--	group by ctc_id) latest
--	where latest.ctc_id = als.ctc_id
--	and latest.last_date = als.row_created

	


INSERT INTO [CTC].[ctc].[alpha_student_current]
           ([alpha_student_id]
           ,[ctc_id]
           ,[division]
           ,[first_name]
           ,[middle_initial]
           ,[last_name]
           ,[gender]
           ,[ethnicity]
           ,[iep]
           ,[lep]
           ,[grade]
           ,[GPA]
           ,[unit]
           ,[relation_code]
           ,[relation_name]
           ,[dob]
           ,[loss_code]
           ,[cps_status]
		   ,[upload_id]
           ,[row_created])
SELECT [alpha_student_id]
      ,[als].[ctc_id]
      ,[division]
      ,[first_name]
      ,[middle_initial]
      ,[last_name]
      ,[gender]
      ,[ethnicity]
      ,[iep]
      ,[lep]
      ,[grade]
      ,[GPA]
      ,[unit]
      ,[relation_code]
      ,[relation_name]
      ,[dob]
      ,[loss_code]
      ,[cps_status]
	  ,[upload_id]
	  ,[last_date]

  FROM [CTC].[ctc].[alpha_student] als,
	(select ctc_id, max(row_created) last_date
	from ctc.alpha_student
	group by ctc_id) latest
	where latest.ctc_id = als.ctc_id
	and latest.last_date = als.row_created

commit transaction