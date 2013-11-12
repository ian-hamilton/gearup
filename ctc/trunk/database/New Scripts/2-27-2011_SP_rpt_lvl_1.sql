USE [CTC]
GO
/****** Object:  StoredProcedure [ctc].[update_rpt_lvl1]    Script Date: 02/27/2011 21:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [ctc].[update_rpt_lvl1] @userid varchar (50), @user nvarchar(256), @new_rpt_lvl int AS

BEGIN

DECLARE @user_rpt_lvl int

SET @user_rpt_lvl = (SELECT rpt_lvl FROM ctc.user_unit WHERE rpt_lvl > 0 AND username = @userid)

IF (SELECT rpt_lvl FROM ctc.user_unit WHERE rpt_lvl > 0 AND username = @userid) = 99 
OR (SELECT rpt_lvl FROM ctc.user_unit WHERE rpt_lvl > 0 AND username = @userid) = 9


	IF @user_rpt_lvl IN (9,99) --1

	set @user_rpt_lvl = 1
----BEGIN
----
--IF (SELECT rpt_lvl FROM ctc.user_unit WHERE rpt_lvl > 0 AND username = @userid) = 9
--	IF @user_rpt_lvl = 9
--	
--	IF @new_rpt_lvl < 4 --2
----
--
--
----	BEGIN
--
----ELSE
--
--	BEGIN TRANSACTION
--
--	BEGIN TRY
--
--	DECLARE @id int
--
--	--SP Sets Report Levels 3 and Below. Data Services Manager to set Rpt_lvls > 3 (site liasion) 
--
--	-- Begin Update
--
--		UPDATE ctc.user_unit SET rpt_lvl = NULL WHERE username = @user  --Set all rpt_lvl records to NULL 
--
--		SET @id = (SELECT max(user_unit_id) FROM ctc.user_unit WHERE username = @user AND status_flag = 1) --Find max user_unit_id and assign variable
--
--		UPDATE ctc.user_unit SET rpt_lvl = @new_rpt_lvl WHERE username = @user AND user_unit_id = @id AND status_flag = 1--Set rpt_lvl  
--
--	IF @@ROWCOUNT = 0 SELECT '****ERROR**** No Report Levels were updated' AS 'Error Message' -- If no update occurs, inform user --3
--
----	BEGIN	
--	ELSE
--
--	SELECT 'Report Level Successfully Set For:' AS Message, username, rpt_lvl AS 'To rpt_lvl' FROM ctc.user_unit uu WHERE status_flag = 1 AND username = 'tuser'/*@user*/ AND rpt_lvl IS NOT NULL --inform user update was successful --3
--
--
--	END TRY
--
--			BEGIN CATCH
--
--			ROLLBACK TRANSACTION
--
--			SELECT 'THERE WAS AN ERROR IN SETTING THE RPT_LVL. THE TRASACTION HAS BEEN ROLLED BACK', ERROR_MESSAGE()
--
--			END CATCH
--
--	COMMIT TRANSACTION
--
--
----END	
----
	ELSE (SELECT 'Only Report Levels 3 and below can be set with this function' AS 'Error Message') --2
--
--END
----
ELSE 
	(SELECT 'You do not have the proper security level to access this report' AS 'Error Message') --1

END