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
using CTC.BLL;
using CTC.DAL;


public partial class useradmin_addunit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //this.loadControls((UserManager)Session[Globals.SESSION_MODULEMANAGER]);
            this.loadControls(((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj);
        }

    }

    private void loadControls(UserManager manager)
    {
        this.DropDownListProgram.DataSource = ProgramManager.selectDbAllPrograms();
        this.DropDownListProgram.DataTextField = "program_name";
        this.DropDownListProgram.DataValueField = "program_id";
        this.DropDownListProgram.DataBind();
        this.DropDownListProgram.Items.FindByText("GEAR UP 3").Selected = true;
        if (manager.UnitList != null)
        {
            this.ListBoxUnits.DataSource = manager.UnitList;
            this.ListBoxUnits.DataTextField = "unit";
            this.ListBoxUnits.DataValueField = "unit";
            this.ListBoxUnits.DataBind();
        }

    }

    protected void LinkButtonRemove_Click(object sender, EventArgs e)
    {
        if (this.ListBoxUnits.SelectedItem != null)
        {
            //UserManager m = (UserManager)Session[Globals.SESSION_MODULEMANAGER];

            UserManager m = ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj;

            m.removeUnit(this.ListBoxUnits.SelectedValue, this.User.Identity.Name);

            this.loadControls(m);
        }
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        //UserManager m = (UserManager)Session[Globals.SESSION_MODULEMANAGER];
        UserManager m = ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj;

        this.GridViewFacility.DataSource = m.selectLikeFacilityNoNullUnits(this.TextBoxFacilityName.Text, this.DropDownListProgram.SelectedValue);
        this.GridViewFacility.DataBind();


    }
    protected void GridViewFacility_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (this.GridViewFacility.SelectedRow != null)
        {
            //UserManager m = (UserManager)Session[Globals.SESSION_MODULEMANAGER];
            UserManager m = ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj;

            m.addUnit(this.GridViewFacility.SelectedRow.Cells[3].Text, this.User.Identity.Name);

            this.loadControls(m);
        }

    }
    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/useradmin/edituser.aspx");
    }
    protected void ButtonAddAllUnits_Click(object sender, EventArgs e)
    {

        UserManager m = ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj;

        foreach (GridViewRow row in this.GridViewFacility.Rows)
        {

            m.addUnit(row.Cells[3].Text, this.User.Identity.Name);

        }

        this.loadControls(m);


    }
}
