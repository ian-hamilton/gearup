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
using CTC.BLL;

public partial class useradmin_edituser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //this.loadControls((UserManager)Session[Globals.SESSION_MODULEMANAGER]);
            this.loadControls(((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj);

        }
    }

    private void loadControls(UserManager manager)
    {
        MembershipUser user = manager.User;

        this.LabelCreated.Text = user.CreationDate.ToShortDateString() + " " + user.CreationDate.ToShortTimeString();
        this.LabelEmail.Text = user.Email;
        this.LabelLastLogin.Text = user.LastLoginDate.ToShortDateString() + " " + user.LastLoginDate.ToShortTimeString();
        this.LabelUserId.Text = user.UserName;

        ProfileCommon p = Profile.GetProfile(user.UserName);

        if (p != null) { this.TextBoxEntity.Text = p.EntityId; }

        this.CheckBoxApproved.Checked = manager.User.IsApproved;
        this.CheckBoxonline.Checked = user.IsOnline;
        this.CheckBoxLockedOut.Checked = user.IsLockedOut; 

        if (manager.UnitList != null)
        {
            this.GridViewUnits.DataSource = manager.UnitList;
            this.GridViewUnits.DataBind();
        }

        this.CheckBoxListRoles.DataSource = Roles.GetAllRoles();
        this.CheckBoxListRoles.DataBind();
        
        foreach (ListItem i in this.CheckBoxListRoles.Items)
        {
            foreach (string role in Roles.GetRolesForUser(user.UserName))
            {
                if(role.ToLower().Equals(i.Value.ToLower()))
                { i.Selected = true; }
            }

        }

    }
    protected void ButtonSubmitUser_Click(object sender, EventArgs e)
    {
        this.LabelSaveStatus.Text = "User update complete. ";

        //UserManager m = (UserManager)Session[Globals.SESSION_MODULEMANAGER];
        UserManager m = ((SessionManager)Session[Globals.SESSION_OBJECT]).UserManagerObj;

        try
        {

            if (this.CheckBoxLockedOut.Checked == false && m.User.IsLockedOut)
            {
                m.User.UnlockUser();
            }

            m.User.IsApproved = this.CheckBoxApproved.Checked;

            Membership.UpdateUser(m.User);

            ProfileCommon p = Profile.GetProfile(m.User.UserName);

            p.EntityId = this.TextBoxEntity.Text;

            p.Save();

            foreach (ListItem item in this.CheckBoxListRoles.Items)
            {
                if (item.Selected == false && Roles.IsUserInRole(m.User.UserName, item.Value))
                {
                    Roles.RemoveUserFromRole(m.User.UserName, item.Value);
                }
                else if (item.Selected && Roles.IsUserInRole(m.User.UserName, item.Value) == false)
                {
                    Roles.AddUserToRole(m.User.UserName, item.Value);
                }
            }

            this.loadControls(m);
        }
        catch (MembershipCreateUserException exc)
        {
            this.LabelSaveStatus.Text = "Unable to save the user. ";

            this.LabelSaveStatus.Text += exc.Message;                 
            
        }

        


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/useradmin/addunit.aspx");
    }

    protected void ButtonResetPassword_Click(object sender, EventArgs e)
    {

        MembershipUser member = Membership.GetUser(this.LabelUserId.Text);

        this.LabelSaveStatus.Text = 
            UserManager.resetPassword(member);
    }
}
