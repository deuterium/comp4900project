﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using BCCAModel;

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
public partial class Reporting_Default : System.Web.UI.Page {

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

            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptNo";
            ddlDepartments.DataTextField = "deptName";
            ddlDepartments.DataBind();
            ddlDepartments.Items.Insert(0, noOptionSpecified);

            ddlPositions.DataSource = ctx.Positions;
            ddlPositions.DataBind();
            ddlPositions.Items.Insert(0, noOptionSpecified);
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);

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

            tbxId.Text = emp.empNo.ToString();


            var position = ctx.Positions
                           .Where(p => p.posName.Equals(emp.position))
                           .Select(p => p);

            if ((position != null) && (position.Count() == 1)) {
                ddlPositions.SelectedValue = emp.position;
            }
            else if (emp.position == null) {
                ddlPositions.SelectedIndex = 0;
            }
            else {
                ddlPositions.SelectedValue = otherOption;
                tbxPosition.Text = emp.position;
            }
            CheckPositionOption();

            if (employers.Contains(emp.employer)) {
                ddlEmployers.SelectedValue = emp.employer;
            }
            else if (emp.position == null) {
                ddlEmployers.SelectedIndex = 0;
            }
            else {
                ddlEmployers.SelectedValue = otherOption;
                tbxEmployer.Text = emp.employer;
            }
            CheckEmployeeOption();

            if (emp.supervisor == null) {
                tbxSupervisor.Text = String.Empty;
            }
            else {
                tbxSupervisor.Text = emp.supervisor;
            }

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("yyyy/MM/dd");
            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("yyyy/MM/dd");
            }
            setResultMsg(null, SuccessColour);

        }
        else if ((qry != null) && (qry.Count() <= 0)) {
            setResultMsg("No employees with that first and last name found.", FailColour);
        }
        else {
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

}