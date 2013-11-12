using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using EnterpriseNETClass;
using CTC.DAL;
using CTC.DAL.Entities;

/// <summary>
/// Summary description for ProfileManager
/// </summary>
public class ProfileManager
{

    private Int64? _eventId = null;
    private Int64? _attendanceId = null;
        
    System.Collections.Generic.List<Profile_descriptor> _profiles;
    System.Collections.Generic.List<Attendance_profile> _attendanceProfiles;

    private Questionaire_document _questionaire_document = null;

    public Questionaire_document Questionaire_document
    {
        get { return _questionaire_document; }
        set { _questionaire_document = value; }
    }

    const string s1 = "class=\"d0\"";
    const string s2 = "class=\"d1\"";

    public enum AttendanceType
    {
        NONE,
        parent,
        student,
        Estudiantes,
        volunteer,
        family,
        staff,
        facilitator
    }
  

    public ProfileManager()
    { }

    public ProfileManager(string eventId, string attendanceId, string APR, ProfileManager.AttendanceType targetType)
    {

        DatabaseObjectAccess doa = DataAccess.createDOA();

        this._profiles = (System.Collections.Generic.List<Profile_descriptor>)doa.selectObjects(
            typeof(Profile_descriptor), "@descriptor_event_type = '" + APR + "'" + "@descriptor_target_type = '" + targetType.ToString() + "'", "@descriptor_order");

        doa.Dispose();

        doa = DataAccess.createDOA();

        if (!String.IsNullOrEmpty(eventId) && String.IsNullOrEmpty(attendanceId))
        {
            this._eventId = Int64.Parse(eventId);

            this._attendanceProfiles = (System.Collections.Generic.List<Attendance_profile>)doa.selectObjects(
                typeof(Attendance_profile), "@event_id = " + eventId, "");
        }
        else if (!String.IsNullOrEmpty(eventId) && !String.IsNullOrEmpty(attendanceId))
        {
            this._eventId = Int64.Parse(eventId);
            this._attendanceId = Int64.Parse(attendanceId);

            this._attendanceProfiles = (System.Collections.Generic.List<Attendance_profile>)doa.selectObjects(
                typeof(Attendance_profile), "@event_id = " + eventId + "@event_attendance_id = " + attendanceId, "");
        }
        else
            this._attendanceProfiles = new System.Collections.Generic.List<Attendance_profile>();

    
    }

    public System.Collections.Generic.List<Profile_descriptor> getAvailableProfiles()
    {
       return _profiles.FindAll(delegate(Profile_descriptor pfd) { return pfd.status_flag == 1; }); 
    }

    public System.Collections.Generic.List<Profile_options> getAvailableProfileOptions(long profileId)
    {
        System.Collections.Generic.List<Profile_options> list = null;

        Profile_descriptor profile = this._profiles.Find(delegate(Profile_descriptor opt) { return opt.profile_descriptor_id == profileId; });

        list = profile.Options;

        list.Sort(delegate(Profile_options p1, Profile_options p2)
        {
            return p1.option_order.CompareTo(p2.option_order);
        });

        return list;
    }

    //public string htmlForm()
    //{
        


    //    StringBuilder builder = new StringBuilder("<form id=\"profileForm\"><table cellpadding=\"10\"><tr><th>Question</th><th>Options</th></tr>");

    //    foreach(Profile_descriptor pfd in this.getAvailableProfiles())
    //    {
    //        builder.Append("<tr><td>" + pfd.descriptor_display + "</td><td><select><option value=\"null\">Select...</option>");

    //        foreach (Profile_options pfo in this.getAvailableProfileOptions(pfd.profile_descriptor_id))
    //        {

    //            builder.Append("<option value =\"" + pfo.profile_option_id + "\">" + pfo.profile_option_display + "</option>");

    //        }

    //        builder.Append("</select></td></tr>");
    //    }

    //    builder.Append("<tr><td><input type=\"submit\" value=\"submit\"/></td></tr></table></form>");

