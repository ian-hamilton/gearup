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
/// Summary description for ProgramManager
/// </summary>
public class ProgramManager
{
    public ProgramManager()
    { }

    public System.Collections.Generic.List<CTC.DAL.Entities.Program> selectLikePrograms(string likeString)
    {

        System.Collections.Generic.List<CTC.DAL.Entities.Program> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<CTC.DAL.Entities.Program>)doa.selectObjects(
            typeof(CTC.DAL.Entities.Program), "@lower(program_name) like lower('" + likeString + "%')@status_flag = 1", "program_name");

        doa.Dispose();

        return returnList;
    }

    public static DataTable selectDbAllPrograms()
    {
        return DataAccess.executeSelect(DataAccess.SQL_ALL_PROGAMS).Tables[0];

    }
}
