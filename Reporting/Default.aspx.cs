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
 * fix time regex (see sample forms) --> make a up/down arrow clock (NumericUpDown)
 * fix table style (when you select Other from DDL)
 * make clear all and clear individual form buttons
 * add regex validator to phone
 * add regex for name
 * custom validator for Others in DDL
 * ask about dates (how the labels on the forms say M/D/Y)
 * Kalen: panel A, panel B
 * Kalen: comment boxes are centered (vertically) - see section G
 * add regex to last 3 sections
 * test really long inputs
 * put results msg in update panel triggered by btn click (so it disappears eveyr time you click submit)
 * re-order controls so they appear in the order you click them?
 * add schedule (last part of follow-up)
 * Add create user
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
        noOptionSpecified, "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", otherOption
    };
    // List of static, pre-defined actiosn following an incident that a user can select
    public static List<String> actionsFollowing = new List<String> {
        noOptionSpecified,
        "Report Only",
        "Lost time (missed/will miss next scheduled shift due to injury)",
        "First Aid",
        "Medical Aid (GP / Clinic)",
        "Medical Aid (ER)"
    };
    // Date format
    System.Globalization.DateTimeFormatInfo dateFormatInfo = new System.Globalization.DateTimeFormatInfo();
    #endregion class variables
    
    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Populates the Employer, Position, and Department drop down lists.
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        // Only do the initial set up the first time the page loads (and not on post-backs).
        if (!IsPostBack) {
            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            pnlPop.Style.Value = "display:none;";
            lblResults.Visible = true;
            //GridView1.DataSource = ctx.Employees;
            //GridView1.DataBind();
            tsmScriptManager.SetFocus(tbxLastName.ClientID);
            dateFormatInfo.ShortDatePattern = "MM/dd/yyyy";
        }
    }

    #region Employee Info Related
    #region Drop Down Lists

    #region Load DropDownLists

        /// <summary>
        /// Populates the employers drop down list.
        /// </summary>
        private void PopulateEmployersDdl() {
            ddlEmployers.DataSource = employers;
            ddlEmployers.DataBind();
        }

        /// <summary>
        /// Populates the positions drop down list.
        /// Loads positions from the database.
        /// Adds the "no selection" option to the front of the list.
        /// Adds the "other" option to the end of the list.
        /// </summary>
        private void PopulatePositionsDdl() {
            ddlPositions.DataSource = ctx.Positions;
            ddlPositions.DataValueField = "posName";
            ddlPositions.DataBind();
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);
            ddlPositions.Items.Insert(0, noOptionSpecified);
        }

        /// <summary>
        /// Populates the departments drop down list.
        /// Loads departments from the database.
        /// Adds the "no selection" option to the front of the list.
        /// Adds the "other" option to the end of the list.
        /// </summary>
        private void PopulateDepartmentsDdl() {
            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptName";
            ddlDepartments.DataBind();
            ddlDepartments.Items.Insert(ddlDepartments.Items.Count, otherOption);
            ddlDepartments.Items.Insert(0, noOptionSpecified);
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
            //var department = ctx.Departments
            //                .Where(d => d.deptName.Equals(emp.deptName))
            //                .Select(d => d).FirstOrDefault();

            //if (emp.deptName == null) {
            //    ddlDepartments.SelectedIndex = 0;
            //}
            //else if (department != null) {
            //    ddlDepartments.SelectedValue = department.deptName;
            //}
            //else {
            //    ddlDepartments.SelectedValue = otherOption;
            //    tbxDepartment.Text = emp.deptName;
            //}
            CheckDepartmentSelection();

            if (emp.supervisor == null) {
                tbxSupervisor.Text = String.Empty;
            }
            else {
                tbxSupervisor.Text = emp.supervisor;
            }

            tbxRoom.Text = emp.room;

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy");

            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("M/d/yyyy");
            }

        }
        else if ((qry != null) && (qry.Count() <= 0)) {
            Popup_Overlay("No employee with that first and last name found.", FailColour);
        }
        else {
            Popup_Overlay("There was more than one employee with that first and last name.", FailColour);
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
    #endregion LoadEmployeeData

    #region Create Employee
    /// <summary>
    /// Calls the create Employee method, which creates and saves an Employee into the database.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnCreateEmployee_Click(object sender, EventArgs e) {
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

        DateTime formStartDate = Convert.ToDateTime(tbxStartDate.Text, dateFormatInfo);
        DateTime formEndDate = Convert.ToDateTime(tbxEndDate.Text, dateFormatInfo);

        emp = new Employee {
            fname = tbxFirstName.Text,
            lname = tbxLastName.Text,
            room = tbxRoom.Text,
            supervisor = tbxSupervisor.Text,
            startDate = formStartDate,
            endDate = formEndDate
        };

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
        //if (ddlDepartments.SelectedValue.Equals(otherOption)) {
        //    emp.deptName = tbxDepartment.Text;
        //}
        //else if (ddlDepartments.SelectedValue.Equals(noOptionSpecified)) {
        //    emp.deptName = null;
        //}
        //else {
        //    emp.deptName = ddlDepartments.SelectedValue;
        //}
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

        DateTime formStartDate = Convert.ToDateTime(tbxStartDate.Text);
        DateTime formEndDate = Convert.ToDateTime(tbxEndDate.Text);

        emp.fname = tbxFirstName.Text;
        emp.lname = tbxLastName.Text;
        emp.room = tbxRoom.Text;
        emp.supervisor = tbxSupervisor.Text;
        emp.startDate = formStartDate;
        emp.endDate = formEndDate;

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
        //if (ddlDepartments.SelectedValue.Equals(otherOption)) {
        //    emp.deptName = tbxDepartment.Text;
        //}
        //else if (ddlDepartments.SelectedValue.Equals(noOptionSpecified)) {
        //    emp.deptName = null;
        //}
        //else {
        //    emp.deptName = ddlDepartments.SelectedValue;
        //}
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
    /// Calls the create report method, which creates and saves an Incident report in the database.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnCreateReport_Click(object sender, EventArgs e) {
        Page.Validate("vgpEmpInfo");
        Page.Validate("vgpPanelA");
        Page.Validate("vgpFCorrective");
        Page.Validate("vgpGRelevant");
        Page.Validate("vgpHManagers");

        if (Page.IsValid) {
            createReport();
        }
    }
    
    /// <summary>
    /// Creates a new Incident report object (using the form fields) and saves it in the database.
    /// Returns the new Incident report on success, null on failure.
    /// Displays a pop-up with a success or fail message.
    /// </summary>
    /// <returns>the newly created Incident report</returns>
    private Incident createReport() {
        getEmployeeData();
        int empId = Convert.ToInt32(tbxId.Text);
        String temp = tbx_p1_timeReported.Text;
        String temp2 = tbx_p1_timeOfIncident.Text;

        DateTime dateOfIncident = Convert.ToDateTime(tbx_p1_dateOfIncident.Text + " " + tbx_p1_timeOfIncident.Text);
        DateTime dateReported = Convert.ToDateTime(tbx_p1_dateReported.Text + " " + tbx_p1_timeReported.Text);

        Incident report = new Incident {

            #region A_IncidentInfo
            empNo = empId,
            p1_dateOfIncident = dateOfIncident,
            p1_dateReported = dateReported,
            p1_incidentDesc = convertTextBox(tbx_p1_incidentDesc),
            p1_witnessName1 = convertTextBox(tbx_p1_witnessName1),
            p1_witnessPhone1 = convertTextBox(tbx_p1_witnessPhone1),
            p1_witnessName2 = convertTextBox(tbx_p1_witnessName2),
            p1_witnessPhone2 = convertTextBox(tbx_p1_witnessPhone2),
            p1_action_firstAid = convertCheckbox(cbx_p1_action_firstAid),
            p1_action_medicalGP = convertCheckbox(cbx_p1_action_medicalGP),
            p1_action_lostTime = convertCheckbox(cbx_p1_action_lostTime),
            p1_action_medicalER = convertCheckbox(cbx_p1_action_medicalER),
            #endregion A_IncidentInfo

            #region B_NatureOfInjury
            p1_nature_no = convertCheckbox(cbx_p1_nature_no),
            p1_nature_musculoskeletal = convertCheckbox(cbx_p1_nature_musculoskeletal),
            p1_nature_bruise = convertCheckbox(cbx_p1_nature_bruise),
            p1_nature_burn = convertCheckbox(cbx_p1_nature_burn),
            p1_nature_cut = convertCheckbox(cbx_p1_nature_cut),
            p1_nature_puncture = convertCheckbox(cbx_p1_nature_puncture),
            p1_nature_skinIrritation = convertCheckbox(cbx_p1_nature_skinIrritation),
            p1_nature_skinMucous = convertCheckbox(cbx_p1_nature_skinMucous),
            p1_nature_eye = convertCheckbox(cbx_p1_nature_eye),
            p1_nature_allergic = convertCheckbox(cbx_p1_nature_allergic),
            p1_nature_psychological = convertCheckbox(cbx_p1_nature_psychological),
            p1_nature_respiratory = convertCheckbox(cbx_p1_nature_respiratory),
            #endregion B_NatureOfInjury

            #region C_AccidentInvestigation
            p2_activity_no = convertCheckbox(cbx_p2_activity_no),
            p2_activity_repositioning = convertCheckbox(cbx_p2_activity_repositioning),
            p2_activity_transferring = convertCheckbox(cbx_p2_activity_transferring),
            p2_activity_assistedWalking = convertCheckbox(cbx_p2_activity_assistedWalking),
            p2_activity_assistedFloor = convertCheckbox(cbx_p2_activity_assistedFloor),
            p2_activity_fall = convertCheckbox(cbx_p2_activity_fall),
            p2_activity_holding = convertCheckbox(cbx_p2_activity_holding),
            p2_activity_toileting = convertCheckbox(cbx_p2_activity_toileting),

            p2_patient_ceilingLift = convertCheckbox(cbx_p2_patient_ceilingLift),
            p2_patient_sitStandLift = convertCheckbox(cbx_p2_patient_sitStandLift),
            p2_patient_floorLift = convertCheckbox(cbx_p2_patient_floorLift),
            p2_patient_manualLift = convertCheckbox(cbx_p2_patient_manualLift),
            p2_patient_otherSpecify = convertTextBox(tbx_p2_patient_otherSpecify),
            p2_patient_adequateAssist = convertRadioButtonList(rbl_p2_patient_adequateAssist),

            p2_activity_washing = convertCheckbox(cbx_p2_activity_washing),
            p2_activity_dressing = convertCheckbox(cbx_p2_activity_dressing),
            p2_activity_changing = convertCheckbox(cbx_p2_activity_changing),
            p2_activity_feeding = convertCheckbox(cbx_p2_activity_feeding),
            p2_activity_prep = convertCheckbox(cbx_p2_activity_prep),
            p2_activity_dressingChanges = convertCheckbox(cbx_p2_activity_dressingChanges),
            p2_activity_otherPatientCare = convertTextBox(tbx_p2_activity_otherPatientCare),

            p2_activity_recapping = convertCheckbox(cbx_p2_activity_recapping),
            p2_activity_puncture = convertCheckbox(cbx_p2_activity_puncture),
            p2_activity_sharpsDisposal = convertCheckbox(cbx_p2_activity_sharpsDisposal),
            p2_activity_otherSharps = convertCheckbox(cbx_p2_activity_otherSharps),

            p2_activity_material = convertTextBox(tbx_p2_acitvity_material),
            p2_activity_lift = convertCheckbox(cbx_p2_activity_recapping),
            p2_activity_push = convertCheckbox(cbx_p2_activity_push),
            p2_activity_carry = convertCheckbox(cbx_p2_activity_carry),
            p2_activity_otherMat = convertTextBox(tbx_p2_activity_otherMat),
            p2_activity_driving = convertCheckbox(cbx_p2_activity_driving),
            p2_activity_otherEquip = convertTextBox(tbx_p2_activity_otherEquip),
            p2_activity_otherEquipDesc = convertCheckbox(cbx_p2_activity_otherEquipDesc),
            p2_activity_equipMain = convertCheckbox(cbx_p2_activity_equipMain),
            p2_activity_comp = convertCheckbox(cbx_p2_activity_comp),
            p2_activity_nonComp = convertCheckbox(cbx_p2_activity_nonComp),

            p2_activity_walking = convertCheckbox(cbx_p2_activity_walking),
            p2_activity_bending = convertCheckbox(cbx_p2_activity_bending),
            p2_activity_reading = convertCheckbox(cbx_p2_activity_reading),
            p2_activity_spill = convertCheckbox(cbx_p2_activity_spill),
            p2_activity_cleaning = convertCheckbox(cbx_p2_activity_cleaning),
            p2_activity_other = convertTextBox(tbx_p2_activity_other),
            #endregion C_AccidentInvestigation

            #region D_Cause
            p2_cause_human = convertCheckbox(cbx_p2_cause_human),
            p2_cause_animal = convertCheckbox(cbx_p2_cause_animal),

            p2_cause_needle = convertCheckbox(cbx_p2_cause_needle),
            p2_cause_otherSharps = convertCheckbox(cbx_p2_cause_otherSharps),
            p2_cause_skin = convertCheckbox(cbx_p2_cause_skin),

            p2_cause_awkwardPosture = convertCheckbox(cbx_p2_cause_awkwardPosture),
            p2_cause_staticPosture = convertCheckbox(cbx_p2_cause_staticPosture),
            p2_cause_contactStress = convertCheckbox(cbx_p2_cause_contactStress),
            p2_cause_force = convertCheckbox(cbx_p2_cause_force),
            p2_cause_rep = convertCheckbox(cbx_p2_cause_rep),

            p2_cause_motor = convertCheckbox(cbx_p2_cause_motor),
            p2_cause_slip = convertCheckbox(cbx_p2_cause_slip),
            p2_cause_aggression = convertCheckbox(cbx_p2_cause_aggression),
            p2_cause_undetermined = convertCheckbox(cbx_p2_cause_undetermined),
            p2_cause_event = convertCheckbox(cbx_p2_cause_event),
            p2_cause_underEquip = convertCheckbox(cbx_p2_cause_underEquip),
            p2_cause_hit = convertCheckbox(cbx_p2_cause_hit),
            p2_cause_other = convertTextBox(tbx_p2_cause_other),

            p2_aggression_verbal = convertCheckbox(cbx_p2_cause_aggression_verbal),
            p2_aggression_biting = convertCheckbox(cbx_p2_cause_aggression_biting),
            p2_aggression_hitting = convertCheckbox(cbx_p2_cause_aggression_hitting),
            p2_aggression_squeezing = convertCheckbox(cbx_p2_cause_aggression_squeezing),
            p2_aggression_assault = convertCheckbox(cbx_p2_cause_aggression_assault),
            p2_aggression_patient = convertCheckbox(cbx_p2_cause_aggression_patient),
            p2_aggression_family = convertCheckbox(cbx_p2_cause_aggression_family),
            p2_aggression_public = convertCheckbox(cbx_p2_cause_aggression_public),
            p2_aggression_worker = convertCheckbox(cbx_p2_cause_aggression_worker),
            p2_aggression_other = convertTextBox(tbx_p2_cause_aggression_other),
            p2_cause_exposure_chemName = convertTextBox(tbx_p2_cause_exposure_chemName),
            p2_cause_chemInhalation = convertCheckbox(cbx_p2_cause_chemInhalation),
            p2_cause_chemIngest = convertCheckbox(cbx_p2_cause_chemIngest),
            p2_cause_chemContact = convertCheckbox(cbx_p2_cause_chemContact),
            p2_cause_latex = convertCheckbox(cbx_p2_cause_latex),
            p2_cause_dust = convertCheckbox(cbx_p2_cause_dust),
            p2_cause_disease = convertCheckbox(cbx_p2_cause_disease),
            p2_cause_temp = convertCheckbox(cbx_p2_cause_temp),
            p2_cause_noise = convertCheckbox(cbx_p2_cause_noise),
            p2_cause_radiation = convertCheckbox(cbx_p2_cause_radiation),
            p2_cause_elec = convertCheckbox(cbx_p2_cause_elec),
            p2_cause_air = convertCheckbox(cbx_p2_cause_air),
            #endregion D_Cause

            #region E_ContributingFactors
            p2_factors_malfunction = convertCheckbox(cbx_p2_factors_malfunction),
            p2_factors_improperUse = convertCheckbox(cbx_p2_factors_improperUse),
            p2_factors_signage = convertCheckbox(cbx_p2_factors_signage),
            p2_factors_notAvailable = convertCheckbox(cbx_p2_factors_notAvailable),
            p2_factors_poorDesign = convertCheckbox(cbx_p2_factors_poorDesign),
            p2_factors_otherEquip = convertTextBox(tbx_p2_factors_otherEquip),

            p2_factors_temp = convertCheckbox(cbx_p2_factors_temp),
            p2_factors_workplace = convertCheckbox(cbx_p2_factors_workplace),
            p2_factors_layout = convertCheckbox(cbx_p2_factors_layout),
            p2_factors_limitedWorkspace = convertCheckbox(cbx_p2_factors_limitedWorkspace),
            p2_factors_slippery = convertCheckbox(cbx_p2_factors_slippery),
            p2_factors_lighting = convertCheckbox(cbx_p2_factors_lighting),
            p2_factors_noise = convertCheckbox(cbx_p2_factors_noise),
            p2_factors_vent = convertCheckbox(cbx_p2_factors_vent),
            p2_factors_storage = convertCheckbox(cbx_p2_factors_storage),
            p2_factors_otherEnv = convertTextBox(tbx_p2_factors_otherEnv),

            p2_factors_assessment = convertCheckbox(cbx_p2_factors_assessment),
            p2_factors_procedure = convertCheckbox(cbx_p2_factors_procedure),
            p2_factors_appropriateEquip = convertCheckbox(cbx_p2_factors_appropriateEquip),
            p2_factors_conduct = convertCheckbox(cbx_p2_factors_conduct),
            p2_factors_extended = convertCheckbox(cbx_p2_factors_extended),
            p2_factors_comm = convertCheckbox(cbx_p2_factors_comm),
            p2_factors_unaccustomed = convertCheckbox(cbx_p2_factors_unaccustomed),
            p2_factors_otherWorkPractice = convertTextBox(tbx_p2_factors_otherWorkPractice),

            p2_factors_directions = convertCheckbox(cbx_p2_factors_directions),
            p2_factors_weight = convertCheckbox(cbx_p2_factors_weight),
            p2_factors_aggressive = convertCheckbox(cbx_p2_factors_aggressive),
            p2_factors_patientResistive = convertCheckbox(cbx_p2_factors_patientResistive),
            p2_factors_movement = convertCheckbox(cbx_p2_factors_movement),
            p2_factors_confused = convertCheckbox(cbx_p2_factors_confused),
            p2_factors_influence = convertCheckbox(cbx_p2_factors_influence),
            p2_factors_lang = convertCheckbox(cbx_p2_factors_lang),
            p2_factors_otherPatient = convertTextBox(tbx_p2_factors_otherPatient),

            p2_factors_alone = convertCheckbox(cbx_p2_factors_alone),
            p2_factors_info = convertCheckbox(cbx_p2_factors_info),
            p2_factors_scheduling = convertCheckbox(cbx_p2_factors_scheduling),
            p2_factors_training = convertCheckbox(cbx_p2_factors_training),
            p2_factors_equip = convertCheckbox(cbx_p2_factors_equip),
            p2_factors_personal = convertCheckbox(cbx_p2_factors_personal),
            p2_factors_safe = convertCheckbox(cbx_p2_factors_safe),
            p2_factors_perceived = convertCheckbox(cbx_p2_factors_perceived),
            p2_factors_otherOrganizational = convertTextBox(tbx_p2_factors_otherOrganizational),

            p2_factors_inexperienced = convertCheckbox(cbx_p2_factors_inexperienced),
            p2_factors_communication = convertCheckbox(cbx_p2_factors_communication),
            p2_factors_fatigued = convertCheckbox(cbx_p2_factors_fatigued),
            p2_factors_distracted = convertCheckbox(cbx_p2_factors_distracted),
            p2_factors_preexisting = convertCheckbox(cbx_p2_factors_preexisting),
            p2_factors_sick = convertCheckbox(cbx_p2_factors_sick),
            p2_factors_otherWorker = convertTextBox(tbx_p2_factors_otherWorker),
            #endregion E_ContributingFactors

            #region F_CorrectiveAction
            p2_corrective_person = convertTextBox(tbx_p2_corrective_person),
            p2_corrective_maintenance = convertRadioButtonList(rbl_p2_corrective_maintenance),
            p2_corrective_communicated = convertRadioButtonList(rbl_p2_corrective_communicated),
            p2_corrective_time = convertRadioButtonList(rbl_p2_corrective_time),
            #endregion F_CorrectiveAction

            #region G_FollowUp
            p2_corrective_written = convertTextBox(tbx_p2_corrective_written),
            p2_corrective_education = convertTextBox(tbx_p2_corrective_education),
            p2_corrective_equipment = convertTextBox(tbx_p2_corrective_equipment),
            p2_corrective_environment = convertTextBox(tbx_p2_corrective_environment),
            p2_corrective_patient = convertTextBox(tbx_p2_corrective_patient),
            #endregion G_FollowUp

            #region G_ManagersReport
            p2_manager_previous = convertTextBox(tbx_p2_manager_previous),
            p2_manager_objections = convertTextBox(tbx_p2_manager_objections),
            p2_manager_alternative = convertTextBox(tbx_p2_manager_alternative),
            #endregion G_ManagersReport

            followUpStatus = "0",
        };

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

        #region F_CorrectiveAction_Dates
        if (!tbx_p2_corrective_personDate.Text.Equals(String.Empty)) {
            DateTime dateCorrectivePerson = Convert.ToDateTime(tbx_p2_corrective_personDate.Text);
            report.p2_corrective_personDate = dateCorrectivePerson;
        }

        if (!tbx_p2_corrective_maintenanceDate.Text.Equals(String.Empty)) {
            DateTime dateMaintenance = Convert.ToDateTime(tbx_p2_corrective_maintenanceDate.Text);
            report.p2_corrective_maintenanceDate = dateMaintenance;
        }

        if (!tbx_p2_corrective_communicatedDate.Text.Equals(String.Empty)) {
            DateTime dateCommunicated = Convert.ToDateTime(tbx_p2_corrective_communicatedDate.Text);
            report.p2_corrective_communicatedDate = dateCommunicated;
        }

        if (!tbx_p2_corrective_timeDate.Text.Equals(String.Empty)) {
            DateTime dateTimeLoss = Convert.ToDateTime(tbx_p2_corrective_timeDate.Text);
            report.p2_corrective_timeDate = dateTimeLoss;
        }
        #endregion F_CorrectiveAction_Dates

        #region G_FollowUp_Dates

        #region G_FollowUp_Dates_Target

        if (!tbx_p2_corrective_writtenTargetDate.Text.Equals(String.Empty)) {
            DateTime writtenDate = Convert.ToDateTime(tbx_p2_corrective_writtenTargetDate.Text);
            report.p2_corrective_writtenTargetDate = writtenDate;
        }

        if (!tbx_p2_corrective_educationTargetDate.Text.Equals(String.Empty)) {
            DateTime educationDate = Convert.ToDateTime(tbx_p2_corrective_educationTargetDate.Text);
            report.p2_corrective_educationTargetDate = educationDate;
        }

        if (!tbx_p2_corrective_equipmentTargetDate.Text.Equals(String.Empty)) {
            DateTime equipmentDate = Convert.ToDateTime(tbx_p2_corrective_equipmentTargetDate.Text);
            report.p2_corrective_equipmentTargetDate = equipmentDate;
        }

        if (!tbx_p2_corrective_environmentTargetDate.Text.Equals(String.Empty)) {
            DateTime environmentDate = Convert.ToDateTime(tbx_p2_corrective_environmentTargetDate.Text);
            report.p2_corrective_environmentTargetDate = environmentDate;
        }

        if (!tbx_p2_corrective_patientTargetDate.Text.Equals(String.Empty)) {
            DateTime patientDate = Convert.ToDateTime(tbx_p2_corrective_patientTargetDate.Text);
            report.p2_corrective_patientTargetDate = patientDate;
        }

        #endregion G_FollowUp_Dates_Target

        #region G_FollowUp_Dates_Completed

        if (!tbx_p2_corrective_writtenCompletedDate.Text.Equals(String.Empty)) {
            DateTime writtenDate = Convert.ToDateTime(tbx_p2_corrective_writtenCompletedDate.Text);
            report.p2_corrective_writtenCompletedDate = writtenDate;
        }

        if (!tbx_p2_corrective_educationCompletedDate.Text.Equals(String.Empty)) {
            DateTime educationDate = Convert.ToDateTime(tbx_p2_corrective_educationCompletedDate.Text);
            report.p2_corrective_educationCompletedDate = educationDate;
        }

        if (!tbx_p2_corrective_equipmentCompletedDate.Text.Equals(String.Empty)) {
            DateTime equipmentDate = Convert.ToDateTime(tbx_p2_corrective_equipmentCompletedDate.Text);
            report.p2_corrective_equipmentCompletedDate = equipmentDate;
        }

        if (!tbx_p2_corrective_environmentCompletedDate.Text.Equals(String.Empty)) {
            DateTime environmentDate = Convert.ToDateTime(tbx_p2_corrective_environmentCompletedDate.Text);
            report.p2_corrective_environmentCompletedDate = environmentDate;
        }

        if (!tbx_p2_corrective_patientCompletedDate.Text.Equals(String.Empty)) {
            DateTime patientDate = Convert.ToDateTime(tbx_p2_corrective_patientCompletedDate.Text);
            report.p2_corrective_patientCompletedDate = patientDate;
        }

        #endregion G_FollowUp_Dates_Completed

        #endregion G_FollowUp_Dates

        #region H_FixedShiftRotation
        #region H_FixedShiftRotation_Week1
        if (!tbx_p2_manager_week1_sun.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_sun.Text);
            report.p2_manager_week1_sun = d;
        }

        if (!tbx_p2_manager_week1_mon.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_mon.Text);
            report.p2_manager_week1_mon = d;
        }

        if (!tbx_p2_manager_week1_tue.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_tue.Text);
            report.p2_manager_week1_tue = d;
        }

        if (!tbx_p2_manager_week1_wed.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_wed.Text);
            report.p2_manager_week1_wed = d;
        }

        if (!tbx_p2_manager_week1_thu.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_thu.Text);
            report.p2_manager_week1_thu = d;
        }

        if (!tbx_p2_manager_week1_fri.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_fri.Text);
            report.p2_manager_week1_fri = d;
        }

        if (!tbx_p2_manager_week1_sat.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week1_sat.Text);
            report.p2_manager_week1_sat = d;
        }
        #endregion H_FixedShiftRotation_Week1

        #region H_FixedShiftRotation_Week2
        if (!tbx_p2_manager_week2_sun.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_sun.Text);
            report.p2_manager_week2_sun = d;
        }

        if (!tbx_p2_manager_week2_mon.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_mon.Text);
            report.p2_manager_week2_mon = d;
        }

        if (!tbx_p2_manager_week2_tue.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_tue.Text);
            report.p2_manager_week2_tue = d;
        }

        if (!tbx_p2_manager_week2_wed.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_wed.Text);
            report.p2_manager_week2_wed = d;
        }

        if (!tbx_p2_manager_week2_thu.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_thu.Text);
            report.p2_manager_week2_thu = d;
        }

        if (!tbx_p2_manager_week2_fri.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_fri.Text);
            report.p2_manager_week2_fri = d;
        }

        if (!tbx_p2_manager_week2_sat.Text.Equals(String.Empty)) {
            Decimal d = Convert.ToDecimal(tbx_p2_manager_week2_sat.Text);
            report.p2_manager_week2_sat = d;
        }
        #endregion H_FixedShiftRotation_Week2
        #endregion H_FixedShiftRotation

        try {
            ctx.AddToIncidents(report);
            ctx.SaveChanges();
            Popup_Overlay("Report successfully created.", SuccessColour);
            return report;
        }
        catch (Exception ex) {
            Popup_Overlay("An error has occured while creating your report. Please try again." + ex.StackTrace.ToString(), FailColour);
            return null;
        }
    }

    /// <summary>
    /// Converts a radio button list into a String value that the database can accept.
    /// If no value is selected returns null.
    /// Otherwise, returns the value as a String ("1" for yes, "2" for no).
    /// </summary>
    /// <param name="cbx">The CheckBox to convert.</param>
    /// <returns>String: 1 for yes/checked, 2 for no/unchecked.</returns>
    private String convertCheckbox(CheckBox cbx) {
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
        } else {
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
        } else if (tbx.Text.Equals(String.Empty)) {
            return null;
        } else {
            return tbx.Text;
        }
    }
    #endregion Create New Incident Report

    #region Load Incident Report
    /// <summary>
    /// Calls the create report method, which creates and saves an Incident report in the database.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnGetReport_Click(object sender, EventArgs e) {
        Page.Validate("vgpEmpInfo");
        Page.Validate("vgpPanelA");
        Page.Validate("vgpFCorrective");
        Page.Validate("vgpGRelevant");
        Page.Validate("vgpHManagers");

        if (Page.IsValid) {
            createReport();
        }
    }
      
    private Incident getReport(int id) {
        var report = ctx.Incidents
                     .Where(r => r.incidentNo.Equals(id))
                     .Select(r => r).FirstOrDefault();

        if (report == null) {
            Popup_Overlay("Report not found.", SuccessColour);
        }

        tbxFirstName.Text = report.Employee.fname.ToString();
        tbxLastName.Text = report.Employee.lname.ToString();
        getEmployeeData();

        #region A_IncidentInfo
        tbx_p1_dateOfIncident.Text = convertDateTimeToString((DateTime) (DateTime) report.p1_dateOfIncident);
        tbx_p1_timeOfIncident.Text = String.Format("h:m tt", report.p1_dateOfIncident);
        tbx_p1_dateReported.Text = convertDateTimeToString((DateTime) report.p1_dateReported);
        tbx_p1_timeReported.Text = String.Format("h:m tt", report.p1_dateReported);
        tbx_p1_incidentDesc.Text = report.p1_incidentDesc.ToString();
        tbx_p1_witnessName1.Text = report.p1_witnessName1.ToString();
        tbx_p1_witnessPhone1.Text = report.p1_witnessPhone1.ToString();
        tbx_p1_witnessName2.Text = report.p1_witnessName2.ToString();
        tbx_p1_witnessPhone2.Text = report.p1_witnessPhone2.ToString();
        cbx_p1_action_firstAid.Checked =convertToCheckbox(report.p1_action_firstAid.ToString());
        cbx_p1_action_medicalGP.Checked = convertToCheckbox(report.p1_action_medicalGP.ToString());
        tbx_p1_action_medicalGP_date.Text = convertDateTimeToString((DateTime) report.p1_action_medicalGP_date);
        cbx_p1_action_medicalER.Checked = convertToCheckbox(report.p1_action_medicalER.ToString());
        tbx_p1_action_medicalER_date.Text = convertDateTimeToString((DateTime) report.p1_action_medicalER_date);
        cbx_p1_action_lostTime.Checked = convertToCheckbox(report.p1_action_lostTime.ToString());
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        cbx_p1_nature_no.Checked = convertToCheckbox(report.p1_nature_no.ToString());
        cbx_p1_nature_musculoskeletal.Checked = convertToCheckbox(report.p1_nature_musculoskeletal.ToString());
        cbx_p1_nature_bruise.Checked = convertToCheckbox(report.p1_nature_bruise.ToString());
        cbx_p1_nature_burn.Checked = convertToCheckbox(report.p1_nature_burn.ToString());
        cbx_p1_nature_cut.Checked = convertToCheckbox(report.p1_nature_cut.ToString());
        cbx_p1_nature_puncture.Checked = convertToCheckbox(report.p1_nature_puncture.ToString());
        cbx_p1_nature_skinIrritation.Checked = convertToCheckbox(report.p1_nature_skinIrritation.ToString());
        cbx_p1_nature_skinMucous.Checked = convertToCheckbox(report.p1_nature_skinMucous.ToString());
        cbx_p1_nature_eye.Checked = convertToCheckbox(report.p1_nature_eye.ToString());
        cbx_p1_nature_allergic.Checked = convertToCheckbox(report.p1_nature_allergic.ToString());
        cbx_p1_nature_psychological.Checked = convertToCheckbox(report.p1_nature_psychological.ToString());
        cbx_p1_nature_respiratory.Checked = convertToCheckbox(report.p1_nature_respiratory.ToString());
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        cbx_p2_activity_no.Checked = convertToCheckbox(report.p2_activity_no.ToString());
        cbx_p2_activity_repositioning.Checked = convertToCheckbox(report.p2_activity_repositioning.ToString());
        cbx_p2_activity_transferring.Checked = convertToCheckbox(report.p2_activity_transferring.ToString());
        cbx_p2_activity_assistedWalking.Checked = convertToCheckbox(report.p2_activity_assistedWalking.ToString());
        cbx_p2_activity_assistedFloor.Checked = convertToCheckbox(report.p2_activity_assistedFloor.ToString());
        cbx_p2_activity_fall.Checked = convertToCheckbox(report.p2_activity_fall.ToString());
        cbx_p2_activity_holding.Checked = convertToCheckbox(report.p2_activity_holding.ToString());
        cbx_p2_activity_toileting.Checked = convertToCheckbox(report.p2_activity_toileting.ToString());
        
        cbx_p2_patient_ceilingLift.Checked = convertToCheckbox(report.p2_patient_ceilingLift.ToString());
        cbx_p2_patient_sitStandLift.Checked = convertToCheckbox(report.p2_patient_sitStandLift.ToString());
        cbx_p2_patient_floorLift.Checked = convertToCheckbox(report.p2_patient_floorLift.ToString());
        cbx_p2_patient_manualLift.Checked = convertToCheckbox(report.p2_patient_manualLift.ToString());
        tbx_p1_numEmployeesInvolved.Text = report.p1_numEmployeesInvolved.ToString();
        
        tbx_p2_patient_otherSpecify.Text = report.p2_patient_otherSpecify.ToString();
        rbl_p2_patient_adequateAssist.SelectedValue = report.p2_patient_adequateAssist.ToString();

        cbx_p2_activity_washing.Checked = convertToCheckbox(report.p2_activity_washing.ToString());
        cbx_p2_activity_dressing.Checked = convertToCheckbox(report.p2_activity_dressing.ToString());
        cbx_p2_activity_changing.Checked = convertToCheckbox(report.p2_activity_changing.ToString());
        cbx_p2_activity_feeding.Checked = convertToCheckbox(report.p2_activity_feeding.ToString());
        cbx_p2_activity_prep.Checked = convertToCheckbox(report.p2_activity_prep.ToString());
        cbx_p2_activity_dressingChanges.Checked = convertToCheckbox(report.p2_activity_dressingChanges.ToString());
        tbx_p2_activity_otherPatientCare.Text = report.p2_activity_otherPatientCare.ToString();

        cbx_p2_activity_recapping.Checked = convertToCheckbox(report.p2_activity_recapping.ToString());
        cbx_p2_activity_puncture.Checked = convertToCheckbox(report.p2_activity_puncture.ToString());
        cbx_p2_activity_sharpsDisposal.Checked = convertToCheckbox(report.p2_activity_sharpsDisposal.ToString());
        cbx_p2_activity_otherSharps.Checked = convertToCheckbox(report.p2_activity_otherSharps.ToString());

        tbx_p2_acitvity_material.Text = report.p2_activity_material.ToString();
        cbx_p2_activity_recapping.Checked = convertToCheckbox(report.p2_activity_lift.ToString());
        cbx_p2_activity_push.Checked = convertToCheckbox(report.p2_activity_push.ToString());
        cbx_p2_activity_carry.Checked = convertToCheckbox(report.p2_activity_carry.ToString());
        tbx_p2_activity_otherMat.Text = report.p2_activity_otherMat.ToString();
        cbx_p2_activity_driving.Checked = convertToCheckbox(report.p2_activity_driving.ToString());
        tbx_p2_activity_otherEquip.Text = report.p2_activity_otherEquip.ToString();
        cbx_p2_activity_otherEquipDesc.Checked = convertToCheckbox(report.p2_activity_otherEquipDesc.ToString());
        cbx_p2_activity_equipMain.Checked = convertToCheckbox(report.p2_activity_equipMain.ToString());
        cbx_p2_activity_comp.Checked = convertToCheckbox(report.p2_activity_comp.ToString());
        cbx_p2_activity_nonComp.Checked = convertToCheckbox(report.p2_activity_nonComp.ToString());
        
        cbx_p2_activity_walking.Checked = convertToCheckbox(report.p2_activity_walking.ToString());
        cbx_p2_activity_bending.Checked = convertToCheckbox(report.p2_activity_bending.ToString());
        cbx_p2_activity_reading.Checked = convertToCheckbox(report.p2_activity_reading.ToString());
        cbx_p2_activity_spill.Checked = convertToCheckbox(report.p2_activity_spill.ToString());
        cbx_p2_activity_cleaning.Checked = convertToCheckbox(report.p2_activity_cleaning.ToString());
        tbx_p2_activity_other.Text = report.p2_activity_other.ToString();
         #endregion C_AccidentInvestigation

        #region D_Cause
        cbx_p2_cause_human.Checked = convertToCheckbox(report.p2_cause_human.ToString());
        cbx_p2_cause_animal.Checked = convertToCheckbox(report.p2_cause_animal.ToString());

        cbx_p2_cause_needle.Checked = convertToCheckbox(report.p2_cause_needle.ToString());
        cbx_p2_cause_otherSharps.Checked = convertToCheckbox(report.p2_cause_otherSharps.ToString());
        cbx_p2_cause_skin.Checked = convertToCheckbox(report.p2_cause_skin.ToString());

        cbx_p2_cause_awkwardPosture.Checked = convertToCheckbox(report.p2_cause_awkwardPosture.ToString());
        cbx_p2_cause_staticPosture.Checked = convertToCheckbox(report.p2_cause_staticPosture.ToString());
        cbx_p2_cause_contactStress.Checked = convertToCheckbox(report.p2_cause_contactStress.ToString());
        cbx_p2_cause_force.Checked = convertToCheckbox(report.p2_cause_force.ToString());
        cbx_p2_cause_rep.Checked = convertToCheckbox(report.p2_cause_rep.ToString());

        cbx_p2_cause_motor.Checked = convertToCheckbox(report.p2_cause_motor.ToString());
        cbx_p2_cause_slip.Checked = convertToCheckbox(report.p2_cause_slip.ToString());
        cbx_p2_cause_aggression.Checked = convertToCheckbox(report.p2_cause_aggression.ToString());
        cbx_p2_cause_undetermined.Checked = convertToCheckbox(report.p2_cause_undetermined.ToString());
        cbx_p2_cause_event.Checked = convertToCheckbox(report.p2_cause_event.ToString());
        cbx_p2_cause_underEquip.Checked = convertToCheckbox(report.p2_cause_underEquip.ToString());
        cbx_p2_cause_hit.Checked = convertToCheckbox(report.p2_cause_hit.ToString());
        tbx_p2_cause_other.Text = report.p2_cause_other.ToString();

        cbx_p2_cause_aggression_verbal.Checked = convertToCheckbox(report.p2_aggression_verbal.ToString());
        cbx_p2_cause_aggression_biting.Checked = convertToCheckbox(report.p2_aggression_biting.ToString());
        cbx_p2_cause_aggression_hitting.Checked = convertToCheckbox(report.p2_aggression_hitting.ToString());
        cbx_p2_cause_aggression_squeezing.Checked = convertToCheckbox(report.p2_aggression_squeezing.ToString());
        cbx_p2_cause_aggression_assault.Checked = convertToCheckbox(report.p2_aggression_assault.ToString());
        cbx_p2_cause_aggression_patient.Checked = convertToCheckbox(report.p2_aggression_patient.ToString());
        cbx_p2_cause_aggression_family.Checked = convertToCheckbox(report.p2_aggression_family.ToString());
        cbx_p2_cause_aggression_public.Checked = convertToCheckbox(report.p2_aggression_public.ToString());
        cbx_p2_cause_aggression_worker.Checked = convertToCheckbox(report.p2_aggression_worker.ToString());
        tbx_p2_cause_aggression_other.Text = report.p2_aggression_other.ToString();
                        
        tbx_p2_cause_exposure_chemName.Text = report.p2_cause_exposure_chemName.ToString();
        cbx_p2_cause_chemInhalation.Checked = convertToCheckbox(report.p2_cause_chemInhalation.ToString());
        cbx_p2_cause_chemIngest.Checked = convertToCheckbox(report.p2_cause_chemIngest.ToString());
        cbx_p2_cause_chemContact.Checked = convertToCheckbox(report.p2_cause_chemContact.ToString());
        cbx_p2_cause_latex.Checked = convertToCheckbox(report.p2_cause_latex.ToString());
        cbx_p2_cause_dust.Checked = convertToCheckbox(report.p2_cause_dust.ToString());
        cbx_p2_cause_disease.Checked = convertToCheckbox(report.p2_cause_disease.ToString());
        cbx_p2_cause_temp.Checked = convertToCheckbox(report.p2_cause_temp.ToString());
        cbx_p2_cause_noise.Checked = convertToCheckbox(report.p2_cause_noise.ToString());
        cbx_p2_cause_radiation.Checked = convertToCheckbox(report.p2_cause_radiation.ToString());
        cbx_p2_cause_elec.Checked = convertToCheckbox(report.p2_cause_elec.ToString());
        cbx_p2_cause_air.Checked = convertToCheckbox(report.p2_cause_air.ToString());
        #endregion D_Cause

        #region E_ContributingFactors       
        cbx_p2_factors_malfunction.Checked = convertToCheckbox(report.p2_factors_malfunction.ToString());
        cbx_p2_factors_improperUse.Checked = convertToCheckbox(report.p2_factors_improperUse.ToString());
        cbx_p2_factors_signage.Checked = convertToCheckbox(report.p2_factors_signage.ToString());
        cbx_p2_factors_notAvailable.Checked = convertToCheckbox(report.p2_factors_notAvailable.ToString());
        cbx_p2_factors_poorDesign.Checked = convertToCheckbox(report.p2_factors_poorDesign.ToString());
        tbx_p2_factors_otherEquip.Text = report.p2_factors_otherEquip.ToString();

        cbx_p2_factors_temp.Checked = convertToCheckbox(report.p2_factors_temp.ToString());
        cbx_p2_factors_workplace.Checked = convertToCheckbox(report.p2_factors_workplace.ToString());
        cbx_p2_factors_layout.Checked = convertToCheckbox(report.p2_factors_layout.ToString());
        cbx_p2_factors_limitedWorkspace.Checked = convertToCheckbox(report.p2_factors_limitedWorkspace.ToString());
        cbx_p2_factors_slippery.Checked = convertToCheckbox(report.p2_factors_slippery.ToString());
        cbx_p2_factors_lighting.Checked = convertToCheckbox(report.p2_factors_lighting.ToString());
        cbx_p2_factors_noise.Checked = convertToCheckbox(report.p2_factors_noise.ToString());
        cbx_p2_factors_vent.Checked = convertToCheckbox(report.p2_factors_vent.ToString());
        cbx_p2_factors_storage.Checked = convertToCheckbox(report.p2_factors_storage.ToString());
        tbx_p2_factors_otherEnv.Text = report.p2_factors_otherEnv.ToString();

        cbx_p2_factors_assessment.Checked = convertToCheckbox(report.p2_factors_assessment.ToString());
        cbx_p2_factors_procedure.Checked = convertToCheckbox(report.p2_factors_procedure.ToString());
        cbx_p2_factors_appropriateEquip.Checked = convertToCheckbox(report.p2_factors_appropriateEquip.ToString());
        cbx_p2_factors_conduct.Checked = convertToCheckbox(report.p2_factors_conduct.ToString());
        cbx_p2_factors_extended.Checked = convertToCheckbox(report.p2_factors_extended.ToString());
        cbx_p2_factors_comm.Checked = convertToCheckbox(report.p2_factors_comm.ToString());
        cbx_p2_factors_unaccustomed.Checked = convertToCheckbox(report.p2_factors_unaccustomed.ToString());
        tbx_p2_factors_otherWorkPractice.Text = report.p2_factors_otherWorkPractice.ToString();

        cbx_p2_factors_directions.Checked = convertToCheckbox(report.p2_factors_directions.ToString());
        cbx_p2_factors_weight.Checked = convertToCheckbox(report.p2_factors_weight.ToString());
        cbx_p2_factors_aggressive.Checked = convertToCheckbox(report.p2_factors_aggressive.ToString());
        cbx_p2_factors_patientResistive.Checked = convertToCheckbox(report.p2_factors_patientResistive.ToString());
        cbx_p2_factors_movement.Checked = convertToCheckbox(report.p2_factors_movement.ToString());
        cbx_p2_factors_confused.Checked = convertToCheckbox(report.p2_factors_confused.ToString());
        cbx_p2_factors_influence.Checked = convertToCheckbox(report.p2_factors_influence.ToString());
        cbx_p2_factors_lang.Checked = convertToCheckbox(report.p2_factors_lang.ToString());
        tbx_p2_factors_otherPatient.Text = report.p2_factors_otherPatient.ToString();

        cbx_p2_factors_alone.Checked = convertToCheckbox(report.p2_factors_alone.ToString());
        cbx_p2_factors_info.Checked = convertToCheckbox(report.p2_factors_info.ToString());
        cbx_p2_factors_scheduling.Checked = convertToCheckbox(report.p2_factors_scheduling.ToString());
        cbx_p2_factors_training.Checked = convertToCheckbox(report.p2_factors_training.ToString());
        cbx_p2_factors_equip.Checked = convertToCheckbox(report.p2_factors_equip.ToString());
        cbx_p2_factors_personal.Checked = convertToCheckbox(report.p2_factors_personal.ToString());
        cbx_p2_factors_safe.Checked = convertToCheckbox(report.p2_factors_safe.ToString());
        cbx_p2_factors_perceived.Checked = convertToCheckbox(report.p2_factors_perceived.ToString());
        //tbx_p2_factors_otherOrganizational.Text = report.p2_factors_otherOrganizational.ToString();

        cbx_p2_factors_inexperienced.Checked = convertToCheckbox(report.p2_factors_inexperienced.ToString());
        cbx_p2_factors_communication.Checked = convertToCheckbox(report.p2_factors_communication.ToString());
        cbx_p2_factors_fatigued.Checked = convertToCheckbox(report.p2_factors_fatigued.ToString());
        cbx_p2_factors_distracted.Checked = convertToCheckbox(report.p2_factors_distracted.ToString());
        cbx_p2_factors_preexisting.Checked = convertToCheckbox(report.p2_factors_preexisting.ToString());
        cbx_p2_factors_sick.Checked = convertToCheckbox(report.p2_factors_sick.ToString());
        tbx_p2_factors_otherWorker.Text = report.p2_factors_otherWorker.ToString();
        #endregion E_ContributingFactors

        #region F_CorrectiveAction
        tbx_p2_corrective_person.Text = report.p2_corrective_person.ToString();
        tbx_p2_corrective_personDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_personDate);
        rbl_p2_corrective_maintenance.SelectedValue = report.p2_corrective_maintenance.ToString();
        tbx_p2_corrective_maintenanceDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_maintenanceDate);
        rbl_p2_corrective_communicated.SelectedValue = report.p2_corrective_communicated.ToString();
        tbx_p2_corrective_communicatedDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_communicatedDate);
        rbl_p2_corrective_time.SelectedValue = report.p2_corrective_time.ToString();
        tbx_p2_corrective_timeDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_timeDate);
        #endregion F_CorrectiveAction

        #region G_FollowUp
        tbx_p2_corrective_written.Text = report.p2_corrective_written.ToString();
        tbx_p2_corrective_writtenTargetDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_writtenTargetDate);
        //tbx_p2_corrective_writtenCompletedDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_writtenCompletedDate);
        tbx_p2_corrective_education.Text = report.p2_corrective_education.ToString();
        tbx_p2_corrective_educationTargetDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_educationTargetDate);
        tbx_p2_corrective_educationCompletedDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_educationCompletedDate);
        tbx_p2_corrective_equipment.Text = report.p2_corrective_equipment.ToString();
        tbx_p2_corrective_equipmentTargetDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_equipmentTargetDate);
        tbx_p2_corrective_equipmentCompletedDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_equipmentCompletedDate);
        tbx_p2_corrective_environment.Text = report.p2_corrective_environment.ToString();
        tbx_p2_corrective_environmentTargetDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_environmentTargetDate);
        tbx_p2_corrective_environmentCompletedDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_environmentCompletedDate);
        tbx_p2_corrective_patient.Text = report.p2_corrective_patient.ToString();
        tbx_p2_corrective_patientTargetDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_patientTargetDate);
        tbx_p2_corrective_patientCompletedDate.Text = convertDateTimeToString((DateTime) report.p2_corrective_patientCompletedDate);
        #endregion G_FollowUp

        #region G_ManagersReport
        //tbx_p2_manager_previous.Text = report.p2_manager_previous.ToString();
        //tbx_p2_manager_objections.Text = report.p2_manager_objections.ToString();
        //tbx_p2_manager_alternative.Text = report.p2_manager_alternative.ToString();
        #endregion G_ManagersReport     

        #region H_FixedShiftRotation

        #region H_FixedShiftRotation_Week1
        tbx_p2_manager_week1_sun.Text = report.p2_manager_week1_sun.ToString();
        tbx_p2_manager_week1_mon.Text = report.p2_manager_week1_mon.ToString();
        tbx_p2_manager_week1_tue.Text = report.p2_manager_week1_tue.ToString();
        tbx_p2_manager_week1_wed.Text = report.p2_manager_week1_wed.ToString();
        tbx_p2_manager_week1_thu.Text = report.p2_manager_week1_thu.ToString();
        tbx_p2_manager_week1_fri.Text = report.p2_manager_week1_fri.ToString();
        tbx_p2_manager_week1_sat.Text = report.p2_manager_week1_sat.ToString();
        #endregion H_FixedShiftRotation_Week1

        #region H_FixedShiftRotation_Week2
        tbx_p2_manager_week2_sun.Text = report.p2_manager_week2_sun.ToString();
        tbx_p2_manager_week2_mon.Text = report.p2_manager_week2_mon.ToString();
        tbx_p2_manager_week2_tue.Text = report.p2_manager_week2_tue.ToString();
        tbx_p2_manager_week2_wed.Text = report.p2_manager_week2_wed.ToString();
        tbx_p2_manager_week2_thu.Text = report.p2_manager_week2_thu.ToString();
        tbx_p2_manager_week2_fri.Text = report.p2_manager_week2_fri.ToString();
        tbx_p2_manager_week2_sat.Text = report.p2_manager_week2_sat.ToString();
        #endregion H_FixedShiftRotation_Week2

        #endregion H_FixedShiftRotation

        return report;
    }

    /// <summary>
    /// Converts a String value in the database to a radio button list value.
    /// If the value is null or "2", returns false.
    /// If the value is "1" returns true;
    /// </summary>
    /// <param name="value">The String to convert.</param>
    /// <returns>Boolean: true for 1, false for 2 or null.</returns>
    private Boolean convertToCheckbox(String value) {
        if ((value == null) || value.Equals("2")) {
            return false;
        }
        return true;
    }
       
    /// <summary>
    /// Converts a DateTime into a String.
    /// Returns The date in the format M/d/yyyy.
    /// Returns null if the value is null or is the default date time (indicating the date was unknown).
    /// </summary>
    /// <param name="value">The Date to convert.</param>
    /// <returns>The date in the format M/d/yyyy or null, if the value is null or the default date time.</returns>
    private String convertDateTimeToString(DateTime value) {
        if (value.Equals(DateTime.MinValue)) {
            return null;
        }
        return String.Format("M/d/yyyy", value.ToString());
    }

    #endregion Load Incident Report
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      