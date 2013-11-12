using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using EnterpriseNETClass;
using System.Data.SqlClient;

namespace CTC.DAL
{

    /// <summary>
    /// Summary description for DataAccess
    /// </summary>
    /// 
    public class DataAccess
    {
        /*event attendance */
        //private const string SQL_EVENT_STUDENTS_PER_TARGET = "select distinct alpha.ctc_id, alpha.first_name, alpha.last_name, alpha.dob,  "
        //                            + "alpha.unit, alpha.grade, alpha.gpa, alpha.cps_status, alpha.row_created  "
        //                            + "from ctc.event_facility ef,  "
        //                            + "ctc.facility f,  "
        //                            + "ctc.alpha_student_current "
        //                            + "where ef.facility_id = f.facility_id  "
        //                            + "and f.unit = alpha_student_current.unit  "
        //                            + "and ef.event_id = ?event_id  "
        //                            + "order by last_name, first_name";

        //public const string SQL_EVENT_ENTITY_PER_TARGET = "select distinct entity.entity_id, entity.entity_type_id, entity.title, entity.salutation, entity.first_name, entity.middle_initial, entity.last_name,  "
        //                            + "entity.address_1, entity.address_2, entity.city, entity.state, entity.zip, entity.phone, entity.phone_2,  "
        //                            + "entity.email, entity.gender, entity.ethnicity, entity.dob, entity.relation, entity.unit,  "
        //                            + "entity.status_flag, entity.row_created, entity.row_updated, entity.row_created_by_user_id, entity.row_updated_by_user_id  "
        //                            + "from ctc.event_facility ef,  "
        //                            + "ctc.facility f,  "
        //                            + "ctc.entity  "
        //                            + "where ef.facility_id = f.facility_id  "
        //                            + "and f.unit = entity.unit  "
        //                            + "and ef.event_id = ?event_id  "
        //                            + "order by last_name, first_name";

        public const string SQL_SELECT_COLLEGES = "select facility_id, facility_name from ctc.facility where status_flag = 1 AND facility_type_id in (4,5) order by facility_name";  

        public const string SQL_SELECT_BLOB = "select file_blob from ctc.file_repository where status_flag = 1 and file_repository_id = @id";

        public const string SQL_SELECT_LIKE_EVENTS = "SELECT e.[event_id]"
                                      +" ,e.[event_title]"
                                      +" ,e.[apr_code]"
                                      +" ,e.[date_of_service]"
                                      +" ,e.[start_time]"
                                      +" ,e.[end_time]"
                                      +" ,e.[host_facility_id]"
                                      +" ,e.[event_comment]"
                                      +" ,e.[status_flag]"
                                      +" ,e.[row_created]"
                                      +" ,e.[row_updated]"
                                      +" ,e.[row_created_by_user_id]"
                                      +" ,e.[row_updated_by_user_id]"
                                      +" ,e.[responsible_entity_id]"
                                      +" ,a.[apr_desc] as display_apr_desc"
                                      +" FROM [CTC].[ctc].[events] e inner join ctc.apr a on a.apr_code = e.apr_code where ";

       
        //
        private const string SQL_EVENT_FAMILY_PER_TARGET = "select distinct ent.entity_id, ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '') as [full_reverse_name] "
                                        + "from ctc.entity ent "
                                        + "inner join ctc.entity_type et ON ent.entity_type_id = et.entity_type_id "
                                        + "inner join ctc.entity_facility ef ON ent.entity_id = ef.entity_id "
                                        + "WHERE ent.status_flag = 1 AND et.status_flag = 1 AND ef.status_flag = 1 "
                                        + "AND et.entity_group in ('family') "
                                        + "AND ef.facility_id IN "
                                        + "(select f.facility_id "
                                        + "from ctc.events e "
                                        + "inner join ctc.event_facility ef ON e.event_id = ef.event_id "
                                        + "inner join ctc.facility f ON ef.facility_id = f.facility_id "
                                        + "where e.status_flag = 1 AND ef.status_flag = 1 AND f.status_flag = 1 "
                                        + "AND e.event_id = ?event_id) "
                                        + "order by ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '') ";


     

