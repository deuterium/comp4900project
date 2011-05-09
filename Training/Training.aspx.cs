using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using BCCAModel;

public partial class Training_Training : System.Web.UI.Page {
    BCCAEntities ctx = new BCCAEntities();
    public static Color FailColour = Color.Red;
    public static Color SuccessColour = Color.Green;
    public static String otherOption = "Other (specifiy)";

    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            List<String> employers = new List<String> { "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", otherOption };
            ddlEmployers.DataSource = employers;
            ddlEmployers.DataBind();

            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptNo";
            ddlDepartments.DataTextField = "deptName";
            ddlDepartments.DataBind();

            ddlPositions.Items.Insert(ddlPositions.Items.Count, "Lab Manager Sample");
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);

            populateCourses();

            lblResults.Visible = true;
        }
    }

    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            tbxEmployer.Visible = true;
        }
        else {
            tbxEmployer.Visible = false;
        }
    }

    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e) {
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            tbxPosition.Visible = true;
        }
        else {
            tbxPosition.Visible = false;
        }
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

    private void getEmployeeData() {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if (qry.Count() == 1) {
            emp = qry.FirstOrDefault();
            
            tbxId.Text = emp.empNo.ToString();

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("yyyy/MM/dd");
            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("yyyy/MM/dd");
            }
            setResultMsg(null, SuccessColour);
        } else if (qry.Count() <= 0) {
            setResultMsg("No employees with that first and last name found.", FailColour);
        } else {
            setResultMsg("There was more than one employee with that first and last name.", FailColour);
        }
    }

    protected void btnGetEmployee_Click(object sender, EventArgs e) {
        getEmployeeData();
    }

    private void setResultMsg(String msg, Color foreColour) {
        if (msg == null) {
            lblResults.Text = String.Empty;
            lblResults.Visible = false;
        }
        lblResults.Visible = true;
        lblResults.ForeColor = foreColour;
        lblResults.Text = msg;
    }
}