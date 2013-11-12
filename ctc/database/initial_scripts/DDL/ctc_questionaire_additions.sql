

alter table ctc.questionaire_document
add parent_first_name varchar(30) null
go 

alter table ctc.questionaire_document
add parent_last_name varchar(30) null
go 

alter table ctc.questionaire_document
add parent_phone_number varchar(14) null
go 

alter table ctc.questionaire_document
add address varchar(30) null
go 

alter table ctc.questionaire_document
add city varchar(30) null
go 

alter table ctc.questionaire_document
add zip varchar(10) null
go 

alter table ctc.questionaire_document
add student_first_name varchar(30) null
go 

alter table ctc.questionaire_document
add student_middle_name varchar(30) null
go 

alter table ctc.questionaire_document
add student_last_name varchar(30) null
go 

alter table ctc.questionaire_document
add student_dob datetime null
go 

alter table ctc.questionaire_document
add student_school varchar(100) null
go 

alter table ctc.questionaire_document
add grade int null
go 


alter table ctc.questionaire_document
add invalid_flag tinyint default 0 not null
go 

alter table ctc.questionaire_document
add parent2_first_name varchar(30) null
go 

alter table ctc.questionaire_document
add parent2_last_name varchar(30) null
go 
