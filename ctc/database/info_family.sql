USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[info_family]    Script Date: 06/25/2010 22:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------

ALTER procedure [ctc].[info_family] @id bigint
as
begin

SELECT e.entity_id,
e.last_name+ ', '+e.first_name+ ' '+Coalesce(e.middle_initial, '') as Name,
et.entity_type_desc as Relationship
FROM ctc.entity e
inner join ctc.master_entity me ON me.entity_id = e.entity_id
inner join ctc.entity_type et ON e.entity_type_id = et.entity_type_id
WHERE me.ctc_id = @id
AND me.status_flag = 1 AND e.status_flag =1 AND et.status_flag = 1
ORDER BY entity_type_desc

end