        private const string SQL_EVENT_STAFF_PER_TARGET_OR_NULL = "select distinct ent.entity_id, ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '') as [full_reverse_name]" 
                                        + "from ctc.entity ent "
                                        + "LEFT OUTER JOIN ctc.entity_facility ef ON ent.entity_id = ef.entity_id " 
                                        + "inner join ctc.entity_type et ON ent.entity_type_id = et.entity_type_id "
                                        + "WHERE ent.entity_type_id = et.entity_type_id "
                                        + "and et.entity_group in ('CTC Staff', 'CPS Staff', 'Administration', 'School Staff', 'Other Staff'," 
                                        + "'Teacher', 'Teacher - SPED', 'Teacher Support', 'Teacher Support-BiLingual', 'Teacher Support-SPED', " 
                                        + "'Teacher-BiLingual') and ent.status_flag = 1 "
                                        + "and facility_id IS NULL "
                                        + "UNION "
		                                + "select distinct ent.entity_id, ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '') as [full_reverse_name]" 
                                        + "from ctc.entity ent "
                                        + "inner join ctc.entity_type et ON ent.entity_type_id = et.entity_type_id " 
                                        + "inner join ctc.entity_facility ef ON ent.entity_id = ef.entity_id "
                                        + "WHERE ent.status_flag = 1 AND et.status_flag = 1 AND ef.status_flag = 1 " 
                                        + "AND et.entity_group in ('CTC Staff', 'CPS Staff', 'Administration', 'School Staff', 'Other Staff', " 
                                        + "'Teacher', 'Teacher - SPED', 'Teacher Support', 'Teacher Support-BiLingual', 'Teacher Support-SPED', " 
                                        + "'Teacher-BiLingual') "
                                        + "AND ef.facility_id IN "
                                        + "(select f.facility_id "
                                        + "from ctc.events e "
                                        + "inner join ctc.event_facility ef ON e.event_id = ef.event_id " 
                                        + "inner join ctc.facility f ON ef.facility_id = f.facility_id "
                                        + "where e.status_flag = 1 AND ef.status_flag = 1 AND f.status_flag = 1 "
                                        + "AND e.event_id = ?event_id) "
                                        + "ORDER BY ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '')" ;



        /* */

        public const string SQL_EVENT_FACILITATOR_LIKE = "select entity.*"
                                    + " from ctc.entity, ctc.entity_type t"
                                    + " where entity.entity_type_id = t.entity_type_id"
                                    + " and entity.status_flag = 1"
                                    + " and (ltrim(rtrim(t.entity_group)) = 'CTC Staff' or ltrim(rtrim(t.entity_group)) = 'CPS Staff')"
                                    + " and lower(last_name) like lower('?last_name%') and ent.status_flag = 1 order by last_name";

        private const string SQL_EVENT_CALENDAR = "select e.event_id as 'id', e.event_title as 'name', e.start_time as 'start', DATEADD(hh,1,e.start_time) as 'end'"
                                                    + " from ctc.events e"
                                                    + " inner join ctc.event_facility ef on e.event_id = ef.event_id"
                                                    + " inner join ctc.facility fac on fac.facility_id = ef.facility_id"
                                                    + " inner join ctc.user_unit uu on uu.unit = fac.unit"
                                                    + " where cast(CONVERT(char(10), e.start_time, 110) as datetime) >= '@start' and cast(CONVERT(char(10), e.start_time, 110) as datetime) <= '@end'"
                                                    + " and (ef.facility_id = @facility_id or -1 = @facility_id)"
                                                    + " and e.status_flag = 1 and ef.status_flag = 1"
                                                    + " and uu.username = '@username' and uu.status_flag = 1"
                                                    + " group by e.event_id, e.event_title, e.start_time, DATEADD(hh,1,e.start_time)";


        //public const string SQL_EVENT_STUDENTS_PER_TARGET2 = "select distinct alpha.ctc_id, alpha.last_name + ', ' + alpha.first_name + ' ' + Coalesce(alpha.middle_initial, '')  as [full_reverse_name] "
        //                          + "from ctc.event_facility ef, "
        //                          + "ctc.facility f, "
        //                          + "ctc.alpha_student_current alpha "
        //                          + "where ef.facility_id = f.facility_id "
        //                          + "and f.unit = alpha.unit "  
        //                          + "and ef.event_id = ?event_id "
        //                          + "order by alpha.last_name + ', ' + alpha.first_name ";

