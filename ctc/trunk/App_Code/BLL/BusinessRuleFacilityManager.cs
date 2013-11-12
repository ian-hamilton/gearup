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
/// Summary description for BusinessRuleFacilityManager
/// </summary>
public abstract class BusinessRuleFacilityManager : BusinessEntityManager
{

    public bool isHost = false;

    public abstract void addFacility(string facilityId, string userName);

    public abstract void removeFacility(string facilityId, string userName);

    public abstract System.Collections.IList getFacilityList();

    public abstract string whereFacilityIn();

}
