using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CTC.DAL.Entities;
using CTC.DAL;
using EnterpriseNETClass;
using System.Text;

/// <summary>
/// Summary description for WebSiteManager
/// </summary>
public class WebSiteManager
{

    public static string getAppLinks()
    {
        

        DatabaseObjectAccess doa = DataAccess.createDOA();

        It_content_manager content = (It_content_manager)doa.selectObjects(
            typeof(It_content_manager), "@module_name = 'side_bar'@area = 'application_links'", "@line_sequence")[0];

        doa.Dispose();

        return content.content_line_text;

    }

    public static string getRemoteLinks()
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        It_content_manager content = (It_content_manager)doa.selectObjects(
            typeof(It_content_manager), "@module_name = 'side_bar'@area = 'remote_links'", "@line_sequence")[0];

        doa.Dispose();

        return content.content_line_text;

    }

    public static string getQouteOfTheWeek()
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        It_content_manager content = (It_content_manager)doa.selectObjects(
            typeof(It_content_manager), "@module_name = 'side_bar'@area = 'qoute_of_the_week'", "@line_sequence")[0];

        doa.Dispose();

        return content.content_line_text;

    }

    public static string getCitadelasemana()
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        It_content_manager content = (It_content_manager)doa.selectObjects(
            typeof(It_content_manager), "@module_name = 'side_bar'@area = 'Citadelasemana'", "@line_sequence")[0];

        doa.Dispose();

        return content.content_line_text;
    }


    public static string getMainAnnouncement()
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        It_content_manager content = (It_content_manager)doa.selectObjects(
            typeof(It_content_manager), "@module_name = 'main_default'@area = 'announcement'", "@line_sequence")[0];

        doa.Dispose();

        return content.content_line_text;
    }

    public static string getContacts()
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        It_content_manager content = (It_content_manager)doa.selectObjects(
            typeof(It_content_manager), "@module_name = 'contacts'@area = 'contacts_main'", "@line_sequence")[0];

        doa.Dispose();

        return content.content_line_text;


    }

 

}