        public const string SQL_EVENT_STUDENTS_PER_TARGET2 = "select distinct alpha.ctc_id, alpha.last_name + ', ' + alpha.first_name + ' ' + Coalesce(alpha.middle_initial, '')  as [full_reverse_name] "
                                                                + "from ctc.event_facility ef "
                                                                + "inner join ctc.facility f ON ef.facility_id = f.facility_id "
                                                                + "inner join ctc.alpha_student alpha ON f.unit = alpha.unit "
                                                                + "WHERE alpha.upload_id IN (SELECT upload_id FROM ctc.upload WHERE semester = (SELECT semester_code FROM ctc.IT_system_semesters WHERE '?event_date' BETWEEN semester_start_date AND semester_end_date)) "
                                                                + "and ef.event_id = ?event_id "
                                                                + "order by alpha.last_name + ', ' + alpha.first_name + ' ' + Coalesce(alpha.middle_initial, '') ";

        public const string SQL_EVENT_VOLUNTEERS = "select distinct ent.entity_id, ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '') as [full_reverse_name]" 
                                        + "from ctc.entity ent "
                                        + "LEFT OUTER JOIN ctc.entity_facility ef ON ent.entity_id = ef.entity_id " 
                                        + "inner join ctc.entity_type et ON ent.entity_type_id = et.entity_type_id "
                                        + "WHERE ent.entity_type_id = et.entity_type_id "
                                        + "and facility_id IS NULL "
                                        + "UNION "
		                                + "select distinct ent.entity_id, ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '') as [full_reverse_name]" 
                                        + "from ctc.entity ent "
                                        + "inner join ctc.entity_type et ON ent.entity_type_id = et.entity_type_id " 
                                        + "inner join ctc.entity_facility ef ON ent.entity_id = ef.entity_id "
                                        + "WHERE ent.status_flag = 1 AND et.status_flag = 1 AND ef.status_flag = 1 " 
                                        + "AND ef.facility_id IN "
                                        + "(select f.facility_id "
                                        + "from ctc.events e "
                                        + "inner join ctc.event_facility ef ON e.event_id = ef.event_id " 
                                        + "inner join ctc.facility f ON ef.facility_id = f.facility_id "
                                        + "where e.status_flag = 1 AND ef.status_flag = 1 AND f.status_flag = 1 "
                                        + "AND e.event_id = ?event_id) "
                                        + "ORDER BY ent.last_name + ', ' + ent.first_name + ' ' + Coalesce(ent.middle_initial, '')" ;

        public const string SQL_FACILITIES_PER_PROGRAM = "select * "
                                    + "from ctc.facility "
                                    + "inner join ctc.facility_programs fp on fp.facility_id = ctc.facility.facility_id "
                                    + "where ctc.facility.status_flag = 1 "
                                    + "and fp.program_id = ?program_id "
                                    + "and ctc.facility.facility_name like '?facility_name%'";
                    
 
     
        public const string SQL_SELECT_FACILITY_PER_SECURITY_UNIT = "select * from ctc.facility left outer join ctc.user_unit uu on facility.unit = uu.unit where ((uu.unit = facility.unit and uu.username = '?1') or facility.unit is null) and facility_name like '?2%' ?3 and facility.status_flag = 1 order by facility_name";

        public const string SQL_SELECT_FACILITY_PER_SECURITY_UNIT_BY_UNIT = "select * from ctc.facility left outer join ctc.user_unit uu on facility.unit = uu.unit where ((uu.unit = facility.unit and uu.username = '?1') or facility.unit is null) and facility.unit = ?2 and facility.status_flag = 1 order by facility_name";

        public const string SQL_SELECT_ENTITY_PER_SECURITY_UNIT = "select * from ctc.entity ,ctc.user_unit uu where uu.status_flag = 1 and (uu.unit = entity.unit or entity.unit is null) and uu.username = '?1' and last_name like '?2%' order by entity.last_name, entity.first_name";

        public const string SQL_SELECT_ENTITY_PER_SECURITY_UNIT_BY_ID = "select distinct * from ctc.entity ,ctc.user_unit uu where uu.status_flag = 1 and (uu.unit = entity.unit or entity.unit is null) and uu.username = '?1' and entity_id = ?2";

