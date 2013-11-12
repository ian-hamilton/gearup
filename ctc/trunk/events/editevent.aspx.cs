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

public partial class events_editevent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        JavascriptFactory.maxLengthMultiLine(this.TextBoxEventComment, 1000, this);

        if (!IsPostBack) { this.loadControls(); }
    }

    private void loadControls()
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        this.LabelStatus.Text = manager.CurrentMessage;

        this.LabelEventId.Text = manager.Event.event_id.ToString();
        this.LabelEventApr.Text = manager.Event.display_apr_desc;
        this.TextBoxEventDate.Text = manager.Event.date_of_service.ToShortDateString();
        this.LabelEventTitle.Text = manager.Event.event_title;
        this.LabelFacilityEditNon.Text = manager.Event.display_host_facility_name;

        if (manager.Event.start_time.HasValue)
            this.TextBoxStartTime.Text = manager.Event.start_time.Value.ToString("HH:mm");
        if (manager.Event.end_time.HasValue)
            this.TextBoxEndTime.Text = manager.Event.end_time.Value.ToString("HH:mm");
        this.TextBoxEventComment.Text = manager.Event.event_comment;
        this.CheckBoxActive.Checked = Convert.ToBoolean(manager.Event.status_flag);
        this.CheckBoxRegistration.Checked = Convert.ToBoolean(manager.Event.registration_flag);

        this.TextBoxResponsibleEntity.Text = manager.Event.display_responsible_entity_name;
        
        this.GridViewProgram.DataSource = manager.Event_Programs;
        this.GridViewProgram.DataBind();

        this.GridViewFacilites.DataSource = manager.Event_Facilities;
        this.GridViewFacilites.DataBind();

        if (manager.CurrentEditType == BusinessRuleManager.EditType.create 
            || manager.CurrentEditType == BusinessRuleManager.EditType.predit
            || manager.CurrentEditType == BusinessRuleManager.EditType.eventDuplicate)
        {
            this.DropDownListApr.DataSource = EventManager.selectActiveApr();
            this.DropDownListApr.DataTextField = "apr_desc";
            this.DropDownListApr.DataValueField = "apr_code";
            this.DropDownListApr.DataBind();

            if (!String.IsNullOrEmpty(manager.Event.apr_code)) { this.DropDownListApr.SelectedValue = manager.Event.apr_code; }
            this.TextBoxEventTitle.Text = manager.Event.event_title;
            this.TextBoxEventDate.Text = manager.Event.date_of_service.ToString("MM/dd/yyyy");
            this.TextBoxHost.Text = manager.Event.display_host_facility_name;

            this.MultiViewEvent.SetActiveView(this.ViewNew);

            this.LinkButtonManageAttendance.Visible = false;

            this.LinkButtonProfile.Visible = false;

        }
        else
        {
            this.LinkButtonManageAttendance.Visible = true;

            this.LinkButtonProfile.Visible = true;

            this.MultiViewEvent.SetActiveView(this.ViewEdit);

        }

        
    }
  

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        this.updateEventInformation(manager);

        manager.saveEvent();

        Server.Transfer(manager.RedirectURL);
    }

    private void updateEventInformation(EventManager manager)
    {
        if (manager.CurrentEditType == BusinessRuleManager.EditType.create || 
            manager.CurrentEditType == BusinessRuleManager.EditType.predit
            || manager.CurrentEditType == BusinessRuleManager.EditType.eventDuplicate)
        {
            manager.addEvent(this.TextBoxEventTitle.Text,
                this.DropDownListApr.SelectedValue,
                this.TextBoxEventDate.Text,
                this.TextBoxStartTime.Text,
                this.TextBoxEndTime.Text,
                this.TextBoxEventComment.Text,
                Convert.ToBoolean(this.CheckBoxActive.Checked),
                Convert.ToBoolean(this.CheckBoxRegistration.Checked),
                this.User.Identity.Name);
        }
        else
        {
            manager.updateEvent(this.TextBoxEventDate.Text,
                this.TextBoxStartTime.Text,
                this.TextBoxEndTime.Text,
                this.TextBoxEventComment.Text,
                Convert.ToBoolean(this.CheckBoxActive.Checked),
                Convert.ToBoolean(this.CheckBoxRegistration.Checked),
                this.User.Identity.Name);

        }


    }
    protected void LinkButtonManageAttendance_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;
       
        this.updateEventInformation(manager);
        
        Server.Transfer("~/events/eventattendance.aspx");
       

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        manager.Method = BusinessEntityManager.selectMethod.single;

        this.updateEventInformation(manager);

        Server.Transfer("~/redirects/addevententity.aspx");
    }

    protected void LinkButtonProfile_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        manager.CurrentAttendanceType = ProfileManager.AttendanceType.NONE;

        this.updateEventInformation(manager);

        Server.Transfer("~/profiles/eventprofile.aspx");
    }
    protected void LinkButtonManagePrograms_Click(object sender, EventArgs e)
    {
        //this.updateEventInformation((EventManager)Session[Globals.SESSION_MODULEMANAGER]);
        //this.updateEventInformation(((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj);
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        this.updateEventInformation(manager);

        Server.Transfer("~/redirects/addeventprograms.aspx");
    }
    protected void LinkButtonManageHost_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        manager.isHost = true;

        this.updateEventInformation(manager);

        Server.Transfer("~/redirects/addeventfacility.aspx");
    }

    protected void LinkButtonManageFacility_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        manager.isHost = false;

        this.updateEventInformation(manager);

        Server.Transfer("~/redirects/addeventfacility.aspx");
    }
}
