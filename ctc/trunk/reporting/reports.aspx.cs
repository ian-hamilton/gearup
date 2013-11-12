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
using System.Text;

public partial class reporting_reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { this.loadControls(); }
    }

    private void loadControls()
    {
        this.DropDownListReports.DataSource = ReportManager.getValidReportProcesses();
        this.DropDownListReports.DataTextField = "report_name";
        this.DropDownListReports.DataValueField = "report_id";
        this.DropDownListReports.DataBind();




    }
    protected void DropDownListReports_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(this.DropDownListReports.SelectedValue) && !this.DropDownListReports.SelectedValue.Equals("-1"))
        {

            ReportManager manager = new ReportManager(Int64.Parse(this.DropDownListReports.SelectedValue));

            ((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj = manager;

            this.LabelDesc.Text = manager.Report_process.report_desc;

        }

    }
   


    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        if (((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj != null)
        {
            Response.Redirect("~/reporting/reportRedirect.aspx");
        }
        
    }
}
