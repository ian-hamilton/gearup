create table ctc.it_apr_period
(begin_date datetime not null,
end_date datetime not null)

begin transaction 

insert into ctc.it_apr_period values('03/01/2007', '02/29/2008')

insert into ctc.it_apr_period values('03/01/2008', '02/28/2009')

commit transaction