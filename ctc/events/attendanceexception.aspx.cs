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

public partial class events_attendanceexception : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        JavascriptFactory.maxLengthMultiLine(this.TextBoxComment, 1000, this);

        if (!IsPostBack) { this.loadControls(); }
    }

    private void loadControls()
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        this.GridViewExceptions.DataSource = manager.getAttendanceException();
        this.GridViewExceptions.DataBind();

    }

    protected void ButtonAddException_Click(object sender, EventArgs e)
    {
        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];
        EventManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj;

        manager.addAttendanceException(this.TextBoxCps.Text.Trim(),
            this.TextBoxFirstName.Text.Trim(),
            this.TextBoxLastName.Text.Trim(),
            this.TextBoxComment.Text.Trim(),
            this.CheckBoxIsStudent.Checked,
            this.User.Identity.Name);

        this.loadControls();
    }
    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/events/eventattendance.aspx");
    }
}
