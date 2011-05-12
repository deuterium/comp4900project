using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using BCCAModel;
using System.Text;

/// <summary>
/// Training/Default.aspx.cs
/// BCCA Cancer Research Centre
/// Safety Training Database and Website
/// Authors: BCIT COMP4900 2011
/// Chris Wood - chriswood.ca@gmail.com
/// Daisy Yuen - yuen.daisy@gmail.com
/// Kalen Wessel - kalen.wessel@gmail.com
/// Lindsay Fester - lindsay.m.fester@gmail.com
/// Michael Anderson - anderson.michael23@gmail.com
/// </summary>
public partial class Training_Training : System.Web.UI.Page {
    
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // Text colour for failure messages
    public static Color FailColour = Color.Red;
    // Text colour for success messages
    public static Color SuccessColour = Color.Green;
    // Text value of DropDowns for the other option, selecting this option causes a textbox to appear for custom data entry
    public static String otherOption = "Other (specifiy)";
    // Text value of DropDowns for the none specified option (null value in db)
    public static String noOptionSpecified = "Choose an option...";
    // List of pre-defined employers a user can select
    public static List<String> employers = new List<String> {
        noOptionSpecified, "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", otherOption
    };  

    /// <summary>
    /// Populate the Drop Down Lists (emplyoers, departments, positions).
    /// Add OtherOption to end of each Drop Down List.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            ddlEmployers.DataSource = employers;
            ddlEmployers.DataBind();

