using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tracking_DepartmentTrackerGridViews : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public GridView getIncidentsGridView() {
        return gdvIncidents;
    }

    public GridView getLabInspectionsGridView() {
        return gdvLabInspections;
    }

    public GridView getOfficeInspectionsGridView() {
        return gdvOfficeInspections;
    }

}