using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class profiles_attendanceprofile : System.Web.UI.Page
{
    protected override PageStatePersister PageStatePersister
    {
        get
        {
            //return base.PageStatePersister;
            return new SessionPageStatePersister(this);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ProfileManager manager = null;

        //EventManager eManager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager eManager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        if (IsPostBack)
        {
            //manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
            manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;
        }
        else
        {
            manager = new ProfileManager(eManager.Event.event_id.ToString(), eManager.CurrentEventAttendanceId.ToString(), eManager.Event.apr_code, eManager.CurrentAttendanceType);
        }

        manager.loadForm(this.PlaceHolderForm, "Questions", "Options");

        //Session.Add(Globals.SESSION_PROFILE, manager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj = manager;


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //ProfileManager manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
        ProfileManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;

        this.LabelError.Visible = true;

        this.LabelError.Text = manager.saveProfile(this.PlaceHolderForm, this.User.Identity.Name, String.Empty,
            "All questions must be answered.");

        if (this.LabelError.Text.Length <= 0)
        {
            this.LabelError.Text = "Profile has been saved.";
        }
    }

    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/events/eventattendance.aspx");
    }
}
