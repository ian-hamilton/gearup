using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
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
/// Summary description for StudentManager
/// </summary>
public class StudentManager : BusinessRuleFacilityManager
{

    private Ctc_master _ctc_master;


    public Ctc_master Ctc_master
    {
        get { return _ctc_master; }
        set { _ctc_master = value; }
    }

    public StudentManager() { }

	public StudentManager(string ctc_id)
	{
        DatabaseObjectAccess doa = DataAccess.createDOA();

        this._ctc_master = (Ctc_master)doa.selectObjects(typeof(Ctc_master), "ctc_id = " + ctc_id, "")[0];

        doa.Dispose();

        this.RedirectURL = "~/maintenance/editstudent.aspx";

        this._entityTypeSearchString = new string[1];
        this._entityTypeSearchString[0] = "Family";
	}

    //public System.Collections.Generic.List<It_system_semesters> selectSemesters()
    //{
    //    System.Collections.Generic.List<It_system_semesters> returnList = null;

    //    DatabaseObjectAccess doa = DataAccess.createDOA();

    //    returnList = (System.Collections.Generic.List<It_system_semesters>)doa.selectObjects(typeof(It_system_semesters), "", "");

    //    return returnList;
    //}


    public override void addProgram(string programId, string userName)
    {
        Master_programs p = this._ctc_master.Master_programs.Find(delegate(Master_programs pr) { return pr.program_id == long.Parse(programId); });

        if (p != null)
        {
            p.status_flag = 1;
            p.row_updated = DateTime.Now;
            p.row_updated_by_user_id = userName;
        }
        else
        {
            p = new Master_programs();
            p.program_id = long.Parse(programId);
            p.status_flag = 1;
            p.row_created = DateTime.Now;
            p.row_updated = DateTime.Now;
            p.row_created_by_user_id = userName;
            p.row_updated_by_user_id = userName;

            this._ctc_master.Master_programs.Add(p);

        }
    }

    public override void removeProgram(string programId, string userName)
    {
        Master_programs p = this._ctc_master.Master_programs.Find(delegate(Master_programs pr) { return pr.program_id == long.Parse(programId); });

        if (p != null)
        {
            p.status_flag = 0;
            p.row_updated = DateTime.Now;
            p.row_updated_by_user_id = userName;
        }
    }

    public System.Collections.Generic.List<Master_programs> Master_programs
    {

        get
        {
            return this._ctc_master.Master_programs.FindAll(delegate(Master_programs mp) { return mp.status_flag == 1; });
        }

    }


    public override System.Collections.IList getProgramList()
    {
        return this.Master_programs;
    }

    public System.Collections.Generic.List<Master_entity> getResidingEntity()
    {

        return this._ctc_master.Master_entity.FindAll(delegate(Master_entity me) { return me.reside_flag == 1 && me.status_flag == 1; });
        
    }
    public System.Collections.Generic.List<Master_entity> getParentEntity()
    {

        return this._ctc_master.Master_entity.FindAll(delegate(Master_entity me) { return me.reside_flag != 1 && me.status_flag == 1; });

    }

    public System.Collections.Generic.List<Alpha_student_current> selectLikeStudents(string lName , string userName)
    {
        System.Collections.IList returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        //returnList = doa.selectObjects(typeof(Alpha_student_current), "@last_name like '" + likeString + "%'", "@last_name@first_name");

        returnList = doa.selectObjectsSQL(typeof(Alpha_student_current), DataAccess.SQL_SELECT_ALPHA_PER_SECURITY_UNIT
            .Replace("?1", userName).Replace("?2", lName));

        return (System.Collections.Generic.List<Alpha_student_current>)returnList;
    }

    public System.Collections.Generic.List<Alpha_student_current> selectStudentCtc(Int64 ctc_id, string userName)
    {

        System.Collections.IList returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        //returnList = doa.selectObjects(typeof(Alpha_student_current), "@last_name like '" + likeString + "%'", "@last_name@first_name");

        returnList = doa.selectObjectsSQL(typeof(Alpha_student_current), DataAccess.SQL_SELECT_ALPHA_PER_SECURITY_CtcId
            .Replace("?1", userName).Replace("?2", ctc_id.ToString()));

        if (doa.CurrentException != null)
            throw doa.CurrentException;

        return (System.Collections.Generic.List<Alpha_student_current>)returnList;

      }

    public System.Collections.Generic.List<Alpha_student_current> selectStudentCps(Int64 cps_id, string userName)
    {
        System.Collections.IList returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        //returnList = doa.selectObjects(typeof(Alpha_student_current), "@last_name like '" + likeString + "%'", "@last_name@first_name");

        returnList = doa.selectObjectsSQL(typeof(Alpha_student_current), DataAccess.SQL_SELECT_ALPHA_PER_SECURITY_CpsId
           .Replace("?1", userName).Replace("?2", cps_id.ToString()));

        return (System.Collections.Generic.List<Alpha_student_current>)returnList;
    }

    public override void addEntity(string entityId, string userName)
    {
        Master_entity e = null;

        int resideFlag = 0;
        
        if ( this.Method == selectMethod.reside )
        {
            resideFlag = 1;

            e = this._ctc_master.Master_entity.Find(delegate(Master_entity me) { return me.reside_flag == 1; });

            if (e != null)
            {
                e.reside_flag = 0;

                e.row_updated = DateTime.Now;
                e.row_updated_by_user_id = userName;                
            }
        }

        e = this._ctc_master.Master_entity.Find(delegate(Master_entity me) { return me.entity_id == long.Parse(entityId); });

        if (e != null)
        {
            e.status_flag = 1;

            e.row_updated = DateTime.Now;
            e.row_updated_by_user_id = userName;

            e.reside_flag = resideFlag;
        }
        else
        {
            e = new Master_entity();
            e.entity_id = long.Parse(entityId);
            e.reside_flag = resideFlag;
            e.status_flag = 1;
            e.row_created_by_user_id = userName;
            e.row_updated_by_user_id = userName;

            this._ctc_master.Master_entity.Add(e);
        }



    }

