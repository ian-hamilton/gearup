USE [CTC]
GO
/****** Object:  View [ctc].[mv_student_info_gearup_events]    Script Date: 01/23/2011 23:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER view [ctc].[mv_student_info_gearup_events]
as
select alphac.ctc_id, e.date_of_service, e.event_title, (e_fac.first_name + ' ' + e_fac.last_name) facilitator
from ctc.alpha_student_current alphac
inner join ctc.event_attendance ea
	on alphac.ctc_id = ea.ctc_id
inner join ctc.events e
	on ea.event_id = e.event_id
inner join ctc.event_program ep
	on e.event_id = ep.event_id
inner join ctc.program p
	on ep.program_id = p.program_id
inner join ctc.event_attendance ea_fac
	on e.event_id = ea_fac.event_id
inner join ctc.entity e_fac
	on ea_fac.entity_id = e_fac.entity_id

where p.program_name like 'Gear Up 3%'
and ea_fac.event_attendance_type_id = 3
and ea.status_flag = 1
and e.status_flag = 1
and ep.status_flag = 1
and p.status_flag = 1
and ea_fac.status_flag = 1
and e_fac.status_flag = 1
and e_fac.last_name <> 'unknown'

group by alphac.ctc_id, e.date_of_service, e.event_title, (e_fac.first_name + ' ' + e_fac.last_name), e.event_id


