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
                                         lastname = temp1.temp0.emp.lname,
                                         firstname = temp1.temp0.emp.fname,
                                         startdate = temp1.temp0.TT.startDate,
                                         enddate = temp1.temp0.TT.endDate
                                     }
                               );
        grvValidCourses.DataSource = q;
        Session["query"] = q;
        BindData();
    }

    private void BindData()
    {
        grvValidCourses.DataSource = Session["query"];
        grvValidCourses.DataBind();
    }

    private void populateExpiredCourses()
    {
        //int month = Convert.ToInt32(tbxMonthsRange.Text);
        DateTime currentDate = DateTime.Now;
        int empNo = Convert.ToInt32(tbxId.Text);
        //var q = from x in ctx.TrainingCourses
        //        select x;
        //var total = q.Count();

        //List<String> courseArray = ctx.TrainingCourses.Select(c => c.trainingName).ToList();

        GridView grvExpiringCourseLookUp = new GridView();
        grvExpiringCourseLookUp.DataSource = ctx.Employees.Where(e => e.empNo == empNo)
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
                                        .Where(temp1 => ((currentDate) > temp1.temp0.TT.endDate))
                                        .Select(
                                            temp1 =>
                                                new
                                                {
                                                    trainingName = temp1.TC.trainingName,
                                                    lname = temp1.temp0.emp.lname,
                                                    fname = temp1.temp0.emp.fname,
                                                    endDate = temp1.temp0.TT.endDate
                                                }
                                        );
        pnlCoursesExpired.Controls.Add(grvExpiringCourseLookUp);
        grvExpiringCourseLookUp.Caption = "<table width=\"100%\" class=\"gvCaption\"><tr><td>Expiring Courses</td></tr></table>";
        grvExpiringCourseLookUp.DataBind();
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

            
            if (emp.deptName == null)
            {
                ddlDepartments.SelectedIndex = 0;
            }
            else
                ddlDepartments.SelectedValue = emp.deptName.ToString();
                   

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
            

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("DD/MM/YYYY");
            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("DD/MM/YYYY");
            }
            setResultMsg(null, SuccessColour);

        } else if ((qry != null) && (qry.Count() <= 0)) {
            setResultMsg("No employees with that first and last name found.", FailColour);
        } else {
            setResultMsg("There was more than one employee with that first and last name.", FailColour);
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
        emp.deptName = (!(ddlDepartments.SelectedValue == "") ? Convert.ToString(ddlDepartments.SelectedValue) : null);
        emp.room = (!(tbxRoom.Text == "") ? (tbxRoom.Text) : null);
        emp.startDate = Convert.ToDateTime(tbxStartDate.Text);
        emp.endDate = (!(tbxEndDate.Text == "") ? Convert.ToDateTime(tbxEndDate.Text): (DateTime?)null);
        emp.active = "y";
        emp.supervisor = (!(tbxSupervisor.Text == "") ? (tbxSupervisor.Text) : null);

        if (ddlPositions.SelectedValue == "Other (specify)")
        {
            emp.position = tbxPosition.Text;
        }
        else
        {
            emp.position = (!(ddlPositions.SelectedIndex == 0) ? ddlPositions.SelectedValue : null);
        }

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

            String pos;
            if (ddlPositions.SelectedValue == "Other (specify)") {
                pos = tbxPosition.Text;
            } else {
                pos = (!(ddlPositions.SelectedIndex == 0 && ddlPositions.SelectedValue == "Other (specify)") ? ddlPositions.SelectedValue : null);
            }

            try
            {
                Employee employee = new Employee()

                {
                    fname = tbxFirstName.Text,
                    lname = tbxLastName.Text,
                    employer = (!(ddlEmployers.SelectedIndex == 0) ? ddlEmployers.SelectedValue : null),
                    deptName = (!(ddlDepartments.SelectedValue == "") ? ddlDepartments.SelectedValue : null),
                    room = (!(tbxRoom.Text == "") ? (tbxRoom.Text) : null),
                    startDate = tmpStartDate,
                    endDate = (!(tbxEndDate.Text == "") ? tmpEndDate : (DateTime?)null),
                    active = "y",
                    supervisor = (!(tbxSupervisor.Text == "") ? (tbxSupervisor.Text) : null),
                    position = pos,
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

    protected void grvValidCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvValidCourses.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void grvValidCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        var q = Session["query"];

        int empNo = Convert.ToInt32(tbxId.Text);

    }
    protected void grvValidCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvValidCourses.EditIndex = -1;
        BindData();
    }
}