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

public partial class events_event : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.LabelNoResult.Visible = false;
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        if ((this.TextBoxEventDesc.Text.Length + this.TextBoxEventId.Text.Length) > 0
            || (this.TextBoxStartDate.Text.Length + this.TextBoxEndDate.Text.Length > 10))
        {
            this.GridViewEvent.DataSource = EventManager.selectLikeEvents(
                this.TextBoxEventId.Text, this.TextBoxEventDesc.Text, this.TextBoxStartDate.Text, this.TextBoxEndDate.Text);
            this.GridViewEvent.DataBind();
        }

        if (this.GridViewEvent.Rows.Count <= 0) { this.LabelNoResult.Visible = true; }
    }

    protected void ButtonNew_Click(object sender, EventArgs e)
    {
        EventManager manager = new EventManager();

        //Session.Add(Globals.SESSION_MODULEMANAGER, manager);

        ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj = manager;

        Server.Transfer(manager.RedirectURL);
    }

      protected void GridViewEvent_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        //EventManager manager = new EventManager(this.GridViewEvent.SelectedRow.Cells[int.Parse(e.CommandArgument.ToString())].Text);

        //EventManager manager = new EventManager(this.GridViewEvent.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text);

        EventManager manager = new EventManager(this.GridViewEvent.DataKeys[int.Parse(e.CommandArgument.ToString())][0].ToString());

        if (e.CommandName.Equals("edit"))
        {
            manager.CurrentEditType = BusinessRuleManager.EditType.edit;
        }
        else if (e.CommandName.Equals("duplicate"))
        {
            manager.Event.event_id = 0;

            manager.Event.date_of_service = DateTime.Now;

            manager.CurrentEditType = BusinessRuleManager.EditType.eventDuplicate;

            manager.duplicateCleanse(this.User.Identity.Name);
        }

        //Session.Add(Globals.SESSION_MODULEMANAGER, manager);
        ((SessionManager)Session[Globals.SESSION_OBJECT]).EventManagerObj = manager;

        Server.Transfer(manager.RedirectURL);

    }
}
