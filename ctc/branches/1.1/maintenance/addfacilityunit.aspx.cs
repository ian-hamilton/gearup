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
        //if (!IsPostBack) { this.loadControls(); }
    }

    //private void loadControls()
    //{
    //    BusinessRuleFacilityManager manager = (BusinessRuleFacilityManager)Session[Globals.SESSION_MODULEMANAGER];

    //    this.GridViewSelectedFacility.DataSource = manager.getFacilityList();
    //    this.GridViewSelectedFacility.DataBind();

    //}

    //protected void GridViewSelectedFacility_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (this.GridViewSelectedFacility.SelectedRow != null)
    //    {
    //        EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];

    //        string unit = this.GridViewFacility.SelectedRow.Cells[4].Text;

    //        manager.Entity.unit = Int32.Parse(unit);

    //        this.ButtonDone_Click(null, null);
    //    }
    //}
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        FacilityManager m = new FacilityManager();

        this.GridViewFacility.DataSource = m.selectLikeFacility(this.TextBoxFacilityName.Text, this.User.Identity.Name);
        this.GridViewFacility.DataBind();
    }
    protected void GridViewFacility_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewFacility.SelectedRow != null)
        {
            //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
            EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

            string unit = this.GridViewFacility.SelectedRow.Cells[4].Text;

            manager.Entity.unit = Int32.Parse(unit);

            this.ButtonDone_Click(null, null);
        }
    }
    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        Server.Transfer(manager.RedirectURL);
    }
}