        //public const string SQL_SELECT_ENTITY_PER_MASTER_ENTITY_BY_ID = "select distinct * from ctc.entity INNER JOIN ctc.master_entity ON ctc.entity.entity_id = ctc.master_entity.entity_id where ctc.entity.status_flag = 1 and ctc.master_entity.status_flag = 1 and ctc.entity.entity_id = ?1";

        public const string SQL_SELECT_ENTITY_PER_SECURITY_UNIT_AND_TYPE = "select * from ctc.entity ,ctc.user_unit uu where uu.status_flag = 1 and entity.status_flag = 1 and (uu.unit = entity.unit or entity.unit is null) and uu.username = '?1' and last_name like '?2%' and entity_type_id = ?3 order by entity.last_name, entity.first_name";

        public const string SQL_SELECT_ALPHA_PER_SECURITY_UNIT = "select distinct * from ctc.alpha_student_current, ctc.user_unit uu where uu.status_flag = 1 and uu.unit = alpha_student_current.unit and uu.username = '?1' and last_name like '?2%' order by alpha_student_current.last_name, alpha_student_current.first_name";

        public const string SQL_SELECT_ALPHA_PER_SECURITY_CtcId = "select distinct * from ctc.alpha_student_current, ctc.user_unit uu where uu.status_flag = 1 and uu.unit = alpha_student_current.unit and uu.username = '?1' and ctc_id = ?2";

        public const string SQL_SELECT_ALPHA_PER_SECURITY_CpsId = "select distinct * from ctc.alpha_student_current INNER JOIN ctc.ctc_master ON ctc.alpha_student_current.ctc_id = ctc.ctc_master.ctc_id, ctc.user_unit where ctc.user_unit.status_flag = 1 and ctc.ctc_master.status_flag = 1 and ctc.user_unit.unit = alpha_student_current.unit and ctc.user_unit.username = '?1' and cps_id = ?2";
        
        public const string SQL_ALL_PROGAMS = "select program_name, program_id from ctc.program where status_flag = 1 order by program_name";

        public const string SQL_SELECT_ETHNICITY = "select ethnicity, ethnicity_desc, 1 as row "
                                                    + "from ctc.ethnicity "
                                                    + "where ethnicity_desc != 'Unknown' "
                                                    + "union "
                                                    + "select ethnicity, ethnicity_desc, 0 as row "
                                                    + "from ctc.ethnicity "
                                                    + "where ethnicity_desc = 'Unknown' "
                                                    + "order by row asc, ethnicity_desc asc";

        public const string SQL_SELECT_ALL_FACILITIES = "select '**All**' as facility_name, -1 as facility_id union select facility_name, facility_id from ctc.facility where status_flag = 1 order by facility_name";

     

        public const string SQL_SELECT_ALL_FACILITIES_BY_PROGRAM = "IF (SELECT COUNT(unit) FROM ctc.user_unit WHERE username = '?2' AND status_flag = 1) > 1 "
                                                                    + "BEGIN "
                                                                    + "SELECT '**All**' as facility_name, -1 as facility_id "
                                                                    + "UNION "
                                                                    + "SELECT facility_name, facility_id "
                                                                    + "FROM ctc.facility f "
                                                                    + "INNER JOIN ctc.user_unit uu on uu.unit = f.unit "
                                                                    + "WHERE f.status_flag = 1 AND uu.status_flag = 1 "
                                                                    + "and facility_id in (select distinct facility_id from ctc.facility_programs where program_id = '?1') "
                                                                    + "AND uu.username = '?2' "
                                                                    + "ORDER BY facility_name "
                                                                    + "END "
                                                                    + "ELSE "
                                                                    + "SELECT facility_name, facility_id "
                                                                    + "FROM ctc.facility f "
                                                                    + "INNER JOIN ctc.user_unit uu on uu.unit = f.unit "
                                                                    + "WHERE f.status_flag = 1 AND uu.status_flag = 1 "
                                                                    + "and facility_id in (select distinct facility_id from ctc.facility_programs where program_id = '?1') "
                                                                    + "AND uu.username = '?2' "
                                                                    + "ORDER BY facility_name ";


        
       
