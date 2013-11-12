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

public partial class info_entityview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) { this.loadControls(); }

    }


    private void loadControls()
    {
        //EntityManager em = new EntityManager(Request["ID"]);

        //this.LabelEntityId.Text = em.Entity.entity_id.ToString();
        //this.LableEntityName.Text = em.Entity.first_name + " " + em.Entity.last_name;

        //EventManager manager = (EventManager)Session[Globals.SESSION_MODULEMANAGER];

        //manager.getAttendanceException(Request["ID"]);

        //this.LabelExceptionId.Text = manager.ViewAttendanceException.attendance_excpetion_id.ToString();
        //this.LableExceptionFirstName.Text = manager.ViewAttendanceException.first_name;

        DataTable dt = InfoManager.exception(Request["ID"]);

        if (dt.Rows.Count > 0)
        {

            this.LabeEventID.Text = dt.Rows[0]["event_id"].ToString().Trim();
            this.LabelComment.Text = dt.Rows[0]["comment"].ToString().Trim();
            this.LabelCPSID.Text = dt.Rows[0]["cps_id"].ToString().Trim();
            this.LabelCreatedBy.Text = dt.Rows[0]["row_created_by_user_id"].ToString().Trim();
            this.LabelCTCID.Text = dt.Rows[0]["ctc_id"].ToString().Trim();
            this.LabelExceptionid.Text = dt.Rows[0]["attendance_excpetion_id"].ToString().Trim();
            this.LabelName.Text = dt.Rows[0]["first_name"].ToString().Trim() + " " + dt.Rows[0]["last_name"].ToString().Trim();
            this.LabelRetrieved.Text = dt.Rows[0]["retrieved_flag"].ToString().Trim();
            this.LabelRetrievedBy.Text = dt.Rows[0]["retrieved_by"].ToString().Trim();
            this.LabelRowCreated.Text = dt.Rows[0]["row_created"].ToString().Trim();
        }
        else
        {
            this.LabelDatabaseError.Visible = true;
        }

    }
}