    public void updateStudent(string comment, /*string semester,*/ string userName, 
        bool parentPermission,
        bool mediaRelease,
        bool twentyFirstCentury,
        bool fasfa,
        IDictionary<long, bool> facilityDictionary//,
        //bool studentSurvey,
        //bool parentSurvey
        )
    {

        this._ctc_master.status_comment = comment;
        //if (semester.Equals("None"))
        //    this._ctc_master.start_semester = String.Empty;
        //else
        //    this._ctc_master.start_semester = semester;

        this._ctc_master.row_updated = DateTime.Now;
        this._ctc_master.row_updated_by_user_id = userName;

        this.Ctc_master.parential_permission = Convert.ToInt32(parentPermission);
        this.Ctc_master.media_release = Convert.ToInt32(mediaRelease);
        this.Ctc_master.twenty_first = Convert.ToInt32(twentyFirstCentury);
        this.Ctc_master.fafsa = Convert.ToInt32(fasfa);
        //this.Ctc_master.student_servey = Convert.ToInt32(studentSurvey);
        //this.Ctc_master.parent_survey = Convert.ToInt32(parentSurvey);

        foreach (MasterFacility masterFacility in _ctc_master.Master_facility)
        {
            if (facilityDictionary.ContainsKey(masterFacility.masterFacilityId))
            {
                bool isAccepted = facilityDictionary[masterFacility.masterFacilityId];
                masterFacility.acceptanceLetterFlag = isAccepted ? 1 : 0;
            }
        }

    }

    public void saveStudent()
    {
        DatabaseObjectAccess doa = DataAccess.createDOA();

        Ctc_master master = (Ctc_master)doa.persistObject(this._ctc_master);

        if (master == null)
        {
            this.CurrentMessage = doa.CurrentException.Message;
        }
        else
        {
            this._ctc_master = master;

            this.CurrentMessage = "Student saved successfully!";

            this._currentEditType = EditType.edit;

        }

    }

    public override void removeEnity(string entityId, string userName)
    {
        Master_entity me = this._ctc_master.Master_entity.Find(delegate(Master_entity m) { return m.entity_id == long.Parse(entityId); });

        if (me != null)
        {
            me.status_flag = 0;
            me.row_updated = DateTime.Now;
            me.row_updated_by_user_id = userName;
        }
    }

    public override System.Collections.IList getEntityList()
    {
        if (this.Method == selectMethod.reside)
        {
            return this.getResidingEntity();
        }
        else
        {
            return this.getParentEntity();
        }
    }

    public System.Collections.Generic.List<Language_register_student> Student_languages
    {
        get { return this._ctc_master.Language_register_student.FindAll(delegate(Language_register_student lrs) { return lrs.status_flag == 1; }); }
    }

    public override void addLanguage(string languageId, string userName)
    {
        Language_register_student l = null;

        l = this._ctc_master.Language_register_student.Find(delegate(Language_register_student lan) { return lan.language_id == long.Parse(languageId); });

        if (l != null)
        {
            l.status_flag = 1;
            l.home_language_flag = 0;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }
        else
        {
            l = new Language_register_student();
            l.language_id = long.Parse(languageId);
            l.home_language_flag = 0;
            l.status_flag = 1;
            l.row_created = DateTime.Now;
            l.row_updated = DateTime.Now;
            l.row_created_by_user_id = userName;
            l.row_updated_by_user_id = userName;

            this._ctc_master.Language_register_student.Add(l);
        }
    }

    public override void makeHomeLanguage(string languageId, string userName)
    {
        Language_register_student l = null;

        l = this._ctc_master.Language_register_student.Find(delegate(Language_register_student lan) { return lan.home_language_flag == 1; });

        if (l != null)
        {
            l.home_language_flag = 0;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }

        l = this._ctc_master.Language_register_student.Find(delegate(Language_register_student lan) { return lan.language_id == long.Parse(languageId); });

        if (l != null)
        {
            l.home_language_flag = 1;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }
    }

    public override void removeLanguage(string languageId, string userName)
    {
        Language_register_student l = this._ctc_master.Language_register_student.Find(delegate(Language_register_student lan) { return lan.language_id == long.Parse(languageId); });

        if (l != null)
        {
            l.status_flag = 0;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }
    }

    public override System.Collections.IList getLanguageList()
    {
        return this.Student_languages;
    }

    public override string validate()
    {
        throw new Exception("The method or operation is not implemented.");
    }


    public override void addFacility(string facilityId, string userName)
    {
        this._ctc_master.Master_facility.Add(new MasterFacility()
        {
            ctcId = _ctc_master.ctc_id.Value,
            facility_id = Int64.Parse(facilityId),
            acceptanceLetterFlag = 0,
            statusFlag = 1,
            rowCreated = DateTime.Now,
            rowUpdated = DateTime.Now,
            rowCreatedByUserId = userName,
            rowUpdatedByUserId = userName
        });

        this.saveStudent();

    }

    public override void removeFacility(string facilityId, string userName)
    {
        foreach (MasterFacility masterFacility in _ctc_master.Master_facility)
        {
            if (masterFacility.facility_id == Int64.Parse(facilityId))
                masterFacility.statusFlag = 0;
        }
    }

    public override System.Collections.IList getFacilityList()
    {
        return this._ctc_master.Master_facility.FindAll(x => x.statusFlag == 1);

    }

    public override string whereFacilityIn()
    {
        return " and facility_type_id in (4,5) ";
    }
}
