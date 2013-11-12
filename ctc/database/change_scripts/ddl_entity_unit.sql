USE [CTC]
GO
/****** Object:  Table [ctc].[entity_units]    Script Date: 08/04/2009 17:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ctc].[entity_facility](
	[entity_facility_id] [bigint] IDENTITY(1,1) NOT NULL,
	[entity_id] [bigint] NOT NULL,
	[facility_id] [bigint] NOT NULL,
	[status_flag] [int] NOT NULL DEFAULT ((1)),
	[row_created] [datetime] NOT NULL DEFAULT (getdate()),
	[row_updated] [datetime] NOT NULL DEFAULT (getdate()),
	[row_created_by_user_id] [varchar](15) NOT NULL,
	[row_updated_by_user_id] [varchar](15) NOT NULL,
 CONSTRAINT [pk_ctc_entity_facility] PRIMARY KEY NONCLUSTERED 
(
	[entity_facility_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [ctc].[entity_facility]  WITH CHECK ADD  CONSTRAINT [FK_entity_facilty_01] FOREIGN KEY([entity_id])
REFERENCES [ctc].[entity] ([entity_id])
GO
ALTER TABLE [ctc].[entity_facility]  WITH CHECK ADD  CONSTRAINT [FK_entity_facility_02] FOREIGN KEY([facility_id])
REFERENCES [ctc].[facility] ([facility_id])
GO



begin transaction

INSERT INTO ctc.entity_facility
(entity_id,
facility_id,
status_flag,
row_created,
row_updated,
row_created_by_user_id,
row_updated_by_user_id)
   select e.entity_id, f.facility_id, '1',GETDATE (),GETDATE (),'csystem','csystem'
from ctc.entity e
inner join ctc.facility f on f.unit = e.unit
where e.unit is not null

commit transaction
go