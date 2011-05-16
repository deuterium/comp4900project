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
        Populate_Labs(0);
        Populate_Offices();
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
    /// <param name="mode"></param>
    protected void Populate_Labs(int mode)
    {
        switch (mode)
        {
            //Role: Safety Officer; Sees all reports
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
                gvwFollowupLabInspection.DataSource = ctx.LabInspections
                    .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1"))
                        && (l.deptNo == (int?)Session["DeptNo"]))
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
    protected void Populate_Offices()
    {
        gvwFollowupOfficeInspection.DataSource = ctx.OfficeInspections
                .Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1"))
                    //hardcoded "person logged in department"
                && (o.deptNo == null))
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
        gvwFollowupOfficeInspection.DataBind();

    }

    protected void gvwFollowupOfficeInspection_SelectedIndexChanged(object sender, EventArgs e)
    {
        followupNo = gvwFollowupOfficeInspection.SelectedRow.Cells[1].Text;
        followupType = "Office";
        Server.Transfer("Followup.aspx", true);
    }
    #endregion



}