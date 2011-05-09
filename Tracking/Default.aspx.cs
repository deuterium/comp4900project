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
    // List of pre-defined employers a user can select
    public static List<String> employers = new List<String> {
        noOptionSpecified, "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", otherOption
    };
    #endregion class variables

    protected void Page_Load(object sender, EventArgs e)
    {    
        if (!IsPostBack) {
            ddlEmployers.DataSource = employers;
            ddlEmployers.DataBind();
            ddlEmployers.Items.Insert(0, noOptionSpecified);

            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptNo";
            ddlDepartments.DataTextField = "deptName";
            ddlDepartments.DataBind();
            ddlDepartments.Items.Insert(0, noOptionSpecified);

            ddlPositions.DataSource = ctx.Positions;
            ddlPositions.DataValueField = "posName";
            ddlPositions.DataBind();
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);
            ddlPositions.Items.Insert(0, noOptionSpecified);    

            lblResults.Visible = true;
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e) {
        var reports = ctx.Incidents
                      .Select(r => r);
       
        if (!tbxFirstName.Text.Equals(String.Empty)) {
            reports = reports.Where(r => r.Employee.fname.Equals(tbxFirstName.Text));
        }

        if (!tbxLastName.Text.Equals(String.Empty)) {
            reports = reports.Where(r => r.Employee.lname.Equals(tbxLastName.Text));
        }

        if (ddlPositions.SelectedValue != noOptionSpecified) {
            if (!tbxPosition.Text.Equals(String.Empty)) {
                reports = reports.Where(r => r.Employee.position.Equals(tbxPosition.Text));
            } else {
                reports = reports.Where(r => r.Employee.position.Equals(ddlPositions.SelectedValue));
            }
        }

        if (ddlEmployers.SelectedValue != noOptionSpecified) {
            if (!tbxEmployer.Text.Equals(String.Empty)) {
                reports = reports.Where(r => r.Employee.employer.Equals(tbxEmployer.Text));
            } else {
                reports = reports.Where(r => r.Employee.employer.Equals(ddlEmployers.SelectedValue));
            }
        }

        if (ddlDepartments.SelectedValue != noOptionSpecified) {
            reports = reports.Where(r => r.Employee.deptNo.Equals(ddlDepartments.SelectedValue));
        }

        //room

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

        gdvReports.DataSource = reports;
        gdvReports.DataBind();
        
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

    #region DropDownLists
    /// <summary>
    /// Calls CheckEmployeeOption(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        CheckEmployeeOption();
    }

    /// <summary>
    /// Calls CheckPositionOption(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e) {
        CheckPositionOption();
    }

    /// <summary>
    /// If the Positions drop down list is changed to the other option, display the text box for data entry.
    /// If any other value is selected, hide the textbox.
    /// </summary>
    private void CheckPositionOption() {
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            tbxPosition.Visible = true;
        } else {
            tbxPosition.Visible = false;
        }
    }

    /// <summary>
    /// If the Employers drop down list is changed to the other option, display the text box for data entry.
    /// If any other value is selected, hide the textbox.
    /// </summary>
    private void CheckEmployeeOption() {
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            tbxEmployer.Visible = true;
        } else {
            tbxEmployer.Visible = false;
        }
    }
    #endregion DropDownLists
}