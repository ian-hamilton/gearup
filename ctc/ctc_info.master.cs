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


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Globals.SESSION_OBJECT] == null) { Response.Redirect("~/webForms/sessiontimeout.aspx"); }

        if (!IsPostBack)
        {
            //add onfocus/onblur event to all input controls
            JavascriptFactory.SetAllInputControlsColors(this, System.Drawing.SystemColors.Window, System.Drawing.SystemColors.WindowText,
                System.Drawing.Color.LightBlue, System.Drawing.SystemColors.WindowText);

        }
    }
  
}
