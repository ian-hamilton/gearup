using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CTC.DAL;
using CTC.DAL.Entities;
using EnterpriseNETClass;
using System.Collections.Generic;

/// <summary>
/// Summary description for EventManager
/// </summary>
public class EventManager : BusinessRuleFacilityManager
{
    private Events _event;
    private Attendance_exception _viewAttendanceException;

    private Int64 _currentEventAttendanceId = 0;
    private ProfileManager.AttendanceType _currentAttendanceType;


    private struct sAttendanceType
    {
        public const Int64 family = 1;
        public const Int64 staff = 2;
        public const Int64 facilitator = 3;
        public const Int64 volunteer = 4;

    }

    public ProfileManager.AttendanceType CurrentAttendanceType
    {
        get { return _currentAttendanceType; }
        set { _currentAttendanceType = value; }
    }

    public Int64 CurrentEventAttendanceId
    {
        get { return _currentEventAttendanceId; }
        set { _currentEventAttendanceId = value; }
    }

    public Attendance_exception ViewAttendanceException
    {
        get { return _viewAttendanceException; }
    }

    public EventManager()
    {
        this._event = new Events();

        this.RedirectURL = "~/events/editevent.aspx";
    }

    public EventManager(string eventid)
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        this._event = (Events)doa.selectObjects(typeof(Events), "@event_id = " + eventid, "")[0];

        doa.Dispose();

        this._currentEditType = EditType.edit;

        this.RedirectURL = "~/events/editevent.aspx";

