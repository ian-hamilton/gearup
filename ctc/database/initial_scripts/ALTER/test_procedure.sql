IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = 'ctc'
AND SPECIFIC_NAME = 'f_rpt_test'
)
DROP PROCEDURE ctc.f_rpt_test
go
---------------------------------------------------------

create procedure ctc.f_rpt_test @start_date varchar(50) , @end_date varchar(50), @report_options varchar(200), @report_radio varchar(1000)
as

	declare @v_start_date datetime
	
	declare @v_end_date datetime

	

begin

	set @v_start_date = convert(datetime,@start_date,101)
	set @v_end_date = convert(datetime,@end_date,101)


SELECT f.facility_name, a.apr_code, a.apr_desc, sum(convert(decimal(10,1), DATEDIFF(n,e.start_time,e.end_time)/60.00)) AS total_hours, count(t.ctc_id) no_students, sum(convert(decimal(10,1), DATEDIFF(n,e.start_time,e.end_time)/60.00)) / count(t.ctc_id) avg_hrs_student
FROM ctc.events e, ctc.facility f, ctc.alpha_student t, ctc.event_attendance ea, ctc.apr a 
WHERE f.unit =  t.unit
AND t.ctc_id = ea.ctc_id
AND e.event_id = ea.event_id
AND a.apr_code = e.apr_code
AND e.date_of_service Between @v_start_date and @v_end_date
GROUP BY f.facility_name, e.apr_code, a.apr_code, a.apr_desc 
ORDER BY f.facility_name, a.apr_code, a.apr_desc




end

