using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profiles_questionairespanish : System.Web.UI.Page
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
            manager = new ProfileManager(String.Empty, String.Empty, "spanish_questionaire", ProfileManager.AttendanceType.student);
        }

        manager.loadForm(this.PlaceHolderForm, "Preguntas", "Opciones");

        //Session.Add(Globals.SESSION_PROFILE, manager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj = manager;


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //ProfileManager manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
        ProfileManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;

        this.LabelError.Visible = true;

        this.LabelError.Text = manager.saveProfile(this.PlaceHolderForm, "questionaire", 
            this.TextBoxCPS.Text, "Todas las preguntas del portafolio tienen que ser contestadas.");

        if (this.LabelError.Text.Length <= 0)
        {
            Server.Transfer("~/profiles/questionaireconfirmationspanish.aspx");
        }
    }
    protected void TextBoxCPS_TextChanged(object sender, EventArgs e)
    {

    }
}
