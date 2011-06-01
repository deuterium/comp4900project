using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tracking_DepartmentTrackerGridView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public GridView getGridView() {
        return gdvDepartmentTracker;
    }

    //protected void gdvDepartmentTracker_RowCommand(object sender, GridViewCommandEventArgs e) {
    //    // caller should handle this
    //}

    //public void setDataSource(GridView gdv) {
    //    gdvTracker.DataSource = gdv.DataSource;
    //    gdvTracker.DataBind();
    //}

    //public override object DataSource {
    //    get { return gdvTracker.DataSource; }
    //    set { gdvTracker.DataSource = value; }
    //}

    //private int GetIncidentIdFromRow(int index) {
    //    GridViewRow row = gdvTracker.Rows[index];
    //    String strIncidentNo = ((Label)row.FindControl("lblIncidentNo")).Text;
    //    int incidentNo = -1;
    //    try {
    //        incidentNo = Convert.ToInt32(strIncidentNo);
    //    }
    //    catch (FormatException ex) {
    //        ex.ToString();
    //        Popup_Overlay("An unexpected error has occured. Please refresh the page and try again.", FailColour);
    //    }
    //    return incidentNo;
    //}

    //protected void gdvTracker_RowCommand(object sender, GridViewCommandEventArgs e) {
    //    // Get the row that called the event
    //    int index = Convert.ToInt32(e.CommandArgument);
    //    // Find out which button was clicked, take appropriate action
    //    switch (e.CommandName) {
    //        case "RowViewReport":
    //            Response.Redirect("~/Reporting/ViewIncidentReport.aspx?IncidentNo=" + GetIncidentIdFromRow(index));
    //            break;
    //        case "RowViewEmployee":
    //            loadEmployee(getEmployeeFromIncidentId(GetIncidentIdFromRow(index)));
    //            break;
    //        case "RowViewCourses":
    //            loadCourses(getEmployeeFromIncidentId(GetIncidentIdFromRow(index)));
    //            break;
    //        case "RowViewLabInspections":
    //            loadLabInspections(GetIncidentIdFromRow(index + 1)); // subheader rows don't have incident numbers
    //            break;
    //        case "RowViewOfficeInspections":
    //            loadOfficeInspections(GetIncidentIdFromRow(index + 1)); // subheader rows don't have incident numbers
    //            break;
    //        default:
    //            throw new System.SystemException("Default case of switch should never be reached");
    //    }
    //}

    //private Employee getEmployeeFromIncidentId(int incidentNo) {
    //    Employee emp = ctx.Incidents
    //                    .Where(i => i.incidentNo.Equals(incidentNo))
    //                    .Select(i => i.Employee).FirstOrDefault();
    //    return emp;
    //}

}