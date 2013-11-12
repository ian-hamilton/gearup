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

public partial class maintenance_entity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.LabelNoResult.Visible = false;
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        EntityManager entityManager = new EntityManager();

        this.GridViewEntity.DataSource = entityManager.selectLikeEntity(this.TextBoxLastName.Text, this.User.Identity.Name);
        this.GridViewEntity.DataBind();

        if (this.GridViewEntity.Rows.Count <= 0) { this.LabelNoResult.Visible = true; }
    }

    protected void ButtonNew_Click(object sender, EventArgs e)
    {

        EntityManager entityManager = new EntityManager();

        //Session.Add(Globals.SESSION_MODULEMANAGER, entityManager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj = entityManager;

        Server.Transfer(entityManager.RedirectURL);

    }

    protected void GridViewEntity_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (this.GridViewEntity.SelectedRow != null)
        {

            //EntityManager entityManager = new EntityManager(((System.Web.UI.WebControls.HyperLink)this.GridViewEntity.SelectedRow.Cells[1].Controls[0]).Text);
            EntityManager entityManager = new EntityManager(this.GridViewEntity.DataKeys[this.GridViewEntity.SelectedRow.RowIndex][0].ToString());

            //Session.Add(Globals.SESSION_MODULEMANAGER, entityManager);
            ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj = entityManager;

            Server.Transfer(entityManager.RedirectURL);
        }

    }
}
