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
    //Used to pass report or inspection number to Followup.aspx
    public string followupNo { get; set; }
    //Used to determine if report or inspection on Followup.aspx
    public string followupType { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        Populate_Incidents();
        Populate_Labs();
    }

    #region Incident/Accident Followup


    /// <summary>
    /// TODO: Check who is logged in and populate that based on their role/department
    /// </summary>
    protected void Populate_Incidents()
    {
        gvwFollowupIncidents.DataSource = ctx.Incidents
            .Where(inc => ((inc.followUpStatus == "0") || (inc.followUpStatus == "1"))
                //hardcoded "person logged in department"
            && (inc.submitterDeptNo == 3))
            .Select(inc => new
            {
                incNo = inc.incidentNo,
                incDate = inc.p1_dateOfIncident,
                incEmpName = (inc.Employee.fname + " ") + inc.Employee.lname,
                incSubmitter = inc.reportSubmitter
            })
            .OrderBy(a => a.incDate);
        gvwFollowupIncidents.DataBind();
    }

    /// <summary>
    /// TODO:
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void gvwFollowupIncidents_SelectedIndexChanged(object sender, EventArgs e)
    {
        followupNo = gvwFollowupIncidents.SelectedRow.Cells[1].Text;
        followupType = "Incident";
        Server.Transfer("Followup.aspx", true);
    }
    #endregion

    #region Lab Inspection Followup
    /// <summary>
    /// TODO:
    /// </summary>
    protected void Populate_Labs()
    {
        gvwFollowupLabInspection.DataSource = ctx.LabInspections
            .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1"))
                //hardcoded "person logged in department"
            && (l.deptNo == 3))
            .Select(l => new
            {
                insNo = l.labInsNo,
                insDate = l.date,
                insLoc = (ctx.Departments
                    .Where(d => d.deptNo == l.deptNo)
                    .Select(d => d.deptName)
                    .FirstOrDefault() + " - ") + l.room,
                insMgr = l.labMgr,
                insSubmitter = l.reportSubmitter
            })
            .OrderBy(a => a.insDate);
        gvwFollowupLabInspection.DataBind();
    }

    /// <summary>
    /// TODO:
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void gvwFollowupLabInspection_SelectedIndexChanged(object sender, EventArgs e)
    {
        followupNo = gvwFollowupLabInspection.SelectedRow.Cells[1].Text;
        followupType = "Lab";
        Server.Transfer("Followup.aspx", true);
    }
    #endregion

    #region Office Inspection Followup
    /// <summary>
    /// TODO:
    /// </summary>
    protected void Populate_Offices()
    { }
    #endregion

    
}