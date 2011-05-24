using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

/// <summary>
///MasterPage.master.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Kalen Wessel - kalen.wessel@gmail.com
/// </summary>
public partial class MasterPage : System.Web.UI.MasterPage
{
    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    /// <summary>
    /// If a user is logged in, show the user details panel which has their name,
    /// role, how many followups there are and shows a logout button.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthenticationHash"].ToString().Count() > 0)
        {
            divUserLoginDetails.Visible = true;
            lblUserName.Text = Session["AuthenticatedUser"].ToString();
            int roleNo = (int)Session["RoleNo"];
            string roleName = ctx.Roles.Where(r => r.roleNo == roleNo).Select(r => r.role1).First();
            switch (roleName)
            {
                case "Administrator":
                    Show_Menu(0);
                    Followup_Count(0, roleName);
                    break;
                case "Safety Officer":
                    Show_Menu(1);
                    Followup_Count(0, roleName);
                    break;
                case "Lab Manager":
                    Followup_Count(1, roleName);
                    break;
                default:
                    throw new System.SystemException("Default case of switch should never be reached");
            }
        }
    }

    /// <summary>
    /// Sets the label for number of followups depending on what Role the logged in user is.
    /// 0 - Administrator/Safety Officer - Sets total of all Reports/Inspections needing followup
    /// 1 - Lab Manager - Sets total of only Reports/Inspections needing followup from their department
    /// </summary>
    /// <param name="mode">mode to count follow ups</param>
    /// <param name="roleName">name of current user's role</param>
    protected void Followup_Count(int mode, string roleName)
    {
        switch (mode)
        {
            //Admin/Safety Officers - Counts all Followups
            case 0:
                lblFollowupNum.Text =
                    ((ctx.Incidents
                        .Where(inc => ((inc.followUpStatus == "0") || (inc.followUpStatus == "1")))
                        .Select(inc => inc.incidentNo).Count()) +
                    (ctx.LabInspections
                        .Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1")))
                        .Select(l => l.labInsNo).Count()) +
                    (ctx.OfficeInspections
                        .Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1")))
                        .Select(o => o.officeInsNo).Count())).ToString();
                lblFollowupNum.ForeColor = System.Drawing.Color.Red;
                if (!IsPostBack)
                {
                    if (roleName == "Administrator")
                        lblUserRole.Text += "an " + roleName;
                    else
                        lblUserRole.Text += "a " + roleName;
                }
                break;
            //LabManagers - Counts Followups only for their lab
            case 1:
                int userDeptNo = (int)Session["DeptNo"];
                string userDept = ctx.Departments.Where(d => d.deptNo == userDeptNo).Select(d => d.deptName).First();
                lblFollowupNum.Text =
                    ((ctx.Incidents
                        .Where(inc => (((inc.followUpStatus == "0") || (inc.followUpStatus == "1"))) && (inc.submitterDeptNo == userDeptNo))
                        .Select(inc => inc.incidentNo).Count()) +
                    (ctx.LabInspections
                        .Where(l => (((l.followUpStatus == "0") || (l.followUpStatus == "1"))) && (l.deptName == userDept))
                        .Select(l => l.labInsNo).Count()) +
                    (ctx.OfficeInspections
                        .Where(o => (((o.followUpStatus == "0") || (o.followUpStatus == "1"))) && (o.deptName == userDept))
                        .Select(o => o.officeInsNo).Count())).ToString();
                lblFollowupNum.ForeColor = System.Drawing.Color.Red;
                if (!IsPostBack)
                {
                    lblUserRole.Text += "a " + roleName;
                }
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    /// <summary>
    /// Ends user's session and clears all session variables
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void lbnLogout_Click(object sender, EventArgs e)
    {
        Session.Contents.RemoveAll();
        Session.Abandon();
        Response.Redirect("~/Default.aspx");
    }

    /// <summary>
    /// Shows the Admin or the Safety Officer Menu
    /// 0 - Admin menu, shows tracking, training and admin additionally
    /// 1 - Safety Officer menu, shows tracking and training additionally
    /// </summary>
    /// <param name="type">type of the menu to show</param>
    protected void Show_Menu(int type)
    {
        //Admin Menu
        if (type == 0)
        {
            masterMenuAdmin.Visible = true;
            masterMenuRegular.Visible = false;
        }
        //Safety Officer Menu
        else if (type == 1)
        {
            masterMenuSO.Visible = true;
            masterMenuRegular.Visible = false;
        }
    }
    protected void lbnHelp_Click(object sender, EventArgs e) {
        Response.Redirect("~/BCCRC_SafetyDatabase_UserGuide.pdf");
    }
}
