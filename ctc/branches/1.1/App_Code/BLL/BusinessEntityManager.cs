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
/// Summary description for BusinessEntityManager
/// </summary>
public abstract class BusinessEntityManager : BusinessLanguageManager  
{
    protected string[] _entityTypeSearchString;

    public string[] EntityTypeSearchString
    {
        get { return _entityTypeSearchString; }
    }

    private selectMethod _method = selectMethod.normal;

    public selectMethod Method
    {
        get { return _method; }
        set { _method = value; }
    }

    public enum selectMethod
    {
        normal,
        reside,
        single
    }

    public abstract void addEntity(string entityId, string userName);

    public abstract void removeEnity(string entityId, string userName);

    public abstract System.Collections.IList getEntityList();
}
