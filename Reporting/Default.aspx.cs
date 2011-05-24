using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BCCAModel;

/// <summary>
/// Reporting/Default.aspx.cs
/// BCCA Cancer Research Centre
/// Safety Training Database and Website
/// Author: BCIT COMP4900 2011
/// Lindsay Fester - lindsay.m.fester@gmail.com
/// </summary>
public partial class Reporting_Default : System.Web.UI.Page
{
    #region Class Variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // The date format to use for displaying and converting dates
    public static String dateFormat = "M/d/yyyy";
    // The locale to use when displaying and converting dates/times
    public static CultureInfo locale = new CultureInfo("en-CA");
    // Text colour for failure messages
    public static Color FailColour = Color.Red;
    // Text colour for success messages
    public static Color SuccessColour = Color.Green;
    // Text value of DropDowns for the other option, selecting this option causes a textbox to appear for custom data entry
    public static String otherOption = "Other (specifiy)";
    // Text value of DropDowns for the none specified option (null value in db)
    public static String noOptionSpecified = "Choose an option...";
    // List of static, pre-defined employers a user can select
    public static List<String> employers = new List<String> {
        "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH"
    };
    // Set by a called method so the caller can handle the error and display the message.
    private String reportErrorMsg = String.Empty;
    #endregion class variables

    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Populates the drop down lists.
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;

