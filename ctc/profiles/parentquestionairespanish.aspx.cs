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

public partial class profiles_parentquestionairespanish : System.Web.UI.Page
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
            manager = new ProfileManager(String.Empty, String.Empty, "spanish_questionaire", ProfileManager.AttendanceType.parent);
        }

        manager.loadForm(this.PlaceHolderForm, "Preguntas", "Opciones");

        //Session.Add(Globals.SESSION_PROFILE, manager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj = manager;


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //ProfileManager manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
        // ProfileManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;

        SessionManager sm = (SessionManager)Session[Globals.SESSION_OBJECT];
        ProfileManager manager = sm.ProfileManagerObj;


        this.LabelError.Visible = true;

        string pguarphone = this.TextBoxPhoneAreaCode.Text.Trim() + this.TextBoxPhonePrefix.Text.Trim() + this.TextBoxPhoneNumber.Text.Trim();
        DateTime dob = DateTime.Parse(this.DOB.Text.Trim());
        Int32 grade = Int32.Parse(Grade.Text.Trim());
        string parent2FirstName = null;
        string parent2LastName = null;

        this.LabelError.Text = manager.saveProfile(this.PlaceHolderForm,
            "questionaire",
            this.TextBoxCPS.Text.Trim(),
            "All questions must be answered.",
            this.PGuarFName.Text.Trim(),
            this.PGuarLName.Text.Trim(),
            pguarphone,
            this.PGuarAddress.Text.Trim(),
            this.PGuarCity.Text.Trim(),
            this.PGuarZip.Text.Trim(),
            this.StuFName.Text.Trim(),
            this.StuMidName.Text.Trim(),
            this.StuLName.Text.Trim(),
            dob,
            this.School.Text.Trim(),
            grade,
            parent2FirstName,
            parent2LastName,
            ProfileManager.AttendanceType.parent);

        if (this.LabelError.Text.Length <= 0)
        {
            Server.Transfer("~/profiles/questionaireconfirmation.aspx");
        }
    }

}
