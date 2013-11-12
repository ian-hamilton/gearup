using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using CTC.DAL;

/// <summary>
/// Summary description for InfoManager
/// </summary>
public class InfoManager
{
    public const string NONE = "No Data was Returned";

    public static string formatPhoneNumber(string phoneNumber)
    {
        string returnValue = String.Empty;

        if (phoneNumber.Length == 10)
        {

            returnValue = phoneNumber.Substring(0, 3) + "-" + phoneNumber.Substring(3, 3) + "-" + phoneNumber.Substring(6, 4);

        }

        return returnValue;
    }

    public static string formatShortDate(string date)
    {
        string returnValue = String.Empty;

        DateTime dateVal = DateTime.MinValue;

        if (DateTime.TryParse(date, out dateVal))
        {

            returnValue = dateVal.ToShortDateString();

        }

        return returnValue;
    }

    public static string formatMilitaryTime(string date)
    {
        string returnValue = String.Empty;

        DateTime dateVal = DateTime.MinValue;

        if (DateTime.TryParse(date, out dateVal))
        {

            returnValue = dateVal.ToString("HH:mm");

        }

        return returnValue;
    }

    public static DataTable studentAndGuardianInfo(string ctc_id)
    {
        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_and_guardian);

    }

    public static DataTable resideLanguages(string ctc_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_reside_language);

    }

    public static DataTable studentParticipation(string ctc_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_event_participation);

    }

    //public static DataTable studentTestPerformance(string ctc_id)
    //{

    //    return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_test_performance);

    //}




    public static DataTable studentLastThreeGearup(string ctc_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_top_3_gearup);

    }

    public static DataTable studentTopFacilitators(string ctc_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_top_facilitators);

    }

    public static DataTable studentTestPerformance(string ctc_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_test_performance);

    }

    public static DataTable parentParticipation(string ctc_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_parent_participation);

    }

    public static DataTable infoFamily(string ctc_id)
    {
        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_family);
    }

    public static DataTable infoStudentFacility(string ctc_id)
    {
        return DataAccess.infoStoredProcedure(Int64.Parse(ctc_id), DataAccess.einfoProcs.info_student_facility);
    }

    /*  facility view */

    public static DataTable facility(string facility_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(facility_id), DataAccess.einfoProcs.info_facility);

    }

    public static DataTable facilityPrograms(string facility_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(facility_id), DataAccess.einfoProcs.info_facility_programs);

    }

    public static DataTable facilityParticipation(string facility_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(facility_id), DataAccess.einfoProcs.info_facility_event_participation);

    }

    /* entity information views */

    public static DataTable entity(string entity_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(entity_id), DataAccess.einfoProcs.info_entity);

    }

    public static DataTable entityPrograms(string entity_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(entity_id), DataAccess.einfoProcs.info_entity_programs);

    }

    public static DataTable entityParticipation(string entity_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(entity_id), DataAccess.einfoProcs.info_entity_participation);

    }
    public static DataTable entityStudents(string entity_id)
    {
       

        return DataAccess.infoStoredProcedure(Int64.Parse(entity_id), DataAccess.einfoProcs.info_entity_student);

    }

    /* exception information */

    public static DataTable exception(string attendance_exception_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(attendance_exception_id), DataAccess.einfoProcs.info_exception);

    }

    /* event information */

    public static DataTable events(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_event);

    }

    public static DataTable eventsProgams(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_event_programs);

    }

    public static DataTable eventsTargetFacilities(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_event_target);

    }

    /* Event Attendance Information */


    public static DataTable eventsAttendanceStudent(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_attendance_student);

    }

    public static DataTable eventsAttendanceFacilitator(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_attendance_facilitator);

    }

    public static DataTable eventsAttendanceFamily(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_attendance_family);

    }

    public static DataTable eventsAttendanceStaff(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_attendance_staff);

    }

    public static DataTable eventsAttendanceVolunteer(string event_id)
    {

        return DataAccess.infoStoredProcedure(Int64.Parse(event_id), DataAccess.einfoProcs.info_attendance_volunteer);

    }

}