        if (!IsPostBack)
        {
            addCharFilterToAllTextBoxes();
            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            PopulateReportDeptsDdl();
            pnlPop.Style.Value = "display:none;";
        }
    }

    #region Add Char Filter to All TextBox
    /// <summary>
    /// Recursively gets every control of the specified root (including root and all it's child controls).
    /// Returns the controls as an array of Control objects.
    /// </summary>
    /// <param name="root">The root control to get child controls for.</param>
    /// <returns>An array of all the child controls of root.</returns>
    public static Control[] getAllPageControls(Control root)
    {
        List<Control> list = new List<Control>();
        list.Add(root);
        if (root.HasControls())
        {
            foreach (Control control in root.Controls)
            {
                list.AddRange(getAllPageControls(control));
            }
        }
        return list.ToArray();
    }

    /// <summary>
    /// Adds a character filter to all Text Boxes on the page.
    /// Prevents users from entering the <, >, &, or # characters in Text Boxes.
    /// These characters trigger the HttpRequestValidationException that prevents script injection.
    /// Note: the JS behind the filter could be turned off, in which case, the exception will still occur.
    /// </summary>
    private void addCharFilterToAllTextBoxes()
    {
        Control[] allControls = getAllPageControls(Page);
        foreach (Control c in allControls)
        {
            TextBox tbx = c as TextBox;
            if (tbx != null)
            {
                FilteredTextBoxExtender fte = new FilteredTextBoxExtender();
                fte.FilterMode = FilterModes.InvalidChars;
                fte.InvalidChars = "<>&#";
                fte.TargetControlID = c.ID;
                tbx.Parent.Controls.Add(fte);
            }
        }
    }
    #endregion Filter TextBox

    #region Page Popup
    /// <summary>
    /// Calls the show method of the modal popup AJAX panel.
    /// Shows a confirmation page overlay with a message.
    /// </summary>
    /// <param name="msg">Message displayed on confirmation overlay</param>
    /// <param name="color">Color for the message to be</param>
    protected void Popup_Overlay(string msg, Color color)
    {
        lblPnlPop.Text = msg;
        lblPnlPop.ForeColor = color;
        pnlPop.Style.Value = "display:block;";
        mpePop.Show();
    }

    /// <summary>
    /// Clears username and password textboxes when the overlay is closed.
    /// If user is in edit user mode, the listbox is also updated.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnPnlPopClose_Click(object sender, EventArgs e)
    {
        // do nothing
    }
    #endregion

    #region Toggle Other TextBox and CheckBox
    /// <summary>
    /// Creates a toggle between a TextBox and a CheckBox.
    /// If the TextBox contains text, the CheckBox is Checked.
    /// If the TextBox is empty, the CheckBox is Unchecked.
    /// </summary>
    /// <param name="tbx">The TextBox corresponding to the CheckBox.</param>
    /// <param name="cbx">The CheckBox to check/uncheck.</param>
    private void toggleOther(TextBox tbx, CheckBox cbx)
    {
        if (!tbx.Text.Equals(String.Empty))
        {
            cbx.Checked = true;
            return;
        }
        cbx.Checked = false;
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_patient_otherSpecify_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_patient_otherSpecify, cbx_p2_patient_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_activity_otherPatientCare_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_activity_otherPatientCare, cbx_p2_activity_otherPatientCare);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_activity_otherMat_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_activity_otherMat, cbx_p2_activity_otherMat);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_activity_otherEquip_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_activity_otherEquip, cbx_p2_activity_otherEquip);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_activity_otherEquipDesc_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_activity_otherEquipDesc, cbx_p2_activity_otherEquipDesc);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_activity_other_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_activity_other, cbx_p2_activity_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_cause_other_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_cause_other, cbx_p2_cause_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_cause_aggression_other_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_cause_aggression_other, cbx_p2_cause_aggression_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_factors_otherEquip_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_factors_otherEquip, cbx_p2_factors_otherEquip);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_factors_otherEnv_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_factors_otherEnv, cbx_p2_factors_otherEnv);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_factors_otherWorkPractice_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_factors_otherWorkPractice, cbx_p2_factors_otherWorkPractice);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_factors_otherPatient_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_factors_otherPatient, cbx_p2_factors_otherPatient);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_factors_otherOrganizational_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_factors_otherOrganizational, cbx_p2_factors_otherOrganizational);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void tbx_p2_factors_otherWorker_OnTextChanged(object sender, EventArgs e)
    {
        toggleOther(tbx_p2_factors_otherWorker, cbx_p2_factors_otherWorker);
    }
    #endregion Toggle Other TextBox and CheckBox

    #region Employee Info Related
    #region Drop Down Lists
    #region Load DropDownLists
    /// <summary>
    /// Populates the employers drop down list.
    /// Uses the employers in the class variable.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulateEmployersDdl()
    {
        ddlEmployers.DataSource = employers.OrderBy(e => e.ToString());
        ddlEmployers.DataBind();
        ddlEmployers.Items.Insert(ddlEmployers.Items.Count, otherOption);
        ddlEmployers.Items.Insert(0, noOptionSpecified);
    }

    /// <summary>
    /// Populates the positions drop down list.
    /// Loads positions from the database.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulatePositionsDdl()
    {
        ddlPositions.DataSource = ctx.Positions.OrderBy(p => p.posName);
        ddlPositions.DataValueField = "posName";
        ddlPositions.DataBind();
        ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);
        ddlPositions.Items.Insert(0, noOptionSpecified);
    }

    /// <summary>
    /// Populates the departments drop down list in the employee info panel.
    /// Loads departments from the database.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulateDepartmentsDdl()
    {
        ddlDepartments.DataSource = ctx.Departments.OrderBy(d => d.deptName);
        ddlDepartments.DataValueField = "deptName";
        ddlDepartments.DataBind();
        ddlDepartments.Items.Insert(ddlDepartments.Items.Count, otherOption);
        ddlDepartments.Items.Insert(0, noOptionSpecified);
    }
    #endregion Load DropDownLists

    #region Other Option Textbox Toggle
    /// <summary>
    /// If the "Other (specify)" option is selected, shows a TextBox.
    /// Hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckDdlSelection(ddlPositions, tbxPosition);
    }

    /// <summary>
    /// If the "Other (specify)" option is selected, shows a TextBox.
    /// Hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckDdlSelection(ddlEmployers, tbxEmployer);
    }

    /// <summary>
    /// If the "Other (specify)" option is selected, shows a TextBox.
    /// Hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void ddlDepartments_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckDdlSelection(ddlDepartments, tbxDepartment);
    }

    /// <summary>
    /// If the "Other (specify)" option is selected of the Drop Down List.
    /// If the other option is selected, shows the Text Box.
    /// If any other option is selected, hides the Text Box.
    /// </summary>
    private void CheckDdlSelection(DropDownList ddl, TextBox tbx)
    {
        if (ddl.SelectedValue.Equals(otherOption))
        {
            tbx.Visible = true;
        }
        else
        {
            tbx.Visible = false;
        }
    }
    #endregion Other Option Textbox Toggle
    #endregion DropDownLists

    #region Load Employee
    /// <summary>
    /// Calls getEmployeeData() to get an employee from the database and populate the form with that employee's data.
    /// Displays a pop-up with a success or fail message.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e)
    {
        // Check page
        Page.Validate("vgpEmpName");
        if (!Page.IsValid)
        {
            Popup_Overlay("Invalid input, unable to get Employee.", FailColour);
            return;
        }
        // Get Employee
        Employee result = loadEmployee();
        if (result == null)
        {
            if (reportErrorMsg == null)
            {
                reportErrorMsg = "An error has occured while getting this employee. Please try again.";
            }
            Popup_Overlay(reportErrorMsg, FailColour);
            reportErrorMsg = null;
        }
    }

    /// <summary>
    /// Assumes page is valid.
    /// Uses the employee's first and last name to get the rest of the employee's information from the database.
    /// Populates the Employee Info form with the data.
    /// </summary>
    /// <returns>Returns the employee on success, null on failure.</returns>
    private Employee loadEmployee()
    {
        // Get employee
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;
        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);
        if (qry == null || qry.Count() == 0)
        {
            reportErrorMsg = "No employee with that first and last name found. Are the first and last names in the right fields?";
            return null;
        }
        else if (qry == null || qry.Count() > 1)
        {
            reportErrorMsg = "More than one employee with that first and last name found.";
        }

        #region Populate Form
        // Populate form with employee data
        emp = qry.FirstOrDefault();

        tbxId.Text = emp.empNo.ToString();
        tbxFirstName.Text = emp.fname.ToString();
        tbxLastName.Text = emp.lname.ToString();

        // Position DDL
        var position = ctx.Positions
                        .Where(p => p.posName.Equals(emp.position))
                        .Select(p => p).FirstOrDefault();

        if (emp.position == null)
        {
            ddlPositions.SelectedIndex = 0;
        }
        else if (position != null)
        {
            ddlPositions.SelectedValue = position.posName;
        }
        else
        {
            ddlPositions.SelectedValue = otherOption;
            tbxPosition.Text = emp.position;
        }
        CheckDdlSelection(ddlPositions, tbxPosition);

        // Employer DDL
        if (emp.employer == null)
        {
            ddlEmployers.SelectedIndex = 0;
        }
        else if (employers.Contains(emp.employer))
        {
            ddlEmployers.SelectedValue = emp.employer;
        }
        else
        {
            ddlEmployers.SelectedValue = otherOption;
            tbxEmployer.Text = emp.employer;
        }
        CheckDdlSelection(ddlEmployers, tbxEmployer);

        // Department DDL
        var department = ctx.Departments
                        .Where(d => d.deptName.Equals(emp.deptName))
                        .Select(d => d).FirstOrDefault();

        if (emp.deptName == null)
        {
            ddlDepartments.SelectedIndex = 0;
        }
        else if (department != null)
        {
            ddlDepartments.SelectedValue = department.deptName;
        }
        else
        {
            ddlDepartments.SelectedValue = otherOption;
            tbxDepartment.Text = emp.deptName;
        }
        CheckDdlSelection(ddlDepartments, tbxDepartment);

        if (emp.supervisor == null)
        {
            tbxSupervisor.Text = String.Empty;
        }
        else
        {
            tbxSupervisor.Text = emp.supervisor;
        }

        tbxRoom.Text = emp.room;

        if (emp.startDate != null)
        {
            tbxStartDate.Text = emp.startDate.ToString(dateFormat, locale);
        }

        if (emp.endDate != null)
        {
            tbxEndDate.Text = ((DateTime)emp.endDate).ToString(dateFormat, locale);
        }
        #endregion Populate Form

        return emp;
    }
    #endregion LoadEmployeeData

    #region Create Employee
    /// <summary>
    /// Gets the employee's start and end dates from the form.
    /// If one or both dates are null, validates true (nothing to compare).
    /// If both dates are specified, compares them as dates, and validates 
    /// false if the end date is before the start date.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The event properties.</param>
    protected void cmvEmpDates_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        String strStartDate = tbxStartDate.Text;
        String strEndDate = tbxEndDate.Text;
        if (strStartDate == null || strStartDate.Equals(String.Empty))
        {
            args.IsValid = true;
            return;
        }
        if (strEndDate == null || strEndDate.Equals(String.Empty))
        {
            args.IsValid = true;
            return;
        }
        DateTime startDate = DateTime.ParseExact(strStartDate, dateFormat, locale);
        DateTime endDate = DateTime.ParseExact(strEndDate, dateFormat, locale);

        if (endDate.CompareTo(startDate) > 0)
        {
            args.IsValid = true;
            return;
        }
    }

    /// <summary>
    /// Calls the create Employee method, which creates and saves an Employee into the database.
    /// Displays a pop-up with a success or fail message.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnCreateEmployee_Click(object sender, EventArgs e)
    {
        // Check page
        Page.Validate("vgpAllEmpInfo");
        if (!Page.IsValid)
        {
            return;
        }
        // Create Employee
        Employee result = createEmployee();
        if (result == null)
        {
            if (reportErrorMsg == null)
            {
                reportErrorMsg = "An error has occured while creating this employee. Please try again.";
            }
            Popup_Overlay(reportErrorMsg, FailColour);
            return;
        }
        Popup_Overlay("Employee successfully created.", SuccessColour);
    }

    /// <summary>
    /// Assumes page is valid (including checking if the employee already exists).
    /// Creates a new Employee object (using the form fields).
    /// Saves the new Employee to the database.
    /// </summary>
    /// <returns>Returns the employee on success, null on failure.</returns>
    private Employee createEmployee()
    {
        Employee emp = ctx.Employees
                       .Where(et => et.fname.Equals(tbxFirstName.Text) && et.lname.Equals(tbxLastName.Text))
                       .Select(et => et).FirstOrDefault();

        if (emp != null)
        {
            reportErrorMsg = "An employee with that first and last name already exists.";
            return null;
        }

        // Create employee
        emp = new Employee
        {
            fname = tbxFirstName.Text,
            lname = tbxLastName.Text,
            room = tbxRoom.Text,
            supervisor = tbxSupervisor.Text,
        };

        #region dates
        if (!tbxStartDate.Text.Equals(String.Empty))
        {
            DateTime formStartDate = DateTime.ParseExact(tbxStartDate.Text, dateFormat, locale);
            emp.startDate = formStartDate;
        }
        if (!tbxEndDate.Text.Equals(String.Empty))
        {
            DateTime formEndDate = DateTime.ParseExact(tbxEndDate.Text, dateFormat, locale);
            emp.endDate = formEndDate;
        }
        #endregion dates

        #region position
        if (ddlPositions.SelectedValue.Equals(otherOption))
        {
            emp.position = tbxPosition.Text;
        }
        else if (ddlPositions.SelectedValue.Equals(noOptionSpecified))
        {
            emp.position = null;
        }
        else
        {
            emp.position = ddlPositions.SelectedValue;
        }
        #endregion position

        #region employer
        if (ddlEmployers.SelectedValue.Equals(otherOption))
        {
            emp.employer = tbxEmployer.Text;
        }
        else if (ddlEmployers.SelectedValue.Equals(noOptionSpecified))
        {
            emp.employer = null;
        }
        else
        {
            emp.employer = ddlEmployers.SelectedValue;
        }
        #endregion employer

        #region department
        if (ddlDepartments.SelectedValue.Equals(otherOption))
        {
            emp.deptName = tbxDepartment.Text;
        }
        else if (ddlDepartments.SelectedValue.Equals(noOptionSpecified))
        {
            emp.deptName = null;
        }
        else
        {
            emp.deptName = ddlDepartments.SelectedValue;
        }
        #endregion department

        // Save employee
        try
        {
            ctx.AddToEmployees(emp);
            ctx.SaveChanges();
            tbxId.Text = emp.empNo.ToString();
            return emp;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    #endregion Create Employee

    #region Update Employee
    /// <summary>
    /// Calls the update Employee method, which updates the employee's info in database to match the form.
    /// Displays a pop-up with a success or fail message.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnUpdateEmployee_Click(object sender, EventArgs e)
    {
        Employee result = updateEmployee();
        if (result != null)
        {
            Popup_Overlay("Employee successfully updated.", SuccessColour);
        }
        else
        {
            Popup_Overlay("An error has occured while updating this employee. Please try again.", FailColour);
        }
    }
    /// <summary>
    /// Checks if the form data is valid (includes if the first/last name is already in use).
    /// Updates the Employee object's fields.
    /// Saves the updated Employee to the database.
    /// Note: the ID cannot be changed.
    /// </summary>
    /// <returns>Returns the employee on success, null on failure.</returns>
    private Employee updateEmployee()
    {
        // Check page
        Page.Validate("vgpAllEmpInfo");
        if (!Page.IsValid)
        {
            return null;
        }

        int empId = Convert.ToInt32(tbxId.Text);

        Employee emp = ctx.Employees
                       .Where(et => et.empNo.Equals(empId))
                       .Select(et => et).FirstOrDefault();

        if (emp == null)
        {
            // Unexpected error.
            return null;
        }

        // Update employee
        if (!tbxStartDate.Text.Equals(String.Empty))
        {
            emp.startDate = DateTime.ParseExact(tbxStartDate.Text, dateFormat, locale);
        }
        if (!tbxEndDate.Text.Equals(String.Empty))
        {
            emp.endDate = DateTime.ParseExact(tbxEndDate.Text, dateFormat, locale);
        }

        emp.fname = tbxFirstName.Text;
        emp.lname = tbxLastName.Text;
        emp.room = tbxRoom.Text;
        emp.supervisor = tbxSupervisor.Text;

        #region position
        if (ddlPositions.SelectedValue.Equals(otherOption))
        {
            emp.position = tbxPosition.Text;
        }
        else if (ddlPositions.SelectedValue.Equals(noOptionSpecified))
        {
            emp.position = null;
        }
        else
        {
            emp.position = ddlPositions.SelectedValue;
        }
        #endregion position

        #region employer
        if (ddlEmployers.SelectedValue.Equals(otherOption))
        {
            emp.employer = tbxEmployer.Text;
        }
        else if (ddlEmployers.SelectedValue.Equals(noOptionSpecified))
        {
            emp.employer = null;
        }
        else
        {
            emp.employer = ddlEmployers.SelectedValue;
        }
        #endregion employer

        #region department
        if (ddlDepartments.SelectedValue.Equals(otherOption))
        {
            emp.deptName = tbxDepartment.Text;
        }
        else if (ddlDepartments.SelectedValue.Equals(noOptionSpecified))
        {
            emp.deptName = null;
        }
        else
        {
            emp.deptName = ddlDepartments.SelectedValue;
        }
        #endregion department

        // Save employee
        try
        {
            ctx.SaveChanges();
            return emp;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    #endregion Update Employee
    #endregion EmployeeInfoRelated

    #region Create New Incident Report
    /// <summary>
    /// Populates the departments drop down list in the report info panel.
    /// Loads departments from the database.
    /// Does not add the "no selection" option to the front of the list, as the field is required.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulateReportDeptsDdl()
    {
        ddlReportDepts.DataSource = ctx.Departments.OrderBy(d => d.deptName);
        ddlReportDepts.DataTextField = "deptName";
        ddlReportDepts.DataValueField = "deptNo";
        ddlReportDepts.DataBind();
        ddlReportDepts.Items.Insert(ddlReportDepts.Items.Count, "Other");
    }

    /// <summary>
    /// Calls the create report method, which creates an Incident report using the form.
    /// This method then saves that report in the database.
    /// Displays a pop-up window with a success or fail message.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnCreateReport_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Incident report = createReport();
            try
            {
                ctx.AddToIncidents(report);
                ctx.SaveChanges();
                Popup_Overlay("Report successfully created.", SuccessColour);
            }
            catch (Exception ex)
            {
                if (reportErrorMsg.Equals(String.Empty))
                {
                    reportErrorMsg = "An error has occured while creating your report. Please try again.";
                }
                Popup_Overlay(reportErrorMsg, FailColour);
                reportErrorMsg = String.Empty;
                return;
            }
        }
        else
        {
            cpeEmpInfo.ClientState = "false";
            cpeEmpInfo.Collapsed = false;
            cpeA.ClientState = "false";
            cpeA.Collapsed = false;
        }
    }

    /// <summary>
    /// Creates a new Incident report object (using the form fields) and returns that report.
    /// Does not save the report into the database.
    /// Returns the new Incident report on success, null on failure.
    /// </summary>
    /// <returns>the newly created Incident report</returns>
    private Incident createReport()
    {
        // Check page
        Page.Validate("vgpEmpName");
        Page.Validate("vpgGetEmpFromDb");
        Page.Validate("vgpPanelA");
        Page.Validate("vgpFCorrective");
        Page.Validate("vgpGRelevant");
        Page.Validate("vgpHManagers");
        if (!Page.IsValid)
        {
            reportErrorMsg = "Invalid input.";
            return null;
        }

        Employee emp = loadEmployee();
        if (emp == null)
        {
            reportErrorMsg = "Unable to find employee.";
            return null;
        }

        // Create the report
        Incident report = new Incident
        {

            #region A_IncidentInfo
            empNo = emp.empNo,
            p1_incidentDesc = convertTextBox(tbx_p1_incidentDesc),
            p1_witnessName1 = convertTextBox(tbx_p1_witnessName1),
            p1_witnessPhone1 = convertTextBox(tbx_p1_witnessPhone1),
            p1_witnessName2 = convertTextBox(tbx_p1_witnessName2),
            p1_witnessPhone2 = convertTextBox(tbx_p1_witnessPhone2),
            p1_action_report = convertCheckBox(cbx_p1_action_report),
            p1_action_firstAid = convertCheckBox(cbx_p1_action_firstAid),
            p1_action_medicalGP = convertCheckBox(cbx_p1_action_medicalGP),
            p1_action_lostTime = convertCheckBox(cbx_p1_action_lostTime),
            p1_action_medicalER = convertCheckBox(cbx_p1_action_medicalER),
            #endregion A_IncidentInfo

            #region B_NatureOfInjury
            p1_nature_no = convertCheckBox(cbx_p1_nature_no),
            p1_nature_musculoskeletal = convertCheckBox(cbx_p1_nature_musculoskeletal),
            p1_nature_bruise = convertCheckBox(cbx_p1_nature_bruise),
            p1_nature_burn = convertCheckBox(cbx_p1_nature_burn),
            p1_nature_cut = convertCheckBox(cbx_p1_nature_cut),
            p1_nature_puncture = convertCheckBox(cbx_p1_nature_puncture),
            p1_nature_skinIrritation = convertCheckBox(cbx_p1_nature_skinIrritation),
            p1_nature_skinMucous = convertCheckBox(cbx_p1_nature_skinMucous),
            p1_nature_eye = convertCheckBox(cbx_p1_nature_eye),
            p1_nature_allergic = convertCheckBox(cbx_p1_nature_allergic),
            p1_nature_psychological = convertCheckBox(cbx_p1_nature_psychological),
            p1_nature_respiratory = convertCheckBox(cbx_p1_nature_respiratory),
            #endregion B_NatureOfInjury

            #region C_AccidentInvestigation
            p2_activity_no = convertCheckBox(cbx_p2_activity_no),
            p2_activity_repositioning = convertCheckBox(cbx_p2_activity_repositioning),
            p2_activity_transferring = convertCheckBox(cbx_p2_activity_transferring),
            p2_activity_assistedWalking = convertCheckBox(cbx_p2_activity_assistedWalking),
            p2_activity_assistedFloor = convertCheckBox(cbx_p2_activity_assistedFloor),
            p2_activity_fall = convertCheckBox(cbx_p2_activity_fall),
            p2_activity_holding = convertCheckBox(cbx_p2_activity_holding),
            p2_activity_toileting = convertCheckBox(cbx_p2_activity_toileting),

            p2_patient_ceilingLift = convertCheckBox(cbx_p2_patient_ceilingLift),
            p2_patient_sitStandLift = convertCheckBox(cbx_p2_patient_sitStandLift),
            p2_patient_floorLift = convertCheckBox(cbx_p2_patient_floorLift),
            p2_patient_manualLift = convertCheckBox(cbx_p2_patient_manualLift),
            p2_patient_otherSpecify = convertTextBox(tbx_p2_patient_otherSpecify),
            p2_patient_adequateAssist = convertRadioButtonList(rbl_p2_patient_adequateAssist),

            p2_activity_washing = convertCheckBox(cbx_p2_activity_washing),
            p2_activity_dressing = convertCheckBox(cbx_p2_activity_dressing),
            p2_activity_changing = convertCheckBox(cbx_p2_activity_changing),
            p2_activity_feeding = convertCheckBox(cbx_p2_activity_feeding),
            p2_activity_prep = convertCheckBox(cbx_p2_activity_prep),
            p2_activity_dressingChanges = convertCheckBox(cbx_p2_activity_dressingChanges),
            p2_activity_otherPatientCare = convertTextBox(tbx_p2_activity_otherPatientCare),

            p2_activity_recapping = convertCheckBox(cbx_p2_activity_recapping),
            p2_activity_puncture = convertCheckBox(cbx_p2_activity_puncture),
            p2_activity_sharpsDisposal = convertCheckBox(cbx_p2_activity_sharpsDisposal),
            p2_activity_otherSharps = convertCheckBox(cbx_p2_activity_otherSharps),

            p2_activity_material = convertTextBox(tbx_p2_activity_material),
            p2_activity_lift = convertCheckBox(cbx_p2_activity_lift),
            p2_activity_push = convertCheckBox(cbx_p2_activity_push),
            p2_activity_carry = convertCheckBox(cbx_p2_activity_carry),
            p2_activity_otherMat = convertTextBox(tbx_p2_activity_otherMat),
            p2_activity_driving = convertCheckBox(cbx_p2_activity_driving),
            p2_activity_otherEquip = convertTextBox(tbx_p2_activity_otherEquip),
            p2_activity_otherEquipDesc = convertTextBox(tbx_p2_activity_otherEquipDesc),
            p2_activity_equipMain = convertCheckBox(cbx_p2_activity_equipMain),
            p2_activity_comp = convertCheckBox(cbx_p2_activity_comp),
            p2_activity_nonComp = convertCheckBox(cbx_p2_activity_nonComp),

            p2_activity_walking = convertCheckBox(cbx_p2_activity_walking),
            p2_activity_bending = convertCheckBox(cbx_p2_activity_bending),
            p2_activity_reading = convertCheckBox(cbx_p2_activity_reading),
            p2_activity_spill = convertCheckBox(cbx_p2_activity_spill),
            p2_activity_cleaning = convertCheckBox(cbx_p2_activity_cleaning),
            p2_activity_other = convertTextBox(tbx_p2_activity_other),
            #endregion C_AccidentInvestigation

            #region D_Cause
            p2_cause_human = convertCheckBox(cbx_p2_cause_human),
            p2_cause_animal = convertCheckBox(cbx_p2_cause_animal),

            p2_cause_needle = convertCheckBox(cbx_p2_cause_needle),
            p2_cause_otherSharps = convertCheckBox(cbx_p2_cause_otherSharps),
            p2_cause_skin = convertCheckBox(cbx_p2_cause_skin),

            p2_cause_awkwardPosture = convertCheckBox(cbx_p2_cause_awkwardPosture),
            p2_cause_staticPosture = convertCheckBox(cbx_p2_cause_staticPosture),
            p2_cause_contactStress = convertCheckBox(cbx_p2_cause_contactStress),
            p2_cause_force = convertCheckBox(cbx_p2_cause_force),
            p2_cause_rep = convertCheckBox(cbx_p2_cause_rep),

            p2_cause_motor = convertCheckBox(cbx_p2_cause_motor),
            p2_cause_slip = convertCheckBox(cbx_p2_cause_slip),
            p2_cause_aggression = convertCheckBox(cbx_p2_cause_aggression),
            p2_cause_undetermined = convertCheckBox(cbx_p2_cause_undetermined),
            p2_cause_event = convertCheckBox(cbx_p2_cause_event),
            p2_cause_underEquip = convertCheckBox(cbx_p2_cause_underEquip),
            p2_cause_hit = convertCheckBox(cbx_p2_cause_hit),
            p2_cause_other = convertTextBox(tbx_p2_cause_other),

            p2_aggression_verbal = convertCheckBox(cbx_p2_cause_aggression_verbal),
            p2_aggression_biting = convertCheckBox(cbx_p2_cause_aggression_biting),
            p2_aggression_hitting = convertCheckBox(cbx_p2_cause_aggression_hitting),
            p2_aggression_squeezing = convertCheckBox(cbx_p2_cause_aggression_squeezing),
            p2_aggression_assault = convertCheckBox(cbx_p2_cause_aggression_assault),
            p2_aggression_patient = convertCheckBox(cbx_p2_cause_aggression_patient),
            p2_aggression_family = convertCheckBox(cbx_p2_cause_aggression_family),
            p2_aggression_public = convertCheckBox(cbx_p2_cause_aggression_public),
            p2_aggression_worker = convertCheckBox(cbx_p2_cause_aggression_worker),
            p2_aggression_other = convertTextBox(tbx_p2_cause_aggression_other),
            p2_cause_exposure_chemName = convertTextBox(tbx_p2_cause_exposure_chemName),
            p2_cause_chemInhalation = convertCheckBox(cbx_p2_cause_chemInhalation),
            p2_cause_chemIngest = convertCheckBox(cbx_p2_cause_chemIngest),
            p2_cause_chemContact = convertCheckBox(cbx_p2_cause_chemContact),
            p2_cause_latex = convertCheckBox(cbx_p2_cause_latex),
            p2_cause_dust = convertCheckBox(cbx_p2_cause_dust),
            p2_cause_disease = convertCheckBox(cbx_p2_cause_disease),
            p2_cause_temp = convertCheckBox(cbx_p2_cause_temp),
            p2_cause_noise = convertCheckBox(cbx_p2_cause_noise),
            p2_cause_radiation = convertCheckBox(cbx_p2_cause_radiation),
            p2_cause_elec = convertCheckBox(cbx_p2_cause_elec),
            p2_cause_air = convertCheckBox(cbx_p2_cause_air),
            #endregion D_Cause

            #region E_ContributingFactors
            p2_factors_malfunction = convertCheckBox(cbx_p2_factors_malfunction),
            p2_factors_improperUse = convertCheckBox(cbx_p2_factors_improperUse),
            p2_factors_signage = convertCheckBox(cbx_p2_factors_signage),
            p2_factors_notAvailable = convertCheckBox(cbx_p2_factors_notAvailable),
            p2_factors_poorDesign = convertCheckBox(cbx_p2_factors_poorDesign),
            p2_factors_otherEquip = convertTextBox(tbx_p2_factors_otherEquip),

            p2_factors_temp = convertCheckBox(cbx_p2_factors_temp),
            p2_factors_workplace = convertCheckBox(cbx_p2_factors_workplace),
            p2_factors_layout = convertCheckBox(cbx_p2_factors_layout),
            p2_factors_limitedWorkspace = convertCheckBox(cbx_p2_factors_limitedWorkspace),
            p2_factors_slippery = convertCheckBox(cbx_p2_factors_slippery),
            p2_factors_lighting = convertCheckBox(cbx_p2_factors_lighting),
            p2_factors_noise = convertCheckBox(cbx_p2_factors_noise),
            p2_factors_vent = convertCheckBox(cbx_p2_factors_vent),
            p2_factors_storage = convertCheckBox(cbx_p2_factors_storage),
            p2_factors_otherEnv = convertTextBox(tbx_p2_factors_otherEnv),

            p2_factors_assessment = convertCheckBox(cbx_p2_factors_assessment),
            p2_factors_procedure = convertCheckBox(cbx_p2_factors_procedure),
            p2_factors_appropriateEquip = convertCheckBox(cbx_p2_factors_appropriateEquip),
            p2_factors_conduct = convertCheckBox(cbx_p2_factors_conduct),
            p2_factors_extended = convertCheckBox(cbx_p2_factors_extended),
            p2_factors_comm = convertCheckBox(cbx_p2_factors_comm),
            p2_factors_unaccustomed = convertCheckBox(cbx_p2_factors_unaccustomed),
            p2_factors_otherWorkPractice = convertTextBox(tbx_p2_factors_otherWorkPractice),

            p2_factors_directions = convertCheckBox(cbx_p2_factors_directions),
            p2_factors_weight = convertCheckBox(cbx_p2_factors_weight),
            p2_factors_aggressive = convertCheckBox(cbx_p2_factors_aggressive),
            p2_factors_patientResistive = convertCheckBox(cbx_p2_factors_patientResistive),
            p2_factors_movement = convertCheckBox(cbx_p2_factors_movement),
            p2_factors_confused = convertCheckBox(cbx_p2_factors_confused),
            p2_factors_influence = convertCheckBox(cbx_p2_factors_influence),
            p2_factors_lang = convertCheckBox(cbx_p2_factors_lang),
            p2_factors_otherPatient = convertTextBox(tbx_p2_factors_otherPatient),

            p2_factors_alone = convertCheckBox(cbx_p2_factors_alone),
            p2_factors_info = convertCheckBox(cbx_p2_factors_info),
            p2_factors_scheduling = convertCheckBox(cbx_p2_factors_scheduling),
            p2_factors_training = convertCheckBox(cbx_p2_factors_training),
            p2_factors_equip = convertCheckBox(cbx_p2_factors_equip),
            p2_factors_personal = convertCheckBox(cbx_p2_factors_personal),
            p2_factors_safe = convertCheckBox(cbx_p2_factors_safe),
            p2_factors_perceived = convertCheckBox(cbx_p2_factors_perceived),
            p2_factors_otherOrganizational = convertTextBox(tbx_p2_factors_otherOrganizational),

            p2_factors_inexperienced = convertCheckBox(cbx_p2_factors_inexperienced),
            p2_factors_communication = convertCheckBox(cbx_p2_factors_communication),
            p2_factors_fatigued = convertCheckBox(cbx_p2_factors_fatigued),
            p2_factors_distracted = convertCheckBox(cbx_p2_factors_distracted),
            p2_factors_preexisting = convertCheckBox(cbx_p2_factors_preexisting),
            p2_factors_sick = convertCheckBox(cbx_p2_factors_sick),
            p2_factors_otherWorker = convertTextBox(tbx_p2_factors_otherWorker),
            #endregion E_ContributingFactors

            followUpStatus = "0",
            reportSubmitter = Session["AuthenticatedUser"].ToString(),

        };

        // Continue creating the report
        if ((Session["DeptNo"] == null) || Session["DeptNo"].Equals(String.Empty))
        {    // for admin account
            report.submitterDeptNo = null;
        }
        else
        {
            report.submitterDeptNo = Convert.ToInt32(Session["DeptNo"]);
        }

        #region Report Info Dates and Department
        #region Dates
        String strDateOfIncident = tbx_p1_dateOfIncident.Text;
        String strTimeOfIncident = tbx_p1_timeOfIncident.Text;
        String strDateReported = tbx_p1_dateReported.Text;
        String strTimeReported = tbx_p1_timeReported.Text;

        if (!(strDateOfIncident.Equals(String.Empty) && strTimeOfIncident.Equals(String.Empty)))
        {
            String timeFormat = getTimeFormat(strTimeOfIncident);
            if (timeFormat == null)
            {
                reportErrorMsg = "Time of incident is invalid.";
                return null; // Error
            }
            report.p1_dateOfIncident = DateTime.ParseExact(strDateOfIncident + " " + strTimeOfIncident,
                dateFormat + " " + timeFormat, locale);
        }
        else
        {
            reportErrorMsg = "Date/time reported is required.";
            return null;
        }

        if (!(strDateReported.Equals(String.Empty) && strTimeReported.Equals(String.Empty)))
        {
            String timeFormat = getTimeFormat(strTimeReported);
            if (timeFormat == null)
            {
                reportErrorMsg = "Time reported is invalid.";
                return null; // Error
            }
            report.p1_dateReported = DateTime.ParseExact(strDateReported + " " + strTimeReported,
                dateFormat + " " + timeFormat, locale);
        }
        else
        {
            reportErrorMsg = "Date/time of incident is required.";
            return null;
        }
        #endregion Dates

        #region Department
        if (ddlReportDepts.SelectedValue.Equals("Other"))
        {
            report.deptNo = null;
        }
        else
        {
            int deptNo = Convert.ToInt32(ddlReportDepts.SelectedValue);
            report.deptNo = deptNo;
        }
        #endregion Department
        #endregion Report Info Dates and Department

        #region A_IncidentInfo_Dates
        if (!tbx_p1_action_medicalER_date.Text.Equals(String.Empty))
        {
            DateTime dateMedicalER = DateTime.ParseExact(tbx_p1_action_medicalER_date.Text, dateFormat, locale);
            report.p1_action_medicalER_date = dateMedicalER;
        }

        if (!tbx_p1_action_medicalGP_date.Text.Equals(String.Empty))
        {
            DateTime dateMedicalGP = DateTime.ParseExact(tbx_p1_action_medicalGP_date.Text, dateFormat, locale);
            report.p1_action_medicalGP_date = dateMedicalGP;
        }
        #endregion A_IncidentInfo_Dates

        #region C_AccidentInvestigation_PatientHandling
        if (!tbx_p1_numEmployeesInvolved.Text.Equals(String.Empty))
        {
            report.p1_numEmployeesInvolved = Convert.ToInt32(tbx_p1_numEmployeesInvolved.Text);
        }
        #endregion C_AccidentInvestigation_PatientHandling

        return report;
    }

    /// <summary>
    /// Converts a CheckBox into a String value that the database can accept.
    /// Returns null if the CheckBox is null.
    /// Otherwise, returns the checked value as a String ("1" for yes, "2" for no).
    /// </summary>
    /// <param name="cbx">The CheckBox to convert.</param>
    /// <returns>"1" for checked, "2" for unchecked, or Null if the CheckBox is null.</returns>
    private String convertCheckBox(CheckBox cbx)
    {
        if (cbx == null)
        {
            return null;
        }
        if (!cbx.Checked)
        {
            return "2";
        }
        return "1";
    }

    /// <summary>
    /// Converts a Radio Button List into a String value that the database can accept.
    /// If the Radio Button List is null or no value is selected, returns null.
    /// Otherwise, returns the selected value as a String.
    /// The values should be "1" for Yes, "2" for No, "3" for Unknown or N/A.
    /// </summary>
    /// <param name="rbl">The radio button list to convert.</param>
    /// <returns>String for the Radio Button List's selected value or Null for no value selected.</returns>
    private String convertRadioButtonList(RadioButtonList rbl)
    {
        if ((rbl == null) || rbl.SelectedValue.Equals(String.Empty))
        {
            return null;
        }
        else
        {
            return rbl.SelectedValue.ToString();
        }
    }

    /// <summary>
    /// Converts a Text Box into a String value that the database can accept.
    /// If the Text Box is null or empty, returns null.
    /// Otherwise, returns the text in the Text Box.
    /// </summary>
    /// <param name="tbx">The Text Box with a value to convert.</param>
    /// <returns>The Text Box's text as a String or Null for a null or empty Text Box.</returns>
    private String convertTextBox(TextBox tbx)
    {
        if (tbx == null)
        {
            return null;
        }
        else if (tbx.Text.Equals(String.Empty))
        {
            return null;
        }
        else
        {
            return tbx.Text;
        }
    }


    /// <summary>
    /// In Section A - Action Following, if the Medical Aid (GP / Clinic) checkbox is checked,
    /// then the associated date becomes required. If it's unchecked, the date is not required.
    /// </summary>
    /// <param name="sender">The control that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void cbx_p1_action_medicalGP_CheckChanged(object sender, EventArgs e)
    {
        if (cbx_p1_action_medicalGP.Checked)
        {
            rfvMedicalAidGpDate.Enabled = true;
        }
        else
        {
            rfvMedicalAidGpDate.Enabled = false;
        }
    }

    /// <summary>
    /// In Section A - Action Following, if the Medical Aid (ER) checkbox is checked,
    /// then the associated date becomes required. If it's unchecked, the date is not required.
    /// </summary>
    /// <param name="sender">The control that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void cbx_p1_action_medicalER_CheckChanged(object sender, EventArgs e)
    {
        if (cbx_p1_action_medicalER.Checked)
        {
            rfvMedicalAidErDate.Enabled = true;
        }
        else
        {
            rfvMedicalAidErDate.Enabled = false;
        }
    }

    /// <summary>
    /// Gets the time format that needs to be used to convert the String parameter, time,
    /// to a DateTime.
    /// Returns the time format for converting the string or Null if no time format found.
    /// </summary>
    /// <param name="time">The string time value with an unknown format.</param>
    /// <returns>The time format for converting the string or Null if no time format found.</returns>
    private String getTimeFormat(String time)
    {
        String timeFormat1 = "h tt"; // for 12 am to 12 PM
        String pattern1 = "^(([1-9]{1})|([01]{1}[012])){1} {1}(am|AM|pm|PM){1}$";
        String timeFormat2 = "h:mm tt"; // for 12:00 am to 12:00 PM
        String pattern2 = "^(([0]?[1-9]{1})|([1]{1}[012]{1})){1}:{1}[0-5]{1}[0-9]{1} {1}(am|AM|pm|PM){1}$";
        String timeFormat3 = "H:mm"; // for 0:00 to 23:59
        String pattern3 = "^(([0]?[1-9]{1})|([01]{1}[0-9]{1})|([2]{1}[0123])){1}:{1}[0-5]{1}[0-9]{1}$";

        if (Regex.IsMatch(time, pattern1))
        {
            return timeFormat1;
        }
        else if (Regex.IsMatch(time, pattern2))
        {
            return timeFormat2;
        }
        else if (Regex.IsMatch(time, pattern3))
        {
            return timeFormat3;
        }
        return null;
    }

    /// <summary>
    /// Checks if at least one of the Action Following checkboxes in the Incident/Acident Information
    /// section is found. Validates true if at least one is checked and validates false if none are checked.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The validate event properties.</param>
    protected void cmvActionFollowing_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = (cbx_p1_action_report.Checked
                            || cbx_p1_action_firstAid.Checked
                            || cbx_p1_action_medicalGP.Checked
                            || cbx_p1_action_lostTime.Checked
                            || cbx_p1_action_medicalER.Checked);
    }

    /// <summary>
    /// Checks if the date/time of the report is later than the date/time of the incident
    /// and if it is, validates true. Otherwise, validates false.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The validate event properties.</param>
    protected void cmvReportDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        String strDateOfIncident = tbx_p1_dateOfIncident.Text;
        String strTimeOfIncident = tbx_p1_timeOfIncident.Text;
        String strDateReported = tbx_p1_dateReported.Text;
        String strTimeReported = tbx_p1_timeReported.Text;
        DateTime dateOfIncident;
        DateTime dateReported;
        args.IsValid = false;

        // if either date/time is empty, don't bother comparing
        if (strDateOfIncident.Equals(String.Empty) || strTimeOfIncident.Equals(String.Empty))
        {
            args.IsValid = true;
            return;
        }

        if (strDateReported.Equals(String.Empty) || strTimeReported.Equals(String.Empty))
        {
            args.IsValid = true;
            return;
        }

        String timeFormat1 = getTimeFormat(strTimeOfIncident);
        if (timeFormat1 == null)
        {
            return; // Error, not valid
        }
        dateOfIncident = DateTime.ParseExact(strDateOfIncident + " " + strTimeOfIncident, dateFormat + " " + timeFormat1, locale);

        String timeFormat2 = getTimeFormat(strTimeReported);
        if (timeFormat2 == null)
        {
            return; // Error, not valid
        }
        dateReported = DateTime.ParseExact(strDateReported + " " + strTimeReported, dateFormat + " " + timeFormat2, locale);

        if (dateReported.CompareTo(dateOfIncident) < 0)
        {
            return;
        }
        args.IsValid = true;
    }
    #endregion Create New Incident Report

    #region Clear Forms
    /// <summary>
    /// Clears the Employee Information form and the Report Information form.
    /// </summary>
    /// <param name="sender">The control that triggered the event.</param>
    /// <param name="e">The event properties.</param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        clearEmployeeInfo();
        clearReport();
    }
    /// <summary>
    /// Clears the Employee Information form.
    /// </summary>
    private void clearEmployeeInfo()
    {
        tbxId.Text = String.Empty;
        tbxFirstName.Text = String.Empty;
        tbxLastName.Text = String.Empty;

        ddlPositions.SelectedIndex = 0;
        tbxPosition.Text = String.Empty;
        ddlEmployers.SelectedIndex = 0;
        CheckDdlSelection(ddlPositions, tbxPosition);
        tbxEmployer.Text = String.Empty;
        CheckDdlSelection(ddlEmployers, tbxEmployer);
        ddlDepartments.SelectedIndex = 0;
        tbxDepartment.Text = String.Empty;
        CheckDdlSelection(ddlDepartments, tbxDepartment);

        tbxSupervisor.Text = String.Empty;
        tbxRoom.Text = String.Empty;
        tbxStartDate.Text =
        tbxEndDate.Text = String.Empty;
    }

    /// <summary>
    /// Clears the entire report (panels A through E).
    /// </summary>
    private void clearReport()
    {

        #region A_IncidentInfo
        tbx_p1_dateOfIncident.Text = String.Empty;
        tbx_p1_timeOfIncident.Text = String.Empty;
        tbx_p1_dateReported.Text = String.Empty;
        tbx_p1_timeReported.Text = String.Empty;
        tbx_p1_incidentDesc.Text = String.Empty;
        ddlReportDepts.SelectedIndex = 0;
        tbx_p1_witnessName1.Text = String.Empty;
        tbx_p1_witnessPhone1.Text = String.Empty;
        tbx_p1_witnessName2.Text = String.Empty;
        tbx_p1_witnessPhone2.Text = String.Empty;
        cbx_p1_action_report.Checked = false;
        cbx_p1_action_firstAid.Checked = false;
        cbx_p1_action_medicalGP.Checked = false;
        cbx_p1_action_lostTime.Checked = false;
        cbx_p1_action_medicalER.Checked = false;
        tbx_p1_action_medicalGP_date.Text = String.Empty;
        tbx_p1_action_medicalER_date.Text = String.Empty;
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        cbx_p1_nature_no.Checked = false;
        cbx_p1_nature_musculoskeletal.Checked = false;
        cbx_p1_nature_bruise.Checked = false;
        cbx_p1_nature_burn.Checked = false;
        cbx_p1_nature_cut.Checked = false;
        cbx_p1_nature_puncture.Checked = false;
        cbx_p1_nature_skinIrritation.Checked = false;
        cbx_p1_nature_skinMucous.Checked = false;
        cbx_p1_nature_eye.Checked = false;
        cbx_p1_nature_allergic.Checked = false;
        cbx_p1_nature_psychological.Checked = false;
        cbx_p1_nature_respiratory.Checked = false;
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        cbx_p2_activity_no.Checked = false;
        cbx_p2_activity_repositioning.Checked = false;
        cbx_p2_activity_transferring.Checked = false;
        cbx_p2_activity_assistedWalking.Checked = false;
        cbx_p2_activity_assistedFloor.Checked = false;
        cbx_p2_activity_fall.Checked = false;
        cbx_p2_activity_holding.Checked = false;
        cbx_p2_activity_toileting.Checked = false;

        cbx_p2_patient_ceilingLift.Checked = false;
        cbx_p2_patient_sitStandLift.Checked = false;
        cbx_p2_patient_floorLift.Checked = false;
        cbx_p2_patient_manualLift.Checked = false;
        tbx_p2_patient_otherSpecify.Text = String.Empty;
        rbl_p2_patient_adequateAssist.SelectedValue = String.Empty;
        tbx_p1_numEmployeesInvolved.Text = String.Empty;

        cbx_p2_activity_washing.Checked = false;
        cbx_p2_activity_dressing.Checked = false;
        cbx_p2_activity_changing.Checked = false;
        cbx_p2_activity_feeding.Checked = false;
        cbx_p2_activity_prep.Checked = false;
        cbx_p2_activity_dressingChanges.Checked = false;
        tbx_p2_activity_otherPatientCare.Text = String.Empty;

        cbx_p2_activity_recapping.Checked = false;
        cbx_p2_activity_puncture.Checked = false;
        cbx_p2_activity_sharpsDisposal.Checked = false;
        cbx_p2_activity_otherSharps.Checked = false;

        tbx_p2_activity_material.Text = String.Empty;
        cbx_p2_activity_lift.Checked = false;
        cbx_p2_activity_push.Checked = false;
        cbx_p2_activity_carry.Checked = false;
        tbx_p2_activity_otherMat.Text = String.Empty;
        cbx_p2_activity_driving.Checked = false;
        tbx_p2_activity_otherEquip.Text = String.Empty;
        tbx_p2_activity_otherEquipDesc.Text = String.Empty;
        cbx_p2_activity_equipMain.Checked = false;
        cbx_p2_activity_comp.Checked = false;
        cbx_p2_activity_nonComp.Checked = false;

        cbx_p2_activity_walking.Checked = false;
        cbx_p2_activity_bending.Checked = false;
        cbx_p2_activity_reading.Checked = false;
        cbx_p2_activity_spill.Checked = false;
        cbx_p2_activity_cleaning.Checked = false;
        tbx_p2_activity_other.Text = String.Empty;
        #endregion C_AccidentInvestigation

        #region D_Cause
        cbx_p2_cause_human.Checked = false;
        cbx_p2_cause_animal.Checked = false;

        cbx_p2_cause_needle.Checked = false;
        cbx_p2_cause_otherSharps.Checked = false;
        cbx_p2_cause_skin.Checked = false;

        cbx_p2_cause_awkwardPosture.Checked = false;
        cbx_p2_cause_staticPosture.Checked = false;
        cbx_p2_cause_contactStress.Checked = false;
        cbx_p2_cause_force.Checked = false;
        cbx_p2_cause_rep.Checked = false;

        cbx_p2_cause_motor.Checked = false;
        cbx_p2_cause_slip.Checked = false;
        cbx_p2_cause_aggression.Checked = false;
        cbx_p2_cause_undetermined.Checked = false;
        cbx_p2_cause_event.Checked = false;
        cbx_p2_cause_underEquip.Checked = false;
        cbx_p2_cause_hit.Checked = false;
        tbx_p2_cause_other.Text = String.Empty;

        cbx_p2_cause_aggression_verbal.Checked = false;
        cbx_p2_cause_aggression_biting.Checked = false;
        cbx_p2_cause_aggression_hitting.Checked = false;
        cbx_p2_cause_aggression_squeezing.Checked = false;
        cbx_p2_cause_aggression_assault.Checked = false;
        cbx_p2_cause_aggression_patient.Checked = false;
        cbx_p2_cause_aggression_family.Checked = false;
        cbx_p2_cause_aggression_public.Checked = false;
        cbx_p2_cause_aggression_worker.Checked = false;
        tbx_p2_cause_aggression_other.Text = String.Empty;

        tbx_p2_cause_exposure_chemName.Text = String.Empty;
        cbx_p2_cause_chemInhalation.Checked = false;
        cbx_p2_cause_chemIngest.Checked = false;
        cbx_p2_cause_chemContact.Checked = false;
        cbx_p2_cause_latex.Checked = false;
        cbx_p2_cause_dust.Checked = false;
        cbx_p2_cause_disease.Checked = false;
        cbx_p2_cause_temp.Checked = false;
        cbx_p2_cause_noise.Checked = false;
        cbx_p2_cause_radiation.Checked = false;
        cbx_p2_cause_elec.Checked = false;
        cbx_p2_cause_air.Checked = false;
        #endregion D_Cause

        #region E_ContributingFactors
        cbx_p2_factors_malfunction.Checked = false;
        cbx_p2_factors_improperUse.Checked = false;
        cbx_p2_factors_signage.Checked = false;
        cbx_p2_factors_notAvailable.Checked = false;
        cbx_p2_factors_poorDesign.Checked = false;
        tbx_p2_factors_otherEquip.Text = String.Empty;

        cbx_p2_factors_temp.Checked = false;
        cbx_p2_factors_workplace.Checked = false;
        cbx_p2_factors_layout.Checked = false;
        cbx_p2_factors_limitedWorkspace.Checked = false;
        cbx_p2_factors_slippery.Checked = false;
        cbx_p2_factors_lighting.Checked = false;
        cbx_p2_factors_noise.Checked = false;
        cbx_p2_factors_vent.Checked = false;
        cbx_p2_factors_storage.Checked = false;
        tbx_p2_factors_otherEnv.Text = String.Empty;

        cbx_p2_factors_assessment.Checked = false;
        cbx_p2_factors_procedure.Checked = false;
        cbx_p2_factors_appropriateEquip.Checked = false;
        cbx_p2_factors_conduct.Checked = false;
        cbx_p2_factors_extended.Checked = false;
        cbx_p2_factors_comm.Checked = false;
        cbx_p2_factors_unaccustomed.Checked = false;
        tbx_p2_factors_otherWorkPractice.Text = String.Empty;

        cbx_p2_factors_directions.Checked = false;
        cbx_p2_factors_weight.Checked = false;
        cbx_p2_factors_aggressive.Checked = false;
        cbx_p2_factors_patientResistive.Checked = false;
        cbx_p2_factors_movement.Checked = false;
        cbx_p2_factors_confused.Checked = false;
        cbx_p2_factors_influence.Checked = false;
        cbx_p2_factors_lang.Checked = false;
        tbx_p2_factors_otherPatient.Text = String.Empty;

        cbx_p2_factors_alone.Checked = false;
        cbx_p2_factors_info.Checked = false;
        cbx_p2_factors_scheduling.Checked = false;
        cbx_p2_factors_training.Checked = false;
        cbx_p2_factors_equip.Checked = false;
        cbx_p2_factors_personal.Checked = false;
        cbx_p2_factors_safe.Checked = false;
        cbx_p2_factors_perceived.Checked = false;
        tbx_p2_factors_otherOrganizational.Text = String.Empty;

        cbx_p2_factors_inexperienced.Checked = false;
        cbx_p2_factors_communication.Checked = false;
        cbx_p2_factors_fatigued.Checked = false;
        cbx_p2_factors_distracted.Checked = false;
        cbx_p2_factors_preexisting.Checked = false;
        cbx_p2_factors_sick.Checked = false;
        tbx_p2_factors_otherWorker.Text = String.Empty;
        #endregion E_ContributingFactors
    }
    #endregion Clear Forms
}
