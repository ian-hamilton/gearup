	
drop table ctc.alpha_student_current

go

	create table ctc.alpha_student_current
(ctc_id bigint not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
dob datetime null,
unit int not null,
grade int not null,
gpa numeric(3,2) null,
cps_status varchar(2),
semester varchar(4),
row_created datetime not null)

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

go

begin transaction

	delete from ctc.alpha_student_current

go

	insert ctc.alpha_student_current (ctc_id, first_name, last_name, dob, unit, grade, gpa, cps_status, row_created)
	select als.ctc_id, first_name, last_name, dob, unit, grade, gpa, cps_status, last_date
	from ctc.alpha_student als,
	(select ctc_id, max(row_created) last_date
	from ctc.alpha_student
	group by ctc_id) latest
	where latest.ctc_id = als.ctc_id
	and latest.last_date = als.row_created

go


commit transaction

go