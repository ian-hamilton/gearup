USE [CTC]
GO
/****** Object:  View [ctc].[mv_student_info]    Script Date: 01/23/2011 23:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER view [ctc].[mv_student_info]
as
select alphac.ctc_id, 
	alphac.grade, 
	alphac.division, 
	alphac.gender,
	alphac.first_name,
	alphac.middle_initial,
	alphac.last_name,
	up.semester,
	mst.status_comment, 
	mst.fafsa,
    mst.parential_permission,
    mst.media_release,
    mst.twenty_first,
    mst.student_servey,
    mst.parent_survey,
	min(fac.facility_name) facility_name,
	reside.first_name reside_first_name,
	reside.last_name reside_last_name,
	reside.entity_comment reside_entity_comment, 
	reside.phone reside_phone,
	reside.phone_mobile reside_phone_mobile,
	reside.phone_work reside_phone_work,
	reside.fax reside_fax,
	reside.phone_other reside_phone_other,
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
left outer join ctc.upload up 
	on up.upload_id = alphac.upload_id
left outer join ctc.ctc_master mst
	on mst.ctc_id = alphac.ctc_id

left outer join		(select ac.ctc_id,
			e.first_name,
			e.last_name,
			e.entity_comment, 
			e.phone,
			e.phone_mobile,
			e.phone_work,
			e.fax,
			e.phone_other,
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
		and me.status_flag = 1
		and e.status_flag = 1

		group by ac.ctc_id,
			e.first_name,
			e.last_name,
			e.entity_comment,
			e.phone,
			e.phone_mobile,
			e.phone_work,
			e.fax,
			e.phone_other,
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
		and me.status_flag = 1
		and e.status_flag = 1

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
		and me.status_flag = 1
		and e.status_flag = 1

		group by ac.ctc_id, 
			e.first_name,
			e.last_name)father

	on alphac.ctc_id = 	father.ctc_id


group by alphac.ctc_id, 
	alphac.grade, 
	alphac.division, 
	alphac.gender,
	alphac.first_name,
	alphac.middle_initial,
	alphac.last_name,
	up.semester,
	mst.status_comment, 
	mst.fafsa,
    mst.parential_permission,
    mst.media_release,
    mst.twenty_first,
    mst.student_servey,
    mst.parent_survey,
	reside.first_name,
	reside.last_name,
	reside.entity_comment,
	reside.phone,
	reside.phone_mobile,
	reside.phone_work,
	reside.fax,
	reside.phone_other,
	reside.email,
	reside.email,
	reside.address_1,
	reside.address_2,
	reside.city,
	reside.state--	l.language_name

