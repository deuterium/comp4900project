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
    public static String otherOption = "Other (specify)";
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
        if (!IsPostBack)
        {
            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            pnlPop.Style.Value = "display:none;";
            lblResults.Visible = true;
            tsmScriptManager.SetFocus(tbxLastName.ClientID);
            pnlCrsDetails.Visible = false;
            pnlNewCourse.Visible = false;
        }
    }

    #region Employee Info Related
    #region Drop Down Lists

    #region Load DropDownLists

    /// <summary>
    /// Populates the employers drop down list.
    /// </summary>
    private void PopulateEmployersDdl()
    {
        ddlEmployers.DataSource = employers;
        ddlEmployers.DataBind();
    }

    /// <summary>
    /// Populates the positions drop down list.
    /// Loads positions from the database.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulatePositionsDdl()
    {
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
    private void PopulateDepartmentsDdl()
    {
        ddlDepartments.DataSource = ctx.Departments;
        ddlDepartments.DataValueField = "deptName";
        ddlDepartments.DataBind();
        ddlDepartments.Items.Insert(ddlDepartments.Items.Count, otherOption);
        ddlDepartments.Items.Insert(0, noOptionSpecified);
    }

    /// <summary>
    /// Populates the new Courses dropdown list.
    /// Loads course names from the database
    /// </summary>
    private void PopulateCoursesDdl()
    {
        ddlNewCrs.DataSource = ctx.TrainingCourses;
        ddlNewCrs.DataTextField = "trainingName";
        ddlNewCrs.DataValueField = "trainingNo";
        ddlNewCrs.DataBind();
    }

    #endregion Load DropDownLists

    #region Other Option Textbox Toggle
    /// <summary>
    /// Calls CheckPositionSelection(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckPositionSelection();
    }

    /// <summary>
    /// Calls CheckEmployeeSelection(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckEmployeeSelection();
    }

    /// <summary>
    /// Calls CheckDepartmentSelection(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlDepartments_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckDepartmentSelection();
    }

    /// <summary>
    /// Displays a textbox if the "Other (specify)" option of the positions drop down list is selected.
    /// Hides the textbox if any other option is selected
    /// </summary>
    private void CheckPositionSelection()
    {
        if (ddlPositions.SelectedValue.Equals(otherOption))
        {
            tbxPosition.Visible = true;
        }
        else
        {
            tbxPosition.Visible = false;
        }
    }

    /// <summary>
    /// Displays a textbox if the "Other (specify)" option of the employee drop down list is selected.
    /// Hides the textbox if any other option is selected
    /// </summary>
    private void CheckEmployeeSelection()
    {
        if (ddlEmployers.SelectedValue.Equals(otherOption))
        {
            tbxEmployer.Visible = true;
        }
        else
        {
            tbxEmployer.Visible = false;
        }
    }

    /// <summary>
    /// Displays a textbox if the "Other (specify)" option of the departments drop down list is selected.
    /// Hides the textbox if any other option is selected
    /// </summary>
    private void CheckDepartmentSelection()
    {
        if (ddlDepartments.SelectedValue.Equals(otherOption))
        {
            tbxDepartment.Visible = true;
        }
        else
        {
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
    private void getEmployeeData()
    {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1))
        {
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
            CheckPositionSelection();

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

            if (emp.supervisor == null)
            {
                tbxSupervisor.Text = String.Empty;
            }
            else
            {
                tbxSupervisor.Text = emp.supervisor;
            }

            tbxRoom.Text = emp.room;

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy");

            if (emp.endDate != null)
            {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("M/d/yyyy");
            }

        }
        else if ((qry != null) && (qry.Count() <= 0))
        {
            Popup_Overlay("No employee with that first and last name found.", FailColour);
        }
        else
        {
            Popup_Overlay("There was more than one employee with that first and last name.", FailColour);
        }
        populateValidCourses();
        populateExpiredCourses();
    }

    /// <summary>
    /// Calls getEmployeeData(), which fetches the employee from the database using the employee's first and last name
    /// then populates the rest of the form with the employee's information.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e)
    {
        getEmployeeData();
    }
    #endregion LoadEmployeeData

    #region Create Employee
    /// <summary>
    /// Calls the create Employee method, which creates and saves an Employee into the database.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnCreateEmployee_Click(object sender, EventArgs e)
    {
        createEmployee();
    }

    /// <summary>
    /// Creates a new Employee object (using the form fields) and saves it in the database.
    /// Returns the new Employeeon success, null on failure.
    /// Displays a pop-up with a success or fail message.
    /// The new employee cannot have the same first and last name of an existing employee.
    /// </summary>
    private Employee createEmployee()
    {
        Employee emp = ctx.Employees
                       .Where(et => et.fname.Equals(tbxFirstName.Text) && et.lname.Equals(tbxLastName.Text))
                       .Select(et => et).FirstOrDefault();

        if (emp != null)
        {
            Popup_Overlay("An employee with that first and last name already exists. Please change either the first or the last name.", FailColour);
            return null;
        }

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
            DateTime formStartDate = Convert.ToDateTime(tbxStartDate.Text);
            emp.startDate = formStartDate;
        }
        if (!tbxEndDate.Text.Equals(String.Empty))
        {
            DateTime formEndDate = Convert.ToDateTime(tbxEndDate.Text);
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

        try
        {
            ctx.AddToEmployees(emp);
            ctx.SaveChanges();
            tbxId.Text = emp.empNo.ToString();
            Popup_Overlay("Employee successfully created.", SuccessColour);
            return emp;
        }
        catch (Exception ex)
        {
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
    protected void btnUpdateEmployee_Click(object sender, EventArgs e)
    {
        updateEmployee();
    }

    /// <summary>
    /// Updates an employee object (using the form fields) and saves the changes to the database.
    /// Returns the new Employeeon success, null on failure.
    /// Displays a pop-up with a success or fail message.
    /// The new employee cannot have the same first and last name of an existing employee.
    /// The ID cannot be changed.
    /// </summary>
    private Employee updateEmployee()
    {
        int empId = Convert.ToInt32(tbxId.Text);

        Employee emp = ctx.Employees
                       .Where(et => et.empNo.Equals(empId))
                       .Select(et => et).FirstOrDefault();

        if (emp == null)
        {
            Popup_Overlay("Error updating employee. Please try again.", FailColour);
            return null;
        }

        Employee otherEmp = ctx.Employees
                            .Where(et => et.fname.Equals(tbxFirstName.Text)
                                && et.lname.Equals(tbxLastName.Text)
                                && !(et.empNo.Equals(emp.empNo)))
                            .Select(et => et).FirstOrDefault();

        if (otherEmp != null)
        {
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

        try
        {
            ctx.SaveChanges();
            Popup_Overlay("Employee successfully updated.", SuccessColour);
            return emp;
        }
        catch (Exception ex)
        {
            Popup_Overlay("An error has occured while updating this employee. Please try again." + ex.StackTrace.ToString(), FailColour);
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

    #region gridview methods
    /// <summary>
    /// When the Get Employee button is clicke, this function is called to 
    /// populate all valid courses taken
    /// </summary>
    private void populateValidCourses() {
        DateTime currentDate = DateTime.Now;
        var q = ctx.Employees.Where(e => e.empNo == 6)
                               .Join(
                                  ctx.TrainingTakens,
                                  emp => emp.empNo,
                                  TT => TT.empNo,
                                  (emp, TT) =>
                                     new
                                     {
                                         emp = emp,
                                         TT = TT
                                     }
                               )
                               .Join(
                                  ctx.TrainingCourses,
                                  temp0 => temp0.TT.trainingNo,
                                  TC => TC.trainingNo,
                                  (temp0, TC) =>
                                     new
                                     {
                                         temp0 = temp0,
                                         TC = TC
                                     }
                               )
                               .Where(temp1 => (currentDate <= temp1.temp0.TT.endDate))
                               .Select(
                                  temp1 =>
                                     new
                                     {
                                         coursename = temp1.TC.trainingName,
                                         startdate = temp1.temp0.TT.startDate,
                                         enddate = temp1.temp0.TT.endDate,
                                         ttNo = temp1.temp0.TT.trainingTakenNo,
                                     }
                               );

        grvValidCourses.DataSource = q;
        Session["query"] = q;
        BindData();
    }

    /// <summary>
    /// Binds the grvValidCourses
    /// </summary>
    private void BindData()
    {
        grvValidCourses.DataSource = Session["query"];
        grvValidCourses.DataBind();
    }

    /// <summary>
    /// Populates the expired courses gridview
    /// </summary>
    private void populateExpiredCourses()
    {
        DateTime currentDate = DateTime.Now;
        var q = ctx.Employees.Where(e => e.empNo == 6)
                               .Join(
                                  ctx.TrainingTakens,
                                  emp => emp.empNo,
                                  TT => TT.empNo,
                                  (emp, TT) =>
                                     new
                                     {
                                         emp = emp,
                                         TT = TT
                                     }
                               )
                               .Join(
                                  ctx.TrainingCourses,
                                  temp0 => temp0.TT.trainingNo,
                                  TC => TC.trainingNo,
                                  (temp0, TC) =>
                                     new
                                     {
                                         temp0 = temp0,
                                         TC = TC
                                     }
                               )
                               .Where(temp1 => (currentDate > temp1.temp0.TT.endDate))
                               .Select(
                                  temp1 =>
                                     new
                                     {
                                         coursename = temp1.TC.trainingName,
                                         startdate = temp1.temp0.TT.startDate,
                                         enddate = temp1.temp0.TT.endDate,
                                     }
                               );

        grvExpiredCourses.DataSource = q;
        grvExpiredCourses.DataBind();
    }

    /// <summary>
    /// Triggered when grvValidCourses is edited
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvValidCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvValidCourses.EditIndex = e.NewEditIndex;
        BindData();
    }

    /// <summary>
    /// Triggered when grvValidCourses is updated
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvValidCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        var q = Session["query"];

        GridViewRow row = grvValidCourses.Rows[e.RowIndex];

        int empNo = Convert.ToInt32(tbxId.Text);
        int ttNo = Convert.ToInt32(grvValidCourses.Rows[e.RowIndex].Cells[3].Text);
        //String ttNoTeest = grvValidCourses.Rows[e.RowIndex].Cells[3].Text;

        TrainingTaken training = ctx.TrainingTakens
                       .Where(tt => tt.trainingTakenNo == ttNo)
                       .Select(tt => tt).FirstOrDefault();

        if (e.NewValues["startDate"] != null)
        {
            if (!(e.NewValues["startDate"].Equals(String.Empty)))
            {
                String strStart = e.NewValues["startDate"].ToString();
                try
                {
                    System.Globalization.CultureInfo enUS = new System.Globalization.CultureInfo("en-US");
                    training.startDate = Convert.ToDateTime(Convert.ToDateTime(strStart, enUS));
                }
                catch (Exception ex)
                {
                    Popup_Overlay("Unsupported date format.", FailColour);
                    return;
                }
            }

        }
        if (e.NewValues["endDate"] != null)
        {
            if (!(e.NewValues["endDate"].Equals(String.Empty)))
            {
                String strEnd = e.NewValues["endDate"].ToString();
                try
                {
                    System.Globalization.CultureInfo enUS = new System.Globalization.CultureInfo("en-US");
                    training.endDate = Convert.ToDateTime(Convert.ToDateTime(strEnd, enUS));
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, FailColour);
                    return;
                }
            }
        }

        try
        {
            //ctx.DetectChanges();
            ctx.SaveChanges();
            grvValidCourses.EditIndex = -1;
            e.Cancel = true;
            Popup_Overlay("Update successful.", SuccessColour);
            BindData();
        }
        catch (Exception ex)
        {
            Popup_Overlay("An error has occured while updating this training. Please try again." + ex.StackTrace.ToString(), FailColour);
            return;
        }


    }

    /// <summary>
    /// Triggered when grvValidCourses when edit is cancelled
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvValidCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvValidCourses.EditIndex = -1;
        BindData();
    }

    /// <summary>
    /// Triggered when grvValidCourses is selectedIndex is changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvValidCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = grvValidCourses.SelectedRow;
        //String name = Convert.ToString(row.Cells[1].Text);
        int ttNo = Convert.ToInt32(row.Cells[3].Text);

        TrainingTaken training = ctx.TrainingTakens
                       .Where(tt => tt.trainingTakenNo == ttNo)
                       .Select(tt => tt).FirstOrDefault();

        TrainingCours course = ctx.TrainingCourses
            .Where(c => c.trainingNo == training.trainingNo)
            .Select(c => c).FirstOrDefault();

        disableDetails();
        if (course.trainingName.Equals("Biosafety Training") || course.trainingName.Equals("Chem Safety Training")
            || course.trainingName.Equals("Cyto. Safety Training"))
        {
            pnlCrsDetails.Visible = true;
            lblresp1.Visible = true;
            lblRespType.Visible = true;
            lblCourseDate.Visible = true;
            tbxCourseDate.Visible = true;
            //tbxCourseDate.Text = training.courseDate
            if (course.trainingName.Equals("Biosafety Training"))
            {
                tbxBSCDate.Visible = true;
                lblBSCDate.Visible = true;
                tbxBSCDate.Text = Convert.ToString(training.biosafety_BSCSeminar);
            }
            rblSigned.Visible = true;
            lblSOPSigned.Visible = true;
            if (training.SOPsigned != null)
            {
                if (training.SOPsigned.ToString().Equals("1"))
                {
                    rblSigned.SelectedValue = "Yes";
                }
                else
                {
                    rblSigned.SelectedValue = "No";
                }
            }
            lblEval.Visible = true;
            rblEvaluation.Visible = true;
            if (training.evaluation != null)
            {
                if (training.evaluation.ToString().Equals("1"))
                {
                    rblEvaluation.SelectedValue = "Pass";
                }
                else
                {
                    rblEvaluation.SelectedValue = "Fail";
                }
            }
            lblRespFit.Visible = true;
            tbxDateFit.Visible = true;
            tbxDateFit.Text = Convert.ToString(training.respiratorDate);
            if (!(course.trainingName.Equals("Cyto. Safety Training")))
            {
                lblSpillDate.Visible = true;
                tbxSpillDate.Visible = true;
                tbxSpillDate.Text = Convert.ToString(training.spillCleanupPracticalDate);
            }
            lblRespFit.Visible = true;
            tbxRespType.Visible = true;
            tbxRespType.Text = training.respiratorType;
            lblRespModel.Visible = true;
            tbxRespModel.Visible = true;
            tbxRespModel.Text = training.respiratorModel;
            lblRespComment.Visible = true;
            tbxRespComment.Visible = true;
            tbxRespComment.Text = training.respiratorComments;
            lblCert.Visible = true;
            tbxCert.Visible = true;
            tbxCert.Text = training.certificateNum;
        }
        else if (course.trainingName.Equals("Radiation Safety Training"))
        {
            pnlCrsDetails.Visible = true;
            rblSigned.Visible = true;
            lblSOPSigned.Visible = true;
            if (training.SOPsigned != null)
            {
                if (training.SOPsigned.ToString().Equals("1"))
                {
                    rblSigned.SelectedValue = "Yes";
                }
                else
                {
                    rblSigned.SelectedValue = "No";
                }
            }
            lblEval.Visible = true;
            rblEvaluation.Visible = true;
            if (training.evaluation != null)
            {
                if (training.evaluation.ToString().Equals("1"))
                {
                    rblEvaluation.SelectedValue = "Pass";
                }
                else
                {
                    rblEvaluation.SelectedValue = "Fail";
                }
            }
            lblCert.Visible = true;
            tbxCert.Visible = true;
            tbxCert.Text = training.certificateNum;
            lblDosIssued.Visible = true;
            lblDosSubmitted.Visible = true;
            lblRingIssued.Visible = true;
            rblDosIssued.Visible = true;
            if (training.radiation_dosimeterIssued != null)
            {
                if (Convert.ToString(training.radiation_dosimeterIssued).Equals("1"))
                {
                    rblDosIssued.SelectedValue = "Yes";
                }
                else
                {
                    rblDosIssued.SelectedValue = "No";
                }
            }
            if (training.radiation_dosimeterSubmitted != null)
            {
                if (Convert.ToString(training.radiation_dosimeterSubmitted).Equals("1"))
                {
                    rblDosSubmitted.SelectedValue = "Yes";
                }
                else
                {
                    rblDosSubmitted.SelectedValue = "No";
                }
            }
            rblDosSubmitted.Visible = true;
            if (training.radiation_ringIssued != null)
            {
                if (Convert.ToString(training.radiation_ringIssued).Equals("1"))
                {
                    rblRingIssued.SelectedValue = "Yes";
                }
                else
                {
                    rblRingIssued.SelectedValue = "No";
                }
            }
            rblRingIssued.Visible = true;
        }
        else
        {
            disableDetails();
            pnlCrsDetails.Visible = false;
        }
    }
    #endregion

    #region clearPage
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
                    //case "System.Web.UI.WebControls.DropDownList":
                        //((DropDownList)c).SelectedIndex = 0;
                        //break;
                }
            }
        }
    }

    #endregion 

    

    protected void disableDetails()
    {
        tbxBSCDate.Visible = false;
        lblBSCDate.Visible = false;
        lblDosIssued.Visible = false;
        lblDosSubmitted.Visible = false;
        lblRingIssued.Visible = false;
        rblDosIssued.Visible = false;
        rblDosSubmitted.Visible = false;
        rblRingIssued.Visible = false;
        lblSOPSigned.Visible = false;
        rblSigned.Visible = false;
        lblEval.Visible = false;
        rblEvaluation.Visible = false;
        lblRespFit.Visible = false;
        tbxDateFit.Visible = false;
        lblSpillDate.Visible = false;
        tbxSpillDate.Visible = false;
        lblresp1.Visible = false;
        lblRespType.Visible = false;
        lblRespComment.Visible = false;
        tbxRespComment.Visible = false;
        lblRespFit.Visible = false;
        tbxRespType.Visible = false;
        lblRespModel.Visible = false;
        tbxRespModel.Visible = false;
    }

    
    /// <summary>
    /// Saves course detail changes to the database
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSaveCrsDetails_Click(object sender, EventArgs e)
    {
        GridViewRow row = grvValidCourses.SelectedRow;
        String name = row.Cells[2].Text.ToString();
        int ttNo = Convert.ToInt32(row.Cells[3].Text);

        TrainingTaken training = ctx.TrainingTakens
                       .Where(tt => tt.trainingTakenNo == ttNo)
                       .Select(tt => tt).FirstOrDefault();

        TrainingCours course = ctx.TrainingCourses
            .Where(c => c.trainingNo == training.trainingNo)
            .Select(c => c).FirstOrDefault();

        try
        {
            System.Globalization.CultureInfo enUS = new System.Globalization.CultureInfo("en-US");
            if (!(tbxCourseDate.Text.Equals("")))
            {
                DateTime crsDate = Convert.ToDateTime(Convert.ToDateTime(tbxCourseDate.Text, enUS));
                training.courseDate = crsDate;
            }

            training.evaluation = (rblEvaluation.SelectedValue.Equals("Pass")) ? "1" : "0";
            training.certificateNum = tbxCert.Text;

            if (course.trainingName.Equals("Biosafety Training") || course.trainingName.Equals("Chem Safety Training")
            || course.trainingName.Equals("Cyto. Safety Training"))
            {
                if (course.trainingName.Equals("Biosafety Training") && (!tbxBSCDate.Text.Equals("")))
                {
                    DateTime BSCDate = Convert.ToDateTime(Convert.ToDateTime(tbxBSCDate.Text, enUS));
                    training.biosafety_BSCSeminar = BSCDate;
                }
                training.SOPsigned = (rblSigned.SelectedValue.Equals("Yes")) ? "1" : "0";
                training.evaluation = (rblEvaluation.SelectedValue.Equals("Yes")) ? "1" : "0";
                if (!(tbxSpillDate.Text.Equals("")))
                {
                    DateTime spillDate = Convert.ToDateTime(Convert.ToDateTime(tbxSpillDate.Text, enUS));
                    training.spillCleanupPracticalDate = spillDate;
                }
                if (!(tbxDateFit.Text.Equals("")))
                {
                    DateTime dateFit = Convert.ToDateTime(Convert.ToDateTime(tbxDateFit.Text, enUS));
                    training.respiratorDate = dateFit;
                }
                training.respiratorType = (tbxRespType.Text.Equals("")) ? null : tbxRespType.Text;
                training.respiratorModel = (tbxRespModel.Text.Equals("")) ? null : tbxRespModel.Text;
                training.respiratorComments = (tbxRespComment.Text.Equals("")) ? null : tbxRespComment.Text;
                training.certificateNum = (tbxCert.Text.Equals("")) ? null : tbxCert.Text;
            }
            else if (course.trainingName.Equals("Radiation Safety Training"))
            {
                training.radiation_dosimeterSubmitted = (rblDosSubmitted.SelectedValue.Equals("Yes")) ? "1" : "0";
                training.radiation_dosimeterIssued = (rblDosIssued.SelectedValue.Equals("Yes")) ? "1" : "0";
                training.radiation_ringIssued = (rblRingIssued.SelectedValue.Equals("Yes")) ? "1" : "0";
            }
            else if (course.trainingName.Equals("Cs Unit Training"))
            {
                training.SOPsigned = (rblSigned.SelectedValue.Equals("Yes")) ? "1" : "0";
            }
            ctx.DetectChanges();
            ctx.SaveChanges();
            Popup_Overlay("Details successfully updated.", SuccessColour);
            return;
        }
        catch (Exception ex)
        {
            Popup_Overlay("An error has occured while updating details. Please try again." + ex.StackTrace.ToString(), FailColour);
            return;
        }
    }
    #region addd new course to training taken
    /// <summary>
    /// Unhides the panel to add new courses
    /// Populates the courses dropdown list
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnAddCrs_Click(object sender, EventArgs e)
    {
        pnlNewCourse.Visible = true;
        PopulateCoursesDdl();
    }

    /// <summary>
    /// Creates a new training to add to training taken.
    /// Updates gridview
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnAddCrsAction_Click(object sender, EventArgs e)
    {
        pnlCrsDetails.Visible = false;
        disableDetails();
        
        int empId = Convert.ToInt32(tbxId.Text);
        
        try
        {
            System.Globalization.CultureInfo enUS = new System.Globalization.CultureInfo("en-US");
            DateTime newStartDate = Convert.ToDateTime(Convert.ToDateTime(tbxNewCrsStart.Text, enUS));
            DateTime newEndDate = Convert.ToDateTime(Convert.ToDateTime(tbxNewCrsEnd.Text, enUS));

            TrainingTaken tt = new TrainingTaken
            {
                empNo = empId,
                trainingNo = Convert.ToInt32(ddlNewCrs.SelectedValue),
                startDate = newStartDate,
                endDate = newEndDate,
            };
            ctx.AddToTrainingTakens(tt);
            ctx.SaveChanges();
            BindData();
            tbxNewCrsEnd.Text = "";
            tbxNewCrsStart.Text = "";
            ddlNewCrs.SelectedIndex = 0;
            pnlNewCourse.Visible = false;
            Popup_Overlay("Training successfully created.", SuccessColour);
            return;
        }
        catch (Exception ex)
        {
            Popup_Overlay(ex.Message, FailColour);
            return;
        }
    }

    /// <summary>
    /// Hides the panel to add new courses.
    /// Clears new courses textboxes.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancelAddCrs_Click(object sender, EventArgs e)
    {
        tbxNewCrsEnd.Text = "";
        tbxNewCrsStart.Text = "";
        ddlNewCrs.SelectedIndex = 0;
        pnlNewCourse.Visible = false;
    }
    #endregion
}