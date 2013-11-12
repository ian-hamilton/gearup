create table ctc.questionaire_document
(document_id bigint identity(100000, 1) primary key,
request_date datetime default getDate()
)

alter table ctc.attendance_profile
add document_id bigint null