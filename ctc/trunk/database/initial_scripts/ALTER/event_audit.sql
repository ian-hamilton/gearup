create table ctc.event_audit
(event_audit_id bigint identity(1,1) primary key,
old_value varchar(max) null,
new_value varchar(max) null,
row_created datetime default getdate(),
row_created_by_user_id varchar(30) not null)


create trigger tr_event_audit
on ctc.events
AFTER UPDATE
AS
IF  update(date_of_service) and (select row_updated_by_user_id from inserted) is not null 
and (select date_of_service from inserted) <> (select date_of_service from deleted)
begin



declare @p_new varchar(max)
declare @p_old varchar(max)
declare @p_user varchar(max)

set @p_new = (select date_of_service from inserted)
set @p_old = (select date_of_service from deleted)
set @p_user = (select row_updated_by_user_id from inserted)

begin transaction

INSERT INTO [CTC].[ctc].[event_audit]
           ([old_value]
           ,[new_value]
           ,[row_created_by_user_id])
     VALUES
           (@p_old,
           @p_new,
           @p_user)

commit transaction

end