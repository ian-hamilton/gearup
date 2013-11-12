create table ctc.alpha_student_current
(ctc_id bigint not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
dob datetime null)

insert ctc.alpha_student_current (ctc_id, first_name, last_name,dob)
select als.ctc_id, first_name, last_name, dob
from ctc.alpha_student als,
(select ctc_id, max(row_created) last_date
from ctc.alpha_student
group by ctc_id) latest
where latest.ctc_id = als.ctc_id
and latest.last_date = als.row_created