            ddlPositions.DataSource = ctx.Positions;
            ddlPositions.DataValueField = "posNo";
            ddlPositions.DataTextField = "posName";
            ddlPositions.DataBind();
            ddlPositions.Items.Insert(0, noOptionSpecified);
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);

            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptName";
            ddlDepartments.DataTextField = "deptName";
            ddlDepartments.DataBind();
            ddlDepartments.Items.Insert(0, noOptionSpecified);

            populateCourses();

            lblResults.Visible = true;
        }
    }

    /// <summary>
    /// If the Employers drop down list is changed to the other option, display the text box for data entry.
    /// If any other value is selected, hide the textbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        CheckEmployeeOption();
    }

    /// <summary>
    /// If the Positions drop down list is changed to the other option, display the text box for data entry.
    /// If any other value is selected, hide the textbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e) {
        CheckPositionOption();
    }

    /// <summary>
    /// IGNORE: this was for display purposes only and will be scrapped.
    /// </summary>
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

    /// <summary>
    /// Uses the employee's first and last name to get the rest employee's information from the database.
    /// Populates the Header form with this data.
    /// </summary>
    private void getEmployeeData() {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1)) {
            emp = qry.FirstOrDefault();
        }

        if (emp != null) {
            tbxId.Text = emp.empNo.ToString();


            var position = ctx.Positions
                           .Where(p => p.posName.Equals(emp.position))
                           .Select(p => p);

            if ((position != null) && (position.Count() == 1)) {
                ddlPositions.SelectedValue = emp.position;
            } else if (emp.position == null) {
                ddlPositions.SelectedIndex = 0;
            } else {
                ddlPositions.SelectedValue = otherOption;
                tbxPosition.Text = emp.position;
            }
            CheckPositionOption();

            if (employers.Contains(emp.employer)) {
                ddlEmployers.SelectedValue = emp.employer;
            } else if (emp.position == null) {
                ddlEmployers.SelectedIndex = 0;
            } else {
                ddlEmployers.SelectedValue = otherOption;
                tbxEmployer.Text = emp.employer;
            }
            CheckEmployeeOption();

            if (emp.supervisor == null) {
                tbxSupervisor.Text = String.Empty;
            } else {
                tbxSupervisor.Text = emp.supervisor;
            }

            // fills ddlDepartments
            var dept = ctx.Departments
                        .Where(d => d.deptNo == emp.deptNo)
                        .Select(d => d).FirstOrDefault();
            
            if (emp.deptNo == null)
            {
                ddlDepartments.SelectedIndex = 0;
            }
            else
                ddlDepartments.SelectedValue = dept.deptName.ToString();
                   

            if (tbxRoom != null) {
                if (emp.room == null)
                {
                    tbxRoom.Text = String.Empty;
                }
                else
                {
                    tbxRoom.Text = emp.room.ToString();
                }
            }
            

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("yyyy/MM/dd");
            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("yyyy/MM/dd");
            }
            setResultMsg(null, SuccessColour);

        } else if ((qry != null) && (qry.Count() <= 0)) {
            setResultMsg("No employees with that first and last name found.", FailColour);
        } else {
            setResultMsg("There was more than one employee with that first and last name.", FailColour);
        }
    }

    /// <summary>
    /// Calls getEmployeeData(), which fetches the employee from the database using the employee's first and last name
    /// then populates the rest of the form with the employee's information.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e) {
        getEmployeeData();
    }

    /// <summary>
    /// Sets and displays the result message for the header form.
    /// Using a null msg param will clear and hide the message.
    /// </summary>
    /// <param name="msg">The message to display</param>
    /// <param name="foreColour">The font colour of the message</param>
    private void setResultMsg(String msg, Color foreColour) {
        if (msg == null) {
            lblResults.Text = String.Empty;
            lblResults.Visible = false;
        }
        lblResults.Visible = true;
        lblResults.ForeColor = foreColour;
        lblResults.Text = msg;
    }

    
    private void CheckPositionOption() {
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            tbxPosition.Visible = true;
        }
        else {
            tbxPosition.Visible = false;
        }
    }

    private void CheckEmployeeOption() {
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            tbxEmployer.Visible = true;
        }
        else {
            tbxEmployer.Visible = false;
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ResetFormControlValues(this);
    }

    /// <summary>
    /// resets all controls on the form.
    /// </summary>
    /// <param name="parent"></param>
    private void ResetFormControlValues(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if (c.Controls.Count > 0)
            {
                ResetFormControlValues(c);
            }
            else
            {
                switch (c.GetType().ToString())
                {
                    case "System.Web.UI.WebControls.TextBox":
                        ((TextBox)c).Text = "";
                        break;
                    case "System.Web.UI.WebControls.CheckBox":
                        ((CheckBox)c).Checked = false;
                        break;
                    case "System.Web.UI.WebControls.RadioButton":
                        ((RadioButton)c).Checked = false;
                        break;
                    case "System.Web.UI.WebControls.DropDownList":
                        ((DropDownList)c).SelectedIndex = 0;
                        break;
                }
            }
        }
    }


    protected void btnUpdateEmployee_Click(object sender, EventArgs e)
    {
        int empNo = Convert.ToInt32(tbxId.Text);
        BCCAModel.Employee emp = ctx.Employees
                    .Select(employee => employee)
                    .Where(employee => employee.empNo == empNo)
                    .First();

        var dept = ctx.Departments
                        .Where(d => d.deptName == ddlDepartments.SelectedValue)
                        .Select(d => d.deptNo).FirstOrDefault();

        emp.lname = tbxLastName.Text;
        emp.fname = tbxFirstName.Text;
        emp.employer = (!(ddlEmployers.SelectedIndex == 0) ? ddlEmployers.SelectedValue : null);
        emp.deptNo = (!(ddlDepartments.SelectedValue == "") ? Convert.ToInt32(dept) : (int?)null);
        emp.room = (!(tbxRoom.Text == "") ? (tbxRoom.Text) : null);
        emp.startDate = Convert.ToDateTime(tbxStartDate.Text);
        emp.endDate = (!(tbxEndDate.Text == "") ? Convert.ToDateTime(tbxEndDate.Text): (DateTime?)null);
        emp.active = "y";
        emp.supervisor = (!(tbxSupervisor.Text == "") ? (tbxSupervisor.Text) : null);
        emp.position = (!(ddlPositions.SelectedIndex == 0) ? ddlPositions.SelectedValue : null);

        try
        {
            ctx.DetectChanges();
            ctx.SaveChanges();
            lblError.Text = "Employee updated";
        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + ex.Message;
        }
    }

    /// <summary>
    /// Creates a new Employee object with the specified values 
    /// from user-entered data and inserts it into the database.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreateEmployee_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            DateTime tmpStartDate = Convert.ToDateTime(tbxStartDate.Text);
            DateTime tmpEndDate = Convert.ToDateTime(tbxEndDate.Text);

            var dept = ctx.Departments
                        .Where(d => d.deptName == ddlDepartments.SelectedValue)
                        .Select(d => d.deptNo).FirstOrDefault();
            try
            {
                Employee employee = new Employee()

                {
                    fname = tbxFirstName.Text,
                    lname = tbxLastName.Text,
                    employer = (!(ddlEmployers.SelectedIndex == 0) ? ddlEmployers.SelectedValue : null),
                    deptNo = (!(ddlDepartments.SelectedValue == "") ? Convert.ToInt32(dept) : (int?)null),
                    room = (!(tbxRoom.Text == "") ? (tbxRoom.Text) : null),
                    startDate = tmpStartDate,
                    endDate = (!(tbxEndDate.Text == "") ? tmpEndDate : (DateTime?)null),
                    active = "y",
                    supervisor = (!(tbxSupervisor.Text == "") ? (tbxSupervisor.Text) : null),
                    position = (!(ddlPositions.SelectedIndex == 0) ? ddlPositions.SelectedValue : null),
                };

                ctx.AddToEmployees(employee);
                ctx.SaveChanges();
                lblError.Text = "Employee added.";
            }
            catch (Exception ex)
            {
                
                lblError.Text = ex.Message;
            }
        }
    }
}