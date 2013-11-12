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

public partial class maintenance_addbusinessruleprogram : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            this.loadControls();

        }
    }

    private void loadControls()
    {

        this.GridViewSelectedPrograms.DataSource = ((BusinessRuleManager)Session[Globals.SESSION_MODULEMANAGER]).getProgramList();
        this.GridViewSelectedPrograms.DataBind();

    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {

        ProgramManager pm = new ProgramManager();

        this.GridViewProgram.DataSource = pm.selectLikePrograms(this.TextBoxProgramName.Text);
        this.GridViewProgram.DataBind();

    }

    protected void GridViewProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewProgram.SelectedRow != null)
        {

            BusinessRuleManager fm = (BusinessRuleManager)Session[Globals.SESSION_MODULEMANAGER];

            string id = this.GridViewProgram.DataKeys[this.GridViewProgram.SelectedRow.RowIndex][0].ToString();

            fm.addProgram(id, this.User.Identity.Name);

            this.loadControls();

        }
    }


    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        BusinessRuleManager bm = (BusinessRuleManager)Session[Globals.SESSION_MODULEMANAGER];

        Server.Transfer(bm.RedirectURL);
    }


    protected void GridViewSelectedPrograms_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (this.GridViewSelectedPrograms.SelectedRow != null)
        {

            BusinessRuleManager fm = (BusinessRuleManager)Session[Globals.SESSION_MODULEMANAGER];

            string id = this.GridViewSelectedPrograms.DataKeys[this.GridViewSelectedPrograms.SelectedRow.RowIndex][0].ToString();

            fm.removeProgram(id, this.User.Identity.Name);

            this.loadControls();
        }
    }
}