        this._entityTypeSearchString = new string[0];
    }

    public void duplicateCleanse(String user)
    {
        this._event.Attendance_exception = new System.Collections.Generic.List<Attendance_exception>();

        List<Object> deleteList = new System.Collections.Generic.List<Object>();
        foreach (Event_attendance ea in this.Event.Event_attendance)
        {
            if (ea.status_flag == 0)
            {
                deleteList.Add(ea);
            }
            else
            {
                ea.event_attendance_id = 0;
                ea.row_created_by_user_id = user;
                ea.row_updated_by_user_id = user;
            }
        }

        foreach(Object o in deleteList)
        {
            this.Event.Event_attendance.Remove((Event_attendance)o);
        }

        deleteList = new System.Collections.Generic.List<Object>();
        foreach (Event_facility ef in this.Event_Facilities)
        {
            if (ef.status_flag == 0)
            {
                deleteList.Add(ef);
            }
            else
            {
                ef.event_facility_id = 0;
                ef.row_created_by_user_id = user;
                ef.row_updated_by_user_id = user;
            }
        }
        foreach (Object o in deleteList)
        {
            this.Event_Facilities.Remove((Event_facility)o);
        }

        deleteList = new System.Collections.Generic.List<Object>();
        foreach (Event_program ep in this.Event_Programs)
        {
            if(ep.status_flag == 0)
            {
                deleteList.Add(ep);
            }
            else
            {
                ep.event_program_id = 0;
                ep.row_created_by_user_id = user;
                ep.row_updated_by_user_id = user;
            }
        }
        foreach (Object o in deleteList)
        {
            this.Event_Programs.Remove((Event_program)o);
        }
    }

    public Events Event
    {
        get { return _event; }
        set { _event = value; }
    }

  
    public static System.Data.DataTable selectLikeEvents(string id, string title, string start, string end)
    {
        string where = String.Empty;

        //System.Collections.Generic.List<Events> list = null;

        if (!String.IsNullOrEmpty(id))
        {
            where = " event_id = " + id;
        }
        else if(!String.IsNullOrEmpty(title))
        {
            where = " event_title like '" + title + "%'";
        }
        else if (!String.IsNullOrEmpty(start) && !String.IsNullOrEmpty(end))
        {
            where = " date_of_service >= '" + start + "' and date_of_service <='" + end + "'";
        }

        return DataAccess.executeSelect(DataAccess.SQL_SELECT_LIKE_EVENTS + where).Tables[0];

        //DatabaseObjectAccess doa = DataAccess.createDOA();

        //list = (System.Collections.Generic.List<Events>)doa.selectObjects(typeof(Events), where, "event_id");

        //if (list == null)
        //{
        //    throw new Exception(doa.CurrentException.Message + doa.CurrentException.StackTrace);
        //}

        //doa.Dispose();

        //return list;
    }

    public static System.Collections.Generic.List<Apr> selectActiveApr()
    {
        System.Collections.Generic.List<Apr> list = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        list = (System.Collections.Generic.List<Apr>)doa.selectObjects(
            typeof(Apr), "@status_flag = 1", "apr_desc");

        doa.Dispose();

        return list;

    }


    public void addEvent(string event_title, string apr_code, string dateOfService, string startTime, 
        string endTime, string eventComment, bool active, string userName)
    {
        Events e = this._event;

        e.event_title = event_title;
        e.apr_code = apr_code;
        //try
        //{
        //    e.date_of_service = DateTime.Parse(dateOfService);
        //}
        //catch { }
        e.row_created = DateTime.Now;
        e.row_created_by_user_id = userName;

        this.updateEvent(dateOfService, startTime, endTime, eventComment, active, userName);

        if (this._currentEditType == EditType.create) { this._currentEditType = EditType.predit; }
    }

    public void updateEvent(string event_date, string startTime, string endTime, string eventComment, bool active, string userName)
    {
        this.reset();

        Events e = this._event;


        if (!String.IsNullOrEmpty(event_date))
            e.date_of_service = DateTime.Parse(event_date);
        if (!String.IsNullOrEmpty(startTime))
            e.start_time = DateTime.Parse(e.date_of_service.ToShortDateString() + " " + startTime);
        if (!String.IsNullOrEmpty(endTime))
            e.end_time = DateTime.Parse(e.date_of_service.ToShortDateString() + " " + endTime);

        e.event_comment = eventComment;
        e.status_flag = Convert.ToInt32(active);
        e.row_updated = DateTime.Now;
        e.row_updated_by_user_id = userName;
    }

    public void saveEvent()
    {
        this.CurrentMessage = validate();

        if (String.IsNullOrEmpty(this.CurrentMessage))
        {

            DatabaseObjectAccess doa = DataAccess.createDOA();

            Events e = (Events)doa.persistObject(this._event);

            if (e == null)
            {
                this.CurrentMessage = doa.CurrentException.Message;
            }
            else
            {
                this._event = e;

                this.CurrentMessage = "Event saved successfully!";

                this._currentEditType = EditType.edit;

            }
        }
    }


    public override string validate()
    {
        return String.Empty;
    }

    #region Attendance Methods


    /* Students Attendance*/
    public DataTable getAlphaStudentsPerUnit(string eventId, string event_date)
    {

        return DataAccess.eventAttendanceStudent(eventId, event_date);        

    }

    public Event_attendance getAttendancePerStudent(Int64 ctcId)
    {

        Event_attendance attendance = this._event.Event_attendance.Find(delegate(Event_attendance ea) { return ea.ctc_id == ctcId; });

        return attendance;

    }
    public System.Collections.Generic.List<Event_attendance> getCTCAttendanceList()
    {
        System.Collections.Generic.List<Event_attendance> list = null;

        list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.ctc_id != null && ea.full_reverse_name.Length > 0; });

        list.Sort(delegate(Event_attendance ea1, Event_attendance ea2)
        {
            return ea1.full_reverse_name.CompareTo(ea2.full_reverse_name);
        });

        return list;
    }

    public void addCTC(string ctcId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.ctc_id == long.Parse(ctcId); });

        if (ea != null)
        {
            ea.status_flag = 1;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
        else
        {
            ea = new Event_attendance();
            ea.ctc_id = long.Parse(ctcId);
            ea.status_flag = 1;
            ea.row_created = DateTime.Now;
            ea.row_updated = DateTime.Now;
            ea.row_created_by_user_id = userName;
            ea.row_updated_by_user_id = userName;

            this._event.Event_attendance.Add(ea);
        }

    }

    public void removeCTC(string ctcId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.ctc_id == long.Parse(ctcId); });

        if (ea != null)
        {
            ea.status_flag = 0;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
    }

    /* Students Attendance*/

    /* Family Attendance */
    public DataTable getFamilyPerUnit(string eventId)
    {

        return DataAccess.eventAttendanceFamily(eventId);

    }

    public Event_attendance getAttendancePerFamily(Int64 entityId)
    {

        Event_attendance attendance = this._event.Event_attendance.Find(delegate(Event_attendance ea) { return ea.entity_id == entityId && ea.event_attendance_type_id == sAttendanceType.family; });

        return attendance;

    }

    public System.Collections.Generic.List<Event_attendance> getFamilyAttendanceList()
    {
        System.Collections.Generic.List<Event_attendance> list = null;

        list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.ctc_id == null && ea.event_attendance_type_id != null && ea.event_attendance_type_id == sAttendanceType.family; });

        list.Sort(delegate(Event_attendance ea1, Event_attendance ea2)
        {
            return ea1.display_reverse_full_name.CompareTo(ea2.display_reverse_full_name);
        });

        return list;
    }

    public void addFamily(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId) && a.event_attendance_type_id == sAttendanceType.family; });

        if (ea != null)
        {
            ea.status_flag = 1;
            ea.event_attendance_type_id = sAttendanceType.family;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
        else
        {
            ea = new Event_attendance();
            ea.entity_id = long.Parse(entityId);
            ea.event_attendance_type_id = sAttendanceType.family;
            ea.status_flag = 1;
            ea.row_created = DateTime.Now;
            ea.row_updated = DateTime.Now;
            ea.row_created_by_user_id = userName;
            ea.row_updated_by_user_id = userName;

            this._event.Event_attendance.Add(ea);
        }

    }

    public void removeFamily(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId); });

        if (ea != null)
        {
            ea.status_flag = 0;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
    }

    /* Family Attendance */

    /* Staff Attendance */

    public DataTable getStaffPerUnitOrNull(string eventId)
    {

        return DataAccess.eventAttendanceStaff(eventId);

    }

    public Event_attendance getAttendancePerStaff(Int64 entityId)
    {

        Event_attendance attendance = this._event.Event_attendance.Find(delegate(Event_attendance ea) { return ea.entity_id == entityId && ea.event_attendance_type_id == sAttendanceType.staff; });

        return attendance;

    }

    public System.Collections.Generic.List<Event_attendance> getStaffAttendanceList()
    {
        System.Collections.Generic.List<Event_attendance> list = null;

        list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.ctc_id == null && ea.event_attendance_type_id != null && ea.event_attendance_type_id == sAttendanceType.staff; });

        list.Sort(delegate(Event_attendance ea1, Event_attendance ea2)
        {
            return ea1.display_reverse_full_name.CompareTo(ea2.display_reverse_full_name);
        });

        return list;
    }

    public void addStaff(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId) && a.event_attendance_type_id == sAttendanceType.staff; });

        if (ea != null)
        {
            ea.status_flag = 1;
            ea.event_attendance_type_id = sAttendanceType.staff;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
        else
        {
            ea = new Event_attendance();
            ea.entity_id = long.Parse(entityId);
            ea.event_attendance_type_id = sAttendanceType.staff;
            ea.status_flag = 1;
            ea.row_created = DateTime.Now;
            ea.row_updated = DateTime.Now;
            ea.row_created_by_user_id = userName;
            ea.row_updated_by_user_id = userName;

            this._event.Event_attendance.Add(ea);
        }

    }

    public void removeStaff(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId); });

        if (ea != null)
        {
            ea.status_flag = 0;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
    }

    /* Staff Attendance */

    /* Facilitator Attendance */


    public Event_attendance getAttendancePerFacilitator(Int64 entityId)
    {

        Event_attendance attendance = this._event.Event_attendance.Find(delegate(Event_attendance ea) { return ea.entity_id == entityId && ea.event_attendance_type_id == sAttendanceType.facilitator; });

        return attendance;

    }

    public System.Collections.Generic.List<Event_attendance> getFacilitatorAttendanceList()
    {
        System.Collections.Generic.List<Event_attendance> list = null;

        list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.ctc_id == null && ea.event_attendance_type_id != null && ea.event_attendance_type_id == sAttendanceType.facilitator; });

        list.Sort(delegate(Event_attendance ea1, Event_attendance ea2)
        {
            return ea1.display_reverse_full_name.CompareTo(ea2.display_reverse_full_name);
        });

        return list;
    }

    

    public void addFacilitator(string entityId, string userName)
    {

        /* this must search the type of staff because this particular
         * entity advances from staff to facilitator*/
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId)
            && (a.event_attendance_type_id == sAttendanceType.facilitator || a.event_attendance_type_id == sAttendanceType.staff); });

        if (ea != null)
        {
            ea.status_flag = 1;
            ea.event_attendance_type_id = sAttendanceType.facilitator;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
        //else
        //{
        //    ea = new Event_attendance();
        //    ea.entity_id = long.Parse(entityId);
        //    ea.attendance_type = "staff";
        //    ea.status_flag = 1;
        //    ea.row_created = DateTime.Now;
        //    ea.row_updated = DateTime.Now;
        //    ea.row_created_by_user_id = userName;
        //    ea.row_updated_by_user_id = userName;

        //    this._event.Event_attendance.Add(ea);
        //}

    }

    public void removeFacilitator(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId) && a.event_attendance_type_id == sAttendanceType.facilitator; });

        if (ea != null)
        {
            ea.status_flag = 1;
            ea.event_attendance_type_id = sAttendanceType.staff;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
    }

    /* Facilitator Attendance */

    /* Volunteer Attendance */
    public DataTable getVolunteersPerUnitOrNull(string eventId)
    {

        return DataAccess.eventAttendanceVolunteer(eventId);

    }

    public Event_attendance getAttendancePerVolunteer(Int64 entityId)
    {

        Event_attendance attendance = this._event.Event_attendance.Find(delegate(Event_attendance ea) { return ea.entity_id == entityId && ea.event_attendance_type_id == sAttendanceType.volunteer; });

        return attendance;

    }

    public System.Collections.Generic.List<Event_attendance> getVolunteerAttendanceList()
    {
        System.Collections.Generic.List<Event_attendance> list = null;

        list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.ctc_id == null && ea.event_attendance_type_id != null && ea.event_attendance_type_id == sAttendanceType.volunteer; });

        list.Sort(delegate(Event_attendance ea1, Event_attendance ea2)
        {
            return ea1.display_reverse_full_name.CompareTo(ea2.display_reverse_full_name);
        });

        return list;
    }

    public void addVolunteer(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId) && a.event_attendance_type_id == sAttendanceType.volunteer; });

        if (ea != null)
        {
            ea.status_flag = 1;
            ea.event_attendance_type_id = sAttendanceType.volunteer;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
        else
        {
            ea = new Event_attendance();
            ea.entity_id = long.Parse(entityId);
            ea.event_attendance_type_id = sAttendanceType.volunteer;
            ea.status_flag = 1;
            ea.row_created = DateTime.Now;
            ea.row_updated = DateTime.Now;
            ea.row_created_by_user_id = userName;
            ea.row_updated_by_user_id = userName;

            this._event.Event_attendance.Add(ea);
        }

    }

    public void removeVolunteer(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId); });

        if (ea != null)
        {
            ea.status_flag = 0;
            ea.row_updated = DateTime.Now;
            ea.row_updated_by_user_id = userName;
        }
    }

    /* Volunteer Attendance */

    #endregion

    public override void addEntity(string entityId, string userName)
    {
        Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId); });

        if (this.Method == selectMethod.single)
        {
            this._event.responsible_entity_id = long.Parse(entityId);
        }
        else
        {

            if (ea != null)
            {
                ea.status_flag = 1;
                ea.row_updated = DateTime.Now;
                ea.row_updated_by_user_id = userName;
            }
            else
            {
                ea = new Event_attendance();
                ea.entity_id = long.Parse(entityId);
                ea.status_flag = 1;
                ea.row_created_by_user_id = userName;
                ea.row_updated_by_user_id = userName;

                this._event.Event_attendance.Add(ea);
            }
        }
    }

    public override void removeEnity(string entityId, string userName)
    {
        if (this.Method == selectMethod.single)
        {
            this.Event.responsible_entity_id = null;
        }
        else
        {

            Event_attendance ea = this._event.Event_attendance.Find(delegate(Event_attendance a) { return a.entity_id == long.Parse(entityId); });

            if (ea != null)
            {
                ea.status_flag = 0;
                ea.row_updated = DateTime.Now;
                ea.row_updated_by_user_id = userName;
            }
        }
    }

    public override System.Collections.IList getEntityList()
    {
        if (this.Method == selectMethod.single)
        {
            System.Collections.ArrayList list = new System.Collections.ArrayList();

            if (this.Event.responsible_entity_id.HasValue)
            {

                DatabaseObjectAccess doa = DataAccess.createDOA();

                Entity e = (Entity)doa.selectObjects(typeof(Entity), "@entity_id = " + this.Event.responsible_entity_id.ToString(), "")[0];

                list.Add(e);

            }

            return list;

        }
        else
        {

            System.Collections.Generic.List<Event_attendance> list = null;

            list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.entity_id != null; });

            return list;
        }
    }

    //public System.Collections.IList getNonFacilitatorList()
    //{
    //    System.Collections.Generic.List<Event_attendance> list = null;

    //    list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.display_unit != null; });

    //    return list;
    //}

    //public System.Collections.IList getFacilitatorList()
    //{
    //    System.Collections.Generic.List<Event_attendance> list = null;

    //    list = this._event.Event_attendance.FindAll(delegate(Event_attendance ea) { return ea.status_flag == 1 && ea.display_unit == null; });

    //    return list;
    //}

    //public System.Collections.Generic.List<Entity> getEnityPerUnit()
    //{

    //    System.Collections.Generic.List<Entity> list = null;

    //    DatabaseObjectAccess doa = DataAccess.createDOA();

    //    list = (System.Collections.Generic.List<Entity>)doa.selectObjectsSQL(
    //        typeof(Entity), DataAccess.SQL_EVENT_ENTITY_PER_TARGET.Replace("?event_id", this._event.event_id.ToString()));

    //    doa.Dispose();

    //    return list;

    //}

    //public System.Collections.Generic.List<Entity> getEnityPerNullUnit()
    //{

    //    System.Collections.Generic.List<Entity> list = null;

    //    DatabaseObjectAccess doa = DataAccess.createDOA();

    //    list = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity), "@status_flag = 1@unit is null", "@last_name@first_name");

    //    doa.Dispose();

    //    return list;

    //}



 

 

    public System.Collections.Generic.List<Attendance_exception> getAttendanceException()
    {
        System.Collections.Generic.List<Attendance_exception> returnList = null;

        returnList = this._event.Attendance_exception.FindAll(delegate(Attendance_exception ae) { return ae.status_flag == 1; });

        return returnList;
    }

    public void getAttendanceException(string id)
    {
        this._viewAttendanceException = this._event.Attendance_exception.Find(delegate(Attendance_exception ae) { return ae.attendance_excpetion_id == Int32.Parse(id); });
    }

    public override void addProgram(string programId, string userName)
    {
        Event_program ep = this.Event.Event_program.Find(delegate(Event_program p) { return p.program_id == long.Parse(programId); });

        if (ep != null)
        {
            ep.status_flag = 1;
            ep.row_updated = DateTime.Now;
            ep.row_updated_by_user_id = userName;
        }
        else
        {
            ep = new Event_program();

            ep.program_id = long.Parse(programId);
            ep.row_created_by_user_id = userName;
            ep.row_updated_by_user_id = userName;

            this.Event.Event_program.Add(ep);
        }
    }

    public override void removeProgram(string programId, string userName)
    {
        Event_program ep = this.Event.Event_program.Find(delegate(Event_program p) { return p.program_id == long.Parse(programId); });

        if (ep != null)
        {
            ep.status_flag = 0;
            ep.row_updated = DateTime.Now;
            ep.row_updated_by_user_id = userName;
        }
    }


    public System.Collections.Generic.List<Event_program> Event_Programs
    {
        get
        {
            return this.Event.Event_program.FindAll(delegate(Event_program ep) { return ep.status_flag == 1; });
        }
    }

    public override System.Collections.IList getProgramList()
    {
        return this.Event_Programs;
    }



    public override void addFacility(string facilityId, string userName)
    {
        if (this.isHost)
        {
            this.Event.host_facility_id = long.Parse(facilityId);
        }
        else
        {
            Event_facility fac = this.Event.Event_facility.Find(delegate(Event_facility f) { return f.facility_id == long.Parse(facilityId); });

            if (fac != null)
            {
                fac.status_flag = 1;
                fac.row_updated = DateTime.Now;
                fac.row_updated_by_user_id = userName;
            }
            else
            {
                fac = new Event_facility();
                fac.facility_id = long.Parse(facilityId);
                fac.row_created_by_user_id = userName;
                fac.row_updated_by_user_id = userName;
                this.Event.Event_facility.Add(fac);
            }

        }
    }

    public override void removeFacility(string facilityId, string userName)
    {
        if (this.isHost)
        {
            this.Event.host_facility_id = null;
        }
        else
        {
            Event_facility fac = this.Event.Event_facility.Find(delegate(Event_facility f) { return f.facility_id == long.Parse(facilityId); });

            if (fac != null)
            {
                fac.status_flag = 0;
                fac.row_updated = DateTime.Now;
                fac.row_updated_by_user_id = userName;
            }

        }
    }

    public System.Collections.Generic.List<Event_facility> Event_Facilities
    {
        get { return this.Event.Event_facility.FindAll(delegate(Event_facility ef) { return ef.status_flag == 1; }); }
    }

    public override System.Collections.IList getFacilityList()
    {
        System.Collections.IList list = null;

        if (this.isHost)
        {
            list = new System.Collections.Generic.List<Facility>();

            if (this.Event.host_facility_id.HasValue)
            {
                DatabaseObjectAccess doa = DataAccess.createDOA();

                list.Add(doa.selectObjects(typeof(Facility), "@facility_id = " + this.Event.host_facility_id, "")[0]);

                doa.Dispose();
            }
        }
        else
        {
            list = this.Event_Facilities;
        }

        return list;
    }

    public void addAttendanceException(string cpsId, string first_name, string last_name, string comment, bool isStudent, string userName)
    {
        Attendance_exception ae = new Attendance_exception();

        if (!String.IsNullOrEmpty(cpsId)) { ae.cps_id = long.Parse(cpsId); }
        ae.first_name = first_name;
        ae.last_name = last_name;
        ae.comment = comment;
        ae.student_information_flag = Convert.ToInt32(isStudent);

        ae.row_created_by_user_id = userName;
        ae.row_updated_by_user_id = userName;

        this._event.Attendance_exception.Add(ae);

    }

    public override void addLanguage(string languageId, string userName)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override void makeHomeLanguage(string languageId, string userName)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override void removeLanguage(string languageId, string userName)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override System.Collections.IList getLanguageList()
    {
        throw new Exception("The method or operation is not implemented.");
    }


    /* Calendar Methods */
    public static DataTable getEventsPerCalendar(DateTime start, DateTime end, string facility_id, String username)
    {
        return DataAccess.calendarEvents(start.ToShortDateString(), end.ToShortDateString(), facility_id, username);

    }

    public static int getCountOfAttendees(string event_id)
    {
        return DataAccess.eventAttendanceCount(event_id);
    }

}
