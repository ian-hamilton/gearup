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
using DayPilot.Web.Ui.Events;
using DayPilot.Web.Ui.Events.Bubble;
using DayPilot.Web;

public partial class events_eventcalendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.loadControls(DateTime.Now);
            CalendarExtenderSelect.SelectedDate = DateTime.Now;
        }
      
}   

    private void loadControls(DateTime startDate)
    {


        this.DayPilotCalendarEvents.EventClickJavaScript = "window.open('/CTC/info/eventview.aspx?ID=' + e.value(), '_blank','fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes'); ";
        this.DayPilotMonthEvent.EventClickJavaScript = "window.open('/CTC/info/eventview.aspx?ID=' + e.value(), '_blank','fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes'); ";

        this.DayPilotCalendarEvents.Days = 7;
        this.DayPilotCalendarEvents.StartDate = firstDayOfWeek(startDate, DayOfWeek.Sunday);
        this.DayPilotMonthEvent.StartDate = firstDayOfWeek(startDate, DayOfWeek.Sunday);

        this.DayPilotCalendarEvents.DataSource = EventManager.getEventsPerCalendar(
            this.DayPilotCalendarEvents.StartDate, this.DayPilotCalendarEvents.EndDate, "-1", this.User.Identity.Name);
        this.DayPilotCalendarEvents.DataBind();

        this.DayPilotMonthEvent.DataSource = EventManager.getEventsPerCalendar(
            this.DayPilotMonthEvent.StartDate.AddDays(-40), this.DayPilotMonthEvent.StartDate.AddDays(40), "-1", this.User.Identity.Name);
        this.DayPilotMonthEvent.DataBind();

        this.DropDownListPrograms.DataSource = ProgramManager.selectDbAllPrograms();
        this.DropDownListPrograms.DataTextField = "program_name";
        this.DropDownListPrograms.DataValueField = "program_id";
        this.DropDownListPrograms.DataBind();

        this.DropDownListPrograms.Items.FindByText("GEAR UP 3").Selected = true;

        this.loadFacilities(this.DropDownListPrograms.SelectedValue);

    }

    protected void DayPilotMonthEvent_Refresh(object sender, RefreshEventArgs e)
    {

        ((SessionManager)Session[Globals.SESSION_OBJECT]).CurrentMonthDate = e.StartDate;

        this.monthRefresh(e.StartDate);

    }


    private static DateTime firstDayOfWeek(DateTime day, DayOfWeek weekStarts)
    {
        DateTime d = day;
        while (d.DayOfWeek != weekStarts)
        {
            d = d.AddDays(-1);
        }

        return d;
    }

    protected void DayPilotCalendarEvents_TimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
    {

    }
    protected void DayPilotMonthEvent_TimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
    {
        //this.loadControls(e.Start);

        this.DayPilotCalendarEvents.StartDate = firstDayOfWeek(e.Start, DayOfWeek.Sunday);

        this.DayPilotCalendarEvents.DataSource = EventManager.getEventsPerCalendar(
           this.DayPilotCalendarEvents.StartDate, this.DayPilotCalendarEvents.EndDate, this.DropDownListFacilites.SelectedValue, this.User.Identity.Name);
        this.DayPilotCalendarEvents.DataBind();

        this.monthRefresh(((SessionManager)Session[Globals.SESSION_OBJECT]).CurrentMonthDate);
    }

    private void monthRefresh(DateTime startDate)
    {

        this.DayPilotMonthEvent.StartDate = startDate;
        DayPilotMonthEvent.DataSource = EventManager.getEventsPerCalendar(
            this.DayPilotMonthEvent.StartDate.AddDays(-40), this.DayPilotMonthEvent.StartDate.AddDays(40), this.DropDownListFacilites.SelectedValue, this.User.Identity.Name);

        this.DayPilotMonthEvent.DataBind();
        DayPilotMonthEvent.DataBind();
        DayPilotMonthEvent.Update();

    }

    protected void DropDownListFacilites_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.monthRefresh(((SessionManager)Session[Globals.SESSION_OBJECT]).CurrentMonthDate);
    }

    protected void DayPilotMonthEvent_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.Month.BeforeCellRenderEventArgs e)
    {
        if (e.Start.Day == 1)
        {
            //e.HeaderText = String.Format("<span style='font-weight: bold'>{0}</span>", e.Start.Day);
            e.HeaderText = String.Format("{0:d MMM yyyy}", e.Start);
            

        }
    }
    protected void DropDownListPrograms_SelectedIndexChanged(object sender, EventArgs e)
    {

        this.loadFacilities(this.DropDownListPrograms.SelectedValue);

    }

    private void loadFacilities(string programId)
    {


        this.DropDownListFacilites.DataSource = FacilityManager.selectAllFacilities(programId, this.User.Identity.Name);
        this.DropDownListFacilites.DataTextField = "facility_name";
        this.DropDownListFacilites.DataValueField = "facility_id";
        this.DropDownListFacilites.DataBind();

    }

    protected void DayPilotMonthEvent_BeforeEventRender(object sender, DayPilot.Web.Ui.Events.Month.BeforeEventRenderEventArgs e)
    {
        int i = EventManager.getCountOfAttendees(e.Value.ToString());

        if (i == 0) { e.BackgroundColor = "#FFFF00"; }
        if (i == 1) { e.BackgroundColor = "#008000"; }
        if (i == 2) { e.BackgroundColor = "#0000FF"; }
        if (i == 3) { e.BackgroundColor = "#FF1493"; }
        if (i == 4) { e.BackgroundColor = "#808080"; }
        if (i == 5) { e.BackgroundColor = "#32CD32"; }
        if (i == 6) { e.BackgroundColor = "#87CEEB"; }
        if (i == 7) { e.BackgroundColor = "#FFB6C1"; }
        if (i == 8) { e.BackgroundColor = "#B0C4DE"; }

        if(i<=4 && i>0)
            e.InnerHTML= "<p class=\"fourless\">" + e.Text + "</p>";
        else
            e.InnerHTML = "<p class=\"fivegreater\">" + e.Text + "</p>";
    }

    protected void ImageButtonSelectDate_Click(object sender, ImageClickEventArgs e)
    {
        DateTime dummy;

        bool test = DateTime.TryParse(TextBoxSelect.Text.Trim(), out dummy);

       if (test)
        {
            dummy = dummy.AddDays(15 - dummy.Day);
            this.monthRefresh(dummy);            
        }
       
    }



    }