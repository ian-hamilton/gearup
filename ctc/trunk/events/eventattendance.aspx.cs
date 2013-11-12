using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class events_eventattendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) { this.loadControls(); }

        //if (!IsPostBack) 
        //{
        //    //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        //    EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;


        //    if (this.MultiView1.ActiveViewIndex == 0)
        //    {

        //        this.ListBoxAvailableStudents.DataSource = manager.getAlphaStudentsPerUnit(manager.Event.event_id.ToString());
        //        this.ListBoxAvailableStudents.DataTextField = "full_reverse_name";
        //        this.ListBoxAvailableStudents.DataValueField = "ctc_id";
        //        this.ListBoxAvailableStudents.DataBind();
        //    }
        //    else if (this.MultiView1.ActiveViewIndex == 1)
        //    {

        //        this.ListBoxAvailableFamily.DataSource = manager.getFamilyPerUnit(manager.Event.event_id.ToString());
        //        this.ListBoxAvailableFamily.DataTextField = "full_reverse_name";
        //        this.ListBoxAvailableFamily.DataValueField = "entity_id";
        //        this.ListBoxAvailableFamily.DataBind();
        //    }
        //    else if (this.MultiView1.ActiveViewIndex == 2)
        //    {

        //        this.ListBoxAvailableStaff.DataSource = manager.getStaffPerUnitOrNull(manager.Event.event_id.ToString());
        //        this.ListBoxAvailableStaff.DataTextField = "full_reverse_name";
        //        this.ListBoxAvailableStaff.DataValueField = "entity_id";
        //        this.ListBoxAvailableStaff.DataBind();
        //    }
        //    else if (this.MultiView1.ActiveViewIndex == 3)
        //    {
        //        this.ListBoxAvailableVolunteers.DataSource = manager.getVolunteersPerUnitOrNull(manager.Event.event_id.ToString());
        //        this.ListBoxAvailableVolunteers.DataTextField = "full_reverse_name";
        //        this.ListBoxAvailableVolunteers.DataValueField = "entity_id";
        //        this.ListBoxAvailableVolunteers.DataBind();
        //    }


        //    //this.ListBoxAvailableEntity.DataSource = manager.getEnityPerUnit();
        //    //this.ListBoxAvailableEntity.DataTextField = "display_reverse_full_name";
        //    //this.ListBoxAvailableEntity.DataValueField = "entity_id";
        //    //this.ListBoxAvailableEntity.DataBind();

        //    ////this.ListBoxAvailableFacilitators.DataSource = manager.getEnityPerNullUnit();
        //    ////this.ListBoxAvailableFacilitators.DataTextField = "display_reverse_full_name";
        //    ////this.ListBoxAvailableFacilitators.DataValueField = "entity_id";
        //    ////this.ListBoxAvailableFacilitators.DataBind();

        //    this.loadControls(); 
        //}
    }

    private void loadControls()
    {

        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        if (this.MultiView1.ActiveViewIndex == 0)
        {

            String event_date = manager.Event.date_of_service.ToShortDateString();

            this.ListBoxAvailableStudents.DataSource = manager.getAlphaStudentsPerUnit(manager.Event.event_id.ToString(), event_date);
            this.ListBoxAvailableStudents.DataTextField = "full_reverse_name";
            this.ListBoxAvailableStudents.DataValueField = "ctc_id";
            this.ListBoxAvailableStudents.DataBind();

            this.ListBoxSelectedStudent.DataSource = manager.getCTCAttendanceList();
            this.ListBoxSelectedStudent.DataTextField = "full_reverse_name";
            this.ListBoxSelectedStudent.DataValueField = "ctc_id";
            this.ListBoxSelectedStudent.DataBind();
        }
        else if (this.MultiView1.ActiveViewIndex == 1)
        {

            this.ListBoxAvailableFamily.DataSource = manager.getFamilyPerUnit(manager.Event.event_id.ToString());
            this.ListBoxAvailableFamily.DataTextField = "full_reverse_name";
            this.ListBoxAvailableFamily.DataValueField = "entity_id";
            this.ListBoxAvailableFamily.DataBind();

            this.ListBoxSelectedFamily.DataSource = manager.getFamilyAttendanceList();
            this.ListBoxSelectedFamily.DataTextField = "display_reverse_full_name";
            this.ListBoxSelectedFamily.DataValueField = "entity_id";
            this.ListBoxSelectedFamily.DataBind();
        }

        if (this.MultiView1.ActiveViewIndex == 2)
        {
            this.ListBoxAvailableStaff.DataSource = manager.getStaffPerUnitOrNull(manager.Event.event_id.ToString());
            this.ListBoxAvailableStaff.DataTextField = "full_reverse_name";
            this.ListBoxAvailableStaff.DataValueField = "entity_id";
            this.ListBoxAvailableStaff.DataBind();

            this.ListBoxSelectedStaff.DataSource = manager.getStaffAttendanceList();
            this.ListBoxSelectedStaff.DataTextField = "display_reverse_full_name";
            this.ListBoxSelectedStaff.DataValueField = "entity_id";
            this.ListBoxSelectedStaff.DataBind();

            this.ListBoxSelectedFacilitator.DataSource = manager.getFacilitatorAttendanceList();
            this.ListBoxSelectedFacilitator.DataTextField = "display_reverse_full_name";
            this.ListBoxSelectedFacilitator.DataValueField = "entity_id";
            this.ListBoxSelectedFacilitator.DataBind();
        }

        if (this.MultiView1.ActiveViewIndex == 3)
        {
            this.ListBoxAvailableVolunteers.DataSource = manager.getVolunteersPerUnitOrNull(manager.Event.event_id.ToString());
            this.ListBoxAvailableVolunteers.DataTextField = "full_reverse_name";
            this.ListBoxAvailableVolunteers.DataValueField = "entity_id";
            this.ListBoxAvailableVolunteers.DataBind();

            this.ListBoxSelectedVolunteers.DataSource = manager.getVolunteerAttendanceList();
            this.ListBoxSelectedVolunteers.DataTextField = "display_reverse_full_name";
            this.ListBoxSelectedVolunteers.DataValueField = "entity_id";
            this.ListBoxSelectedVolunteers.DataBind();
        }

        //this.ListBoxSelectedEntity.DataSource = manager.getNonFacilitatorList();
        //this.ListBoxSelectedEntity.DataTextField = "display_reverse_full_name";
        //this.ListBoxSelectedEntity.DataValueField = "entity_id";
        //this.ListBoxSelectedEntity.DataBind();

        //this.ListBoxSelectedFacilitators.DataSource = manager.getFacilitatorList();
        //this.ListBoxSelectedFacilitators.DataTextField = "display_reverse_full_name";
        //this.ListBoxSelectedFacilitators.DataValueField = "entity_id";
        //this.ListBoxSelectedFacilitators.DataBind();

       

    }


    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        Server.Transfer(manager.RedirectURL);
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {

        foreach (ListItem item in this.ListBoxAvailableStudents.Items)
        {
            if (item.Selected)
            {

                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.addCTC(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();
        
    }
    protected void ButtonRemove_Click(object sender, EventArgs e)
    {

        foreach(ListItem item in this.ListBoxSelectedStudent.Items)
        {
            if (item.Selected)
            {

                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.removeCTC(item.Value, this.User.Identity.Name);

                
            }

        }

        this.loadControls();
    }

    protected void ButtonAddFamily_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxAvailableFamily.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.addFamily(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();

    }
    protected void ButtonRemoveFamily_Click(object sender, EventArgs e)
    {

        foreach(ListItem item in this.ListBoxSelectedFamily.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.removeFamily(item.Value, this.User.Identity.Name);

                
            }

        }

        this.loadControls();
    }


    protected void ButtonAddStaff_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxAvailableStaff.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.addStaff(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();
    }
    protected void ButtonRemoveStaff_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxSelectedStaff.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.removeStaff(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();
    }

    protected void ButtonAddVolunteer_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxAvailableVolunteers.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.addVolunteer(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();
    }
    protected void ButtonRemoveVolunteer_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxSelectedVolunteers.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.removeVolunteer(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();
    }




    protected void ButtonAddFacilitator_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxSelectedStaff.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.addFacilitator(item.Value, this.User.Identity.Name);

                
            }
        }

        this.loadControls();
    }
    protected void ButtonRemoveFacilitator_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in this.ListBoxSelectedFacilitator.Items)
        {
            if (item.Selected)
            {
                //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
                EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

                manager.removeFacilitator(item.Value, this.User.Identity.Name);

               
            }
        }

        this.loadControls();
    }
    protected void LinkButtonException_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/events/attendanceexception.aspx");
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        //if (!String.IsNullOrEmpty(this.TextBoxSearch.Text))
        //{

        //    EntityManager manager = new EntityManager();

        //    this.ListBoxAvailableFacilitators.DataSource = manager.selectLikeEntityFacilitators(this.TextBoxSearch.Text);
        //    this.ListBoxAvailableFacilitators.DataTextField = "display_reverse_full_name";
        //    this.ListBoxAvailableFacilitators.DataValueField = "entity_id";
        //    this.ListBoxAvailableFacilitators.DataBind();
        //}
    
    }
    protected void ImageButtonProfile_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListBoxSelectedStudent.SelectedIndex >= 0)
        {
            //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
            EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;
            
            manager.CurrentEventAttendanceId = manager.getAttendancePerStudent
                (Int64.Parse(this.ListBoxSelectedStudent.SelectedValue)).event_attendance_id;

            manager.CurrentAttendanceType = ProfileManager.AttendanceType.student;

            Response.Redirect("~/profiles/attendanceprofile.aspx");
        }
    }

    protected void ImageButtonFamilyProfile_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListBoxSelectedFamily.SelectedIndex >= 0)
        {
            //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
            EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

            manager.CurrentEventAttendanceId = manager.getAttendancePerFamily
                (Int64.Parse(this.ListBoxSelectedFamily.SelectedValue)).event_attendance_id;

            manager.CurrentAttendanceType = ProfileManager.AttendanceType.family;

            Response.Redirect("~/profiles/attendanceprofile.aspx");
        }
    }

    protected void ImageButtonStaffProfile_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListBoxSelectedStaff.SelectedIndex >= 0)
        {
            //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
            EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

            manager.CurrentEventAttendanceId = manager.getAttendancePerStaff
                (Int64.Parse(this.ListBoxSelectedStaff.SelectedValue)).event_attendance_id;

            manager.CurrentAttendanceType = ProfileManager.AttendanceType.staff;

            Response.Redirect("~/profiles/attendanceprofile.aspx");
        }
    }

    protected void ImageButtonFacilitatorProfile_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListBoxSelectedFacilitator.SelectedIndex >= 0)
        {
            //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
            EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

            manager.CurrentEventAttendanceId = manager.getAttendancePerFacilitator
                (Int64.Parse(this.ListBoxSelectedFacilitator.SelectedValue)).event_attendance_id;

            manager.CurrentAttendanceType = ProfileManager.AttendanceType.facilitator;

            Response.Redirect("~/profiles/attendanceprofile.aspx");
        }
    }

    protected void ImageButtonVolunteerProfile_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListBoxSelectedVolunteers.SelectedIndex >= 0)
        {
            //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
            EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

            manager.CurrentEventAttendanceId = manager.getAttendancePerVolunteer
                (Int64.Parse(this.ListBoxSelectedVolunteers.SelectedValue)).event_attendance_id;

            manager.CurrentAttendanceType = ProfileManager.AttendanceType.volunteer;

            Response.Redirect("~/profiles/attendanceprofile.aspx");
        }
    }

    //private void redirectProfile(Int64 attendanceId)
    //{
    //    EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];

    //    manager.CurrentEventAttendanceId = attendanceId;

    //    Server.Transfer("~/profiles/attendanceprofile.aspx");

    //}

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        int index = Int32.Parse(e.Item.Value);
        MultiView1.ActiveViewIndex = index;
        this.loadControls(); 
    }
        
}
