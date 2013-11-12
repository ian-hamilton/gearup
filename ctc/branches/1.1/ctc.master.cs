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
using System.Text;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session.IsNewSession && Page.AppRelativeVirtualPath != "~/Default.aspx")
        { Response.Redirect("~/webForms/sessiontimeout.aspx"); }

        if (Request.UserAgent.IndexOf("AppleWebKit") > 0)
        {

            Request.Browser.Adapters.Clear();

        }

        if (!IsPostBack)
        {
            //add onfocus/onblur event to all input controls
            JavascriptFactory.SetAllInputControlsColors(this, System.Drawing.SystemColors.Window, System.Drawing.SystemColors.WindowText,
                System.Drawing.Color.LightBlue, System.Drawing.SystemColors.WindowText);

        }
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        StringBuilder javaScript = new StringBuilder();

        javaScript.Append("\n<script language=JavaScript>\n");
        javaScript.Append("window.history.forward(1);\n");
        javaScript.Append("</script>\n");

        //Page.RegisterClientScriptBlock("HistoryScript", javaScript.ToString());
        Page.ClientScript.RegisterClientScriptBlock(
       Page.GetType(), "HistoryScript", javaScript.ToString());
    }

    protected void LinkButtonLogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Default.aspx");
    }


    protected void LoginButton_Click(object sender, EventArgs e)
    {

        try
        {

            string s = ((TextBox)this.LoginView1.Controls[0].FindControl("Login1").Controls[0].FindControl("UserName")).Text;

            SessionManager.logMessageEvent(s, "login attempt");
        }
        catch { }

        
    }



    
}
