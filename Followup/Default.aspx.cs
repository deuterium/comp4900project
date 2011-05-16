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
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
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
    /// TODO:
    /// </summary>
    /// <param name="mode"></param>
    protected void Populate_Incidents(int mode)
    {
        switch (mode)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                gvwFollowupIncidents.DataSource = ctx.Incidents
                    .Where(inc => ((inc.followUpStatus == "0") || (inc.followUpStatus == "1")))
                    .Select(inc => new
                    {
                        incNo = inc.incidentNo,
                        incDate = inc.p1_dateOfIncident,
                        incEmpName = (inc.Employee.fname + " ") + inc.Employee.lname,
                        incSubmitter = inc.reportSubmitter
                    })
                    .OrderBy(a => a.incDate);
                break;
            //Role: Lab Manager; Sees all corrseponding reports to their lab
            case 1:
                int? userDeptNo = (int?)Session["DeptNo"];
                gvwFollowupIncidents.DataSource = ctx.Incidents
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
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
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
    /// <param name="mode"></param>
    protected void Populate_Labs(int mode)
    {
        switch (mode)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                gvwFollowupLabInspection.DataSource = ctx.LabInspections
                    .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1")))
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
                break;
            //Role: Lab Manager; Sees all corrseponding reports to their lab
            case 1:
                int? userDeptNo = (int?)Session["DeptNo"];
                gvwFollowupLabInspection.DataSource = ctx.LabInspections
                    .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1"))
                        && (l.deptNo == userDeptNo))
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
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
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
    /// <param name="mode"></param>
    protected void Populate_Offices(int mode)
    {
        switch (mode)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                gvwFollowupOfficeInspection.DataSource = ctx.OfficeInspections
                    .Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1")))
                    .Select(o => new
                    {
                        insNo = o.officeInsNo,
                        insDate = o.insDate,
                        insLoc = (ctx.Departments
                            .Where(d => d.deptNo == o.deptNo)
                            .Select(d => d.deptName)
                            .FirstOrDefault() + " - ") + o.area,
                        insIpt = o.inspector,
                        insSubmitter = o.reportSubmitter
                    })
                    .OrderBy(a => a.insDate);
                break;
            //Role: Lab Manager; Sees all corrseponding reports to their lab
            case 1:
                int? userDeptNo = (int?)Session["DeptNo"];
                gvwFollowupOfficeInspection.DataSource = ctx.OfficeInspections
                    .Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1"))
                        && (o.deptNo == userDeptNo))
                    .Select(o => new
                    {
                        insNo = o.officeInsNo,
                        insDate = o.insDate,
                        insLoc = (ctx.Departments
                            .Where(d => d.deptNo == o.deptNo)
                            .Select(d => d.deptName)
                            .FirstOrDefault() + " - ") + o.area,
                        insIpt = o.inspector,
                        insSubmitter = o.reportSubmitter
                    })
                    .OrderBy(a => a.insDate);
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
        gvwFollowupOfficeInspection.DataBind();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvwFollowupOfficeInspection_SelectedIndexChanged(object sender, EventArgs e)
    {
        followupNo = gvwFollowupOfficeInspection.SelectedRow.Cells[1].Text;
        followupType = "Office";
        Server.Transfer("Followup.aspx", true);
    }
    #endregion
}