        //public const string SQL_SELECT_COUNT_ATTENDANCE = "SELECT CASE WHEN APR LIKE 'S%' THEN CT ELSE CASE WHEN APR LIKE 'P%' THEN CT+1 ELSE CASE WHEN APR LIKE 'T%' THEN CT+2 ELSE CASE WHEN APR LIKE 'ME%' THEN CT+3 ELSE 0 END END END END FROM (SELECT CT, APR FROM (SELECT apr_code AS APR FROM ctc.events e WHERE e.status_flag = 1 AND event_id = ?event_id)A, (SELECT CASE WHEN CT >= 1 THEN 1 ELSE 5 END AS CT FROM (SELECT COUNT(q.event_attendance_id)AS CT FROM (SELECT event_attendance_id, event_attendance_type_id FROM ctc.event_attendance ea INNER JOIN ctc.events e ON e.event_id = ea.event_id WHERE ea.event_id = ?event_id and ea.status_flag = 1) q WHERE q.event_attendance_type_id = 3 ) A )B )C";
       
        public const string SQL_SELECT_COUNT_ATTENDANCE = "SELECT CASE WHEN APR LIKE 'S%' THEN CT ELSE " 
                                                        + "CASE WHEN APR LIKE 'P%' THEN CT+1 ELSE " 
                                                        + "CASE WHEN APR LIKE 'T%' THEN CT+2 ELSE " 
                                                        + "CASE WHEN APR LIKE 'ME%' THEN CT+3 ELSE 0 END END END END " 
                                                        + "FROM " 
                                                            + "( "
                                                            + "SELECT CT, APR "
                                                            + "FROM " 
                                                                + "( "
                                                                + "SELECT apr_code AS APR " 
                                                                + "FROM ctc.events e " 
                                                                + "WHERE e.status_flag = 1 AND event_id = ?event_id "
                                                                + ")A, "
                                                            + "( "
                                                            + "SELECT CASE WHEN CT >= 1 THEN 1 ELSE 5 END AS CT "
                                                            + "FROM "
                                                                + "( "
                                                                + "SELECT COUNT(q.event_attendance_id)AS CT " 
                                                                + "FROM " 
                                                                    + "( "
                                                                    + "SELECT event_attendance_id, event_attendance_type_id " 
                                                                    + "FROM ctc.event_attendance ea " 
                                                                    + "INNER JOIN ctc.events e ON e.event_id = ea.event_id " 
                                                                    + "WHERE ea.event_id = ?event_id and ea.status_flag = 1 "
                                                                    + ") q " 
                                                            + "WHERE q.event_attendance_type_id = 3 " 
                                                            + ") A "
                                                        + ")B "
                                                + ")C ";
      



        public enum einfoProcs
        {
            info_student_and_guardian,
            info_student_event_participation,
            info_reside_language,
            info_student_top_3_gearup,
            info_student_top_facilitators,
            info_student_test_performance,
            info_student_parent_participation,
            info_family,
            info_student_facility,
            info_facility,
            info_facility_programs,
            info_facility_event_participation,
            info_entity,
            info_entity_programs,
            info_entity_participation,
            info_entity_student,
            info_exception,
            info_event,
            info_event_programs,
            info_event_target,
            info_attendance_facilitator,
            info_attendance_family,
            info_attendance_staff,
            info_attendance_student,
            info_attendance_volunteer
        }

        public DataAccess()
        {}

        public static DatabaseObjectAccess createDOA()
        {

            return new DatabaseObjectAccess(DBFactory.DatabaseType.sqlServer, SiteConfiguration.getMainConnectionString());

        }

        public static Byte[] getFileRepositoryByteArray(long repositoryId)
        {
            SqlConnection connection = new SqlConnection(SiteConfiguration.getMainConnectionString());
            connection.Open();
            System.Data.SqlClient.SqlCommand cmd = new SqlCommand(SQL_SELECT_BLOB, connection);
            cmd.Parameters.AddWithValue("@id", repositoryId);

            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();

            System.IO.MemoryStream memory = new System.IO.MemoryStream();
            long startIndex = 0;
            const int chunk = 256;

            while (true)
            {
                byte[] buffer = new byte[chunk];
                long retBytes = reader.GetBytes(0, startIndex, buffer, 0, chunk);
                memory.Write(buffer, 0, (int)retBytes);
                startIndex += retBytes;
                if (retBytes != chunk)
                    break;
            }

            connection.Close();
            Byte[] data = memory.ToArray();
            memory.Dispose();
            return data;
        }


