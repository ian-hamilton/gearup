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

public partial class maintenance_addbusinessrulefacility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { this.loadControls(); }
    }

    private void loadControls()
    {
        BusinessRuleFacilityManager manager = (BusinessRuleFacilityManager)Session[Globals.SESSION_MODULEMANAGER];

        this.GridViewSelectedFacility.DataSource = manager.getFacilityList();
        this.GridViewSelectedFacility.DataBind();

    }

    protected void GridViewSelectedFacility_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewSelectedFacility.SelectedRow != null)
        {
            BusinessRuleFacilityManager manager = (BusinessRuleFacilityManager)Session[Globals.SESSION_MODULEMANAGER];

            string id = this.GridViewSelectedFacility.DataKeys[this.GridViewSelectedFacility.SelectedRow.RowIndex][0].ToString();

            manager.removeFacility(id, this.User.Identity.Name);

            this.loadControls();
        }
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        FacilityManager m = new FacilityManager();
        BusinessRuleFacilityManager manager = (BusinessRuleFacilityManager)Session[Globals.SESSION_MODULEMANAGER];

        this.GridViewFacility.DataSource = m.selectLikeFacility(this.TextBoxFacilityName.Text, this.User.Identity.Name, manager.whereFacilityIn());
        this.GridViewFacility.DataBind();
    }
    protected void GridViewFacility_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewFacility.SelectedRow != null)
        {
            BusinessRuleFacilityManager manager = (BusinessRuleFacilityManager)Session[Globals.SESSION_MODULEMANAGER];

            string id = this.GridViewFacility.DataKeys[this.GridViewFacility.SelectedRow.RowIndex][0].ToString();

            manager.addFacility(id, this.User.Identity.Name);

            this.loadControls();
        }
    }
    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        BusinessRuleFacilityManager manager = (BusinessRuleFacilityManager)Session[Globals.SESSION_MODULEMANAGER];

        Server.Transfer(manager.RedirectURL);
    }
}
