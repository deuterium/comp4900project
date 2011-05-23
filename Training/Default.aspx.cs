using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
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
public partial class Training_Default : System.Web.UI.Page {
    
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
    // The date format to use for displaying and converting dates
    public static String dateFormat = "M/d/yyyy";
    // The locale to use when displaying and converting dates/times
    public static CultureInfo locale = new CultureInfo("en-CA");
    /// <summary>
    /// Populate the Drop Down Lists (emplyoers, departments, positions).
    /// Add OtherOption to end of each Drop Down List.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;

        //Lab managers should no be on this page, if they go here they are forwarded away
        int roleNo = (int)Session["RoleNo"];
        string role = ctx.Roles.Where(r => r.roleNo == roleNo).Select(r => r.role1).First();
        if (role == "Lab Manager")
        {
            Response.Redirect("~/Default.aspx");
        }

        if (!IsPostBack)
        {
            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            pnlPop.Style.Value = "display:none;";
            tsmScriptManager.SetFocus(tbxLastName.ClientID);
            pnlCrsDetails.Visible = false;
            pnlNewCourse.Visible = false;
            pnlExpiredCourseDetails.Visible = false;

            addCharFilterToAllTextBoxes();
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

    #region Toggle Other TextBox and CheckBox
    private void toggleOther(TextBox tbx, CheckBox cbx)
    {
        if (!tbx.Text.Equals(String.Empty))
        {
            cbx.Checked = true;
            return;
        }
        cbx.Checked = false;
    }
    
    #endregion Toggle Other TextBox and CheckBox

    #region Employee Info Related
    #region Drop Down Lists
    #region Load DropDownLists

    /// <summary>
    /// Populates the employers drop down list.
    /// </summary>
    private void PopulateEmployersDdl()
    {
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
    private void PopulatePositionsDdl()
    {
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
    private void PopulateDepartmentsDdl()
    {
        // Employee Info Departments DDL
        ddlDepartments.DataSource = ctx.Departments.OrderBy(d => d.deptName);
        ddlDepartments.DataValueField = "deptName";
        ddlDepartments.DataBind();
        ddlDepartments.Items.Insert(ddlDepartments.Items.Count, otherOption);
        ddlDepartments.Items.Insert(0, noOptionSpecified);
    }
    /// <summary>
    /// Populates the courses dropdown list when user clicks the "Add Course" button.
    /// </summary>
    private void PopulateCoursesDdl()
    {
        ddlNewCrs.DataSource = ctx.TrainingCourses.OrderBy(c => c.trainingName);
        ddlNewCrs.DataValueField = "trainingNo";
        ddlNewCrs.DataTextField = "trainingName";
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
    /// <returns>Returns the employee on success, null on failure.</returns>
    private Employee getEmployeeData()
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

            if (emp.startDate != null)
            {
                tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy", new CultureInfo("en-CA"));
            }

            if (emp.endDate != null)
            {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("M/d/yyyy", new CultureInfo("en-CA"));
            }

        }
        else if ((qry != null) && (qry.Count() <= 0))
        {
            Popup_Overlay("No employee with that first and last name found.", FailColour);
            return null;
        }
        else
        {
            Popup_Overlay("There was more than one employee with that first and last name.", FailColour);
            return null;
        }
        populateValidCourses();
        populateExpiredCourses();
        return emp;
    }

    /// <summary>
    /// Calls getEmployeeData(), which fetches the employee from the database using the employee's first and last name
    /// then populates the rest of the form with the employee's information.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e)
    {
        Page.Validate("vgpGetEmp");
        Page.Validate("vpgGetEmpFromDb");
        if (!Page.IsValid)
        {
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
    protected void btnCreateEmployee_Click(object sender, EventArgs e)
    {
        Page.Validate("vgpGetEmp");
        Page.Validate("vgpCreateEmp");
        if (!Page.IsValid)
        {
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

        if (!tbxStartDate.Text.Equals(String.Empty))
        {
            emp.startDate = DateTime.ParseExact(tbxStartDate.Text, dateFormat, locale);
            //emp.startDate = Convert.ToDateTime(tbxStartDate.Text);
        }
        if (!tbxEndDate.Text.Equals(String.Empty))
        {
            emp.endDate = DateTime.ParseExact(tbxEndDate.Text, dateFormat, locale);
            //emp.endDate = Convert.ToDateTime(tbxEndDate.Text);
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

        try
        {
            ctx.SaveChanges();
            Popup_Overlay("Employee successfully updated.", SuccessColour);
            return emp;
        }
        catch (Exception ex)
        {
            Popup_Overlay("An error has occured while updatin this employee. Please try again." + ex.StackTrace.ToString(), FailColour);
            return null;
        }
    }
    #endregion Update Employee
    #endregion EmployeeInfoRelated

    protected void cmvEmployeeExists_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1))
        {
            args.IsValid = true;
        }
        else if ((qry != null) && (qry.Count() <= 0))
        {
            cmvEmployeeExists.ErrorMessage = "No employee with that first and last name found.";
            return;
        }
        else
        {
            cmvEmployeeExists.ErrorMessage = "There was more than one employee with that first and last name.";
            return;
        }
    }

    protected void cmvDates_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        String strStartDate = tbxStartDate.Text;
        String strEndDate = tbxEndDate.Text;
        if (strStartDate == null || strStartDate.Equals(String.Empty))
        {
            args.IsValid = true;
            return;
        }
        if (strEndDate == null && strEndDate.Equals(String.Empty))
        {
            args.IsValid = true;
            return;
        }
        DateTime startDate = Convert.ToDateTime(strStartDate);
        DateTime endDate = Convert.ToDateTime(strEndDate);
        if (startDate.CompareTo(endDate) > 0)
        {
            args.IsValid = true;
            return;
        }
    }

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
        int id = Convert.ToInt32(tbxId.Text);
        DateTime currentDate = DateTime.Now;
        var q = ctx.Employees.Where(e => e.empNo == id)
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
        BindValidData();
        btnAddCrs.Visible = true;
    }

    /// <summary>
    /// Sets the datasource grvValidCourses to a session named query
    /// Binds the grvValidCourses
    /// </summary>
    private void BindValidData()
    {
        grvValidCourses.DataSource = Session["query"];
        grvValidCourses.DataBind();
    }
    /// <summary>
    /// Sets the datasource grvExpiredCourses to a session named expired
    /// Binds grvExpiredCourses gridview
    /// </summary>
    private void BindExpiredData()
    {
        grvExpiredCourses.DataSource = Session["expired"];
        grvExpiredCourses.DataBind();
    }

    /// <summary>
    /// Populates the expired courses gridview
    /// </summary>
    private void populateExpiredCourses()
    {
        DateTime currentDate = DateTime.Now;
        int id = Convert.ToInt32(tbxId.Text);
        var q = ctx.Employees.Where(e => e.empNo == id)
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
                                         ttNo = temp1.temp0.TT.trainingTakenNo,
                                     }
                               );

