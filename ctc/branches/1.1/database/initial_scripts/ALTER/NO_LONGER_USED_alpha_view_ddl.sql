
------------------------ student view ---------------------

drop view ctc.mv_student_info

go

create view ctc.mv_student_info
as
select alphac.ctc_id, 
	alphac.grade, 
	alphac.division, 
	alphac.gender,
	alphac.first_name,
	alphac.last_name,
	min(fac.facility_name) facility_name,
	reside.first_name reside_first_name,
	reside.last_name reside_last_name,
	reside.phone reside_phone,
	reside.phone_2 reside_phone_2,
	reside.email reside_email,
	reside.address_1 reside_address_1,
	reside.address_2 reside_address_2,
	reside.city reside_city,
	reside.state reside_state,
	min(mother.first_name + ' ' + mother.last_name) mother,
	min(father.first_name + ' ' + father.last_name) father

from ctc.alpha_student_current alphac
left outer join ctc.facility fac
	on alphac.unit = fac.unit

left outer join		(select ac.ctc_id,
			e.first_name,
			e.last_name,
			e.phone,
			e.phone_2,
			e.email,
			e.address_1,
			e.address_2,
			e.city,
			e.state
		from ctc.alpha_student_current ac
		left outer join ctc.master_entity me
			on ac.ctc_id = me.ctc_id
		left outer join ctc.entity e
			on me.entity_id = e.entity_id
		left outer join ctc.entity_type etype
			on e.entity_type_id = etype.entity_type_id

		where me.reside_flag = 1

		group by ac.ctc_id, 
			e.first_name,
			e.last_name,
			e.phone,
			e.phone_2,
			e.email,
			e.address_1,
			e.address_2,
			e.city,
			e.state)reside

	on alphac.ctc_id = 	reside.ctc_id

left outer join		(select ac.ctc_id,
			e.first_name,
			e.last_name
		from ctc.alpha_student_current ac
		left outer join ctc.master_entity me
			on ac.ctc_id = me.ctc_id
		left outer join ctc.entity e
			on me.entity_id = e.entity_id
		left outer join ctc.entity_type etype
			on e.entity_type_id = etype.entity_type_id

		where etype.entity_type_desc = 'Parent' and lower(e.gender) = 'f'

		group by ac.ctc_id, 
			e.first_name,
			e.last_name)mother

	on alphac.ctc_id = 	mother.ctc_id


left outer join		(select ac.ctc_id,
			e.first_name,
			e.last_name
		from ctc.alpha_student_current ac
		left outer join ctc.master_entity me
			on ac.ctc_id = me.ctc_id
		left outer join ctc.entity e
			on me.entity_id = e.entity_id
		left outer join ctc.entity_type etype
			on e.entity_type_id = etype.entity_type_id

		where etype.entity_type_desc = 'Parent' and lower(e.gender) = 'm'

		group by ac.ctc_id, 
			e.first_name,
			e.last_name)father

	on alphac.ctc_id = 	father.ctc_id


group by alphac.ctc_id, 
	alphac.grade, 
	alphac.division, 
	alphac.gender,
	alphac.first_name,
	alphac.last_name,
	reside.first_name,
	reside.last_name,
	reside.phone,
	reside.phone_2,
	reside.email,
	reside.address_1,
	reside.address_2,
	reside.city,
	reside.state

having alphac.ctc_id = 11458


go

---------------------------guardian languages------------------------------------

drop view ctc.mv_guardian_languages

go

create view ctc.mv_guardian_languages
as
select e.entity_id, home_language_flag, language_name 
from ctc.entity e
inner join ctc.language_register lr
	on e.entity_id = lr.entity_id
inner join ctc.language l
	on lr.language_id = l.language_id

group by e.entity_id, home_language_flag, language_name 

go


-------------------------- student event participation --------------------------------

drop view ctc.mv_student_info_event_participation

go

create view ctc.mv_student_info_event_participation
as
select alphac.ctc_id, apr.apr_desc, convert(decimal(10,2),sum(convert(decimal(10,2),(datediff(mi,e.start_time,e.end_time)))/60)) hours
from ctc.alpha_student_current alphac
inner join ctc.event_attendance ea
	on alphac.ctc_id = ea.ctc_id
inner join ctc.events e
	on ea.event_id = e.event_id
inner join ctc.apr 
	on e.apr_code = apr.apr_code

where e.start_time is not null
	and e.end_time is not null

group by alphac.ctc_id, apr.apr_desc

go

-----------------------gear up events ---------------------------

drop view ctc.mv_student_info_gearup_events

go

create view ctc.mv_student_info_gearup_events
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

group by alphac.ctc_id, e.date_of_service, e.event_title, (e_fac.first_name + ' ' + e_fac.last_name)

go

----------------------- performance -------------------------------

drop view ctc.mv_student_info_performance

go

create view ctc.mv_student_info_performance
as
select alphac.ctc_id, tscores.score_category, tscores.test_score
from ctc.alpha_student_current alphac
inner join ctc.upload
	on alphac.upload_id = upload.upload_id
inner join ctc.test_scores tscores
	on alphac.ctc_id = tscores.ctc_id
inner join ctc.it_system_semesters sem
	on upload.semester = semester_code

where sem.actual_year = tscores.school_year

group by alphac.ctc_id, tscores.score_category, tscores.test_score

go


----------------- parent event participation--------------------------------------

drop view ctc.mv_student_info_parent_participation

go

create view ctc.mv_student_info_parent_participation
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
--and (apr.apr_code in ('S5', 'P3', 'P1H', 'P2H', 'P6CE', 'FE', 'FEFL', 'FEFM', 'FEC', 'S1C', 'S1CA')
--		or events.apr_code is null)

group by ac.ctc_id, apr.apr_desc

go