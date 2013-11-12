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
using CTC.DAL.Entities;
using System.Text;

public partial class controls_sidebar : System.Web.UI.UserControl
{

    private const string BLANK = "target=\"_blank\"";

    protected void Page_Load(object sender, EventArgs e)
    {

        this.PlaceHolder1AppLinks.Controls.Add(new LiteralControl(WebSiteManager.getAppLinks()));

        this.PlaceHolderRemoteLinks.Controls.Add(new LiteralControl(WebSiteManager.getRemoteLinks()));

        this.PlaceHolderQuoteOfTheWeek.Controls.Add(new LiteralControl(WebSiteManager.getQouteOfTheWeek()));

        this.PlaceHolderCitadelasemana.Controls.Add(new LiteralControl(WebSiteManager.getCitadelasemana()));

    }
}
