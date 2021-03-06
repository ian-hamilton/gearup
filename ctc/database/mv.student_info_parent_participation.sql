USE [CTC]
GO
/****** Object:  View [ctc].[mv_student_info_parent_participation]    Script Date: 01/23/2011 23:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER view [ctc].[mv_student_info_parent_participation]
as
select ac.ctc_id, apr.apr_desc, max(events.date_of_service) most_recent
from ctc.alpha_student_current ac
inner join ctc.master_entity mastere
	on ac.ctc_id = mastere.ctc_id
inner join ctc.entity e
	on mastere.entity_id = e.entity_id
inner join ctc.entity_type etype
	on e.entity_type_id = etype.entity_type_id
inner join ctc.event_attendance ea
	on e.entity_id = ea.entity_id
inner join ctc.events
	on ea.event_id = events.event_id
inner join ctc.apr apr
	on events.apr_code = apr.apr_code


where (etype.entity_type_desc = 'Parent' or etype.entity_type_desc is null)
and mastere.status_flag = 1
and e.status_flag = 1
and ea.status_flag = 1
and events.status_flag = 1
and apr.apr_code LIKE 'P%'
--and (apr.apr_code in ('S5', 'P3', 'P1H', 'P2H', 'P6CE', 'FE', 'FEFL', 'FEFM', 'FEC', 'S1C', 'S1CA')
--		or events.apr_code is null)

group by ac.ctc_id, apr.apr_desc

