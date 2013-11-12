using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CTC.DAL;
using CTC.DAL.Entities;
using EnterpriseNETClass;

/// <summary>
/// Summary description for LanguageManager
/// </summary>
public class LanguageManager
{
    public LanguageManager()
    { }

    public static System.Collections.Generic.List<Language> getLanguages()
    {
        System.Collections.Generic.List<Language> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Language>)doa.selectObjects(typeof(Language), "status_flag = 1", "language_name");

        doa.Dispose();

        return returnList;
    }


}
