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

public partial class maintenance_facility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.LabelNoResult.Visible = false;
    }
    protected void ButtonNew_Click(object sender, EventArgs e)
    {

        FacilityManager facilityManager = new FacilityManager();

        //Session.Add(Globals.SESSION_MODULEMANAGER, facilityManager);

        ((SessionManager)Session[Globals.SESSION_OBJECT]).FacilityManagerObj = facilityManager;

        Server.Transfer(facilityManager.RedirectURL);

    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        FacilityManager m = new FacilityManager();

        if (this.TextBoxFacilityName.Text.Length > 0)
        {
            this.GridViewFacility.DataSource = m.selectLikeFacility(this.TextBoxFacilityName.Text, this.User.Identity.Name);
        }
        else if (this.TextBoxUnit.Text.Length > 0)
        {
            this.GridViewFacility.DataSource = m.selectLikeFacility(Int32.Parse(this.TextBoxUnit.Text), this.User.Identity.Name);

        }
        this.GridViewFacility.DataBind();

        if (this.GridViewFacility.Rows.Count <= 0) { this.LabelNoResult.Visible = true; }
    }
    protected void GridViewFacility_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewFacility.SelectedRow != null)
        {

            //FacilityManager facilityManager = new FacilityManager(((System.Web.UI.WebControls.HyperLink)this.GridViewFacility.SelectedRow.Cells[1].Controls[0]).Text);

            //facilityManager.Facility = facilityManager.selectFacility(this.GridViewFacility.SelectedRow.Cells[1].Text);

            FacilityManager facilityManager = new FacilityManager(this.GridViewFacility.DataKeys[this.GridViewFacility.SelectedRow.RowIndex][0].ToString());

            //Session.Add(Globals.SESSION_MODULEMANAGER, facilityManager);

            ((SessionManager)Session[Globals.SESSION_OBJECT]).FacilityManagerObj = facilityManager;

            Server.Transfer(facilityManager.RedirectURL);

        }

    }
}
