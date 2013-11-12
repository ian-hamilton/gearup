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

public partial class maintenance_student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.LabelNoResult.Visible = false;
    }
    //protected void ButtonSearch_Click(object sender, EventArgs e)
    //{
    //    StudentManager manager = new StudentManager();

    //    this.GridViewStudent.DataSource = manager.selectLikeStudents(this.TextBoxLastName.Text.Trim(), this.User.Identity.Name);
    //    this.GridViewStudent.DataBind();

    //    if (this.GridViewStudent.Rows.Count <= 0) { this.LabelNoResult.Visible = true; }

//}
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        StudentManager manager = new StudentManager();

        if (this.TextBoxLastName.Text.Length > 0)
        {
            this.GridViewStudent.DataSource = manager.selectLikeStudents(this.TextBoxLastName.Text.Trim(), this.User.Identity.Name);
        }
        else if (this.TextBoxCtcId.Text.Length > 0)
        {
            this.GridViewStudent.DataSource = manager.selectStudentCtc(Int64.Parse(this.TextBoxCtcId.Text), this.User.Identity.Name);

        }
        else if (this.TextBoxCpsId.Text.Length > 0)
        {
            this.GridViewStudent.DataSource = manager.selectStudentCps(Int64.Parse(this.TextBoxCpsId.Text), this.User.Identity.Name);

        }
        this.GridViewStudent.DataBind();
        if (this.GridViewStudent.Rows.Count <= 0) { this.LabelNoResult.Visible = true; }
    }

  
    protected void GridViewStudent_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GridViewStudent.SelectedRow != null)
        {
            //StudentManager manager = new StudentManager(((System.Web.UI.WebControls.HyperLink)this.GridViewStudent.SelectedRow.Cells[1].Controls[0]).Text);

            StudentManager manager = new StudentManager(this.GridViewStudent.DataKeys[this.GridViewStudent.SelectedRow.RowIndex][0].ToString());

            //Session.Add(Globals.SESSION_MODULEMANAGER, manager);

            ((SessionManager)Session[Globals.SESSION_OBJECT]).StudentManagerObj = manager;

            Server.Transfer(manager.RedirectURL);
        }
    }
}