        grvExpiredCourses.DataSource = q;
        Session["expired"] = q;
        BindExpiredData();
    }

    /// <summary>
    /// Triggered when grvValidCourses is edited
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvValidCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvValidCourses.EditIndex = e.NewEditIndex;
        BindValidData();
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
                    training.startDate = DateTime.ParseExact(strStart, dateFormat, locale);
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
                    training.endDate = DateTime.ParseExact(strEnd, dateFormat, locale);
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
            BindValidData();
            BindExpiredData();
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
        BindValidData();
    }

    /// <summary>
    /// Triggered when grvValidCourses is selectedIndex is changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvValidCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayValidCourseDetails();
    }

    /// <summary>
    /// Triggered when edit is clicked on grvExpiredCourses
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvExpiredCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvExpiredCourses.EditIndex = e.NewEditIndex;
        BindExpiredData();
    }

    protected void grvExpiredCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        var q = Session["expired"];

        GridViewRow row = grvExpiredCourses.Rows[e.RowIndex];

        int empNo = Convert.ToInt32(tbxId.Text);
        int ttNo = Convert.ToInt32(grvExpiredCourses.Rows[e.RowIndex].Cells[3].Text);

        TrainingTaken training = ctx.TrainingTakens
                       .Where(tt => tt.trainingTakenNo == ttNo)
                       .Select(tt => tt).FirstOrDefault();

        if (e.NewValues["startdate"] != null)
        {
            if (!(e.NewValues["startdate"].Equals(String.Empty)))
            {
                String strStart = e.NewValues["startdate"].ToString();
                try
                {
                    training.startDate = DateTime.ParseExact(strStart, dateFormat, locale);
                }
                catch (Exception ex)
                {
                    Popup_Overlay("Unsupported date format." , FailColour);
                    return;
                }
            }

        }
        if (e.NewValues["enddate"] != null)
        {
            if (!(e.NewValues["enddate"].Equals(String.Empty)))
            {
                String strEnd = e.NewValues["enddate"].ToString();
                try
                {
                    training.endDate = DateTime.ParseExact(strEnd, dateFormat, locale);
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
            grvExpiredCourses.EditIndex = -1;
            e.Cancel = true;
            Popup_Overlay("Update successful.", SuccessColour);
            BindExpiredData();
            BindValidData();
        }
        catch (Exception ex)
        {
            Popup_Overlay("An error has occured while updating this training. Please try again." + ex.StackTrace.ToString(), FailColour);
            return;
        }
    }
    protected void grvExpiredCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvExpiredCourses.EditIndex = -1;
        BindExpiredData();
    }
    protected void grvExpiredCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayExpiredCourseDetails();
    }

    /// <summary>
    /// Called by SelectedIndexChanged methods.
    /// Used to display individual course details
    /// </summary>
    private void DisplayValidCourseDetails()
    {
        pnlNewCourse.Visible = false;
        disableDetails();
        GridViewRow row = grvValidCourses.SelectedRow;
        //String name = Convert.ToString(row.Cells[1].Text);
        int ttNo = Convert.ToInt32(row.Cells[3].Text);

        TrainingTaken training = ctx.TrainingTakens
                       .Where(tt => tt.trainingTakenNo == ttNo)
                       .Select(tt => tt).FirstOrDefault();

        TrainingCours course = ctx.TrainingCourses
            .Where(c => c.trainingNo == training.trainingNo)
            .Select(c => c).FirstOrDefault();

        if (course.trainingName.Equals("Biosafety Training") || course.trainingName.Equals("Chem Safety Training")
            || course.trainingName.Equals("Cyto. Safety Training"))
        {
            pnlCrsDetails.Visible = true;
            pnlGeneralCourseInfo.Visible = true;
            pnlLabTrainingInfo.Visible = true;

            if (course.trainingName.Equals("Biosafety Training"))
            {
                pnlBiosafetyInfo.Visible = true;
                tbxBSCDate.Text = Convert.ToDateTime(training.biosafety_BSCSeminar).ToString(dateFormat, locale);
            }
            
            rblSigned.ClearSelection();
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

            rblEvaluation.ClearSelection();
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

            if (training.respiratorDate != null)
            {
                tbxDateFit.Text = Convert.ToDateTime(training.respiratorDate).ToString(dateFormat, locale);
            }

            if (!(course.trainingName.Equals("Cyto. Safety Training")))
            {
                lblSpillDate.Visible = false;
                tbxSpillDate.Visible = false;
                if (training.spillCleanupPracticalDate != null)
                {
                    tbxSpillDate.Text = Convert.ToDateTime(training.spillCleanupPracticalDate).ToString(dateFormat, locale);
                }
            }

            tbxRespType.Text = training.respiratorType;
            tbxRespModel.Text = training.respiratorModel;
            tbxRespComment.Text = training.respiratorComments;
            tbxCert.Text = training.certificateNum;
        }
        else if (course.trainingName.Equals("Radiation Safety Training"))
        {
            pnlCrsDetails.Visible = true;
            pnlRadiationTrainingInfo.Visible = true;
            pnlGeneralCourseInfo.Visible = true;

            rblSigned.ClearSelection();
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

            rblEvaluation.ClearSelection();
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
            tbxCert.Text = training.certificateNum;
            rblDosIssued.ClearSelection();
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
            rblDosSubmitted.ClearSelection();
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

            rblRingIssued.ClearSelection();
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
        }
        else if (course.trainingName.Equals("ARC Safety Training"))
        {
            pnlCrsDetails.Visible = true;
            pnlGeneralCourseInfo.Visible = true;
            rblEvaluation.ClearSelection();

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

            tbxCert.Text = training.certificateNum;
        }
        else if (course.trainingName.Equals("X Ray Machine Training"))
        {
            pnlCrsDetails.Visible = true;
            pnlGeneralCourseInfo.Visible = true;

            rblSigned.ClearSelection();
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
        }
        else
        {
        }
    }

    private void DisplayExpiredCourseDetails() 
    {
        pnlNewCourse.Visible = false;
        pnlBiosafetyInfoExp.Visible = false;
        pnlGeneralCourseInfoExp.Visible = false;
        pnlLabTrainingInfoExp.Visible = false;
        pnlRadiationTrainingInfoExp.Visible = false;

        GridViewRow row = grvExpiredCourses.SelectedRow;
        //String name = Convert.ToString(row.Cells[1].Text);
        int ttNo = Convert.ToInt32(row.Cells[3].Text);

        TrainingTaken training = ctx.TrainingTakens
                       .Where(tt => tt.trainingTakenNo == ttNo)
                       .Select(tt => tt).FirstOrDefault();

        TrainingCours course = ctx.TrainingCourses
            .Where(c => c.trainingNo == training.trainingNo)
            .Select(c => c).FirstOrDefault();

        if (course.trainingName.Equals("Biosafety Training") || course.trainingName.Equals("Chem Safety Training")
            || course.trainingName.Equals("Cyto. Safety Training"))
        {
            pnlExpiredCourseDetails.Visible = true;
            pnlGeneralCourseInfoExp.Visible = true;
            pnlLabTrainingInfoExp.Visible = true;

            if (course.trainingName.Equals("Biosafety Training"))
            {
                pnlBiosafetyInfoExp.Visible = true;
                tbxBSCDateExp.Text = Convert.ToDateTime(training.biosafety_BSCSeminar).ToString(dateFormat, locale);
            }

            rblSignedExp.ClearSelection();
            if (training.SOPsigned != null)
            {
                if (training.SOPsigned.ToString().Equals("1"))
                {
                    rblSignedExp.SelectedValue = "Yes";
                }
                else
                {
                    rblSignedExp.SelectedValue = "No";
                }
            }

            rblEvaluationExp.ClearSelection();
            if (training.evaluation != null)
            {
                if (training.evaluation.ToString().Equals("1"))
                {
                    rblEvaluationExp.SelectedValue = "Pass";
                }
                else
                {
                    rblEvaluationExp.SelectedValue = "Fail";
                }
            }

            if (training.respiratorDate != null)
            {
                tbxDateFitExp.Text = Convert.ToDateTime(training.respiratorDate).ToString(dateFormat, locale);
            }

            if (!(course.trainingName.Equals("Cyto. Safety Training")))
            {
                lblSpillDate0.Visible = false;
                tbxSpillDateExp.Visible = false;
                if (training.spillCleanupPracticalDate != null)
                {
                    tbxSpillDateExp.Text = Convert.ToDateTime(training.spillCleanupPracticalDate).ToString(dateFormat, locale);
                }
            }

            tbxRespTypeExp.Text = training.respiratorType;
            tbxRespModelExp.Text = training.respiratorModel;
            tbxRespCommentExp.Text = training.respiratorComments;
            tbxCertExp.Text = training.certificateNum;
        }
        else if (course.trainingName.Equals("Radiation Safety Training"))
        {
            pnlExpiredCourseDetails.Visible = true;
            pnlRadiationTrainingInfoExp.Visible = true;
            pnlGeneralCourseInfoExp.Visible = true;

            rblSignedExp.ClearSelection();
            if (training.SOPsigned != null)
            {
                if (training.SOPsigned.ToString().Equals("1"))
                {
                    rblSignedExp.SelectedValue = "Yes";
                }
                else
                {
                    rblSignedExp.SelectedValue = "No";
                }
            }

            rblEvaluationExp.ClearSelection();
            if (training.evaluation != null)
            {
                if (training.evaluation.ToString().Equals("1"))
                {
                    rblEvaluationExp.SelectedValue = "Pass";
                }
                else
                {
                    rblEvaluationExp.SelectedValue = "Fail";
                }
            }
            tbxCertExp.Text = training.certificateNum;
            rblDosIssuedExp.ClearSelection();
            if (training.radiation_dosimeterIssued != null)
            {
                if (Convert.ToString(training.radiation_dosimeterIssued).Equals("1"))
                {
                    rblDosIssuedExp.SelectedValue = "Yes";
                }
                else
                {
                    rblDosIssuedExp.SelectedValue = "No";
                }
            }
            rblDosSubmittedExp.ClearSelection();
            if (training.radiation_dosimeterSubmitted != null)
            {
                if (Convert.ToString(training.radiation_dosimeterSubmitted).Equals("1"))
                {
                    rblDosSubmittedExp.SelectedValue = "Yes";
                }
                else
                {
                    rblDosSubmittedExp.SelectedValue = "No";
                }
            }

            rblRingIssuedExp.ClearSelection();
            if (training.radiation_ringIssued != null)
            {
                if (Convert.ToString(training.radiation_ringIssued).Equals("1"))
                {
                    rblRingIssuedExp.SelectedValue = "Yes";
                }
                else
                {
                    rblRingIssuedExp.SelectedValue = "No";
                }
            }
        }
        else if (course.trainingName.Equals("ARC Safety Training"))
        {
            pnlExpiredCourseDetails.Visible = true;
            pnlGeneralCourseInfoExp.Visible = true;
            rblEvaluationExp.ClearSelection();

            if (training.evaluation != null)
            {
                if (training.evaluation.ToString().Equals("1"))
                {
                    rblEvaluationExp.SelectedValue = "Pass";
                }
                else
                {
                    rblEvaluationExp.SelectedValue = "Fail";
                }
            }

            tbxCertExp.Text = training.certificateNum;
        }
        else if (course.trainingName.Equals("X Ray Machine Training"))
        {
            pnlExpiredCourseDetails.Visible = true;
            pnlGeneralCourseInfoExp.Visible = true;

            rblSignedExp.ClearSelection();
            if (training.SOPsigned != null)
            {
                if (training.SOPsigned.ToString().Equals("1"))
                {
                    rblSignedExp.SelectedValue = "Yes";
                }
                else
                {
                    rblSignedExp.SelectedValue = "No";
                }
            }
        }
        else
        {
        }
    }
    #endregion

    #region clearPage
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ResetFormControlValues(this);
        btnAddCrs.Visible = false;
        pnlCrsDetails.Visible = false;
        grvValidCourses.DataSource = null;
        grvValidCourses.DataBind();
        grvExpiredCourses.DataSource = null;
        grvExpiredCourses.DataBind();
        cpeCourses.ClientState = "true";
        cpeCourses.Collapsed = true;
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
        pnlCrsDetails.Visible = false;
        pnlBiosafetyInfo.Visible = false;
        pnlGeneralCourseInfo.Visible = false;
        pnlLabTrainingInfo.Visible = false;
        pnlRadiationTrainingInfo.Visible = false;
    }

    
    /// <summary>
    /// Saves course detail changes to the database
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    
    #region Course-related
    /// <summary>
    /// Unhides the panel to add new courses
    /// Populates the courses dropdown list
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnAddCrs_Click(object sender, EventArgs e)
    {
        disableDetails();
        pnlCrsDetails.Visible = false;
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
        int empId = Convert.ToInt32(tbxId.Text);
        
        try
        {

            DateTime newStartDate = DateTime.MinValue;
            DateTime newEndDate = DateTime.MinValue;

            if (!(tbxNewCrsStart.Text.Equals(String.Empty)))
            {
                newStartDate = DateTime.ParseExact(tbxNewCrsStart.Text, dateFormat, locale);
            }
            if (!(tbxNewCrsEnd.Text.Equals(string.Empty)))
            {
                newEndDate = DateTime.ParseExact(tbxNewCrsEnd.Text, dateFormat, locale);
            }

            TrainingTaken tt = new TrainingTaken
            {
                empNo = empId,
                trainingNo = Convert.ToInt32(ddlNewCrs.SelectedValue),
                startDate = newStartDate,
                endDate = newEndDate,
            };
            ctx.AddToTrainingTakens(tt);
            ctx.SaveChanges();
            BindValidData();
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

            training.evaluation = (rblEvaluation.SelectedValue.Equals("Pass")) ? "1" : "0";
            training.certificateNum = tbxCert.Text;

            if (course.trainingName.Equals("Biosafety Training") || course.trainingName.Equals("Chem Safety Training")
            || course.trainingName.Equals("Cyto. Safety Training"))
            {
                if (course.trainingName.Equals("Biosafety Training") && (!tbxBSCDate.Text.Equals("")))
                {
                    DateTime BSCDate = DateTime.ParseExact(tbxBSCDate.Text, dateFormat, locale);
                    //DateTime BSCDate = Convert.ToDateTime(Convert.ToDateTime(tbxBSCDate.Text, enUS));
                    training.biosafety_BSCSeminar = BSCDate;
                }
                training.SOPsigned = (rblSigned.SelectedValue.Equals("Yes")) ? "1" : "0";
                training.evaluation = (rblEvaluation.SelectedValue.Equals("Yes")) ? "1" : "0";
                if (!(tbxSpillDate.Text.Equals(String.Empty)))
                {
                    DateTime spillDate = DateTime.ParseExact(tbxSpillDate.Text, dateFormat, locale);
                    //DateTime spillDate = Convert.ToDateTime(Convert.ToDateTime(tbxSpillDate.Text, enUS));
                    training.spillCleanupPracticalDate = spillDate;
                }
                if (!(tbxDateFit.Text.Equals("")))
                {
                    DateTime dateFit = DateTime.ParseExact(tbxDateFit.Text, dateFormat, locale);
                    //DateTime dateFit = Convert.ToDateTime(Convert.ToDateTime(tbxDateFit.Text, enUS));
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
    #endregion

}