using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class maintenance_addentity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        JavascriptFactory.maxLengthMultiLine(this.TextBoxEntityComment, 1000, this);

        if (!IsPostBack)
        {
            this.loadControls();
        }
    }

    private void loadControls()
    {



       

      
        

        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        //Literal literal = null;

        //DataTable dt = InfoManager.entity(Request["ID"]);
        //this.LabelEntityId.Text = manager.Entity.entity_id.ToString();

        this.DropDownListEthnicity.DataSource = manager.selectAllEthnicities();
        this.DropDownListEthnicity.DataTextField = "ethnicity_desc";
        this.DropDownListEthnicity.DataValueField = "ethnicity";
        this.DropDownListEthnicity.DataBind();
        //this.LabelEntityId.Text = dt.Rows[0]["entity_id"].ToString().Trim();
        this.LabelStatus.Text = manager.CurrentMessage;
        this.LiteralEntity.Text = manager.HtmlAmendment;

        this.DropDownListStates.DataSource = Globals.states;
        this.DropDownListStates.DataBind();
        this.DropDownListStates.Items.FindByText("IL").Selected = true;

        this.GridViewProgram.DataSource = manager.Entity_programs;
        this.GridViewProgram.DataBind();

        this.DropDownListEntityType.DataSource = manager.selectEntityTypes();
        this.DropDownListEntityType.DataTextField = "entity_type_desc";
        this.DropDownListEntityType.DataValueField = "entity_type_id";
        this.DropDownListEntityType.DataBind();

        this.CheckBoxActive.Checked = Convert.ToBoolean(manager.Entity.status_flag);

        this.GridSelectedLanguages.DataSource = manager.Entity_languages;
        this.GridSelectedLanguages.DataBind();

        this.GridViewFacilites.DataSource = manager.getFacilityList();
        this.GridViewFacilites.DataBind();

      

      
        if (manager.CurrentEditType == BusinessRuleManager.EditType.edit)
        {
            this.MultiViewEntity.SetActiveView(this.ViewEdit);

            this.LabelEntityId.Text = manager.Entity.entity_id.ToString();
        }

        if (manager.CurrentEditType == BusinessRuleManager.EditType.create)
        {

            

        }
        else
        {

           
            this.TextBoxSalutation.Text = manager.Entity.salutation;
            this.TextBoxFirstName.Text = manager.Entity.first_name;
            this.TextBoxMiddleInitial.Text = manager.Entity.middle_initial;
            this.TextBoxLastName.Text = manager.Entity.last_name;
            this.TextBoxTitle.Text = manager.Entity.title;
            this.DropDownListEntityType.SelectedValue = manager.Entity.entity_type_id.ToString();
            this.TextBoxAddress1.Text = manager.Entity.address_1;
            this.TextBoxAddress2.Text = manager.Entity.address_2;
            this.TextBoxCity.Text = manager.Entity.city;
            this.DropDownListStates.SelectedValue = manager.Entity.state;
            this.TextBoxZipCode.Text = manager.Entity.zip;

            if (!String.IsNullOrEmpty(manager.Entity.phone))
            {
                this.TextBoxPhoneAreaCode.Text = manager.Entity.phone.Substring(0, 3);
                this.TextBoxPhonePrefix.Text = manager.Entity.phone.Substring(3, 3);
                this.TextBoxPhoneNumber.Text = manager.Entity.phone.Substring(6, 4);

            }

            if (!String.IsNullOrEmpty(manager.Entity.phone_mobile))
            {
                this.TextBoxPhoneMobileAreaCode.Text = manager.Entity.phone_mobile.Substring(0, 3);
                this.TextBoxPhoneMobilePrefix.Text = manager.Entity.phone_mobile.Substring(3, 3);
                this.TextBoxPhoneMobileNumber.Text = manager.Entity.phone_mobile.Substring(6, 4);
            }

            if (!String.IsNullOrEmpty(manager.Entity.phone_work))
            {
                this.TextBoxWorkAreaCode.Text = manager.Entity.phone_work.Substring(0, 3);
                this.TextBoxWorkPrefix.Text = manager.Entity.phone_work.Substring(3, 3);
                this.TextBoxWorkNumber.Text = manager.Entity.phone_work.Substring(6, 4);
            }

            if (!String.IsNullOrEmpty(manager.Entity.fax))
            {
                this.TextBoxFaxAreaCode.Text = manager.Entity.fax.Substring(0, 3);
                this.TextBoxFaxPrefix.Text = manager.Entity.fax.Substring(3, 3);
                this.TextBoxFaxNumber.Text = manager.Entity.fax.Substring(6, 4);
            }

            if (!String.IsNullOrEmpty(manager.Entity.phone_other))
            {
                this.TextBoxOtherAreaCode.Text = manager.Entity.phone_other.Substring(0, 3);
                this.TextBoxOtherPrefix.Text = manager.Entity.phone_other.Substring(3, 3);
                this.TextBoxOtherNumber.Text = manager.Entity.phone_other.Substring(6, 4);
            }

            this.TextBoxEmail.Text = manager.Entity.email;
            this.DropDownListGender.SelectedValue = manager.Entity.gender;
            //this.TextBoxEthnicity.Text = manager.Entity.ethnicity.ToString();
            this.DropDownListEthnicity.SelectedValue = manager.Entity.ethnicity.ToString();
            if(manager.Entity.dob.HasValue)
            this.TextBoxDOB.Text = manager.Entity.dob.Value.ToShortDateString();            
            this.TextBoxUnit.Text = manager.Entity.unit.ToString();
            this.TextBoxGrade.Text = manager.Entity.grade.ToString();
            this.TextBoxParentEntity.Text = manager.Entity.display_parent_reverse_full_name;
            this.TextBoxEntityComment.Text = manager.Entity.entity_comment;
            this.LabelEntityId.Text = manager.Entity.entity_id.ToString();
        }

        //literal = new Literal();
        //literal.Text = this.loadStudents();

        //this.PlaceHolderStudents.Controls.Add(literal);
    }

    private void updateEnityInformation(EntityManager manager)
    {

        if (manager.CurrentEditType == BusinessRuleManager.EditType.create)
        {
            manager.addEntity(this.TextBoxSalutation.Text.Trim(),
                this.TextBoxFirstName.Text.Trim(),
                this.TextBoxMiddleInitial.Text.Trim(),
                this.TextBoxLastName.Text.Trim(),
                this.TextBoxTitle.Text.Trim(),
                this.DropDownListEntityType.SelectedValue,
                this.TextBoxAddress1.Text.Trim(),
                this.TextBoxAddress2.Text.Trim(),
                this.TextBoxCity.Text.Trim(),
                this.DropDownListStates.SelectedValue,
                this.TextBoxZipCode.Text.Trim(),
                this.TextBoxPhoneAreaCode.Text.PadLeft(3, '0') + this.TextBoxPhonePrefix.Text.PadLeft(3, '0') + this.TextBoxPhoneNumber.Text.PadLeft(4, '0'),
                this.TextBoxPhoneMobileAreaCode.Text.PadLeft(3, '0') + this.TextBoxPhoneMobilePrefix.Text.PadLeft(3, '0') + this.TextBoxPhoneMobileNumber.Text.PadLeft(4, '0'),
                this.TextBoxEmail.Text.Trim(),
                this.DropDownListGender.SelectedValue,
                //this.TextBoxEthnicity.Text.Trim(),
                this.DropDownListEthnicity.SelectedValue,
                this.TextBoxDOB.Text.Trim(),
                this.TextBoxUnit.Text.Trim(),
                this.TextBoxGrade.Text,
                Convert.ToInt32(this.CheckBoxActive.Checked),
                this.User.Identity.Name,
                this.TextBoxEntityComment.Text,
                this.TextBoxWorkAreaCode.Text.PadLeft(3, '0') + this.TextBoxWorkPrefix.Text.PadLeft(3, '0') + this.TextBoxWorkNumber.Text.PadLeft(4, '0'),
                this.TextBoxFaxAreaCode.Text.PadLeft(3, '0') + this.TextBoxFaxPrefix.Text.PadLeft(3, '0') + this.TextBoxFaxNumber.Text.PadLeft(4, '0'),
                this.TextBoxOtherAreaCode.Text.PadLeft(3, '0') + this.TextBoxOtherPrefix.Text.PadLeft(3, '0') + this.TextBoxOtherNumber.Text.PadLeft(4, '0'));           
                

        }
        else
        {
            manager.addEntity(this.TextBoxSalutation.Text.Trim(),
               this.TextBoxFirstName.Text.Trim(),
               this.TextBoxMiddleInitial.Text.Trim(),
               this.TextBoxLastName.Text.Trim(),
               this.TextBoxTitle.Text.Trim(),
               this.DropDownListEntityType.SelectedValue,
               this.TextBoxAddress1.Text.Trim(),
               this.TextBoxAddress2.Text.Trim(),
               this.TextBoxCity.Text.Trim(),
               this.DropDownListStates.SelectedValue,
               this.TextBoxZipCode.Text.Trim(),
               this.TextBoxPhoneAreaCode.Text.PadLeft(3, '0') + this.TextBoxPhonePrefix.Text.PadLeft(3, '0') + this.TextBoxPhoneNumber.Text.PadLeft(4, '0'),
               this.TextBoxPhoneMobileAreaCode.Text.PadLeft(3, '0') + this.TextBoxPhoneMobilePrefix.Text.PadLeft(3, '0') + this.TextBoxPhoneMobileNumber.Text.PadLeft(4, '0'),
               this.TextBoxEmail.Text.Trim(),
               this.DropDownListGender.SelectedValue,
               //this.TextBoxEthnicity.Text.Trim(),
               this.DropDownListEthnicity.SelectedValue,
                this.TextBoxDOB.Text.Trim(),
               this.TextBoxUnit.Text.Trim(),
               this.TextBoxGrade.Text,
               Convert.ToInt32(this.CheckBoxActive.Checked),
               this.User.Identity.Name,
               this.TextBoxEntityComment.Text,
               this.TextBoxWorkAreaCode.Text.PadLeft(3, '0') + this.TextBoxWorkPrefix.Text.PadLeft(3, '0') + this.TextBoxWorkNumber.Text.PadLeft(4, '0'),
               this.TextBoxFaxAreaCode.Text.PadLeft(3, '0') + this.TextBoxFaxPrefix.Text.PadLeft(3, '0') + this.TextBoxFaxNumber.Text.PadLeft(4, '0'),
               this.TextBoxOtherAreaCode.Text.PadLeft(3, '0') + this.TextBoxOtherPrefix.Text.PadLeft(3, '0') + this.TextBoxOtherNumber.Text.PadLeft(4, '0'));  

        }

        


    }


    //private String loadStudents()
    //{

    //    StringBuilder builder = new StringBuilder();

    //    builder.Append("<table class=\"info\" width=\"325\"><tr><th align=\"center\">CTC ID</th><th>Name</th></tr>");

    //    DataTable dt = InfoManager.entityStudents(Request["ID"]);

    //    if (dt.Rows.Count <= 0)
    //    {
    //        builder.Append("<tr><td colspan=\"2\" align=\"center\"><b><font color=\"red\">" + InfoManager.NONE + "</font></b></td></tr>");
    //    }

    //    foreach (DataRow row in dt.Rows)
    //    {

    //        builder.Append("<tr><td><a target=\"_blank\" href=/CTC/info/studentview.aspx?ID=" + row[0].ToString() + ">" + row[0].ToString() + "</a></td>");
    //        builder.Append("<td>" + row[1].ToString() + "</td></tr>");

    //    }

    //    builder.Append("</table>");

    //    return builder.ToString();


    //}

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];

        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        this.updateEnityInformation(manager);

        manager.saveEntity();

        Server.Transfer(manager.RedirectURL);

    }

    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        this.updateEnityInformation(manager);

        Server.Transfer("~/redirects/addentityprograms.aspx");
    }
    protected void LinkButtonEditLanguage_Click(object sender, EventArgs e)
    {
        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        this.updateEnityInformation(manager);

        Server.Transfer("~/redirects/addentitylanguage.aspx");
    }
    protected void LinkButtonUnit_Click(object sender, EventArgs e)
    {
        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        this.updateEnityInformation(manager);

        Server.Transfer("~/maintenance/addfacilityunit.aspx");
    }
    protected void LinkButtonParentEntity_Click(object sender, EventArgs e)
    {
        //EntityManager manager = (EntityManager)Session[Globals.SESSION_MODULEMANAGER];
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        this.updateEnityInformation(manager);

        Server.Transfer("~/redirects/addentityentity.aspx");

    }
    protected void LinkButtonManageFacility_Click(object sender, EventArgs e)
    {
        EntityManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).EntityManagerObj;

        this.updateEnityInformation(manager);

        Server.Transfer("~/redirects/addentityfacility.aspx");
    }
}
