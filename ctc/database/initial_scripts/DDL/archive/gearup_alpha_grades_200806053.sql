create table gearup.alpha_grades
(alpha_grade_id bigint identity(1,1) primary key,
alpha_student_id bigint not null,
course_number int not null,
course_name varchar(30) not null,
unit_number int not null,
section_number int not null,
period_number int not null,
class_absences int null,
cumulative_absences int null,
GPA numeric(3,2) null,
school_year int not null,
semester int not null,
status_flag int not null default 1,
row_created datetime not null default getdate(),
row_updated datetime not null default getdate(),
row_created_by_user_id varchar(15) not null,
row_updated_by_user_id varchar(15) not null)

go

alter table gearup.alpha_grades
with check
add constraint fk_gearup_alpha_grades_1
foreign key (alpha_student_id)
references gearup.alpha_student(alpha_student_id)
go
