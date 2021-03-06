USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[info_student_top_facilitators]    Script Date: 01/23/2011 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------

ALTER procedure [ctc].[info_student_top_facilitators] @id bigint
as
begin

	select top 3
	facilitator,
	number_of_contacts,
	CONVERT(VARCHAR,last_service,101) AS last_service 
	from
	(select
		facilitator,
		count(facilitator) as number_of_contacts,
		max(cast(floor(cast(date_of_service as float)) as datetime)) as last_service

	from ctc.mv_student_info_gearup_events
	where ctc_id = @id
	group by facilitator)info
ORDER BY number_of_contacts desc

end

