using System;
using System.Linq;
using BCCAModel;
using System.Collections.Generic;
using System.Drawing;
using System.Linq.Expressions;

public partial class Tracking_Default : System.Web.UI.Page {

    #region class variables
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
    #endregion class variables

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

    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Populates the Employer, Position, and Department drop down lists.
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e)
    {    
        if (!IsPostBack) {
            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            pnlPop.Style.Value = "display:none;";
            lblResults.Visible = true;
        }
    }

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

    protected void btnSearch_Click(object sender, EventArgs e) {
        var reports = ctx.Incidents
                      .Select(r => r);

        #region Employee Info Filters
        if (!tbxFirstName.Text.Equals(String.Empty)) {
            reports = reports.Where(r => r.Employee.fname.Equals(tbxFirstName.Text));
        }

        if (!tbxLastName.Text.Equals(String.Empty)) {
            reports = reports.Where(r => r.Employee.lname.Equals(tbxLastName.Text));
        }

        if (ddlPositions.SelectedValue != noOptionSpecified) {
            if (!ddlPositions.SelectedValue.Equals(otherOption)) {
                reports = reports.Where(r => r.Employee.position.Equals(tbxPosition.Text));
            }
            else {
                reports = reports.Where(r => r.Employee.position.Equals(ddlPositions.SelectedValue));
            }
        }

        if (ddlEmployers.SelectedValue != noOptionSpecified) {
            if (ddlEmployers.SelectedValue.Equals(otherOption)) {
                reports = reports.Where(r => r.Employee.employer.Equals(tbxEmployer.Text));
            }
            else {
                reports = reports.Where(r => r.Employee.employer.Equals(ddlEmployers.SelectedValue));
            }
        }

        //if (ddlDepartments.SelectedValue != noOptionSpecified) {
        //    if (ddlDepartments.SelectedValue.Equals(otherOption)) {
        //        reports = reports.Where(r => r.Employee.Department.deptName.Equals(tbxDepartment.Text));
        //    }
        //    else {
        //        reports = reports.Where(r => r.Employee.Department.deptName.Equals(ddlDepartments.SelectedValue));
        //    }    
        //}

        if (tbxRoom.Text != String.Empty) {
            reports = reports.Where(r => r.Employee.room.Equals(tbxRoom.Text));
        }

        if (tbxSupervisor.Text != String.Empty) {
            reports = reports.Where(r => r.Employee.supervisor.Equals(tbxSupervisor.Text));
        }

        if (tbxStartDate.Text != String.Empty) {
            DateTime startDate = Convert.ToDateTime(tbxStartDate.Text);
            reports = reports.Where(r => r.Employee.startDate.Equals(startDate));
        }

        if (tbxEndDate.Text != String.Empty) {
            DateTime endDate = Convert.ToDateTime(tbxEndDate.Text);
            reports = reports.Where(r => r.Employee.endDate.Equals(endDate));
        }
        #endregion Employee Info Filters

        gdvReports.DataSource = reports;
        gdvReports.DataBind();

    }

    // Search -> find all incident reports
    // For each incident report, view report or view department or view employees involved or view courses of employee
    // view department: view employees in department, view training
}