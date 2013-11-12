using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using CTC.DAL;
using CTC.DAL.Entities;
using EnterpriseNETClass;
using System.Text;

/// <summary>
/// Summary description for ReportManager
/// </summary>
public class ReportManager
{

    private Rpt_report_process _report_process = null;

    private System.Data.DataTable _resultTable = null;

    public System.Data.DataTable ResultTable
    {
        get { return _resultTable; }
        set { _resultTable = value; }
    }
    

	public ReportManager(Int64 report_id)
	{
        DatabaseObjectAccess doa = DataAccess.createDOA();

        this._report_process = (Rpt_report_process)doa.selectObjects(typeof(Rpt_report_process), "report_id = " + report_id.ToString(), "report_name")[0];

        doa.Dispose();
	}

    public static System.Collections.IList getValidReportProcesses()
    {

        DatabaseObjectAccess doa = DataAccess.createDOA();

        System.Collections.IList ilist = doa.selectObjects(typeof(Rpt_report_process), "@status_flag = 1", "report_name");

        doa.Dispose();

        return ilist;

    }

    public string createHTMLTableExcelString()
    {
        StringBuilder builder = new StringBuilder();

        builder.Append("<table id=\"excel\"><tr>");

        for (int i = 0; i < this._resultTable.Columns.Count; i++)
        {
            builder.Append("<th>" + this._resultTable.Columns[i].ColumnName + "</th>");

        }

        builder.Append("</tr>");

        foreach (DataRow row in this._resultTable.Rows)
        {
            builder.Append("<tr>");

            for (int i = 0; i < this._resultTable.Columns.Count; i++)
            {
                builder.Append("<td>" + row[i].ToString().Trim() + "</td>");
            }

            builder.Append("</tr>");

        }

        builder.Append("</table>");

        return builder.ToString();
    }

    public void loadControlTable(PlaceHolder holder)
    {

        Literal literal = null;
        int count = 1;

        literal = new Literal();
        literal.Text = "<table width=\"700\"><tr><td style=\"Width:350px\"></td><td style=\"Width:350px\"></td></tr>";
        holder.Controls.Add(literal);

        foreach(Rpt_report_detail rrd in this._report_process.Rpt_report_detail)
        {
            literal = new Literal();

            if (count == 1) { literal.Text = "<tr>"; }
            literal.Text += "<td>";

            holder.Controls.Add(literal);

            Label lb = new Label();
            lb.Text = rrd.display_label;
            holder.Controls.Add(lb);

            literal = new Literal();
            literal.Text = "<br />";
            holder.Controls.Add(literal);

            if (rrd.Control_type.control_type.Equals("text_box"))
            {
                TextBox tb = new TextBox();
                tb.ID = rrd.parameter_control_id;

                holder.Controls.Add(tb);

                RequiredFieldValidator validator = new RequiredFieldValidator();

                validator.ControlToValidate = rrd.parameter_control_id;
                validator.ID = rrd.parameter_control_id + "validator";
                validator.Display = ValidatorDisplay.None;
                validator.ErrorMessage = "Missing required information";

                holder.Controls.Add(validator);

                AjaxControlToolkit.ValidatorCalloutExtender callout = new AjaxControlToolkit.ValidatorCalloutExtender();
                callout.ID = rrd.parameter_control_id + "callout";
                callout.TargetControlID = rrd.parameter_control_id + "validator"; ;

                holder.Controls.Add(callout);
            }
            else if (rrd.Control_type.control_type.Equals("ajax_calendar_extender"))
            {

                TextBox tb = new TextBox();
                tb.ID = rrd.parameter_control_id;
                holder.Controls.Add(tb);

                AjaxControlToolkit.CalendarExtender calex = new AjaxControlToolkit.CalendarExtender();

                calex.TargetControlID = rrd.parameter_control_id;
                calex.ID = rrd.parameter_control_id + "cal_extender";

                holder.Controls.Add(calex);

                RequiredFieldValidator validator = new RequiredFieldValidator();

                validator.ControlToValidate = rrd.parameter_control_id;
                validator.ID = rrd.parameter_control_id + "validator";
                validator.Display = ValidatorDisplay.None;
                validator.ErrorMessage = "Missing required information";

                holder.Controls.Add(validator);

                AjaxControlToolkit.ValidatorCalloutExtender callout = new AjaxControlToolkit.ValidatorCalloutExtender();
                callout.ID = rrd.parameter_control_id + "callout";
                callout.TargetControlID = rrd.parameter_control_id + "validator"; ;

                holder.Controls.Add(callout);


                
            }
            else if (rrd.Control_type.control_type.Equals("selection"))
            {

                DataTable table = DataAccess.executeSelect(rrd.options_sql).Tables[0];

                DropDownList dlist = new DropDownList();
                dlist.ID = rrd.parameter_control_id;
                dlist.DataSource = table;
                dlist.DataTextField = table.Columns[0].ColumnName;
                dlist.DataValueField = table.Columns[1].ColumnName;
                dlist.DataBind();

                holder.Controls.Add(dlist);          

            }
            else if (rrd.Control_type.control_type.Equals("radio"))
            {
                DataTable table = DataAccess.executeSelect(rrd.options_sql).Tables[0];

                RadioButtonList rlist = new RadioButtonList();
                rlist.ID = rrd.parameter_control_id;
                rlist.DataSource = table;
                rlist.DataTextField = table.Columns[0].ColumnName;
                rlist.DataValueField = table.Columns[1].ColumnName;
                rlist.DataBind();

                if (rlist.Items.Count > 0) { rlist.Items[0].Selected = true; }

                holder.Controls.Add(rlist);
            }

            literal = new Literal();
            literal.Text = "<br /></td>";

            if (count % 2 == 0) //even
            {
                literal.Text += "</tr><tr><td><br></td></tr>";
            }

            holder.Controls.Add(literal);

            count++;               

        }

        if (count % 2 != 0) //odd
        {
            literal = new Literal(); 
            literal.Text = "<td></td></tr>";

            holder.Controls.Add(literal);
        }

        literal = new Literal();
        literal.Text = "</table>";
        holder.Controls.Add(literal);


    }


    public DataTable executeReport(PlaceHolder holder, String userName)
    {
        System.Collections.Generic.List<Rpt_report_detail> htable = new System.Collections.Generic.List<Rpt_report_detail>();

        foreach(Control ctl in holder.Controls)
        {

            foreach (Rpt_report_detail detail in this._report_process.Rpt_report_detail)
            {

                if (ctl.ID != null && detail.parameter_control_id.ToLower().Equals(ctl.ID.ToLower()))
                {

                    //String input = String.Empty;

                    if (ctl.GetType() == typeof(TextBox))
                    {
                        detail.Postback_value = ((TextBox)ctl).Text;
                    }
                    else if (ctl.GetType() == typeof(DropDownList))
                    {
                        detail.Postback_value = ((DropDownList)ctl).SelectedValue;
                    }

                    htable.Add(detail);

                }

            }            

        }


        this._resultTable = DataAccess.executeReportSqlFunction(this._report_process.report_function_name, htable, userName).Tables[0];

        return this._resultTable;

    }

    public Rpt_report_process Report_process
    {
        get { return _report_process; }
        set { _report_process = value; }
    }

}
