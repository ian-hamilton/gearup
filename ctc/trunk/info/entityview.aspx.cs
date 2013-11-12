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

public partial class info_entityview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) { this.loadControls(); }

    }


    private void loadControls()
    {
        //EntityManager em = new EntityManager(Request["ID"]);

        //this.LabelEntityId.Text = em.Entity.entity_id.ToString();
        //this.LableEntityName.Text = em.Entity.first_name + " " + em.Entity.last_name;

        Literal literal = null;

        DataTable dt = InfoManager.entity(Request["ID"]);

        this.LabelAddress1.Text = dt.Rows[0]["address_1"].ToString().Trim();
        this.LabelAddress2.Text = dt.Rows[0]["address_2"].ToString().Trim();
        this.LabelCity.Text = dt.Rows[0]["city"].ToString().Trim() + ", " + dt.Rows[0]["state"].ToString().Trim() + " " + dt.Rows[0]["zip"].ToString().Trim();
        this.LabelCreated.Text = dt.Rows[0]["row_created"].ToString().Trim();
        this.LabelCreatedBy.Text = dt.Rows[0]["row_created_by_user_id"].ToString().Trim();
        this.LabelDOB.Text = dt.Rows[0]["dob"].ToString().Trim();
        this.LabelEmail.Text = dt.Rows[0]["email"].ToString().Trim();
        this.LabelComment.Text = dt.Rows[0]["entity_comment"].ToString().Trim();
        this.LabelEntityId.Text = dt.Rows[0]["entity_id"].ToString().Trim();
        this.LabelEntityType.Text = dt.Rows[0]["entity_type_desc"].ToString().Trim();
        this.LabelEthnicity.Text = dt.Rows[0]["ethnicity"].ToString().Trim();
        this.LabelGender.Text = dt.Rows[0]["gender"].ToString().Trim();
        this.LabelGrade.Text = dt.Rows[0]["grade"].ToString().Trim();
        this.LabelName.Text = (String)(dt.Rows[0]["first_name"].ToString().Trim() + " " + dt.Rows[0]["middle_initial"].ToString().Trim()).Trim() + " " + dt.Rows[0]["last_name"].ToString().Trim();
        this.LabelPhone.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["phone"].ToString().Trim());
        this.LabelPhoneMobile.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["phone_mobile"].ToString().Trim());
        this.LabelWork.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["phone_work"].ToString().Trim());
        this.LabelFax.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["fax"].ToString().Trim());
        this.LabelOtherPhone.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["phone_other"].ToString().Trim());
        this.LabelTitle.Text = dt.Rows[0]["title"].ToString().Trim();
        this.LabelFacility.Text = dt.Rows[0]["facility_name"].ToString().Trim();

        literal = new Literal();
        literal.Text = this.loadPrograms();

        this.PlaceHolderPrograms.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadParticipation();

        this.PlaceHolderEntityParticipation.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadStudents();

        this.PlaceHolderStudents.Controls.Add(literal);

    }

    private String loadPrograms()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Entity Programs</th></tr>");

        DataTable dt = InfoManager.entityPrograms(Request["ID"]);

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

    private String loadParticipation()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">APR</th><th>Count</th></tr>");

        DataTable dt = InfoManager.entityParticipation(Request["ID"]);

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

    private String loadStudents()
    {

        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">CTC ID</th><th>Name</th></tr>");

        DataTable dt = InfoManager.entityStudents(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"2\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }

        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/studentview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
            builder.Append("<td>" + row[1].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();


    }
}
