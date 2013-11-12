USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[profile_insert]    Script Date: 08/07/2008 16:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------

alter procedure [ctc].[profile_insert]
as
	declare @id bigint

begin

	begin transaction

	delete from ctc.profile_options
	delete from ctc.profile_descriptor
	

	INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
	VALUES ('Which GEAR UP goal?',1,'event','csystem','csystem')

	set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('Academic',@id,1,'csystem','csystem')

	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('Career Awareness',@id,2,'csystem','csystem')

	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('College readiness',@id,3,'csystem','csystem')

	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('Not Applicable or Not Observed',@id,4,'csystem','csystem')

	
		INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('How often is this event scheduled to occur?',1,'event','csystem','csystem')

		set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Only Once',@id,1,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('A few times with a classroom',@id,2,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('A few times after school',@id,3,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Not Applicable or Not Observed',@id,4,'csystem','csystem')
				
				INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
				VALUES ('Did GEAR UP staff create this workshop?',1,'event','csystem','csystem')

				set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


				INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
				VALUES ('Yes',@id,1,'csystem','csystem')

				INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
				VALUES ('No',@id,2,'csystem','csystem')

				INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
				VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
						
						INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Did a Non-GEAR UP person (teacher, school club or other) create this workshop?',1,'event','csystem','csystem')

						set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Yes',@id,1,'csystem','csystem')

						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('No',@id,2,'csystem','csystem')

						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
				
									INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
									VALUES ('Did the Museum or locaton/venue provide the materials for the workshop?',1,'event','csystem','csystem')

									set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


									INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
									VALUES ('Yes',@id,1,'csystem','csystem')

									INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
									VALUES ('No',@id,2,'csystem','csystem')

									INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
									VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')


INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Was this a special invitation by another organization?',1,'event','csystem','csystem')

set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Yes',@id,1,'csystem','csystem')

INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('No',@id,2,'csystem','csystem')

INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')

	
		INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Did teacher invite GEAR UP to present in the classroom as part of the curriculum?',1,'event','csystem','csystem')

		set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Yes',@id,1,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('No',@id,2,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
				
		INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('What class?',1,'event','csystem','csystem')

		set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Literacy',@id,1,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Math',@id,2,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('History',@id,3,'csystem','csystem')
		
		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Other',@id,4,'csystem','csystem')				
						
						INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Which careers were targeted ?',1,'event','csystem','csystem')

						set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Health and Social Service',@id,1,'csystem','csystem')

						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Arts & Communication ',@id,2,'csystem','csystem')

						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Industrial & Engineering Technology',@id,3,'csystem','csystem')
						
						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Business, Management & Technology',@id,3,'csystem','csystem')
						
								INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
								VALUES ('Students had many career options to choose from? ?',1,'event','csystem','csystem')

								set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)

								INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
								VALUES ('Yes',@id,1,'csystem','csystem')

								INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
								VALUES ('No',@id,2,'csystem','csystem')

								INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
								VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')

INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Did career professionals speak to students?',1,'event','csystem','csystem')

set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Yes',@id,1,'csystem','csystem')

INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('No',@id,2,'csystem','csystem')

INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
				
		INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Students took a tour of the location? ?',1,'event','csystem','csystem')

		set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Yes',@id,1,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('No',@id,2,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
VALUES ('Approximately how many career professionals were at the event?',1,'event','csystem','csystem')

set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('1-10',@id,1,'csystem','csystem')

	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('11-20',@id,2,'csystem','csystem')

	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('over 25',@id,3,'csystem','csystem')

	INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
	 VALUES ('Not Applicable or Not Observed',@id,4,'csystem','csystem')

	
		INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Tour of Campus included?',1,'event','csystem','csystem')

		set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Yes',@id,1,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('No',@id,2,'csystem','csystem')

		INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
		VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
				
			INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
			VALUES ('College Panel or College Student Panel',1,'event','csystem','csystem')

			set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)

			INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
			VALUES ('Yes',@id,1,'csystem','csystem')

			INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
			VALUES ('No',@id,2,'csystem','csystem')

				INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
				VALUES ('Not Applicable or Not Observed',@id,3,'csystem','csystem')
						
						INSERT INTO ctc.profile_descriptor ([descriptor_display],descriptor_order,descriptor_event_type,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('On-Campus partnership or collaborations? ?',1,'event','csystem','csystem')

						set @id = (select max(profile_descriptor_id) from ctc.profile_descriptor)


						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('minority-organization',@id,1,'csystem','csystem')

						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('admissions Office',@id,2,'csystem','csystem')

						INSERT INTO ctc.profile_options([profile_option_display],[profile_descriptor_id],option_order,[row_created_by_user_id],[row_updated_by_user_id])
						VALUES ('Oher',@id,3,'csystem','csystem')
				
									

commit transaction

end