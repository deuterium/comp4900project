using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Globalization;

/** TO DO:
 * Make clear all and clear individual form buttons
 * Make custom validators (date comparisons, Others in form and DDL)
 * test really long inputs, restrict input size in code-behind
 * style + validate schedule (last part of follow-up)
 * Check documentation
 * Add security code, restrict access to certain departments depending on user??
 * Resizeable text areas
 * Make the view incident report have labels or things that LOOK like labels
 **/

/// <summary>
/// Class:   Reporting/Reporting.aspx.cs Code-Behind
/// Project: BCIT COMP4900 2011
///          BCCA Cancer Research Centre
///          Safety Training Database and Website
/// Authors: Lindsay Fester - lindsay.m.fester@gmail.com
/// </summary>
public partial class Reporting_Default : System.Web.UI.Page {
    #region Class Variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // Text colour for failure messages
    public static Color FailColour = Color.Red;
    // Text colour for success messages
    public static Color SuccessColour = Color.Green;
    // Text value of DropDowns for the other option, selecting this option causes a textbox to appear for custom data entry
    public static String otherOption = "Other (specifiy)";
    // Text value of DropDowns for the none specified option (null value in db)
    public static String noOptionSpecified = String.Empty;
    // List of static, pre-defined employers a user can select
    public static List<String> employers = new List<String> {
        noOptionSpecified, "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH"
    };
    #endregion class variables

    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Populates the Employer, Position, and Department drop down lists.
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        // Verifiy user
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();

