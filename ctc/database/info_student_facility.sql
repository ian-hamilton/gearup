USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[info_student_facility]    Script Date: 01/23/2011 23:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------

ALTER procedure [ctc].[info_student_facility] @id bigint
as
begin

SELECT DISTINCT facility_name
FROM ctc.alpha_student t
inner join ctc.facility f ON t.unit = f.unit
WHERE ctc_id = @id
AND facility_name <> 'unknown'

end
