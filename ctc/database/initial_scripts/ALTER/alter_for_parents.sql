alter table ctc.it_eventfilemounts
add event_type varchar(30) default null

update ctc.it_eventfilemounts
set event_type = 'student_event'

CREATE TABLE [ctc].[it_event_attend_stage_parents](
	[field1] [varchar](max) NULL,
	[field2] [varchar](max) NULL,
	[field3] [varchar](max) NULL,
	[field4] [varchar](max) NULL
) 