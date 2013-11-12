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


public partial class useradmin_finduser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        if(this.TextBoxSearch.Text.Length > 0)
        {

        this.GridViewusers.DataSource = Membership.FindUsersByName(this.TextBoxSearch.Text.ToLower()+"%");
        this.DataBind();                  

        }
    }
    protected void GridViewusers_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView v = (GridView)sender;

        if (v.SelectedRow != null)
        {

            GridViewRow row = v.SelectedRow;

            string userName = row.Cells[1].Text;

            CTC.BLL.UserManager manager = new CTC.BLL.UserManager(Membership.GetUser(userName));

            //Session.Add(Globals.SESSION_MODULEMANAGER, manager);
            ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj = manager;

            Server.Transfer("~/useradmin/edituser.aspx");

        }

        
    }
}