        public static DataTable infoStoredProcedure(Int64 id, einfoProcs selectedProc)
        {

            SqlConnection connection = new SqlConnection(SiteConfiguration.getMainConnectionString());

            System.Data.SqlClient.SqlCommand cmd = new SqlCommand("ctc." + selectedProc.ToString(), connection);

            cmd.CommandTimeout = 0;

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            adapter.Fill(ds);

            connection.Close();
            cmd.Dispose();
            adapter.Dispose();
            connection.Dispose();

            return ds.Tables[0];

        }


        public static DataSet executeSelect(string sql)
        {
            SqlConnection connection = new SqlConnection(SiteConfiguration.getMainConnectionString());

            System.Data.SqlClient.SqlCommand cmd = new SqlCommand(sql, connection);

            cmd.CommandTimeout = 0;

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataSet set = new DataSet();

            adapter.Fill(set);

            connection.Close();
            connection.Dispose();
            cmd.Dispose();
            adapter.Dispose();

            return set;

        }

        public static DataTable calendarEvents(string firstDate, string lastDate, string facility_id, String username)
        {
            string sql = SQL_EVENT_CALENDAR.Replace("@start", firstDate).Replace("@end", lastDate).Replace("@facility_id", facility_id).Replace("@username", username);
          
         
            return executeSelect(sql).Tables[0];
        }

        public static DataTable eventAttendanceStudent(string eventid, string event_date)
        {
            string sql = SQL_EVENT_STUDENTS_PER_TARGET2.Replace("?event_id", eventid).Replace("?event_date", event_date);

            return executeSelect(sql).Tables[0];

        }

        public static DataTable eventAttendanceFamily(string eventid)
        {
            string sql = SQL_EVENT_FAMILY_PER_TARGET.Replace("?event_id", eventid);

            return executeSelect(sql).Tables[0];

        }

        public static DataTable eventAttendanceStaff(string eventid)
        {
            string sql = SQL_EVENT_STAFF_PER_TARGET_OR_NULL.Replace("?event_id", eventid);

            return executeSelect(sql).Tables[0];
        }

        public static DataTable eventAttendanceVolunteer(string eventid)
        {
            string sql = SQL_EVENT_VOLUNTEERS.Replace("?event_id", eventid);

            return executeSelect(sql).Tables[0];

        }

        public static int eventAttendanceCount(string event_id)
        {
            string sql = SQL_SELECT_COUNT_ATTENDANCE.Replace("?event_id", event_id);

            Object o = executeSelect(sql).Tables[0].Rows[0][0];

            return Int16.Parse(o.ToString());

        }

        public static DataSet executeReportSqlFunction(string sqlFunctionName, System.Collections.Generic.List<CTC.DAL.Entities.Rpt_report_detail> htable, String userName)
        {

            SqlConnection connection = new SqlConnection(SiteConfiguration.getMainConnectionString());

            System.Data.SqlClient.SqlCommand cmd = new SqlCommand(sqlFunctionName, connection);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.CommandTimeout = 0;

            //System.Collections.IDictionaryEnumerator ienum = htable.GetEnumerator();

            htable.Sort(delegate(CTC.DAL.Entities.Rpt_report_detail r1, CTC.DAL.Entities.Rpt_report_detail r2)
            {
                return r1.control_sequence.CompareTo(r2.control_sequence);
            });

             foreach(CTC.DAL.Entities.Rpt_report_detail detail in htable)
             {

              SqlParameter parameter = new SqlParameter(detail.parameter_name, detail.Postback_value);

                 cmd.Parameters.Add(parameter);

             }

             SqlParameter p = new SqlParameter("@userid", userName);

             cmd.Parameters.Add(p);

             SqlDataAdapter adapter = new SqlDataAdapter(cmd);

             DataSet set = new DataSet();

             adapter.Fill(set);

             connection.Close();
             connection.Dispose();
             cmd.Dispose();
             adapter.Dispose();

             return set;
        }


     
    }

}
