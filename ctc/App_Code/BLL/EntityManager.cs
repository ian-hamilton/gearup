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
/// Summary description for EntityManager
/// </summary>
public class EntityManager : BusinessRuleFacilityManager
{
    private Entity _entity;
    

    public Entity Entity
    {
        get { return _entity; }
        set { _entity = value; }
    }

    public EntityManager()
    {
        this._entity = new Entity();

        this._entityTypeSearchString = new string[1];
        this._entityTypeSearchString[0] = "Family";

        this.RedirectURL = "~/maintenance/addentity.aspx";
    }

    public EntityManager(string entityId)
    {

        DatabaseObjectAccess doa = DataAccess.createDOA();

        this._entity = (Entity)doa.selectObjects(typeof(Entity), "@entity_id = " + entityId, "")[0];

        doa.Dispose();

        this.CurrentEditType = EditType.edit;

        this._entityTypeSearchString = new string[1];
        this._entityTypeSearchString[0] = "Family";

        this.RedirectURL = "~/maintenance/addentity.aspx";

    }

    public System.Collections.Generic.List<Entity> selectLikeEntity(string likeString)
    {
        System.Collections.Generic.List<Entity> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity),
            "@last_name like '" + likeString + "%'", "@last_name @first_name");

        doa.Dispose();

        return returnList;
    }


    public System.Collections.Generic.List<Entity> selectLikeEntity(string likeString, string userName)
    {
        System.Collections.Generic.List<Entity> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        //returnList = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity),
        //    "@last_name like '" + likeString + "%'", "@last_name @first_name");

        returnList = (System.Collections.Generic.List<Entity>)doa.selectObjectsSQL(typeof(Entity),
            DataAccess.SQL_SELECT_ENTITY_PER_SECURITY_UNIT.Replace("?1", userName).Replace("?2", likeString));

        doa.Dispose();

        return returnList;
    }

    public System.Collections.Generic.List<Entity> selectEntity(Int64 entity_id, string userName)
    {
        System.Collections.Generic.List<Entity> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        //returnList = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity),
        //    "@last_name like '" + likeString + "%'", "@last_name @first_name");

        returnList = (System.Collections.Generic.List<Entity>)doa.selectObjectsSQL(typeof(Entity),
            DataAccess.SQL_SELECT_ENTITY_PER_SECURITY_UNIT_BY_ID.Replace("?1", userName).Replace("?2", entity_id.ToString()));

        doa.Dispose();

        return returnList;
    }

    //public System.Collections.Generic.List<Entity> selectEntityInMaster(Int64 entity_id)
    //{
    //    System.Collections.Generic.List<Entity> returnList = null;

    //    DatabaseObjectAccess doa = DataAccess.createDOA();

    //    //returnList = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity),
    //    //    "@last_name like '" + likeString + "%'", "@last_name @first_name");

    //    returnList = (System.Collections.Generic.List<Entity>)doa.selectObjectsSQL(typeof(Entity),
    //        DataAccess.SQL_SELECT_ENTITY_PER_MASTER_ENTITY_BY_ID.Replace("?1", entity_id.ToString()));

    //    doa.Dispose();

    //    return returnList;
    //}

    public System.Collections.Generic.List<Entity> selectLikeEntity(string likeString, string type_id, string userName)
    {
        System.Collections.Generic.List<Entity> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        //returnList = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity),
        //    "@last_name like '" + likeString + "%'@entity_type_id = " + type_id, "@last_name @first_name");

        returnList = (System.Collections.Generic.List<Entity>)doa.selectObjectsSQL(typeof(Entity),
        DataAccess.SQL_SELECT_ENTITY_PER_SECURITY_UNIT_AND_TYPE.Replace("?1", userName).Replace("?2", likeString).Replace("?3", type_id));

        doa.Dispose();

        return returnList;
    }

    public System.Collections.Generic.List<Entity> selectLikeEntityFacilitators(string likeString)
    {
        System.Collections.Generic.List<Entity> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Entity>)doa.selectObjectsSQL(typeof(Entity),
            DataAccess.SQL_EVENT_FACILITATOR_LIKE.Replace("?last_name", likeString));

        doa.Dispose();

        return returnList;
    }

    public System.Collections.Generic.List<Entity_type> selectEntitiesByGroup(string[] groups)
    {

        System.Collections.Generic.List<Entity_type> returnList = null;

        System.Text.StringBuilder builder = new System.Text.StringBuilder("@status_flag = 1");

        string conjuction = String.Empty;

        foreach (string str in groups)
        {

            builder.Append(conjuction + "@entity_group = '" + str + "'");
            conjuction = " and ";
        }

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Entity_type>)doa.selectObjects(typeof(Entity_type),
            builder.ToString(), "entity_type_desc");

        doa.Dispose();

        return returnList;

    }

    public DataTable selectAllEthnicities()
    {
        return DataAccess.executeSelect(DataAccess.SQL_SELECT_ETHNICITY).Tables[0];
    }

    //public System.Collections.Generic.List<Entity> selectEntitiesLikeByGroup(string groupName, string likeString)
    //{
    //    System.Collections.Generic.List<Entity> returnList = null;

    //    System.Text.StringBuilder builder = new System.Text.StringBuilder("@");

    //    string conjuction = String.Empty;

    //    DatabaseObjectAccess doa = DataAccess.createDOA();

    //    foreach(Entity_type et in doa.selectObjects(typeof(Entity_type), "@lower(entity_group) = lower('"+ groupName + "')",""))
    //    {
    //        builder.Append(conjuction + " entity_type_id = " + et.entity_type_id.ToString());
    //        conjuction = " and";
    //    }
        
    //    doa.Dispose();

    //    doa = DataAccess.createDOA();

    //    returnList = (System.Collections.Generic.List<Entity>)doa.selectObjects(typeof(Entity), builder.ToString() + "@last_name like '" + , "@last_name @first_name");

    //    doa.Dispose();

    //    return returnList;
    //}

    public System.Collections.Generic.List<Entity_type> selectEntityTypes()
    {
        System.Collections.Generic.List<Entity_type> returnList = null;

        DatabaseObjectAccess doa = DataAccess.createDOA();

        returnList = (System.Collections.Generic.List<Entity_type>)doa.selectObjects(
            typeof(Entity_type), "@status_flag = 1", "entity_type_desc");

        doa.Dispose();

        return returnList;

    }

    public void addEntity(string salution, string firstName, string middleInitial, string lastName,
        string title, string entityType, string address1, string address2, string city, string state,
        string zip, string phone, string phone_mobile, string email, string gender, string ethnicity, string dob,
        string unit, string grade, int active, string userName, string entityComment, string phone_work, string fax, string phone_other)
    {

        this._entity.row_created = DateTime.Now;
        this._entity.row_created_by_user_id = userName;

        this.updateEntity(salution, firstName, middleInitial, lastName, title, entityType, address1,
            address2, city, state, zip, phone, phone_mobile, email, gender, ethnicity, dob, unit, grade, active, userName, entityComment
            ,phone_work, fax, phone_other);

        if (this._currentEditType == EditType.create) { this._currentEditType = EditType.predit; }

    }

    public void updateEntity(string salution, string firstName, string middleInitial, string lastName,
        string title, string entityType, string address1, string address2, string city, string state,
        string zip, string phone, string phone_mobile, string email, string gender, string ethnicity, string dob,
        string unit, string grade, int active, string userName, string entityComment, string phone_work, string fax, string phone_other)
    {
        this.reset();

        this._entity.salutation = salution;
        this._entity.first_name = firstName;
        this._entity.middle_initial = middleInitial;
        this._entity.last_name = lastName;
        this._entity.title = title;
        this._entity.entity_type_id = long.Parse(entityType);
        this._entity.address_1 = address1;
        this._entity.address_2 = address2;
        this._entity.city = city;
        this._entity.state = state;
        this._entity.zip = zip;
        if (!String.IsNullOrEmpty(phone.Trim('0'))) { this._entity.phone = phone; }
        if (!String.IsNullOrEmpty(phone_mobile.Trim('0'))) { this._entity.phone_mobile = phone_mobile; }
        if (!String.IsNullOrEmpty(phone_work.Trim('0'))) { this._entity.phone_work = phone_work; }
        if (!String.IsNullOrEmpty(fax.Trim('0'))) { this._entity.fax = fax; }
        if (!String.IsNullOrEmpty(phone_other.Trim('0'))) { this._entity.phone_other = phone_other; }
        this._entity.email = email;
        this._entity.gender = gender;

        if (!String.IsNullOrEmpty(ethnicity))
            this._entity.ethnicity = int.Parse(ethnicity);
        else
            this._entity.ethnicity = 0;

        if (!String.IsNullOrEmpty(dob))
            this._entity.dob = DateTime.Parse(dob);
        else
            this._entity.dob = null;

        if (!String.IsNullOrEmpty(unit))
            this._entity.unit = int.Parse(unit);
        else
            this._entity.unit = null;

        if (!String.IsNullOrEmpty(grade))
            this._entity.grade = int.Parse(grade);
        else
            this._entity.grade = null;

        this._entity.status_flag = active;

        this._entity.row_updated = DateTime.Now; ;
        this._entity.row_updated_by_user_id = userName;

        this._entity.entity_comment = entityComment;

        
    }

    public void saveEntity()
    {
        this.CurrentMessage = validate();

        if (String.IsNullOrEmpty(this.CurrentMessage))
        {

            DatabaseObjectAccess doa = DataAccess.createDOA();

            Entity e = (Entity)doa.persistObject(this._entity);

            if (e == null)
            {
                this.CurrentMessage = doa.CurrentException.Message;
            }
            else
            {
                this._entity = e;

                this.CurrentMessage = "Entity saved successfully!";

                this._currentEditType = EditType.edit;

            }
        }

    }

    public override void addProgram(string programId, string userName)
    {
        Entity_program p = this._entity.Entity_programs.Find(delegate(Entity_program pr) { return pr.program_id == long.Parse(programId); });

        if (p != null)
        {
            p.status_flag = 1;
            p.row_updated = DateTime.Now;
            p.row_updated_by_user_id = userName;
        }
        else
        {
            p = new Entity_program();
            p.program_id = long.Parse(programId);
            p.status_flag = 1;
            p.row_created = DateTime.Now;
            p.row_updated = DateTime.Now;
            p.row_created_by_user_id = userName;
            p.row_updated_by_user_id = userName;

            this._entity.Entity_programs.Add(p);

        }
    }

    public override void removeProgram(string programId, string userName)
    {
        Entity_program p = this._entity.Entity_programs.Find(delegate(Entity_program pr) { return pr.program_id == long.Parse(programId); });

        if (p != null)
        {
            p.status_flag = 0;
            p.row_updated = DateTime.Now;
            p.row_updated_by_user_id = userName;
        }


    }

    public System.Collections.Generic.List<Entity_program> Entity_programs
    {

        get { return this._entity.Entity_programs.FindAll(delegate(Entity_program p) { return p.status_flag == 1; }); }

    }

    public System.Collections.Generic.List<Language_register_entity> Entity_languages
    {
        get { return this._entity.Language_register_entity.FindAll(delegate(Language_register_entity l) { return l.status_flag == 1; }); }
    }

    public override System.Collections.IList getProgramList()
    {
        return this.Entity_programs;
    }

    public override void addLanguage(string languageId, string userName)
    {

        Language_register_entity l = null;

        l = this._entity.Language_register_entity.Find(delegate(Language_register_entity lan) { return lan.language_id == long.Parse(languageId); });

        if (l != null)
        {            
            l.status_flag = 1;
            l.home_language_flag = 0;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }
        else
        {
            l = new Language_register_entity();
            l.language_id = long.Parse(languageId);
            l.home_language_flag =0;
            l.status_flag = 1;
            l.row_created = DateTime.Now;
            l.row_updated = DateTime.Now;
            l.row_created_by_user_id = userName;
            l.row_updated_by_user_id = userName;

            this._entity.Language_register_entity.Add(l);
        }
    }

    public override void removeLanguage(string languageId, string userName)
    {
        Language_register_entity l = this._entity.Language_register_entity.Find(delegate(Language_register_entity lan) { return lan.language_id == long.Parse(languageId); });

        if (l != null)
        {
            l.status_flag = 0;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }
    }

   

    public override System.Collections.IList getLanguageList()
    {
        return this.Entity_languages;
    }

    public override void makeHomeLanguage(string languageId, string userName)
    {
        Language_register_entity l = null;

        l = this._entity.Language_register_entity.Find(delegate(Language_register_entity lan) { return lan.home_language_flag == 1; });

        if (l != null)
        {
            l.home_language_flag = 0;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }

        l = this._entity.Language_register_entity.Find(delegate(Language_register_entity lan) { return lan.language_id == long.Parse(languageId) && lan.status_flag == 1; });

        if (l != null)
        {
            l.home_language_flag = 1;
            l.row_updated = DateTime.Now;
            l.row_updated_by_user_id = userName;
        }
    }

    public override string validate()
    {

        if (this._currentEditType == EditType.predit || this._currentEditType == EditType.create)
        {

            System.Collections.Generic.List<Entity> list = null;

            DatabaseObjectAccess doa = DataAccess.createDOA();

            list = (System.Collections.Generic.List<Entity>)doa.selectObjects(
                typeof(Entity), "@lower(last_name) = lower('" + this._entity.last_name.Replace("'","''") + "') and lower(middle_initial) = lower('" + this._entity.middle_initial + "') and lower(first_name) = lower('" + this._entity.first_name.Replace("'","''") + "') and isnull(lower(address_1), '') = lower('" + this._entity.address_1.Replace("'","''") + "')", "last_name");

            if (list != null && list.Count > 0)
            {
                this._currentMessage = "Entered information matches existing data, Please click below to view.";

                System.Text.StringBuilder builder = new System.Text.StringBuilder("<table>\n");

                foreach (Entity e in list)
                {
                    builder.Append("<tr>\n<td>\n<a href=\"/CTC/info/entityview.aspx?ID=" + e.entity_id + "\" target=\"_blank\">" + e.first_name + " " + e.last_name + "</a>\n</td>\n</tr>");
                }

                builder.Append("</table>");

                this.HtmlAmendment = builder.ToString();

            }
        }

        return this._currentMessage;

    }



    public override void addEntity(string entityId, string userName)
    {
        this._entity.parent_entity_id = Int64.Parse(entityId);
    }

    public override void removeEnity(string entityId, string userName)
    {
        this._entity.parent_entity_id = null;
    }

    public override System.Collections.IList getEntityList()
    {
        System.Collections.ArrayList list = new System.Collections.ArrayList();

        if (this._entity.parent_entity_id != null)
        {
            DatabaseObjectAccess doa = DataAccess.createDOA();

            list.Add(doa.selectObjects(typeof(Entity), "@entity_id = " + this._entity.parent_entity_id.ToString(), "")[0]);

            doa.Dispose();
        }

        return list;
    }

    public override void addFacility(string facilityId, string userName)
    {
        Entity_facility entityFacility = null;

        entityFacility = this._entity.Entity_facility.Find(delegate(Entity_facility eu) { return eu.facility_id == long.Parse(facilityId); });

        if (entityFacility != null)
        {
            entityFacility.statusFlag = 1;
            entityFacility.rowUpdated = DateTime.Now;
            entityFacility.rowUpdatedByUserId = userName;
        }
        else
        {
            entityFacility = new Entity_facility();
            entityFacility.facility_id = long.Parse(facilityId);
            entityFacility.statusFlag = 1;
            entityFacility.rowCreated = DateTime.Now;
            entityFacility.rowUpdated = DateTime.Now;
            entityFacility.rowCreatedByUserId = userName;
            entityFacility.rowUpdatedByUserId = userName;

            this._entity.Entity_facility.Add(entityFacility);

        }
    }

    public override void removeFacility(string facilityId, string userName)
    {
        Entity_facility entityFacility = null;

        entityFacility = this._entity.Entity_facility.Find(delegate(Entity_facility eu) { return eu.facility_id == Int32.Parse(facilityId); });

        if (entityFacility != null)
        {
            entityFacility.statusFlag = 0;
            entityFacility.rowUpdated = DateTime.Now;
            entityFacility.rowUpdatedByUserId = userName;
        }
    }

    public override System.Collections.IList getFacilityList()
    {
        return this._entity.Entity_facility.FindAll(delegate(Entity_facility ef) { return ef.statusFlag == 1; });
    }

    public override string whereFacilityIn()
    {
        return String.Empty;
    }
}