        // Only do the initial set up the first time the page loads (and not on post-backs).
        if (!IsPostBack) {
            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            pnlPop.Style.Value = "display:none;";
        }
        lblInvalidActionFollowing.Visible = false;
    }

    #region Toggle Other TextBox and CheckBox
    private void toggleOther(TextBox tbx, CheckBox cbx) {
        if (!tbx.Text.Equals(String.Empty)) {
            cbx.Checked = true;
            return;
        }
        cbx.Checked = false;
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_patient_otherSpecify_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_patient_otherSpecify, cbx_p2_patient_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherPatientCare_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherPatientCare, cbx_p2_activity_otherPatientCare);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherMat_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherMat, cbx_p2_activity_otherMat);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherEquip_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherEquip, cbx_p2_activity_otherEquip);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherEquipDesc_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherEquipDesc, cbx_p2_activity_otherEquipDesc);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_other_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_other, cbx_p2_activity_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_cause_other_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_cause_other, cbx_p2_cause_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_cause_aggression_other_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_cause_aggression_other, cbx_p2_cause_aggression_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherEquip_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherEquip, cbx_p2_factors_otherEquip);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherEnv_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherEnv, cbx_p2_factors_otherEnv);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherWorkPractice_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherWorkPractice, cbx_p2_factors_otherWorkPractice);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherPatient_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherPatient, cbx_p2_factors_otherPatient);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherOrganizational_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherOrganizational, cbx_p2_factors_otherOrganizational);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherWorker_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherWorker, cbx_p2_factors_otherWorker);
    }
    #endregion Toggle Other TextBox and CheckBox

    #region Employee Info Related
    #region Drop Down Lists
    #region Load DropDownLists

    /// <summary>
    /// Populates the employers drop down list.
    /// </summary>
    private void PopulateEmployersDdl() {
        ddlEmployers.DataSource = employers.OrderBy(e => e.ToString());
        ddlEmployers.DataBind();
        ddlEmployers.Items.Insert(ddlEmployers.Items.Count, otherOption);
    }

    /// <summary>
    /// Populates the positions drop down list.
    /// Loads positions from the database.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulatePositionsDdl() {
        ddlPositions.DataSource = ctx.Positions.OrderBy(p => p.posName);
        ddlPositions.DataValueField = "posName";
        ddlPositions.DataBind();
        ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);
        ddlPositions.Items.Insert(0, noOptionSpecified);
    }

    /// <summary>
    /// Populates the departments drop down list in the employee info panel and the report info panel.
    /// Loads departments from the database.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulateDepartmentsDdl() {
        // Employee Info Departments DDL
        ddlDepartments.DataSource = ctx.Departments.OrderBy(d => d.deptName);
        ddlDepartments.DataValueField = "deptName";
        ddlDepartments.DataBind();
        ddlDepartments.Items.Insert(ddlDepartments.Items.Count, otherOption);
        ddlDepartments.Items.Insert(0, noOptionSpecified);
        // Report Info Departments DDL
        ddlReportDepts.DataSource = ctx.Departments.OrderBy(d => d.deptName);
        ddlReportDepts.DataTextField = "deptName";
        ddlReportDepts.DataValueField = "deptNo";
        ddlReportDepts.DataBind();
        ddlReportDepts.Items.Insert(ddlReportDepts.Items.Count, "Other");
    }

    #endregion Load DropDownLists

    #region Other Option Textbox Toggle
    /// <summary>
    /// Calls CheckPositionSelection(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e) {
        CheckPositionSelection();
    }

    /// <summary>
    /// Calls CheckEmployeeSelection(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        CheckEmployeeSelection();
    }

    /// <summary>
    /// Calls CheckDepartmentSelection(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlDepartments_SelectedIndexChanged(object sender, EventArgs e) {
        CheckDepartmentSelection();
    }

    /// <summary>
    /// Displays a textbox if the "Other (specify)" option of the positions drop down list is selected.
    /// Hides the textbox if any other option is selected
    /// </summary>
    private void CheckPositionSelection() {
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            tbxPosition.Visible = true;
        }
        else {
            tbxPosition.Visible = false;
        }
    }

    /// <summary>
    /// Displays a textbox if the "Other (specify)" option of the employee drop down list is selected.
    /// Hides the textbox if any other option is selected
    /// </summary>
    private void CheckEmployeeSelection() {
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            tbxEmployer.Visible = true;
        }
        else {
            tbxEmployer.Visible = false;
        }
    }

    /// <summary>
    /// Displays a textbox if the "Other (specify)" option of the departments drop down list is selected.
    /// Hides the textbox if any other option is selected
    /// </summary>
    private void CheckDepartmentSelection() {
        if (ddlDepartments.SelectedValue.Equals(otherOption)) {
            tbxDepartment.Visible = true;
        }
        else {
            tbxDepartment.Visible = false;
        }
    }
    #endregion Other Option Textbox Toggle
    #endregion DropDownLists

    #region Load Employee Data
    /// <summary>
    /// Uses the employee's first and last name to get the rest employee's information from the database.
    /// Populates the Header form with this data.
    /// </summary>
    /// <returns>Returns the employee on success, null on failure.</returns>
    private Employee getEmployeeData() {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1)) {
            emp = qry.FirstOrDefault();

            tbxId.Text = emp.empNo.ToString();
            tbxFirstName.Text = emp.fname.ToString();
            tbxLastName.Text = emp.lname.ToString();

            // Position DDL
            var position = ctx.Positions
                           .Where(p => p.posName.Equals(emp.position))
                           .Select(p => p).FirstOrDefault();

            if (emp.position == null) {
                ddlPositions.SelectedIndex = 0;
            }
            else if (position != null) {
                ddlPositions.SelectedValue = position.posName;
            }
            else {
                ddlPositions.SelectedValue = otherOption;
                tbxPosition.Text = emp.position;
            }
            CheckPositionSelection();

            // Employer DDL
            if (emp.employer == null) {
                ddlEmployers.SelectedIndex = 0;
            }
            else if (employers.Contains(emp.employer)) {
                ddlEmployers.SelectedValue = emp.employer;
            }
            else {
                ddlEmployers.SelectedValue = otherOption;
                tbxEmployer.Text = emp.employer;
            }
            CheckEmployeeSelection();

            // Department DDL
            var department = ctx.Departments
                            .Where(d => d.deptName.Equals(emp.deptName))
                            .Select(d => d).FirstOrDefault();

            if (emp.deptName == null) {
                ddlDepartments.SelectedIndex = 0;
            }
            else if (department != null) {
                ddlDepartments.SelectedValue = department.deptName;
            }
            else {
                ddlDepartments.SelectedValue = otherOption;
                tbxDepartment.Text = emp.deptName;
            }
            CheckDepartmentSelection();

            if (emp.supervisor == null) {
                tbxSupervisor.Text = String.Empty;
            }
            else {
                tbxSupervisor.Text = emp.supervisor;
            }

            tbxRoom.Text = emp.room;

            if (emp.startDate != null) {
                tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy", new CultureInfo("en-CA"));
            }

            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("M/d/yyyy", new CultureInfo("en-CA"));
            }

        }
        else if ((qry != null) && (qry.Count() <= 0)) {
            Popup_Overlay("No employee with that first and last name found.", FailColour);
            return null;
        }
        else {
            Popup_Overlay("There was more than one employee with that first and last name.", FailColour);
            return null;
        }

        return emp;
    }

    /// <summary>
    /// Calls getEmployeeData(), which fetches the employee from the database using the employee's first and last name
    /// then populates the rest of the form with the employee's information.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e) {
        Page.Validate("vgpGetEmp");
        Page.Validate("vpgGetEmpFromDb");
        if (!Page.IsValid) {
            return;
        }
        
        getEmployeeData();
    }
    #endregion LoadEmployeeData

    #region Create Employee
    /// <summary>
    /// Calls the create Employee method, which creates and saves an Employee into the database.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnCreateEmployee_Click(object sender, EventArgs e) {
        Page.Validate("vgpGetEmp");
        Page.Validate("vgpCreateEmp");
        if (!Page.IsValid) {
            return;
        }
        createEmployee();
    }

    /// <summary>
    /// Creates a new Employee object (using the form fields) and saves it in the database.
    /// Returns the new Employeeon success, null on failure.
    /// Displays a pop-up with a success or fail message.
    /// The new employee cannot have the same first and last name of an existing employee.
    /// </summary>
    private Employee createEmployee() {
        Employee emp = ctx.Employees
                       .Where(et => et.fname.Equals(tbxFirstName.Text) && et.lname.Equals(tbxLastName.Text))
                       .Select(et => et).FirstOrDefault();

        if (emp != null) {
            Popup_Overlay("An employee with that first and last name already exists. Please change either the first or the last name.", FailColour);
            return null;
        }
        
        emp = new Employee {
            fname = tbxFirstName.Text,
            lname = tbxLastName.Text,
            room = tbxRoom.Text,
            supervisor = tbxSupervisor.Text,
        };

        #region dates
        if (!tbxStartDate.Text.Equals(String.Empty)) {
            DateTime formStartDate = Convert.ToDateTime(tbxStartDate.Text);
            emp.startDate = formStartDate;
        }
        if (!tbxEndDate.Text.Equals(String.Empty)) {
            DateTime formEndDate = Convert.ToDateTime(tbxEndDate.Text);
            emp.endDate = formEndDate;
        }
        #endregion dates

        #region position
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            emp.position = tbxPosition.Text;
        }
        else if (ddlPositions.SelectedValue.Equals(noOptionSpecified)) {
            emp.position = null;
        }
        else {
            emp.position = ddlPositions.SelectedValue;
        }
        #endregion position

        #region employer
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            emp.employer = tbxEmployer.Text;
        }
        else if (ddlEmployers.SelectedValue.Equals(noOptionSpecified)) {
            emp.employer = null;
        }
        else {
            emp.employer = ddlEmployers.SelectedValue;
        }
        #endregion employer

        #region department
        if (ddlDepartments.SelectedValue.Equals(otherOption)) {
            emp.deptName = tbxDepartment.Text;
        }
        else if (ddlDepartments.SelectedValue.Equals(noOptionSpecified)) {
            emp.deptName = null;
        }
        else {
            emp.deptName = ddlDepartments.SelectedValue;
        }
        #endregion department
        
        try {
            ctx.AddToEmployees(emp);
            ctx.SaveChanges();
            tbxId.Text = emp.empNo.ToString();
            Popup_Overlay("Employee successfully created.", SuccessColour);
            return emp;
        }
        catch (Exception ex) {
            Popup_Overlay("An error has occured while creating this employee. Please try again." + ex.StackTrace.ToString(), FailColour);
            return null;
        }

    }
    #endregion Create Employee

    #region Update Employee
    /// <summary>
    /// Calls the update Employee method, which updates the employee's info in database to match the form.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnUpdateEmployee_Click(object sender, EventArgs e) {
        updateEmployee();
    }

    /// <summary>
    /// Updates an employee object (using the form fields) and saves the changes to the database.
    /// Returns the new Employeeon success, null on failure.
    /// Displays a pop-up with a success or fail message.
    /// The new employee cannot have the same first and last name of an existing employee.
    /// The ID cannot be changed.
    /// </summary>
    private Employee updateEmployee() {
        int empId = Convert.ToInt32(tbxId.Text);

        Employee emp = ctx.Employees
                       .Where(et => et.empNo.Equals(empId))
                       .Select(et => et).FirstOrDefault();

        if (emp == null) {
            Popup_Overlay("Error updating employee. Please try again.", FailColour);
            return null;
        }

        Employee otherEmp = ctx.Employees
                            .Where(et => et.fname.Equals(tbxFirstName.Text)
                                && et.lname.Equals(tbxLastName.Text)
                                && !(et.empNo.Equals(emp.empNo)))
                            .Select(et => et).FirstOrDefault();

        if (otherEmp != null) {
            Popup_Overlay("An employee with that first and last name already exists. Please change either the first or the last name.", FailColour);
            return null;
        }

        if (!tbxStartDate.Text.Equals(String.Empty)) {
            emp.startDate = Convert.ToDateTime(tbxStartDate.Text);
        }
        if (!tbxEndDate.Text.Equals(String.Empty)) {
            emp.endDate = Convert.ToDateTime(tbxEndDate.Text);
        }

        emp.fname = tbxFirstName.Text;
        emp.lname = tbxLastName.Text;
        emp.room = tbxRoom.Text;
        emp.supervisor = tbxSupervisor.Text;

        #region position
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            emp.position = tbxPosition.Text;
        }
        else if (ddlPositions.SelectedValue.Equals(noOptionSpecified)) {
            emp.position = null;
        }
        else {
            emp.position = ddlPositions.SelectedValue;
        }
        #endregion position

        #region employer
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            emp.employer = tbxEmployer.Text;
        }
        else if (ddlEmployers.SelectedValue.Equals(noOptionSpecified)) {
            emp.employer = null;
        }
        else {
            emp.employer = ddlEmployers.SelectedValue;
        }
        #endregion employer

        #region department
        if (ddlDepartments.SelectedValue.Equals(otherOption)) {
            emp.deptName = tbxDepartment.Text;
        }
        else if (ddlDepartments.SelectedValue.Equals(noOptionSpecified)) {
            emp.deptName = null;
        }
        else {
            emp.deptName = ddlDepartments.SelectedValue;
        }
        #endregion department

        try {
            ctx.SaveChanges();
            Popup_Overlay("Employee successfully updated.", SuccessColour);
            return emp;
        }
        catch (Exception ex) {
            Popup_Overlay("An error has occured while updatin this employee. Please try again." + ex.StackTrace.ToString(), FailColour);
            return null;
        }
    }
    #endregion Update Employee
    #endregion EmployeeInfoRelated

    #region Page Popup
    /// <summary>
    /// Calls the show method of the modal popup AJAX panel.
    /// Shows a confirmation page overlay with a message.
    /// </summary>
    /// <param name="msg">Message displayed on confirmation overlay</param>
    /// <param name="color">Color for the message to be</param>
    protected void Popup_Overlay(string msg, Color color) {
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
    protected void btnPnlPopClose_Click(object sender, EventArgs e) {
        // do nothing
    }
    #endregion

    #region Create New Incident Report
    /// <summary>
    /// Calls the create report method, which creates an Incident report using the form.
    /// This method then saves that report in the database.
    /// Displays a pop-up window with a success or fail message.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnCreateReport_Click(object sender, EventArgs e) {
        Page.Validate("vgpGetEmp");
        Page.Validate("vgpPanelA");
        Page.Validate("vgpFCorrective");
        Page.Validate("vgpGRelevant");
        Page.Validate("vgpHManagers");

        if (Page.IsValid) {
            Incident report = createReport();
            try {
                ctx.AddToIncidents(report);
                ctx.SaveChanges();
                Popup_Overlay("Report successfully created.", SuccessColour);
            }
            catch (Exception ex) {
                Popup_Overlay("An error has occured while creating your report. Please try again.", FailColour);
                return;
            }
        }
        else {
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
    private Incident createReport() {
        Employee emp = getEmployeeData();
        // If employee not found, see if you can create one.
        if (emp == null) {
            Page.Validate("vgpCreateEmp");
            if (Page.IsValid) {
                createEmployee();
            }
            else {
                return null;
            }
        }

        int empId = Convert.ToInt32(tbxId.Text);

        Incident report = new Incident {

            #region A_IncidentInfo
            empNo = empId,
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

        if ((Session["DeptNo"] == null) || Session["DeptNo"].Equals(String.Empty)) {    // for admin account
            report.submitterDeptNo = null;
        }
        else {
            report.submitterDeptNo = Convert.ToInt32(Session["DeptNo"]);
        }

        #region Report Info Dates and Department
        #region Dates
        String strDateOfIncident = tbx_p1_dateOfIncident.Text;
        String strTimeOfIncident = tbx_p1_timeOfIncident.Text;
        String strDateReported = tbx_p1_dateReported.Text;
        String strTimeReported = tbx_p1_timeReported.Text;

        if (!(strDateOfIncident.Equals(String.Empty) && strTimeOfIncident.Equals(String.Empty))) {
            report.p1_dateOfIncident = Convert.ToDateTime(strDateOfIncident + " " + strTimeOfIncident);
        }
        else {
            return null;
        }

        if (!(strDateReported.Equals(String.Empty) && strTimeReported.Equals(String.Empty))) {
            report.p1_dateReported = Convert.ToDateTime(strDateReported + " " + strTimeReported);
        }
        else {
            return null;
        }
        #endregion Dates
        #region Department
        if (ddlReportDepts.SelectedValue.Equals("Other")) {
            report.deptNo = null;
        } else {
            int deptNo = Convert.ToInt32(ddlReportDepts.SelectedValue);
            report.deptNo = deptNo;
        }
        #endregion Department
        #endregion Report Info Dates and Department
    
        #region A_IncidentInfo_Dates
        if (!tbx_p1_action_medicalER_date.Text.Equals(String.Empty)) {
            DateTime dateMedicalER = Convert.ToDateTime(tbx_p1_action_medicalER_date.Text);
            report.p1_action_medicalER_date = dateMedicalER;
        }

        if (!tbx_p1_action_medicalGP_date.Text.Equals(String.Empty)) {
            DateTime dateMedicalGP = Convert.ToDateTime(tbx_p1_action_medicalGP_date.Text);
            report.p1_action_medicalGP_date = dateMedicalGP;
        }
        #endregion A_IncidentInfo_Dates

        #region C_AccidentInvestigation_PatientHandling
        if (!tbx_p1_numEmployeesInvolved.Text.Equals(String.Empty)) {
            try {
                report.p1_numEmployeesInvolved = Convert.ToInt32(tbx_p1_numEmployeesInvolved.Text);
            }
            catch (FormatException) {
                Popup_Overlay("Report not created. The number of employees involved (in Patient Handling of Section C) must be a number.", FailColour);
                return null;
            }
        }
        #endregion C_AccidentInvestigation_PatientHandling

        return report;
    }

    /// <summary>
    /// Converts a radio button list into a String value that the database can accept.
    /// If no value is selected returns null.
    /// Otherwise, returns the value as a String ("1" for yes, "2" for no).
    /// </summary>
    /// <param name="cbx">The CheckBox to convert.</param>
    /// <returns>String: 1 for yes/checked, 2 for no/unchecked.</returns>
    private String convertCheckBox(CheckBox cbx) {
        if (!cbx.Checked) {
            return "2";
        }
        return "1";
    }

    /// <summary>
    /// Converts a radio button list into a String value that the  database can accept.
    /// If no value is selected returns null.
    /// Otherwise, returns the value as a String ("1" for yes, "2" for no, "3" for unknown).
    /// </summary>
    /// <param name="rbl">The radio button list to convert.</param>
    /// <returns>Returns a string: 1 for yes, 2 for no, 3 for N/A or Unknown, null for no value selected.</returns>
    private String convertRadioButtonList(RadioButtonList rbl) {
        if ((rbl == null) || rbl.SelectedValue.Equals(String.Empty)) {
            return null;
        }
        else {
            return rbl.SelectedValue.ToString();
        }
    }

    /// <summary>
    /// Converts a textbox into a String value that the database can accept.
    /// If the textbox is null or empty, returns null.
    /// Otherwise, returns the text in the textbox.
    /// </summary>
    /// <param name="tbx">The textbox to convert.</param>
    /// <returns>Null: for null or empty textbox otherwise returns the textbox's text as a String.</returns>
    private String convertTextBox(TextBox tbx) {
        if (tbx == null) {
            return null;
        }
        else if (tbx.Text.Equals(String.Empty)) {
            return null;
        }
        else {
            return tbx.Text;
        }
    }
    #endregion Create New Incident Report

    protected void cbx_p1_action_medicalGP_CheckChanged(object sender, EventArgs e) {
        if (cbx_p1_action_medicalGP.Checked) {
            rfvMedicalAidGpDate.Enabled = true;
        }
        else {
            rfvMedicalAidGpDate.Enabled = false;
        }
    }
    protected void cbx_p1_action_medicalER_CheckChanged(object sender, EventArgs e) {
        if (cbx_p1_action_medicalER.Checked) {
            rfvMedicalAidErDate.Enabled = true;
        }
        else {
            rfvMedicalAidErDate.Enabled = false;
        }
    }
    protected void cmvActionFollowing_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = (cbx_p1_action_report.Checked
                            || cbx_p1_action_firstAid.Checked
                            || cbx_p1_action_medicalGP.Checked
                            || cbx_p1_action_lostTime.Checked
                            || cbx_p1_action_medicalER.Checked);
    }

    protected void cmvEmployeeExists_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        
        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1)) {
            args.IsValid = true;
        } else if ((qry != null) && (qry.Count() <= 0)) {
            cmvEmployeeExists.ErrorMessage = "No employee with that first and last name found.";
            return;
        }
        else {
            cmvEmployeeExists.ErrorMessage = "There was more than one employee with that first and last name.";
            return;
        }
    }

    protected void cmvDates_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;
        String strStartDate = tbxStartDate.Text;
        String strEndDate = tbxEndDate.Text;
        if (strStartDate == null || strStartDate.Equals(String.Empty)) {
            args.IsValid = true;
            return;
        }
        if (strEndDate == null && strEndDate.Equals(String.Empty)) {
            args.IsValid = true;
            return;
        }
        DateTime startDate = Convert.ToDateTime(strStartDate);
        DateTime endDate = Convert.ToDateTime(strEndDate);
        if (startDate.CompareTo(endDate) > 0) {
            args.IsValid = true;
            return;
        }
    }
    

}
