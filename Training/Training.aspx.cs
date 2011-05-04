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
        List<Object> expiredCourses = new List<Object> {
            new { name = "General Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Selct", edit = "Edit", required = "[X]", status = "Expired" },
            new { name = "Safety Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[X]", status = "Expired" },
            new { name = "Training Course 1", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[ ]", status = "Expired" }
        };

        List<Object> completedCourses = new List<Object> {
            new { name = "General Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[X]", status = "Completed" },
            new { name = "Safety Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[X]", status = "Completed" },
            new { name = "Training Course 1", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[ ]", status = "Completed" }
        };

        List<Object> notCompletedCourses = new List<Object> {
            new { name = "General Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[X]", status = "Not Completed" },
            new { name = "Safety Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[X]", status = "Not Completed" },
        };

        List<Object> courseCatalog = new List<Object> {
            new { name = "General Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[ ]", status = "N/A" },
            new { name = "Safety Orientation", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[ ]", status = "N/A" },
            new { name = "Training Course 1", dateCompleted = DateTime.Now.ToString("yyyy/MM/dd"), dateExpired = DateTime.Now.AddMonths(3).ToString("yyyy/MM/dd"), select = "Select", edit = "Edit", required = "[ ]", status = "N/A" }
        };

        gdvCoursesCompleted.DataSource = completedCourses;
        gdvCoursesCompleted.DataBind();

        gdvCoursesExpired.DataSource = expiredCourses;
        gdvCoursesExpired.DataBind();

        gdvCoursesNotCompleted.DataSource = notCompletedCourses;
        gdvCoursesNotCompleted.DataBind();

        gdvCoursesCatalog.DataSource = courseCatalog;
        gdvCoursesCatalog.DataBind();
    }
}