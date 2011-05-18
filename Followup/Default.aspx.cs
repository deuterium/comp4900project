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

    /// <summary>
    /// Checks if page view is a valid, logged in user, if not forwards to ~/Login.aspx
    /// Checks what role the valid user is in. Incident/Accident reports, lab inspections
    /// and office inspections that need followup will be populated depending on what Role 
    /// the logged in user is.
    /// Administrator/Safety Officer: All Reports/Inspections
    /// Lab Manager: Only Reports/Inspections to do with their corrseponding Deptpartment
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check User Authentication
        ASP.global_asax.Session_Authentication();
        //Gets reports based on user role
        int? userRoleNo = (int?)Session["RoleNo"];
        switch (ctx.Roles.Where(r => r.roleNo == userRoleNo).Select(r => r.role1).First())
        {
            case "Administrator":
                Populate_Incidents(0);
                Populate_Labs(0);
                Populate_Offices(0);
                break;
            case "Safety Officer":
                Populate_Incidents(0);
                Populate_Labs(0);
                Populate_Offices(0);
                break;
            case "Lab Manager":
                Populate_Incidents(1);
                Populate_Labs(1);
                Populate_Offices(1);
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    #region Incident/Accident Followup
    /// <summary>
    /// Populates all Incident/Accident Reports that need follow up into a gridview for selection.
    /// The populated reports are sorted by newest reports first.
    /// Displays a count on the summary panel before the gridview is expanded.
    /// </summary>
    /// <param name="mode">Mode to populate gridview, 0 for all needing follow up, 1 for specific department</param>
    protected void Populate_Incidents(int mode)
    {
        switch (mode)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                var qry = ctx.Incidents
                    .Where(inc => ((inc.followUpStatus == "0") || (inc.followUpStatus == "1")))
                    .Select(inc => new
                    {
                        incNo = inc.incidentNo,
                        incDate = inc.p1_dateOfIncident,
                        incEmpName = (inc.Employee.fname + " ") + inc.Employee.lname,
                        incSubmitter = inc.reportSubmitter
                    })
                    .OrderBy(a => a.incDate);
                gvwFollowupIncidents.DataSource = qry;
                lblFollowupIncicentsCount.Text = qry.Count().ToString();
                break;
            //Role: Lab Manager; Sees all corrseponding reports to their lab
            case 1:
                int? userDeptNo = (int?)Session["DeptNo"];
                var query = ctx.Incidents
                    .Where(inc => ((inc.followUpStatus == "0") || (inc.followUpStatus == "1"))
                    && (inc.submitterDeptNo == userDeptNo))
                    .Select(inc => new
                    {
                        incNo = inc.incidentNo,
                        incDate = inc.p1_dateOfIncident,
                        incEmpName = (inc.Employee.fname + " ") + inc.Employee.lname,
                        incSubmitter = inc.reportSubmitter
                    })
                    .OrderBy(a => a.incDate);
                gvwFollowupIncidents.DataSource = query;
                lblFollowupIncicentsCount.Text = query.Count().ToString();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
        gvwFollowupIncidents.DataBind();
    }

    /// <summary>
    /// When user selects a Incident/Accident Report, the report ID is saved in a page scoped
    /// variable and the Server transfers the user to Followup.aspx with the ID and "Incident"
    /// as a page mode under the PreviousPage directive.
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
    /// Populates all Lab Inspections that need follow up into a gridview for selection.
    /// The populated inspections are sorted by newest reports first.
    /// Displays a count on the summary panel before the gridview is expanded.
    /// </summary>
    /// <param name="mode">Mode to populate gridview, 0 for all needing follow up, 1 for specific department</param>
    protected void Populate_Labs(int mode)
    {
        switch (mode)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                var qry = ctx.LabInspections
                    .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1")))
                    .Select(l => new
                    {
                        insNo = l.labInsNo,
                        insDate = l.date,
                        insLoc = (l.deptName + " - ") + l.room,
                        insMgr = l.labMgr,
                        insSubmitter = l.reportSubmitter
                    })
                    .OrderBy(a => a.insDate);
                gvwFollowupLabInspection.DataSource = qry;
                lblFollowupLabInspectionCount.Text = qry.Count().ToString();
                break;
            //Role: Lab Manager; Sees all corrseponding reports to their lab
            case 1:
                int? userDeptNo = (int?)Session["DeptNo"];
                string userDept = ctx.Departments.Where(d => d.deptNo == userDeptNo).Select(d => d.deptName).First();
                var query = ctx.LabInspections
                    .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1"))
                        && (l.deptName == userDept))
                    .Select(l => new
                    {
                        insNo = l.labInsNo,
                        insDate = l.date,
                        insLoc = (l.deptName + " - ") + l.room,
                        insMgr = l.labMgr,
                        insSubmitter = l.reportSubmitter
                    })
                    .OrderBy(a => a.insDate);
                gvwFollowupLabInspection.DataSource = query;
                lblFollowupLabInspectionCount.Text = query.Count().ToString();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
        gvwFollowupLabInspection.DataBind();
    }

    /// <summary>
    /// When user selects a Lab Inspection, the inspection ID is saved in a page scoped
    /// variable and the Server transfers the user to Followup.aspx with the ID and "Lab"
    /// as a page mode under the PreviousPage directive.
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
    /// Populates all Office Inspections that need follow up into a gridview for selection.
    /// The populated inspections are sorted by newest reports first.
    /// Displays a count on the summary panel before the gridview is expanded.
    /// </summary>
    /// <param name="mode">Mode to populate gridview, 0 for all needing follow up, 1 for specific department</param>
    protected void Populate_Offices(int mode)
    {
        switch (mode)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                var qry = ctx.OfficeInspections
                    .Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1")))
                    .Select(o => new
                    {
                        insNo = o.officeInsNo,
                        insDate = o.insDate,
                        insLoc = (o.deptName + " - ") + o.area,
                        insIpt = o.inspector,
                        insSubmitter = o.reportSubmitter
                    })
                    .OrderBy(a => a.insDate);
                gvwFollowupOfficeInspection.DataSource = qry;
                lblFollowupOfficeInspectionCount.Text = qry.Count().ToString();
                break;
            //Role: Lab Manager; Sees all corrseponding reports to their lab
            case 1: 
                int? userDeptNo = (int?)Session["DeptNo"];
                string userDept = ctx.Departments.Where(d => d.deptNo == userDeptNo).Select(d => d.deptName).First();
                var query = ctx.OfficeInspections
                    .Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1"))
                        && (o.deptName == userDept))
                    .Select(o => new
                    {
                        insNo = o.officeInsNo,
                        insDate = o.insDate,
                        insLoc = (o.deptName + " - ") + o.area,
                        insIpt = o.inspector,
                        insSubmitter = o.reportSubmitter
                    })
                    .OrderBy(a => a.insDate);
                gvwFollowupOfficeInspection.DataSource = query;
                lblFollowupOfficeInspectionCount.Text = query.Count().ToString();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
        gvwFollowupOfficeInspection.DataBind();
    }

    /// <summary>
    /// When user selects a Office Inspection, the inspection ID is saved in a page scoped
    /// variable and the Server transfers the user to Followup.aspx with the ID and "Office"
    /// as a page mode under the PreviousPage directive.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void gvwFollowupOfficeInspection_SelectedIndexChanged(object sender, EventArgs e)
    {
        followupNo = gvwFollowupOfficeInspection.SelectedRow.Cells[1].Text;
        followupType = "Office";
        Server.Transfer("Followup.aspx", true);
    }
    #endregion
}
