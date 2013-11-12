using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class maintenance_editstudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        JavascriptFactory.maxLengthMultiLine(this.TextBoxStatusComment, 1000, this);

        if (!IsPostBack)
        {
            this.loadControls();

            //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];

        //StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        //    this.DropDownListSemester.DataSource = manager.selectSemesters();
        //    this.DropDownListSemester.DataTextField = "semester_code";
        //    this.DropDownListSemester.DataValueField = "semester_code";
        //    this.DropDownListSemester.DataBind();
        }
    }

    private void loadControls()
    {
        //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];

        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        this.LabelStatus.Text = manager.CurrentMessage;

        this.LabelCtcId.Text = manager.Ctc_master.ctc_id.ToString();
        this.LabelAlphaName.Text = manager.Ctc_master.Alpha_student.first_name + " " + manager.Ctc_master.Alpha_student.last_name;
        if (manager.Ctc_master.Alpha_student.dob.HasValue)
            this.LabelDOB.Text = manager.Ctc_master.Alpha_student.dob.Value.ToShortDateString();

        this.TextBoxStatusComment.Text = manager.Ctc_master.status_comment;
        //this.TextBoxPrimaryLanguage.Text = manager.Ctc_master.primary_language.ToString();

        this.GridViewResidingEntity.DataSource = manager.getResidingEntity();
        this.GridViewResidingEntity.DataBind();

        this.GridViewParentsGuardians.DataSource = manager.getParentEntity();
        this.GridViewParentsGuardians.DataBind();

        //if (String.IsNullOrEmpty(manager.Ctc_master.start_semester))
        //{ this.DropDownListSemester.SelectedValue = "None"; }
        //else
        //{
        //    this.DropDownListSemester.SelectedValue = manager.Ctc_master.start_semester;
        //}

        this.GridViewProgram.DataSource = manager.Master_programs;
        this.GridViewProgram.DataBind();

        this.GridSelectedLanguages.DataSource = manager.Student_languages;
        this.GridSelectedLanguages.DataBind();

        this.CheckBox21Century.Checked = Convert.ToBoolean(manager.Ctc_master.twenty_first);
        this.CheckBoxFASFA.Checked = Convert.ToBoolean(manager.Ctc_master.fafsa);
        this.CheckBoxMediaRelease.Checked = Convert.ToBoolean(manager.Ctc_master.media_release);
        this.CheckBoxParentalPermission.Checked = Convert.ToBoolean(manager.Ctc_master.parential_permission);
        this.CheckBoxParentSurvey.Checked = Convert.ToBoolean(manager.Ctc_master.parent_survey);
        this.CheckBoxStudentSurvey.Checked = Convert.ToBoolean(manager.Ctc_master.student_servey);

        this.GridViewFacilites.DataSource = manager.getFacilityList();
        this.GridViewFacilites.DataBind();

    }
   
    private void updateInformation(StudentManager manager)
    {

        IDictionary<long, bool> dictionary = new Dictionary<long, bool>();

        foreach (GridViewRow row in GridViewFacilites.Rows)
        {
            CheckBox box = (CheckBox)row.FindControl("CheckBox1");
            long id = (long)GridViewFacilites.DataKeys[row.RowIndex][0];
            dictionary.Add(id, box.Checked);
        }

        manager.updateStudent(this.TextBoxStatusComment.Text.Trim(), 
            //this.DropDownListSemester.SelectedValue,
            this.User.Identity.Name,
            this.CheckBoxParentalPermission.Checked,
            this.CheckBoxMediaRelease.Checked,
            this.CheckBox21Century.Checked,
            this.CheckBoxFASFA.Checked,
            dictionary//,
            //this.CheckBoxStudentSurvey.Checked,
            //this.CheckBoxParentSurvey.Checked
            );

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];
        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        this.updateInformation(manager);

        manager.saveStudent();

        Server.Transfer(manager.RedirectURL);
    }



    protected void LinkButtonEditLanguage_Click(object sender, EventArgs e)
    {
        //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];
        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        this.updateInformation(manager);

        Server.Transfer("~/redirects/addstudentlanguage.aspx");
    }
    protected void LinkButtonResidingEntity_Click(object sender, EventArgs e)
    {
        //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];
        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        manager.Method = BusinessEntityManager.selectMethod.reside;

        this.updateInformation(manager);

        Server.Transfer("~/redirects/addstudententity.aspx");
    }
    protected void LinkButtonParentGuardians_Click(object sender, EventArgs e)
    {
        //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];
        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        manager.Method = BusinessEntityManager.selectMethod.normal;

        this.updateInformation(manager);

        Server.Transfer("~/redirects/addstudententity.aspx");
    }
    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        //StudentManager manager = (StudentManager)Session[Globals.SESSION_MODULEMANAGER];
        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        this.updateInformation(manager);

        Server.Transfer("~/redirects/addstudentprograms.aspx");
    }
    protected void LinkButtonManageFacility_Click(object sender, EventArgs e)
    {
        StudentManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj;

        this.updateInformation(manager);

        Server.Transfer("~/redirects/addstudentfacility.aspx");
    }



}
