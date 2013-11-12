USE [CTC]
GO

/****** Object:  Table [ctc].[registration_document]    Script Date: 06/17/2011 17:55:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [ctc].[registration_document](
	[document_id] [bigint] IDENTITY(100000,1) NOT NULL,
	[date_entered] [datetime] NULL,
	[parent_first_name] [varchar](30) NULL,
	[parent_last_name] [varchar](30) NULL,
	[parent_phone_number] [varchar](14) NULL,
	[home_phone_number] [varchar](14) NULL,
	[address] [varchar](30) NULL,
	[city] [varchar](30) NULL,
	[zip] [varchar](10) NULL,
	[student_first_name] [varchar](30) NULL,
	[student_middle_name] [varchar](30) NULL,
	[student_last_name] [varchar](30) NULL,
	[student_dob] [datetime] NULL,
	[student_school] [varchar](100) NULL,
	[grade] [int] NULL,
	[division] [varchar](6) NULL,
	[email] [varchar](30) NULL,
	[invalid_flag] [tinyint] NOT NULL,
	[parent2_first_name] [varchar](30) NULL,
	[parent2_last_name] [varchar](30) NULL,
	[parent2_phone_number] [varchar](14) NULL,
	[relation] [varchar](30) NULL,
	[medCond] [varchar](30) NULL,
	[medication] [varchar](30) NULL,
	[allergies] [varchar](30) NULL,
	[DrName] [varchar](30) NULL,
	[DrPhone] [varchar](30) NULL,
	[ClinLoc] [varchar](30) NULL,
	[regisComment] [varchar](1000) NULL,
	[status_flag] [tinyint] NOT NULL,
	[medCond_flag] [tinyint] NULL,
	[medication_flag] [tinyint] NULL,
	[allergies_flag] [tinyint] NULL,
	[parent_work_flag] [tinyint] NULL,
	[parent_cell_flag] [tinyint] NULL,
	[parent_other_flag] [tinyint] NULL,
	[parent2_work_flag] [tinyint] NULL,
	[parent2_cell_flag] [tinyint] NULL,
	[parent2_other_flag] [tinyint] NULL,
	[event_id] [bigint] NULL,
	[dep1] [varchar](30) NULL,
	[dep2] [varchar](6) NULL,
	[dep3] [varchar](4) NULL,
	[row_created] [datetime] NOT NULL,
	[row_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[document_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [ctc].[registration_document] ADD  DEFAULT (getdate()) FOR [date_entered]
GO

ALTER TABLE [ctc].[registration_document] ADD  DEFAULT ((0)) FOR [invalid_flag]
GO

ALTER TABLE [ctc].[registration_document] ADD  DEFAULT ((1)) FOR [status_flag]
GO

ALTER TABLE [ctc].[registration_document] ADD  DEFAULT (getdate()) FOR [row_created]
GO

ALTER TABLE [ctc].[registration_document] ADD  DEFAULT (getdate()) FOR [row_updated]
GO


