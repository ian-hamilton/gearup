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

public partial class profiles_parentquestionaire : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProfileManager manager = null;

        if (IsPostBack)
        {
            //manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
            manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;
        }
        else
        {
            manager = new ProfileManager(String.Empty, String.Empty, "questionaire", ProfileManager.AttendanceType.parent);
        }

        manager.loadForm(this.PlaceHolderForm, "Questions", "Options");

        //Session.Add(Globals.SESSION_PROFILE, manager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj = manager;


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //ProfileManager manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
        ProfileManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;

        this.LabelError.Visible = true;

        this.LabelError.Text = manager.saveProfile(this.PlaceHolderForm, "questionaire", this.TextBoxCPS.Text, "All questions must be answered.");

        if (this.LabelError.Text.Length <= 0)
        {
            Server.Transfer("~/profiles/questionaireconfirmation.aspx");
        }
    }
    protected void TextBoxCPS_TextChanged(object sender, EventArgs e)
    {

    }
}
