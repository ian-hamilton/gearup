USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[info_student_top_3_gearup]    Script Date: 01/23/2011 23:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------

ALTER procedure [ctc].[info_student_top_3_gearup] @id bigint
as
begin

	select top 3 
	convert(varchar, date_of_service, 101) as date_of_service,
	event_title,
	facilitator
	 from
	(select
		date_of_service,
		event_title,
		facilitator

	from ctc.mv_student_info_gearup_events
	where ctc_id = @id
	and facilitator <> 'unknown'
	) info


ORDER BY cast(floor(cast(date_of_service as float)) as datetime) desc





end 