    //    //return builder.ToString();
    //    return String.Empty;
    //}

    public void loadForm(PlaceHolder holder, string question, string options)
    {
        string currentClass = s2;

        int count = 1;
        ListItem li = null;
        Literal lit = null;
        ListControl dl = null;

        // cellspacing=\"0\" cellpadding=\"15\"

        lit = new Literal();
        lit.Text = "<table width=\"600\">\n<tr><td><table width=\"700\"><tr><th width=\"500\">" + question + "</th><th width=\"200\">" + options + "</th></tr></table></td></tr>";
        holder.Controls.Add(lit);

        foreach (Profile_descriptor pfd in this.getAvailableProfiles())
        {
            if (currentClass.Equals(s1))
                currentClass = s2;
            else currentClass = s1;

            Label l = new Label();

            if (pfd.multi_option_flag == 1)
            {
                dl = new CheckBoxList();
            }
            else
            {
                dl = new DropDownList();
            }
            
            lit = new Literal();
            lit.Text = "\n<tr " + currentClass + ">\n<td><table class=\"questions\"><tr><td><table width=\"700\"><tr><td width=\"500\">";
            holder.Controls.Add(lit);

            l.Text = pfd.descriptor_display;
            l.AssociatedControlID = "optionControl" + count.ToString();
            dl.ID = l.AssociatedControlID;
            holder.Controls.Add(l);

            lit = new Literal();
            lit.Text = "\n</td>\n<td width=\"200\" align=\"right\">";
            holder.Controls.Add(lit);

            if (dl.GetType() == typeof(DropDownList))
            {
                li = new ListItem("Select...", "0");
                dl.Items.Add(li);
            }

            System.Collections.Generic.List<Attendance_profile> answeredProfiles = this._attendanceProfiles.FindAll(delegate(Attendance_profile myap) { return myap.profile_descriptor_id == pfd.profile_descriptor_id && myap.status_flag == 1; });
            
            foreach (Profile_options pfo in this.getAvailableProfileOptions(pfd.profile_descriptor_id))
            {
                li = new ListItem(pfo.profile_option_display, pfd.profile_descriptor_id.ToString()+ "-" + pfo.profile_option_id.ToString());

                foreach (Attendance_profile profile in answeredProfiles)
                {
                    //dl.SelectedValue = profile.profile_descriptor_id.ToString() + "-" + profile.profile_option_id.ToString();

                    if (li.Value == profile.profile_descriptor_id.ToString() + "-" + profile.profile_option_id.ToString())
                        li.Selected = true;
                }

                dl.Items.Add(li);
            }

           

            holder.Controls.Add(dl);

            lit = new Literal();
            lit.Text = "\n</td></tr></table></td></tr></table></td>\n</tr>";
            holder.Controls.Add(lit);

            count++;
        }

        lit = new Literal();
        lit.Text = "\n</table>";
        holder.Controls.Add(lit);

    }

  

    public bool validate(PlaceHolder holder)
    {

        foreach (Control control in holder.Controls)
        {
            if (control.GetType() == typeof(DropDownList))
            {
                if (((DropDownList)(control)).SelectedValue.Equals("0"))
                    return false;
            }
        }

        return true;

    }

