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
/// Summary description for BusinessLanguageManager
/// </summary>
public abstract class BusinessLanguageManager : BusinessRuleManager
{
    public abstract void addLanguage(string languageId, string userName);

    public abstract void makeHomeLanguage(string languageId,string userName);

    public abstract void removeLanguage(string languageId, string userName);

    public abstract System.Collections.IList getLanguageList();

}
