using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CTC.BLL;
using EnterpriseNETClass;
using CTC.DAL;
using CTC.DAL.Entities;

/// <summary>
/// Summary description for SessionManager
/// </summary>
public class SessionManager
{
    private FacilityManager _facilityManagerObj;
    private LanguageManager _languageManagerObj;
    private ProgramManager _programManagerObj;
    private UserManager _userManagerObj;
    private StudentManager _studentManagerObj;
    private ProfileManager _profileManagerObj;
    private EventManager _eventManagerObj;
    private EntityManager _entityManagerObj;
    private ReportManager _reportManagerObj; 

    

    private DateTime _currentMonthDate = DateTime.Now;

    public DateTime CurrentMonthDate
    {
        get { return _currentMonthDate; }
        set { _currentMonthDate = value; }
    }

    public SessionManager()
    { }

    public static void logError(string userName, string errorMessage, string url)
    {
            It_web_log webLog = new It_web_log();

            webLog.log_user_name = userName;
            webLog.log_error = errorMessage;
            webLog.log_event = url;

            DatabaseObjectAccess doa = DataAccess.createDOA();
            doa.persistObject(webLog);

            doa.Dispose();
    }

    public static void logMessageEvent(string userName, string message)
    {
        It_web_log webLog = new It_web_log();

        webLog.log_user_name = userName;
        webLog.log_event = message;

        DatabaseObjectAccess doa = DataAccess.createDOA();
        doa.persistObject(webLog);

        doa.Dispose();
    }

    public ReportManager ReportManagerObj
    {
        get { return _reportManagerObj; }
        set { _reportManagerObj = value; }
    }

    public FacilityManager FacilityManagerObj
    {
        get { return _facilityManagerObj; }
        set { _facilityManagerObj = value; }
    }
    

    public LanguageManager LanguageManagerObj
    {
        get { return _languageManagerObj; }
        set { _languageManagerObj = value; }
    }
    

    public ProgramManager ProgramManagerObj
    {
        get { return _programManagerObj; }
        set { _programManagerObj = value; }
    }
    

    public UserManager UserManagerObj
    {
        get { return _userManagerObj; }
        set { _userManagerObj = value; }
    }
    

    public StudentManager StudentManagerObj
    {
        get { return _studentManagerObj; }
        set { _studentManagerObj = value; }
    }
    

    public ProfileManager ProfileManagerObj
    {
        get { return _profileManagerObj; }
        set { _profileManagerObj = value; }
    }
    

    public EventManager EventManagerObj
    {
        get { return _eventManagerObj; }
        set { _eventManagerObj = value; }
    }
    

    public EntityManager EntityManagerObj
    {
        get { return _entityManagerObj; }
        set { _entityManagerObj = value; }
    }

    

   

    

   
}
