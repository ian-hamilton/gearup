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
/// Summary description for IBusinessRuleManager
/// </summary>
public abstract class BusinessRuleManager
{

    protected EditType _currentEditType = EditType.create;
    protected string _currentMessage = String.Empty;
    private string _htmlAmendment = String.Empty;

    public string HtmlAmendment
    {
        get { return _htmlAmendment; }
        set { _htmlAmendment = value; }
    }

    public EditType CurrentEditType
    {
        get { return _currentEditType; }
        set { _currentEditType = value; }
    }

   

    public string CurrentMessage
    {
        get { return _currentMessage; }
        set { _currentMessage = value; }
    }

    public enum EditType
    {
        create,
        edit,
        predit,
        eventDuplicate

    }

    private string _redirectURL;

    public string RedirectURL
    {
        get { return _redirectURL; }
        set { _redirectURL = value; }
    }

    public void reset()
    {
        this._currentMessage = String.Empty;
        this._htmlAmendment = String.Empty;
    }

    public abstract string validate();

    public abstract void addProgram(string programId, string userName);

    public abstract void removeProgram(string programId, string userName);

    public abstract System.Collections.IList getProgramList();

}
