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
using System.Text;

public partial class info_studentview : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) { this.loadControls(); }

    }


    private void loadControls()
    {

        //StudentManager sm = new StudentManager(Request["ID"]);

        //this.LabelCTCId.Text = sm.Ctc_master.ctc_id.ToString();
        //this.LabelStudentName.Text = sm.Ctc_master.Alpha_student.first_name + " " + sm.Ctc_master.Alpha_student.last_name;

        Literal literal = null;

        DataTable dt = InfoManager.studentAndGuardianInfo(Request["ID"]);

        this.LiteralSemester.Text =  " as of " + dt.Rows[0]["semester"].ToString().Trim();

        this.LabelCTCID.Text = dt.Rows[0]["ctc_id"].ToString().Trim();

        string first = dt.Rows[0]["first_name"].ToString().Trim() + " " + dt.Rows[0]["middle_initial"].ToString().Trim();

        this.Labelname.Text = first.Trim() + " " + dt.Rows[0]["last_name"].ToString().Trim();
        this.LabelGrade.Text = dt.Rows[0]["grade"].ToString().Trim();
        this.LabelDivision.Text = dt.Rows[0]["division"].ToString().Trim();
        this.LabelGender.Text = dt.Rows[0]["gender"].ToString().Trim();
        this.LabelSchool.Text = dt.Rows[0]["facility_name"].ToString().Trim();

        this.LabelGuardianAddress.Text = dt.Rows[0]["reside_address_1"].ToString().Trim() + " " + dt.Rows[0]["reside_address_2"].ToString().Trim();
        this.LabelGuardianCity.Text = dt.Rows[0]["reside_city"].ToString().Trim() + ", " + dt.Rows[0]["reside_state"].ToString().Trim();
        this.LabelGuardianEmail.Text = dt.Rows[0]["reside_email"].ToString().Trim();
        this.LabelGuardianName.Text = dt.Rows[0]["reside_first_name"].ToString().Trim() + " " + dt.Rows[0]["reside_last_name"].ToString().Trim();
        this.LabelGuardianPhone.Text = dt.Rows[0]["reside_phone"].ToString().Trim();
        this.LabelGuardianPhoneMobile.Text = dt.Rows[0]["reside_phone_mobile"].ToString().Trim();
        this.LabelGuardianPhoneWork.Text  = dt.Rows[0]["reside_phone_work"].ToString().Trim();
        this.LabelGuardianFax.Text = dt.Rows[0]["reside_fax"].ToString().Trim();
        this.LabelGuardianOtherPhone.Text = dt.Rows[0]["reside_phone_other"].ToString().Trim();



        this.Label21St.Text = this.isCompleted(dt.Rows[0]["twenty_first"].ToString());
        this.LabelFASFA.Text = this.isCompleted(dt.Rows[0]["fafsa"].ToString());
        this.LabelMediaRelease.Text = this.isCompleted(dt.Rows[0]["media_release"].ToString());
        this.LabelParentPermission.Text = this.isCompleted(dt.Rows[0]["parential_permission"].ToString());
        this.LabelParentSurvey.Text = this.isCompleted(dt.Rows[0]["parent_survey"].ToString());
        this.LabelStudentSurvey.Text = this.isCompleted(dt.Rows[0]["student_servey"].ToString());
            


       // literal.Text = loadTestScoreTable();
        //this.PlaceHolderTestPerformance.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadFacilityHistory();

        this.PlaceHolderFacilities.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadThreeEvents();

        this.PlaceHolderLastThreeGearup.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadFamily();

        this.PlaceHolderFamily.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadTopFacilitators();

        this.PlaceHolderLastTopFacilitators.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadStudentParticipation();

        this.PlaceHolderStudentParticipation.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadResideLanguages();

        this.PlaceHolderResideLanguages.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadRParentParticipation();

        this.PlaceHolderParentParticipation.Controls.Add(literal);

             
    }

    private String isCompleted(String value)
    {
        const string TRUE = "Completed";
        string output = String.Empty;

        int input = Int32.Parse(value);

        if (input != 0)
        {
            output = TRUE;
        }

        return output;
    }

    private String loadTestScoreTable()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Test</th><th>Category</th><th>Score</th></tr>");

        DataTable dt = InfoManager.studentTestPerformance(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"3\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td>" + row[0].ToString());

            builder.Append("</td><td>" + row[1].ToString() + "</td>");

            builder.Append("<td>" + row[2].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }


    private String loadThreeEvents()
    {

        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Date</th><th>Description</th><th>Facilitator</th></tr>");

        DataTable dt = InfoManager.studentLastThreeGearup(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"3\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td>" + row[0].ToString());

            builder.Append("</td><td>" + row[1].ToString());

            builder.Append("</td><td>" + row[2].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();


    }


    private String loadTopFacilitators()
    {

        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Top Facilitators</th><th># of Contacts</th></tr>");

        DataTable dt = InfoManager.studentTopFacilitators(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"2\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td>" + row[0].ToString());

            builder.Append("</td><td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    private String loadStudentParticipation()
    {

        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">APR</th><th>Hours</th></tr>");

        DataTable dt = InfoManager.studentParticipation(Request["ID"]);

        if (dt.Rows.Count <= 1)
        {
            builder.Append("<tr><td colspan=\"2\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        int count = 1;

        foreach (DataRow row in dt.Rows)
        {

            if (count == dt.Rows.Count)
            {
                builder.Append("<tr><th>Total Events</th><th>Total Hours</th></tr>");
            }

            builder.Append("<tr><td>" + row[0].ToString());

            builder.Append("</td><td>" + row[1].ToString() + "</td></tr>");

            count++;

        }

        builder.Append("</table>");

        return builder.ToString();

    }

    private String loadResideLanguages()
    {

        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Language</th></tr>");

        DataTable dt = InfoManager.resideLanguages(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"1\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }


        foreach (DataRow row in dt.Rows)
        {


            builder.Append("<tr><td>" + row[0].ToString() + "</td></tr>");


        }

        builder.Append("</table>");

        return builder.ToString();

    }

    private String loadRParentParticipation()
    {

        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">APR</th><th>Most Recent</th></tr>");

        DataTable dt = InfoManager.parentParticipation(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"2\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }


        foreach (DataRow row in dt.Rows)
        {


            builder.Append("<tr><td>" + row[0].ToString() + "</td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");


        }

        builder.Append("</table>");

        return builder.ToString();

    }

    private String loadFamily()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th colspan=\"3\">Family</th></tr>");
        builder.Append("<tr><th>Entity ID</th><th>Name</th><th>Relationship</th></tr>");

        DataTable dt = InfoManager.infoFamily(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"3\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }


        foreach (DataRow row in dt.Rows)
        {
            builder.Append("<tr><td><a target=\"_blank\" href=\"/CTC/info/entityview.aspx?ID=" + row[0].ToString() + "\">" + row[0].ToString() + "</td>");
            builder.Append("<td>" + row[1].ToString() + "</td>");
            builder.Append("<td>" + row[2].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();

    }

    private String loadFacilityHistory()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th>Facility History</th></tr>");

        DataTable dt = InfoManager.infoStudentFacility(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }


        foreach (DataRow row in dt.Rows)
        {
            builder.Append("<tr><td>" + row[0].ToString() + "</td>");
        }

        builder.Append("</table>");

        return builder.ToString();

    }

}
