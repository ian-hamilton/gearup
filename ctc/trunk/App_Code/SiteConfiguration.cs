using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for SiteConfiguration
/// </summary>
public class SiteConfiguration
{
    public SiteConfiguration()
    { }

    public static string getMainConnectionString()
    {
        return ConfigurationManager.ConnectionStrings[Globals.CONFIG_MAIN_STRING].ToString();
    }
}
