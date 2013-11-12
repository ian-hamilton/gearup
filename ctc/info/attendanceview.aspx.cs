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

public partial class info_attendanceview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { this.loadControls(); }
    }

    private void loadControls()
    {

        Literal literal = null;

        literal = new Literal();
        literal.Text = this.loadStudents();
        this.PlaceHolderStudent.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadFamily();
        this.PlaceHolderFamily.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadStaff();
        this.PlaceHolderStaff.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadfacilitators();
        this.PlaceHolderFacilitator.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadVolunteers();
        this.PlaceHolderVolunteer.Controls.Add(literal);

    }

    private String loadStudents()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th colspan=\"2\" align=\"center\">Student Attendance</th></tr>");

        DataTable dt = InfoManager.eventsAttendanceStudent(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/studentview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    private String loadFamily()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th colspan=\"2\" align=\"center\">Family Attendance</th></tr>");

        DataTable dt = InfoManager.eventsAttendanceFamily(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/entityview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    private String loadStaff()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th colspan=\"2\" align=\"center\">Staff Attendance</th></tr>");

        DataTable dt = InfoManager.eventsAttendanceStaff(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/entityview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    private String loadfacilitators()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th colspan=\"2\" align=\"center\">Facilitators Attendance</th></tr>");

        DataTable dt = InfoManager.eventsAttendanceFacilitator(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/entityview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    private String loadVolunteers()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th colspan=\"2\" align=\"center\">Volunteer Attendance</th></tr>");

        DataTable dt = InfoManager.eventsAttendanceVolunteer(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/entityview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }
}
