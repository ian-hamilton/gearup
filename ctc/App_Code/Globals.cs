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
/// Summary description for Globals
/// </summary>
public class Globals
{
   // public const string SESSION_MODULEMANAGER = "useradminid";
   // public const string SESSION_EDITFACILITY_MANAGER = "editfacman";

    public const string SESSION_MODULEMANAGER = "manager";
    public const string SESSION_PROFILE = "profileManager";
    public const string CONFIG_MAIN_STRING = "CTCServer";
    public const string SESSION_OBJECT = "sessionmanager";

   


    public static string[] states = {"AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID",

        "IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY",

        "OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"};




}
