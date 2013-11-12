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
using System.Collections;
using System.Collections.Generic;
using EnterpriseNETClass;


namespace CTC.BLL
{
    /// <summary>
    /// Summary description for UserManager
    /// </summary>
    public class UserManager
    {
        public UserManager()
        { }

        public UserManager(MembershipUser user)
        { 
            this._user = user;
            this._unitList = new List<User_unit>();
            this.selectUnit();
        }

        MembershipUser _user;
        System.Collections.Generic.List<User_unit> _unitList;

        public MembershipUser User
        {
            get { return _user; }
           // set { _user = value; }
        }

        public System.Collections.Generic.List<User_unit> UnitList
        {
            get
            {
                return this._unitList.FindAll(delegate(User_unit tu) { return tu.status_flag==1; });
            }
            //set { _unitList = value; }
        }

        public System.Collections.Generic.List<Facility> selectLikeFacility(string likeString)
        {

            FacilityManager fm = new FacilityManager();

            return fm.selectLikeFacility(likeString);

        }

        public System.Collections.Generic.List<Facility> selectLikeFacilityNoNullUnits(string likeString, string ProgramId)
        {

            FacilityManager fm = new FacilityManager();

            return fm.selectLikeFacility(likeString, Int32.Parse(ProgramId)).FindAll(delegate(Facility f) { return f.unit != null; });

        }

        private void selectUnit()
        {

            DatabaseObjectAccess doa = DataAccess.createDOA();

            this._unitList = (System.Collections.Generic.List<User_unit>)doa.selectObjects(typeof(User_unit),"@username = '" + this._user.UserName + "'","unit");

            doa.Dispose();

        }

        public void addUnit(string unit, string currentUser)
        {
            DatabaseObjectAccess doa = DataAccess.createDOA();

            User_unit u = null;

            u = this._unitList.Find(delegate(User_unit tu) { return tu.unit == Int32.Parse(unit); });

            if (u != null)
            {
                u.status_flag = 1;
                u.row_updated_by_user_id = currentUser;
                u.row_updated = DateTime.Now;

                u = (User_unit)doa.persistObject(u);

                if (u == null) { throw doa.CurrentException; }
            }
            else
            {
                u = new User_unit();

                u.unit = Int32.Parse(unit);
                u.username = this._user.UserName;
                u.status_flag = 1;
                u.row_created_by_user_id = currentUser;
                u.row_updated_by_user_id = currentUser;

                u = (User_unit)doa.persistObject(u);

                if (u == null) { throw doa.CurrentException; }

                this._unitList.Add(u);
            }

            doa.Dispose();

        }

        public void removeUnit(string unit, string currentUser)
        {
            DatabaseObjectAccess doa = DataAccess.createDOA();
            User_unit u = null;

            u = this._unitList.Find(delegate(User_unit tu) { return tu.unit == Int32.Parse(unit); });
            u.status_flag = 0;
            u.row_updated_by_user_id = currentUser;

            u = (User_unit)doa.persistObject(u);

            if (u == null) { throw doa.CurrentException; }

            doa.Dispose();

        }

        public static string resetPassword(MembershipUser user)
        {

            DatabaseObjectAccess doa = DataAccess.createDOA();

            It_system_variables var = (It_system_variables)doa.selectObjects(typeof(It_system_variables), "@variable_group = 'password_reset'", "")[0];

            doa.Dispose();

            string oldPassword = user.ResetPassword();

            user.ChangePassword(oldPassword, var.variable_value);

            return "Password has been changed to: \"" + var.variable_value + "\"";

        }
       
    }

}

        

