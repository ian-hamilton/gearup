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

public partial class profiles_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProfileManager manager = null;

        this.DropDownListEvent.DataSource = EventManager.selectRegEvents();
        this.DropDownListEvent.DataTextField = "event_title";
        this.DropDownListEvent.DataValueField = "event_id";
        this.DropDownListEvent.DataBind();

        if (IsPostBack)
        {
            //manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
            manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;
        }
        else
        {
            manager = new ProfileManager(String.Empty, String.Empty, "studentRegistration", ProfileManager.AttendanceType.student);
        }

        //manager.loadForm(this.PlaceHolderForm, "Questions", "Options");

        ////Session.Add(Globals.SESSION_PROFILE, manager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj = manager;


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //ProfileManager manager = (ProfileManager)Session[Globals.SESSION_PROFILE];
        // ProfileManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ProfileManagerObj;


        SessionManager sm = (SessionManager)Session[Globals.SESSION_OBJECT];
        ProfileManager profileManager = sm.ProfileManagerObj;
        DateTime DOB = DateTime.Parse(this.DOB.Text.Trim());
        Int32 Grade = Int32.Parse(this.Grade.Text.Trim());
        Int64? eventId = Int64.Parse(this.DropDownListEvent.Text.Trim());
        Byte? parentWorkPhone = (Byte?)(parPhoneWork.Checked == true ? 1 : 0);
        Byte? parentCellPhone = (Byte?)(parPhoneCell.Checked == true ? 1 : 0);
        Byte? parentOtherPhone = (Byte?)(parPhoneOther.Checked == true ? 1 : 0);
        Byte? parent2WorkPhone = (Byte?)(par2PhoneWork.Checked == true ? 1 : 0);
        Byte? parent2CellPhone = (Byte?)(par2PhoneCell.Checked == true ? 1 : 0);
        Byte? parent2OtherPhone = (Byte?)(par2PhoneOther.Checked == true ? 1 : 0);
        Byte? medCondNone = (Byte?)(medCondNo.Checked == true ? 1 : 0);
        Byte? medicationsNone = (Byte?)(medicationsNo.Checked == true ? 1 : 0);
        Byte? allergiesNone = (Byte?)(allergiesNo.Checked == true ? 1 : 0);
      




        profileManager.saveRegistration(null, "registration",
            "registration",
            DateTime.Now,
            eventId,
            this.PGuarFName.Text.Trim(),
            this.PGuarLName.Text.Trim(),
            this.ParGuarPhone.Text.Trim(),
            this.HomePhone.Text.Trim(),
            this.Addr1.Text.Trim(),
            this.City.Text.Trim(),
            this.Zip.Text.Trim(),
            this.StuFName.Text.Trim(),
            this.StuMidName.Text.Trim(),
            this.StuLName.Text.Trim(),
            DOB,
            //this.DOB.Text.Trim(),
            this.School.Text.Trim(),
            Grade,
            //this.Grade.Text.Trim(),
            this.RoomNo.Text.Trim(),
            this.eMail.Text.Trim(),
            this.PGuar2FName.Text.Trim(),
            this.PGuar2LName.Text.Trim(),
            this.ParGuar2Phone.Text.Trim(),
            this.Relation.Text.Trim(),
            this.MedCond.Text.Trim(),
            this.Medication.Text.Trim(),
            this.Allergies.Text.Trim(),
            this.DrName.Text.Trim(),
            this.DrPhone.Text.Trim(),
            this.ClinLoc.Text.Trim(),
            this.TextBoxRegistrationComment.Text.Trim(),
            parentWorkPhone,
            parentCellPhone,
            parentOtherPhone,
            parent2WorkPhone,
            parent2CellPhone,
            parent2OtherPhone,
            medCondNone,
            medicationsNone,
            allergiesNone,
            ProfileManager.AttendanceType.student);



        //this.LabelError.Visible = true;



        //string ParGuarPhone = null;
        //string homePhoneNumber = null; // this.TextBoxPhoneAreaCode.Text.Trim() + this.TextBoxPhonePrefix.Text.Trim() + this.TextBoxPhoneNumber.Text.Trim();
        //DateTime dob = DateTime.Parse(this.DOB.Text.Trim());
        //Int32 Grade = Int32.Parse(Grade.Text.Trim());
        //string PGuarAddress = null;
        //string PGuarCity = null;
        //string PGuarZip = null;


        //    this."studentregistration",
        //    this.TextBoxCPS.Text.Trim(),
        //    //"All questions must be answered.",
        //    this.PGuarFName.Text.Trim(),
        //    this.PGuarLName.Text.Trim(),
        //pguarphone,
        //    PGuarAddress,
        //    PGuarCity,
        //    PGuarZip,
        //    this.StuFName.Text.Trim(),
        //    //this.StuMidName.Text.Trim(),
        //    this.StuLName.Text.Trim(),
        //    this.HomePhone.Text.Trim(),
        //    this.eMail.Text.Trim(),
        //    this.School.Text.Trim(),
        //    grade,
        //    this.PGuar2FName.Text.Trim(),
        //    this.PGuar2LName.Text.Trim(),
        //    ProfileManager.AttendanceType.student);

        //if (this.LabelError.Text.Length <= 0)
        {
            Server.Transfer("~/profiles/registrationconfirmation.aspx");
        }
    }
}
    //public string homePhoneNumber { get; set; }


//    public PlaceHolder PlaceHolderForm { get; set; }

﻿