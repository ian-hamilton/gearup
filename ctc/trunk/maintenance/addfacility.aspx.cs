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

public partial class maintenance_addfacility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        JavascriptFactory.maxLengthMultiLine(this.TextBoxFacilityDesc, 1000, this);

        JavascriptFactory.maxLengthMultiLine(this.TextBoxFacilityComment, 1000, this);

        if (!IsPostBack)
        {
            this.loadControls();
        }
    }

    private void loadControls()
    {

        //FacilityManager manager = (FacilityManager)Session[Globals.SESSION_MODULEMANAGER];

        FacilityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).FacilityManagerObj;

        this.LabelStatus.Text = manager.CurrentMessage;
        this.LiteralHTML.Text = manager.HtmlAmendment;

       this.DropDownListStates.DataSource = Globals.states;
       this.DropDownListStates.DataBind();

       this.DropDownListFacilityType.DataSource = manager.selectFacilityTypes();
       this.DropDownListFacilityType.DataTextField = "facility_type_name";
       this.DropDownListFacilityType.DataValueField = "facility_type_id";
       this.DropDownListFacilityType.DataBind();

       if (manager.CurrentEditType == FacilityManager.EditType.create)
       {
           this.MultiViewFacility.SetActiveView(this.ViewAdd);         

       }
       else if (manager.CurrentEditType == BusinessRuleManager.EditType.predit)
       {
           this.MultiViewFacility.SetActiveView(this.ViewAdd);
           this.TextBoxFacilityName.Text = manager.Facility.facility_name;
           this.DropDownListFacilityType.SelectedValue = manager.Facility.facility_type_id.ToString();
           //this.TextBoxArea.Text = manager.Facility.area.ToString();
           this.TextBoxUnit.Text = manager.Facility.unit.ToString();

       }
       else if (manager.CurrentEditType == BusinessRuleManager.EditType.edit)
       {
           this.MultiViewFacility.SetActiveView(this.ViewEdit);

           this.LabelFacilityId.Text = manager.Facility.facility_id.ToString();
           this.LabelFacilityName.Text = manager.Facility.facility_name;
           this.LabelFacilityType.Text = manager.Facility.display_facility_type_name;
           //this.LabelArea.Text = manager.Facility.area.ToString();
           this.LabelUnit.Text = manager.Facility.unit.ToString();


       }

       if (manager.CurrentEditType == BusinessRuleManager.EditType.edit || manager.CurrentEditType == BusinessRuleManager.EditType.predit)
       {


           this.TextBoxFacilityDesc.Text = manager.Facility.facility_desc;
           this.TextBoxAddress1.Text = manager.Facility.address_1;
           this.TextBoxAddress2.Text = manager.Facility.address_2;
           this.TextBoxCity.Text = manager.Facility.city;

           this.DropDownListStates.SelectedItem.Text = manager.Facility.state;

           this.TextBoxZipCode.Text = manager.Facility.zip;
           this.TextBoxMiscContactName.Text = manager.Facility.misc_contact_name;

           if (!String.IsNullOrEmpty(manager.Facility.phone))
           {
               this.TextBoxPhoneAreaCode.Text = manager.Facility.phone.Substring(0, 3);
               this.TextBoxPhonePrefix.Text = manager.Facility.phone.Substring(3, 3);
               this.TextBoxPhoneNumber.Text = manager.Facility.phone.Substring(6, 4);

           }

           if (!String.IsNullOrEmpty(manager.Facility.phone_alt))
           {
               this.TextBoxAltPhoneAreaCode.Text = manager.Facility.phone_alt.Substring(0, 3);
               this.TextBoxAltPhonePrefix.Text = manager.Facility.phone_alt.Substring(3, 3);
               this.TextBoxAltPhoneNumber.Text = manager.Facility.phone_alt.Substring(6, 4);

           }

           if (!String.IsNullOrEmpty(manager.Facility.fax))
           {
               this.TextBoxFaxAreaCode.Text = manager.Facility.fax.Substring(0, 3);
               this.TextBoxFaxPrefix.Text = manager.Facility.fax.Substring(3, 3);
               this.TextBoxFaxNumber.Text = manager.Facility.fax.Substring(6, 4);

           }

           if (!String.IsNullOrEmpty(manager.Facility.lunchroom))
           {
               this.TextBoxLunchRoomAreaCode.Text = manager.Facility.lunchroom.Substring(0, 3);
               this.TextBoxLunchRoomPrefix.Text = manager.Facility.lunchroom.Substring(3, 3);
               this.TextBoxLunchRoomNumber.Text = manager.Facility.lunchroom.Substring(6, 4);

           }

           if (!String.IsNullOrEmpty(manager.Facility.engineering))
           {
               this.TextBoxEngineeringAreaCode.Text = manager.Facility.engineering.Substring(0, 3);
               this.TextBoxEngineeringPrefix.Text = manager.Facility.engineering.Substring(3, 3);
               this.TextBoxEngineeringNumber.Text = manager.Facility.engineering.Substring(6, 4);

           }

           this.TextBoxURL.Text = manager.Facility.url;
           this.TextBoxBellUrl.Text = manager.Facility.bellurl;
           this.TextBoxGrades.Text = manager.Facility.grades;
           this.TextBoxSchoolFocus.Text = manager.Facility.school_focus;
           this.CheckBoxWarningList.Checked = Convert.ToBoolean(manager.Facility.is_warning_list);
           this.CheckBoxActive.Checked = Convert.ToBoolean(manager.Facility.status_flag);
           this.TextBoxFacilityComment.Text = manager.Facility.facility_comment;

           this.GridViewProgram.DataSource = manager.Facility_programs;
           this.GridViewProgram.DataBind();


       }


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //FacilityManager manager = (FacilityManager)Session[Globals.SESSION_MODULEMANAGER];

        FacilityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).FacilityManagerObj;

        this.updateFacilityInformation(manager);

        manager.saveFacility();

        Server.Transfer(manager.RedirectURL);

    }

    private void updateFacilityInformation(FacilityManager manager)
    {

        if (manager.CurrentEditType == BusinessRuleManager.EditType.create)
        {

            manager.addFacility(this.TextBoxUnit.Text.Trim(),
                "0",
                this.TextBoxFacilityName.Text.Trim(),
                this.TextBoxFacilityDesc.Text.Trim(),
                this.DropDownListFacilityType.SelectedValue,
                this.TextBoxAddress1.Text.Trim(),
                this.TextBoxAddress2.Text.Trim(),
                this.TextBoxCity.Text.Trim(),
                this.DropDownListStates.SelectedItem.Text.Trim(),
                this.TextBoxZipCode.Text.Trim().PadLeft(5, '0'),
                this.TextBoxMiscContactName.Text.Trim(),
                this.TextBoxPhoneAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxPhonePrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxPhoneNumber.Text.Trim().PadLeft(4, '0'),
                this.TextBoxAltPhoneAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxAltPhonePrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxAltPhoneNumber.Text.Trim().PadLeft(4, '0'),
                this.TextBoxFaxAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxFaxPrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxFaxNumber.Text.Trim().PadLeft(4, '0'),
                this.TextBoxLunchRoomAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxLunchRoomPrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxLunchRoomNumber.Text.Trim().PadLeft(4, '0'),
                this.TextBoxEngineeringAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxEngineeringPrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxEngineeringNumber.Text.Trim().PadLeft(4, '0'),
                this.TextBoxURL.Text.Trim(),
                this.TextBoxBellUrl.Text.Trim(),
                this.TextBoxGrades.Text.Trim(),
                this.TextBoxSchoolFocus.Text.Trim(),
                Convert.ToInt32(this.CheckBoxWarningList.Checked),
                Convert.ToInt32(this.CheckBoxActive.Checked),
                this.TextBoxFacilityComment.Text,
                this.User.Identity.Name);
        }
        else
        {

            manager.updateFacility(this.TextBoxFacilityDesc.Text.Trim(),
               this.TextBoxAddress1.Text.Trim(),
               this.TextBoxAddress2.Text.Trim(),
               this.TextBoxCity.Text.Trim(),
               this.DropDownListStates.SelectedItem.Text,
               this.TextBoxZipCode.Text.Trim().PadLeft(5, '0'),
               this.TextBoxMiscContactName.Text.Trim(),
               this.TextBoxPhoneAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxPhonePrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxPhoneNumber.Text.Trim().PadLeft(4, '0'),
               this.TextBoxAltPhoneAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxAltPhonePrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxAltPhoneNumber.Text.Trim().PadLeft(4, '0'),
               this.TextBoxFaxAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxFaxPrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxFaxNumber.Text.Trim().PadLeft(4, '0'),
               this.TextBoxLunchRoomAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxLunchRoomPrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxLunchRoomNumber.Text.Trim().PadLeft(4, '0'),
               this.TextBoxEngineeringAreaCode.Text.Trim().PadLeft(3, '0') + this.TextBoxEngineeringPrefix.Text.Trim().PadLeft(3, '0') + this.TextBoxEngineeringNumber.Text.Trim().PadLeft(4, '0'),
               this.TextBoxURL.Text.Trim(),
               this.TextBoxBellUrl.Text.Trim(),
               this.TextBoxGrades.Text.Trim(),
               this.TextBoxSchoolFocus.Text.Trim(),
               Convert.ToInt32(this.CheckBoxWarningList.Checked),
               Convert.ToInt32(this.CheckBoxActive.Checked),
               this.TextBoxFacilityComment.Text,
               this.User.Identity.Name);

        }

    }

    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        //FacilityManager manager = (FacilityManager)Session[Globals.SESSION_MODULEMANAGER];

        FacilityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).FacilityManagerObj;

        this.updateFacilityInformation(manager);

        Server.Transfer("~/redirects/addfacilityprograms.aspx");
    }
}
