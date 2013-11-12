using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class redirects_addentityprograms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        Session.Add(Globals.SESSION_MODULEMANAGER, manager);

        Server.Transfer("~/maintenance/addbusinessruleprogram.aspx");
    }
}
