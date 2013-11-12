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

public partial class login_addusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.loadControls();
        }
    }

    private void loadControls()
    {

        this.CheckBoxListRoles.DataSource = Roles.GetAllRoles();
        this.CheckBoxListRoles.DataBind();

    }

    protected void ButtonSubmitUser_Click(object sender, EventArgs e)
    {
        try
        {

            if (!this.TextBoxConfirmPassword.Text.Equals(this.TextBoxPassword.Text))
            { throw new ApplicationException("Password confirmation does not match."); }

            if (this.CheckBoxListRoles.SelectedIndex < 0)
            { throw new ApplicationException("A Role must be selected for user."); }

            MembershipUser user = Membership.CreateUser(this.TextBoxUserName.Text.ToLower().Trim(), this.TextBoxPassword.Text, this.TextBoxEmail.Text);

            foreach (ListItem item in this.CheckBoxListRoles.Items)
            {
                if (item.Selected) { Roles.AddUserToRole(this.TextBoxUserName.Text.ToLower().Trim(), item.Value); }

            }

            ProfileCommon profile = this.Profile.GetProfile(this.TextBoxUserName.Text.ToLower().Trim());

            profile.EntityId = this.TextBoxEntityId.Text.Trim();

            profile.Save();

            this.LabelError.Text = "User created Successfully!";

            this.MultiViewButton.SetActiveView(this.ViewContinue);

            this.RequiredFieldValidatorConfirm.EnableClientScript = false;
            this.RequiredFieldValidatorEmail.EnableClientScript = false;
            this.RequiredFieldValidatorPassword.EnableClientScript = false;
            this.RequiredFieldValidatorUserName.EnableClientScript = false;
            this.RegularExpressionValidator1.EnableClientScript = false;

            CTC.BLL.UserManager manager = new CTC.BLL.UserManager(user);

            //Session.Add(Globals.SESSION_MODULEMANAGER, manager);
            ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj = manager;

        }
        catch (MembershipCreateUserException exc)
        {

            this.LabelError.Text = "Unable to create the user. ";

            switch (exc.StatusCode)
            {
                case MembershipCreateStatus.DuplicateEmail:
                    this.LabelError.Text += "An account with specified e-mail already exists.";
                    break;

                case MembershipCreateStatus.DuplicateUserName:
                    this.LabelError.Text += "An account with specified User Name already exists.";
                    break;

                case MembershipCreateStatus.InvalidEmail:
                    this.LabelError.Text += "The specified E-mail address is invalid";
                    break;

                case MembershipCreateStatus.InvalidPassword:
                    this.LabelError.Text += "The specified Password is invalid.";
                    break;

                default:
                    this.LabelError.Text += exc.Message;
                    break;
            }
        }
        catch (ApplicationException exa)
        {
            this.LabelError.Text = "Unable to create the user. ";
            this.LabelError.Text += exa.Message;

        }

        this.MultiViewUser.SetActiveView(this.ViewError);



    }
    protected void ButtonContinue_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/Default.aspx");

        Server.Transfer("~/useradmin/edituser.aspx");
    }

}
