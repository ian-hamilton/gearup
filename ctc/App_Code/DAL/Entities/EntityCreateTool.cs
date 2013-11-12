using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EnterpriseNETClass;

/// <summary>
/// Summary description for EntityCreateTool
/// </summary>
public static class EntityCreateTool
{
	

    public static String getClass(string tableName)
    {

        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CTCServer"].ToString();
        String classDef = EnterpriseNETClass.DataItemUtilities.constructDatabaseClass("CTC.DAL.Entities", DBFactory.DatabaseType.sqlServer, connectionString, tableName);
        return classDef;

    }
}