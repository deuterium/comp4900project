using System;
using System.Linq;
using BCCAModel;

/// <summary>
///Followup/Default.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Chris Wood - chriswood.ca@gmail.com
/// </summary>
public partial class Followup_Default : System.Web.UI.Page
{

    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        Populate_Incidents();
    }

    #region Incident/Accident Followup


    /// <summary>
    /// TODO: Check who is logged in and populate that based on their role/department
    /// </summary>
    protected void Populate_Incidents()
    {
        //var q = ctx.Incidents
        //    .Where(inc => (inc.followUpStatus == "0") || (inc.followUpStatus == "1")
        //        //hardcoded "person logged in department"
        //    && (inc.deptNo == "3"))
        //    .Select(inc => new 
        //    { 
        //        incNo = inc.incidentNo,
        //        incDate = inc.p1_dateOfIncident,
        //        incEmpName = (inc.Employee.fname + " ") + inc.Employee.lname
        //    });
        //q.Count();
        //gvwFollowupIncidents.DataSource = q;
        //gvwFollowupIncidents.DataBind();
    }
    #endregion

    #region Lab Inspection Followup
    #endregion

    #region Office Inspection Followup
    #endregion
}