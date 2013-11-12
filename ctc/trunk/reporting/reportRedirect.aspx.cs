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

public partial class reporting_reportRedirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ReportManager manager = null;

        manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj;

        this.LabelReportDesc.Text = manager.Report_process.report_name;

        manager.loadControlTable(this.PlaceHolderReportDetails);

        ((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj = manager;

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        ReportManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj;

        this.GridViewResult.DataSource = manager.executeReport(this.PlaceHolderReportDetails, this.User.Identity.Name);
        this.GridViewResult.DataBind();
    }

    protected void GridViewResult_Sorting(object sender, GridViewSortEventArgs e)
    {
        //sorts the datatable result
        ReportManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj;

        DataTable dataTable = manager.ResultTable;

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            this.GridViewResult.DataSource = dataView;
            this.GridViewResult.DataBind();

        }
    }

    //used to sort the gridview when not using a datasource object
    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;

        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    }


    protected void ButtonExcel_Click(object sender, EventArgs e)
    {
        
        ReportManager manager = ((SessionManager)Session[Globals.SESSION_OBJECT]).ReportManagerObj;

        if (manager != null && manager.ResultTable != null)
        {

            string strBody = manager.createHTMLTableExcelString();

            Response.Clear();
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            Response.AppendHeader("Content-Type", "application/vnd.ms-excel");

            //Response.AppendHeader("Content-Type", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            //Response.AppendHeader("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            Response.Write(strBody);
            Response.End();

        }


    }
  }
