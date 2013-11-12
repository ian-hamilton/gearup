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
using CTC.BLL;

public partial class info_facilityview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) { this.loadControls(); }

    }


    private void loadControls()
    {

        //FacilityManager fm = new FacilityManager(Request["ID"]);

        //this.LabelFacId.Text = fm.Facility.facility_id.ToString();
        //this.LabelFacName.Text = fm.Facility.facility_name; 

        Literal literal = null;
       
        


        DataTable dt = InfoManager.facility(Request["ID"]);

        this.LabelAddress1.Text = dt.Rows[0]["address_1"].ToString().Trim();
        this.LabelAddress2.Text = dt.Rows[0]["address_2"].ToString().Trim();
        this.LabelEngineering.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["engineering"].ToString().Trim());
        this.LabelFacCommnent.Text = dt.Rows[0]["facility_comment"].ToString().Trim();
        this.LabelFacilityDesc.Text = dt.Rows[0]["facility_desc"].ToString().Trim();
        this.LabelFacilityId.Text = dt.Rows[0]["facility_id"].ToString().Trim();
        this.LabelFacilityName.Text = dt.Rows[0]["facility_name"].ToString().Trim();
        this.LabelFax.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["fax"].ToString().Trim());
        this.LabelGrades.Text = dt.Rows[0]["grades"].ToString().Trim();
        this.LabelLunchroom.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["lunchroom"].ToString().Trim());
        this.LabelPhone.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["phone"].ToString().Trim());
        this.LabelPhoneAlt.Text = InfoManager.formatPhoneNumber(dt.Rows[0]["phone_alt"].ToString().Trim());
        this.LabelUnit.Text = dt.Rows[0]["unit"].ToString().Trim();
        this.URL.Text = "http://" + dt.Rows[0]["url"].ToString().Trim();
        this.URL.NavigateUrl = "http://" + dt.Rows[0]["url"].ToString().Trim();
        this.BellURL.Text = "http://" + dt.Rows[0]["bellurl"].ToString().Trim();
        this.BellURL.NavigateUrl = "http://" + dt.Rows[0]["bellurl"].ToString().Trim();
        this.LabelCity.Text = dt.Rows[0]["city"].ToString().Trim() +", " + dt.Rows[0]["state"].ToString().Trim() + " " + dt.Rows[0]["zip"].ToString().Trim();
       

        literal = new Literal();
        literal.Text = this.loadPrograms();

        this.PlaceHolderPrograms.Controls.Add(literal);

        literal = new Literal();
        literal.Text = this.loadParticipation();

        this.PlaceHolderFacilityParticipation.Controls.Add(literal);


    }


    private String loadPrograms()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">Facility Programs</th></tr>");

        DataTable dt = InfoManager.facilityPrograms(Request["ID"]);

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

        builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">APR</th><th>Current Period</th></th><th>Last Period</th></tr>");

        DataTable dt = InfoManager.facilityParticipation(Request["ID"]);

        if (dt.Rows.Count <= 0)
        {
            builder.Append("<tr><td colspan=\"3\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
        }
       
        foreach (DataRow row in dt.Rows)
        {

            builder.Append("<tr><td>" + row[0].ToString() + "</td>");
            builder.Append("<td>" + row[1].ToString() + "</td>");
            builder.Append("<td>" + row[2].ToString() + "</td></tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    public string bellurl { get; set; }
}
