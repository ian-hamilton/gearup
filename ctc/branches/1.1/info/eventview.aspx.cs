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
using System.Text;

public partial class info_event : System.Web.UI.Page
{

    private const string URL_ATTENDANCE = "/CTC/info/attendanceview.aspx?ID=";



    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) { this.loadControls(); }

    }


    private void loadControls()
    {

        //EventManager ev = new EventManager(Request["ID"]);

        //this.LabelEventId.Text = ev.Event.event_id.ToString();
        //this.LableEventName.Text = ev.Event.event_title;

        Literal literal = null;

        DataTable dt = InfoManager.events(Request["ID"]);

        this.HyperLinkAttendance.NavigateUrl = URL_ATTENDANCE + Request["ID"];

        this.LabeDateOfService.Text = InfoManager.formatShortDate(dt.Rows[0]["date_of_service"].ToString());
        this.LabelAPR.Text = dt.Rows[0]["apr_desc"].ToString();
        this.LabelComment.Text = dt.Rows[0]["event_comment"].ToString();
        this.LabelEndTime.Text = InfoManager.formatMilitaryTime(dt.Rows[0]["end_time"].ToString());
        this.LabelEventId.Text = dt.Rows[0]["event_id"].ToString();
        this.LabelEventTitle.Text = dt.Rows[0]["event_title"].ToString();
        this.LabelHostFacility.Text = dt.Rows[0]["facility_name"].ToString();
        this.LabelResponsibleEntity.Text = dt.Rows[0]["ResponsibleEntity"].ToString();
        this.LabelRowCreated.Text = dt.Rows[0]["row_created"].ToString();
        this.LabelRowCreatedBy.Text = dt.Rows[0]["row_created_by_user_id"].ToString();
        this.LabelStartTime.Text = InfoManager.formatMilitaryTime(dt.Rows[0]["start_time"].ToString());

        literal = new Literal();
        literal.Text = this.loadPrograms();

        this.PlaceHolderPrograms.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadTargetFacilities();

        this.PlaceHolderTarget.Controls.Add(literal);


    }

    private String loadPrograms()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Event Programs</th></tr>");

        DataTable dt = InfoManager.eventsProgams(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td>" + row[0].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }


    private String loadTargetFacilities()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Target Facilities</th></tr>");

        DataTable dt = InfoManager.eventsTargetFacilities(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td>" + row[0].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }


}
