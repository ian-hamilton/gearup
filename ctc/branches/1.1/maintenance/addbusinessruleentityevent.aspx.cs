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

public partial class maintenance_addbusinessruleentity : System.Web.UI.Page
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
        BusinessEntityManager manager = (BusinessEntityManager)Session[Globals.SESSION_MODULEMANAGER];

        EntityManager entityManager = new EntityManager();

        this.GridViewSelectedEntity.DataSource = manager.getEntityList();
        this.GridViewSelectedEntity.DataBind();
        

    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        EntityManager entityManager = new EntityManager();

        this.GridViewEntity.DataSource = entityManager.selectLikeEntity(this.TextBoxEntityName.Text, this.User.Identity.Name);
        this.GridViewEntity.DataBind();
    }

    protected void GridViewEntity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewEntity.SelectedRow != null)
        {
            string id = this.GridViewEntity.DataKeys[this.GridViewEntity.SelectedRow.RowIndex][0].ToString();

            BusinessEntityManager bem = (BusinessEntityManager)Session[Globals.SESSION_MODULEMANAGER];

            bem.addEntity(id, this.User.Identity.Name);

            this.loadControls();

        }
    }

    protected void ButtonDone_Click(object sender, EventArgs e)
    {
        BusinessRuleManager manager = (BusinessRuleManager)Session[Globals.SESSION_MODULEMANAGER];

        Server.Transfer(manager.RedirectURL);
    }

    protected void GridViewSelectedEntity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewSelectedEntity.SelectedRow != null)
        {
            string id = this.GridViewSelectedEntity.DataKeys[this.GridViewSelectedEntity.SelectedRow.RowIndex][0].ToString();

            BusinessEntityManager bem = (BusinessEntityManager)Session[Globals.SESSION_MODULEMANAGER];

            bem.removeEnity(id, this.User.Identity.Name);

            this.loadControls();

        }

    }
}
