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

public partial class maintenance_addbusinessrulelanguage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.loadControls();

            this.GridViewLanguage.DataSource = LanguageManager.getLanguages();
            this.GridViewLanguage.DataBind();
        }
    }

    private void loadControls()
    {
        BusinessLanguageManager manager  = (BusinessLanguageManager)Session[Globals.SESSION_MODULEMANAGER];

        this.GridSelectedLanguages.DataSource = manager.getLanguageList();
        this.GridSelectedLanguages.DataBind();

    }


    protected void GridViewLanguage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewLanguage.SelectedRow != null)
        {
            BusinessLanguageManager manager = (BusinessLanguageManager)Session[Globals.SESSION_MODULEMANAGER];

            string id = this.GridViewLanguage.DataKeys[this.GridViewLanguage.SelectedRow.RowIndex][0].ToString();

            manager.addLanguage(id, this.User.Identity.Name);

            this.loadControls();
        }
    }
    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        BusinessLanguageManager manager = (BusinessLanguageManager)Session[Globals.SESSION_MODULEMANAGER];

        Server.Transfer(manager.RedirectURL);
    }
    protected void GridSelectedLanguages_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        BusinessLanguageManager manager = (BusinessLanguageManager)Session[Globals.SESSION_MODULEMANAGER];

        string id = this.GridSelectedLanguages.DataKeys[int.Parse(e.CommandArgument.ToString())][0].ToString();

        //String id = this.GridSelectedLanguages.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text;

        if (e.CommandName.Equals("MarkHome"))
        {
            manager.makeHomeLanguage(id, this.User.Identity.Name);            

        }
        else if (e.CommandName.Equals("RemoveLanguage"))
        {
            manager.removeLanguage(id, this.User.Identity.Name);
        }

        this.loadControls();
    }
    protected void GridSelectedLanguages_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
