using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class redirects_addentityfacility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        Session.Add(Globals.SESSION_MODULEMANAGER, manager);

        Server.Transfer("~/maintenance/addbusinessrulefacility.aspx");
    }
}
