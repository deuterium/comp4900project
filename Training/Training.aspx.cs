using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Training_Training : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateCourses();
    }

    private void populateCourses() {
        //GdvCourses
        // 0 = not complete, 1 = complete, 2 = expired
        List<Object> courses = new List<Object> {
            new { status = 0, name = "General Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd") },
            new { status = 1, name = "Safety Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd") },
            new { status = 2, name = "Training Course 1", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd") }
        };

        gdvCourses.DataSource = courses;
        gdvCourses.DataBind();
    }
}