


---------------------------------------------------------------------------------------------

alter table ctc.apr
add base_apr varchar(10) null

-----------------------------------------------------------------------------------------------

begin transaction 

insert into ctc.program (program_name, row_created_by_user_id, row_updated_by_user_id)
values ('Academy Test', 'csystem', 'csystem')

go

commit transaction



begin transaction

update ctc.master_programs
set program_id = 159

select *
from ctc.master_programs mstr
where mstr.ctc_id in
(select distinct alpha.ctc_id 
from ctc.alpha_student alpha
where alpha.unit in (7970,7980))

commit transaction