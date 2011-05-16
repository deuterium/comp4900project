using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Summary_Statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BCCAEntities ctx = new BCCAEntities();
        var qryLabRecords = ctx.LabInspections.Select(LI => LI).Count();
        lblLabRecords.Text = qryLabRecords.ToString();

        var qryOfficeRecords = ctx.OfficeInspections.Select(OI => OI).Count();
        lblOfficeRecords.Text = qryOfficeRecords.ToString();

        var qryCoursesRecords = ctx.TrainingCourses.Select(TC => TC).Count();
        lblTrainingCourses.Text = qryCoursesRecords.ToString();

        var qryIncidentRecords = ctx.Incidents.Select(I => I).Count();
        lblIncidents.Text = qryIncidentRecords.ToString();

        var qryDepartments = ctx.Departments.Select(D => D).Count();
        lblDepartments.Text = qryDepartments.ToString();

        var qryEmployeeRecords = ctx.Employees.Select(E => E).Count();
        lblEmployeeRecords.Text = qryEmployeeRecords.ToString();

    }
}