    public string saveProfile (PlaceHolder holder, string userName, string cps_id, string errorMessage)
    {
        string returnString = String.Empty;

        DatabaseObjectAccess doa = null;

        ListControl dlist = null;

        if (!validate(holder))
            returnString = errorMessage;//"All questions must be answered.";
        else
        {
            doa = DataAccess.createDOA();

            this.Questionaire_document = (Questionaire_document)doa.persistObject(new Questionaire_document());

            doa.Dispose();

            foreach (Control control in holder.Controls)
            {
                if (control.GetType() == typeof(DropDownList) || control.GetType() == typeof(CheckBoxList))
                {
                    dlist = (ListControl)control;

                    string[] split = dlist.SelectedValue.Split(new char[1] { '-' }, StringSplitOptions.RemoveEmptyEntries);

                    doa = DataAccess.createDOA();

                    Profile_descriptor pf = (Profile_descriptor)doa.selectObjects(typeof(Profile_descriptor), "@profile_descriptor_id = " + split[0], "")[0];

                    doa.Dispose();

                    if (pf.multi_option_flag == 1)
                    {
                        updateMulti(dlist, userName, cps_id, this.Questionaire_document.document_id);
                    }
                    else
                    {
                        updateSingle(dlist, userName, cps_id, this.Questionaire_document.document_id);
                    }

                }
            }

            returnString = String.Empty; ;
        }
              

        return returnString;

    }

    private void updateMulti(ListControl lcontrol, string userName, string cps_id, long documentId)
    {
        foreach (ListItem li in lcontrol.Items)
        {
            Int64 cps = 0;

            string[] split = li.Value.Split(new char[1] { '-' }, StringSplitOptions.RemoveEmptyEntries);

            Attendance_profile profile = this._attendanceProfiles.Find(delegate(Attendance_profile ap) { return ap.profile_descriptor_id == long.Parse(split[0]) && ap.profile_option_id == long.Parse(split[1]); });

            if (profile != null)
            {

                profile.status_flag = Convert.ToInt32(li.Selected);
                profile.row_updated = DateTime.Now;
                profile.row_updated_by_user_id = userName;
                profile.document_id = documentId;

                DatabaseObjectAccess doa = DataAccess.createDOA();

                profile = (Attendance_profile)doa.persistObject(profile);

                doa.Dispose();
            }          
            else if(li.Selected)
            {
                profile = new Attendance_profile();
                profile.event_id = this._eventId;
                profile.event_attendance_id = this._attendanceId;
                profile.profile_descriptor_id = long.Parse(split[0]);
                profile.profile_option_id = long.Parse(split[1]);
                profile.row_created_by_user_id = userName;
                profile.row_updated_by_user_id = userName;
                profile.document_id = documentId;

                if(Int64.TryParse(cps_id, out cps))
                {
                    profile.Cps_id = cps;
                }

                DatabaseObjectAccess doa = DataAccess.createDOA();

                profile = (Attendance_profile)doa.persistObject(profile);

                doa.Dispose();

                this._attendanceProfiles.Add(profile);

            }
        }//end for list items
    }

    private void updateSingle(ListControl lcontrol, string userName, string cps_id, long documentId)
    {
        Int64 cps = 0;

        string[] split = lcontrol.SelectedValue.Split(new char[1] { '-' }, StringSplitOptions.RemoveEmptyEntries);

        Attendance_profile profile = this._attendanceProfiles.Find(delegate(Attendance_profile ap) { return ap.profile_descriptor_id == long.Parse(split[0]); });

        if (profile != null)
        {
            profile.profile_option_id = long.Parse(split[1]);
            profile.row_updated = DateTime.Now;
            profile.row_updated_by_user_id = userName;
            profile.document_id = documentId;

            DatabaseObjectAccess doa = DataAccess.createDOA();

            profile = (Attendance_profile)doa.persistObject(profile);

            doa.Dispose();

        }
        else
        {
            profile = new Attendance_profile();
            profile.event_id = this._eventId;
            profile.event_attendance_id = this._attendanceId;
            profile.profile_descriptor_id = long.Parse(split[0]);
            profile.profile_option_id = long.Parse(split[1]);
            profile.row_created_by_user_id = userName;
            profile.row_updated_by_user_id = userName;
            profile.document_id = documentId;
            if (Int64.TryParse(cps_id, out cps))
            {
                profile.Cps_id = cps;
            }

            DatabaseObjectAccess doa = DataAccess.createDOA();

            profile = (Attendance_profile)doa.persistObject(profile);

            doa.Dispose();

            this._attendanceProfiles.Add(profile);

        }

    }

    

}
