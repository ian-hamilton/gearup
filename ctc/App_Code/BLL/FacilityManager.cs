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
/// Summary description for FacilityManager
/// </summary>
public class FacilityManager : BusinessRuleManager   
{
    private CTC.DAL.Entities.Facility _facility;


	public FacilityManager()
    { this._facility = new Facility(); this.RedirectURL = "~/maintenance/addfacility.aspx"; }

    public FacilityManager(string facilityId)
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        this._facility = (Facility)doa.selectObjects(typeof(Facility), "@facility_id = " + facilityId, "")[0];

        doa.Dispose();

        this._currentEditType = EditType.edit;

        this.RedirectURL = "~/maintenance/addfacility.aspx";

    }

    //should only be used by the user admin screen
    public System.Collections.Generic.List<Facility> selectLikeFacility(string likeString)
    {

        System.Collections.Generic.List<Facility> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Facility>)doa.selectObjects(typeof(Facility), "@facility_name like '" + likeString + "%'", "facility_name");

        doa.Dispose();

        return returnList;

    }

       public System.Collections.Generic.List<Facility> selectLikeFacility(string likeString, int ProgramId)
    {

        System.Collections.Generic.List<Facility> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Facility>)doa.selectObjectsSQL(typeof(Facility), DataAccess.SQL_FACILITIES_PER_PROGRAM
             .Replace("?facility_name", likeString).Replace("?program_id", ProgramId.ToString()));

        doa.Dispose();

        return returnList;

    }

       public System.Collections.Generic.List<Facility> selectLikeFacility(string likeString, string userName)
       {
           return this.selectLikeFacility(likeString, userName, String.Empty);
       }

    public System.Collections.Generic.List<Facility> selectLikeFacility(string likeString, string userName, string inFacilityType)
    {

        System.Collections.Generic.List<Facility> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Facility>)
            doa.selectObjectsSQL(typeof(Facility), DataAccess.SQL_SELECT_FACILITY_PER_SECURITY_UNIT.Replace("?1", userName)
            .Replace("?2", likeString.Trim()).Replace("?3", inFacilityType));
        //doa.selectObjects(typeof(Facility), "@facility_name like '" + likeString + "%'", "facility_name");

        doa.Dispose();

        return returnList;

    }

    public System.Collections.Generic.List<Facility> selectLikeFacility(int unit, string userName)
    {

        System.Collections.Generic.List<Facility> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Facility>)
            doa.selectObjectsSQL(typeof(Facility), DataAccess.SQL_SELECT_FACILITY_PER_SECURITY_UNIT_BY_UNIT.Replace("?1", userName)
            .Replace("?2", unit.ToString()).Replace("?3", ""));
        //doa.selectObjects(typeof(Facility), "@facility_name like '" + likeString + "%'", "facility_name");

        doa.Dispose();

        return returnList;

    }

    public System.Collections.Generic.List<Facility_type> selectFacilityTypes()
    {

        System.Collections.Generic.List<Facility_type> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Facility_type>)doa.selectObjects(typeof(Facility_type), "@status_flag = 1", "@facility_type_name");

        return returnList;
    }


    public void addFacility(string unit, string area, string facilityName, string facilityDesc, string facilityTypeId,
        string address1, string address2, string city, string state, string zip, string miscContactName, string phone,
        string altPhone, string fax, string lunchRoom, string engineering, string url, string bellurl, string grades, string schoolFocus,
        int warningList, int active, string facilityComment, string userName)
    {

        if(!String.IsNullOrEmpty(unit)) { this._facility.unit = int.Parse(unit); }
        this._facility.area = int.Parse(area);
        this._facility.facility_name = facilityName;
        this._facility.facility_type_id = long.Parse(facilityTypeId);
        this._facility.row_created_by_user_id = userName;
        this._facility.row_created = DateTime.Now;

        this.updateFacility(facilityDesc, address1, address2, city, state, zip, miscContactName, phone, altPhone,
            fax, lunchRoom, engineering, url, bellurl, grades, schoolFocus, warningList, active, facilityComment, userName);

        if (this._currentEditType == EditType.create) { this._currentEditType = EditType.predit; }

    }

    public void updateFacility(string facilityDesc,string address1, string address2, string city, string state, string zip, string miscContactName, string phone,
    string altPhone, string fax, string lunchRoom, string engineering, string url, string bellurl, string grades, string schoolFocus,
    int warningList, int active, string facilityComment, string userName)
    {

        this.reset();

        this._facility.facility_desc = facilityDesc;
        this._facility.address_1 = address1;
        this._facility.address_2 = address2;
        this._facility.city = city;
        this._facility.state = state;

        if (String.IsNullOrEmpty(zip.Trim('0')))
        { this._facility.zip = String.Empty; }
        else { this._facility.zip = zip; }

        this._facility.misc_contact_name = miscContactName;

        if (String.IsNullOrEmpty(phone.Trim('0')))
        { this._facility.phone = String.Empty; }
        else { this._facility.phone = phone; }

        if (String.IsNullOrEmpty(altPhone.Trim('0')))
        { this._facility.phone_alt = String.Empty; }
        else { this._facility.phone_alt = altPhone; }

        if (String.IsNullOrEmpty(fax.Trim('0')))
        { this._facility.fax = String.Empty; }
        else { this._facility.fax = fax; }

        if (String.IsNullOrEmpty(lunchRoom.Trim('0')))
        { this._facility.lunchroom = String.Empty; }
        else { this._facility.lunchroom = lunchRoom; }

        if (String.IsNullOrEmpty(engineering.Trim('0')))
        { this._facility.engineering = String.Empty; }
        else { this._facility.engineering = engineering; }

        this._facility.url = url;
        this._facility.bellurl = bellurl;
        this._facility.grades = grades;
        this._facility.school_focus = schoolFocus;
        this._facility.is_warning_list = warningList;
        this._facility.status_flag = active;
        this._facility.facility_comment = facilityComment;
        this._facility.row_updated = DateTime.Now;
        this._facility.row_updated_by_user_id = userName;

      

    }

    public void saveFacility()
    {

        this.CurrentMessage = validate();

        if (String.IsNullOrEmpty(this.CurrentMessage))
        {

            DatabaseObjectAccess doa = DataAccess.createDOA();

            Facility f = (Facility)doa.persistObject(this._facility);

            if (f == null)
            {
                this.CurrentMessage = doa.CurrentException.Message;
            }
            else
            {
                this._facility = f;

                this.CurrentMessage = "Facility saved successfully!";

                this._currentEditType = EditType.edit;

            }
        }    

    }

    public override void addProgram(string programId, string userName)
    {

        Facility_programs f = this._facility.Facility_programs.Find(delegate(Facility_programs fp) { return fp.program_id == long.Parse(programId); });

        if (f != null)
        {
            f.status_flag = 1;
            f.row_updated = DateTime.Now;
            f.row_updated_by_user_id = userName;
        }
        else
        {
            f = new Facility_programs();

            f.program_id = long.Parse(programId);
            f.row_created_by_user_id = userName;
            f.row_updated_by_user_id = userName;

            this._facility.Facility_programs.Add(f);
            
        }

    }

 
    public override void removeProgram(string programId, string userName)
    {
        Facility_programs f = this._facility.Facility_programs.Find(delegate(Facility_programs fp) { return fp.program_id == long.Parse(programId); });

        if (f != null)
        {
            f.status_flag = 0;
            f.row_updated = DateTime.Now;
            f.row_updated_by_user_id = userName;
        }


    }

 
    public CTC.DAL.Entities.Facility Facility
    {
        get { return _facility; }
    }

    public System.Collections.Generic.List<CTC.DAL.Entities.Facility_programs> Facility_programs
    {
        get{ return this._facility.Facility_programs.FindAll(delegate(Facility_programs fp) { return fp.status_flag==1;}); }

    }

    public override System.Collections.IList getProgramList()
    {

        return this.Facility_programs;

    }

    public override string validate()
    {
        if (this._currentEditType == EditType.predit || this._currentEditType == EditType.create)
        {

            System.Collections.Generic.List<Facility> list = null;

            DatabaseObjectAccess doa = DataAccess.createDOA();

            list = (System.Collections.Generic.List<Facility>)doa.selectObjects(typeof(Facility),
                "@lower(facility_name) = lower('" + this._facility.facility_name.Replace("'","''") + "') or lower(address_1) = lower('" + this._facility.address_1.Replace("'","''") + "')"
                , "@facility_name");

            if (list != null && list.Count > 0)
            {
                this._currentMessage = "Entered information matches existing data, Please click below to view.";

                System.Text.StringBuilder builder = new System.Text.StringBuilder("<table>\n");

                foreach (Facility f in list)
                {
                    builder.Append("<tr>\n<td>\n<a href=\"/CTC/info/facilityview.aspx?ID=" + f.facility_id + "\" target=\"_blank\">" + f.facility_name + "</a>\n</td>\n</tr>");
                }

                builder.Append("</table>");

                this.HtmlAmendment = builder.ToString();
            }
        }

        return this._currentMessage;

    }

    public static DataTable selectAllFacilities(string username)
    {
        //return DataAccess.executeSelect(DataAccess.SQL_SELECT_ALL_FACILITIES).Tables[0];
        return DataAccess.executeSelect(DataAccess.SQL_SELECT_ALL_FACILITIES).Tables[0];
    }

    public static DataTable selectAllFacilities(string programId, string username)
    {
        return DataAccess.executeSelect(DataAccess.SQL_SELECT_ALL_FACILITIES_BY_PROGRAM.Replace("?1", programId).Replace("?2", username)).Tables[0];
    }
}
