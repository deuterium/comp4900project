using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BCCAModel;

/// <summary>
/// Summary/Default.aspx.cs
/// BCCA Cancer Research Centre
/// Safety Training Database and Website
/// Author: BCIT COMP4900 2011
/// Lindsay Fester - lindsay.m.fester@gmail.com
/// </summary>
public partial class Summary_Default : System.Web.UI.Page {
    #region Class Variables
    // The background color of disabled controls.
    public Color DisabledColor = ColorTranslator.FromHtml("#E6E6E6");
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // The date format to use for displaying dates
    public static String dateFormat = "M/d/yyyy";
    // The locale to use when converting dates
    public static CultureInfo locale = new CultureInfo("en-CA");
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
    // The pink colour of the header text.
    public static Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    // The back colour of header rows.
    public static Color HeaderBackColor = ColorTranslator.FromHtml("#F778A1");
    // The format for percents.
    public static String PercentFormat = "{0:0%}";
    // The default number of pages to show for a grid view.
    public static int DefaultGridViewPageSize = 10;
    #endregion Class Variables

    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Populates the Employer, Position, and Department drop down lists.
    /// Hides Popup panel on page load.
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
        if (role == "Lab Manager") {
            Response.Redirect("~/Default.aspx");
        }

        if (!(Session["RoleNo"].Equals(1) || Session["RoleNo"].Equals(3))) {
            //pnlAllContent.Visible = false;
            lblUnauthorizedMsg.Visible = true;
        }

        if (!IsPostBack) {
            tbxEmpSearchPages.Text = DefaultGridViewPageSize.ToString();
            tbxTrainingSearchPages.Text = DefaultGridViewPageSize.ToString();
            tbxIncidentSearchPages.Text = DefaultGridViewPageSize.ToString();
            tbxLabInspPages.Text = DefaultGridViewPageSize.ToString();
            tbxOffInspPages.Text = DefaultGridViewPageSize.ToString();
        }
        
        populateStatistics();
        populateDepartments();
        populateEmployees();
        populateTraining();
        populateIncidents();
        populateLabInspections();
        populateOfficeInspections();

        btnPrintStats.Attributes.Add("onClick", "javascript:Print('divStats')");
        btnPrintDepts.Attributes.Add("onClick", "javascript:Print('divDepts')");
        btnPrintEmps.Attributes.Add("onClick", "javascript:Print('divEmps')");
        btnPrintTraining.Attributes.Add("onClick", "javascript:Print('divTraining')");
        btnPrintIncidents.Attributes.Add("onClick", "javascript:Print('divIncidents')");
        btnPrintLabInsps.Attributes.Add("onClick", "javascript:Print('divLabInsps')");
        btnPrintOffInsps.Attributes.Add("onClick", "javascript:Print('divOffInsps')");
    }

    private void collapseAllPanels(Boolean collapse) {
        cpeStats.Collapsed = collapse;
        cpeStats.ClientState = collapse.ToString();
        cpeDept.Collapsed = collapse;
        cpeDept.ClientState = collapse.ToString();
        cpeEmployees.Collapsed = collapse;
        cpeEmployees.ClientState = collapse.ToString();
        cpeTraining.Collapsed = collapse;
        cpeTraining.ClientState = collapse.ToString();
        cpeIncidents.Collapsed = collapse;
        cpeIncidents.ClientState = collapse.ToString();
        cpeLabInspections.Collapsed = collapse;
        cpeLabInspections.ClientState = collapse.ToString();
        cpeOfficeInspections.Collapsed = collapse;
        cpeOfficeInspections.ClientState = collapse.ToString();
    }

    private string getSortDirection(String sortDirection) {
        switch (sortDirection) {
            case "ASC":
                sortDirection = "DESC";
                break;
            case "DESC":
                sortDirection = "ASC";
                break;
        }
        return sortDirection;
    }
    
    private void setPageSize(GridView gdv, TextBox tbx, int defaultPageSize) {
        if (tbx.Text == null || tbx.Text.Equals(String.Empty)) {
            gdv.AllowPaging = false;
        }
        else {
            gdv.AllowPaging = true;
            int pageSize = defaultPageSize;
            try {
                pageSize = Convert.ToInt32(tbx.Text);
            }
            catch (FormatException ex) {
                ex.ToString();
                pageSize = defaultPageSize;
                tbx.Text = defaultPageSize.ToString();
            }
            gdv.PageSize = pageSize;
        }
    }

    /// <summary>
    /// Checks if a the given String is a date in the correct format.
    /// Returns the minimum date time value if the String is null or empty.
    /// Returns the date of the String if that String holds a date in the format "MM/DD/YYYY".
    /// </summary>
    /// <param name="str">The String to extract a date from</param>
    /// <returns>The String as a date, if it's valid, otherwise the minimum date.</returns>
    private DateTime getDateTime(String strDate) {
        if (strDate == null) {
            return DateTime.MinValue;
        }
        DateTime date;
        if (strDate == null || strDate.Equals(String.Empty)) {
            return DateTime.MinValue;
        }
        try {
            date = DateTime.ParseExact(strDate, dateFormat, locale);
        }
        catch (FormatException ex) {
            ex.ToString();
            return DateTime.MinValue;
        }
        return date;
    }

    /// <summary>
    /// Makes sure the earliest date (in a range) is in the correct format (MM/DD/YYYY).
    /// For example, 13/24/2011 would be invalid but the client-side validator doesn't catch it.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The event properties.</param>
    protected void cmvEarliestDate_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;

        CustomValidator cmv = (CustomValidator)source;
        TextBox tbx = (TextBox)cmv.Parent.FindControl(cmv.ControlToValidate);
        String strDate = tbx.Text;
        if (strDate == null || strDate.Equals(String.Empty)) {
            args.IsValid = true;
            return;
        }

        DateTime date = getDateTime(tbx.Text);
        if (date.Equals(DateTime.MinValue)) {
            return;
        }

        args.IsValid = true;
    }
        
    #region Statistics
    private void populateStatistics() {
        DataTable dt = new DataTable();
        dt.Columns.Add("statName");
        dt.Columns.Add("statValue");
        DataRow dr = dt.NewRow();
                
        int labInspCount = ctx.LabInspections.Select(LI => LI).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total lab inspections:";
        dr["statValue"] = labInspCount;
        dt.Rows.Add(dr);

        int officeInspCount = ctx.OfficeInspections.Select(OI => OI).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total office inspections:";
        dr["statValue"] = officeInspCount;
        dt.Rows.Add(dr);

        int coursesCount = ctx.TrainingCourses.Select(TC => TC).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total training courses:";
        dr["statValue"] = coursesCount;
        dt.Rows.Add(dr);

        int incidentCount = ctx.Incidents.Select(I => I).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total incident reports:";
        dr["statValue"] = incidentCount;
        dt.Rows.Add(dr);

        int deptCount = ctx.Departments.Select(D => D).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total departments:";
        dr["statValue"] = deptCount;
        dt.Rows.Add(dr);

        int empCount = ctx.Employees.Select(E => E).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total employees:";
        dr["statValue"] = empCount;

        int followUpIncidentCount = ctx.Incidents.Where(inc => ((inc.followUpStatus == "0") || (inc.followUpStatus == "1"))).Select(inc => inc).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total incidents needing follow-up:";
        dr["statValue"] = followUpIncidentCount;
        dt.Rows.Add(dr);

        int followUpLabCount = ctx.LabInspections.Where(l => ((l.followUpStatus == "0") || (l.followUpStatus == "1"))).Select(l => l).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total lab inspections needing follow-up:";
        dr["statValue"] = followUpLabCount;
        dt.Rows.Add(dr);

        int followUpOfficeCount = ctx.OfficeInspections.Where(o => ((o.followUpStatus == "0") || (o.followUpStatus == "1"))).Select(o => o).Count();
        dr = dt.NewRow();
        dr["statName"] = "Total office inspections needing follow-up:";
        dr["statValue"] = followUpOfficeCount;
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr["statName"] = "Total records needing follow-up:";
        dr["statValue"] = followUpIncidentCount + followUpLabCount + followUpOfficeCount;
        dt.Rows.Add(dr);

        gdvStats.DataSource = dt;
        gdvStats.DataBind();
    }
    #endregion Statistics

    #region Departments
    private void populateDepartments() {
        var offInspDept = ctx.OfficeInspections
                          .Select(oid => oid.deptName)
                          .Distinct();

        var labInspDept = ctx.LabInspections
                          .Select(lid => lid.deptName)
                          .Distinct();

        var incRepDept = ctx.Incidents
                          .Select(i => i.Department1.deptName)
                          .Distinct();

        var empDept = ctx.Employees
                      .Select(e => e.deptName)
                      .Distinct();

        var depts = ctx.Departments
                      .Select(d => d.deptName)
                      .Distinct();

        List<String> lstDeptNames = new List<String>();
        lstDeptNames.AddRange(offInspDept.ToList());
        lstDeptNames.AddRange(labInspDept.ToList());
        lstDeptNames.AddRange(incRepDept.ToList());
        lstDeptNames.AddRange(empDept.ToList());
        lstDeptNames.AddRange(depts.ToList());
        lstDeptNames = lstDeptNames.Distinct().ToList<String>();
        
        lstDeptNames = applyDeptFilters(lstDeptNames);
        
        lstDeptNames.Sort();
        //lstDeptNames.RemoveAt(0);
        if (lstDeptNames.Count() > 0 && (lstDeptNames[0] == null || lstDeptNames[0].Equals(String.Empty))) {
            //lstDeptNames[0] = "Other";
            lstDeptNames.RemoveAt(0);
        }

        DataTable dt = new DataTable();
        dt.Columns.Add("deptNo", typeof(int));
        dt.Columns.Add("deptName", typeof(String));
        dt.Columns.Add("employees", typeof(int));
        dt.Columns.Add("incidents", typeof(int));
        dt.Columns.Add("labInspections", typeof(int));
        dt.Columns.Add("officeInspections", typeof(int));

        int totalEmps = 0;
        int totalIncidents = 0;
        int totalOfficeInsp = 0;
        int totalLabInsp = 0;

        foreach (String deptName in lstDeptNames) {
            DataRow dr = dt.NewRow();

            int emps = ctx.Employees.Where(e => e.deptName.Equals(deptName)).Select(e => e.empNo).Count();
            int incidents = 0;
            int officeInsp = ctx.OfficeInspections.Where(oi => oi.deptName.Equals(deptName)).Select(oi => oi).Count();
            int labInsp = ctx.LabInspections.Where(li => li.deptName.Equals(deptName)).Select(li => li).Count();

            String strDeptNo = "-";
            String incidentCount = "-";
            if (ctx.Departments.Select(d => d.deptName).Contains(deptName)) {
                int deptNo = ctx.Departments.Where(d => d.deptName.Equals(deptName)).Select(d => d.deptNo).FirstOrDefault();
                strDeptNo = deptNo.ToString();
                incidents = ctx.Incidents.Where(i => i.deptNo == deptNo).Select(i => i.incidentNo).Count();
                incidentCount = incidents.ToString();                
            }

            dr["deptNo"] = strDeptNo;
            dr["deptName"] = deptName;
            dr["employees"] = emps;
            dr["incidents"] = incidentCount;
            dr["officeInspections"] = officeInsp;
            dr["labInspections"] = labInsp;

            dt.Rows.Add(dr);

            totalEmps += emps;
            totalIncidents += incidents;
            totalOfficeInsp += officeInsp;
            totalLabInsp += labInsp;
        }

        drDeptTotal = dt.NewRow();
        drDeptTotal["deptNo"] = 0;
        drDeptTotal["deptName"] = "Total: ";
        drDeptTotal["employees"] = totalEmps;
        drDeptTotal["incidents"] = totalIncidents;
        drDeptTotal["officeInspections"] = totalOfficeInsp;
        drDeptTotal["labInspections"] = totalLabInsp;

        gdvDepts_DataView = new DataView(dt);
        bindDepts();
    }

    private DataRow drDeptTotal = null;

    private void bindDepts() {
        gdvDepts.DataSource = gdvDepts_DataView;
        gdvDepts.DataBind();
    }

    protected void gdvDepts_RowDataBound(Object sender, GridViewRowEventArgs e) {
        if (e.Row.RowType == DataControlRowType.Footer) {
            GridViewRow footer = e.Row;
            for (int i = 1; i < footer.Cells.Count - 1; i++) {
                footer.Cells[i].Text = drDeptTotal[i].ToString();
            }                        
            footer.Cells[0].Visible = false;
            footer.Cells[1].ColumnSpan = 2;
            footer.Cells[footer.Cells.Count - 1].Text = String.Empty;
        }
    }

    private List<String> applyDeptFilters(List<String> depts) {
        setPageSize(gdvDepts, tbxDeptSearchPages, 20); 
        if (tbxDeptSearchDept.Text != null && !(tbxDeptSearchDept.Text.Equals(String.Empty))) {
            if (cbxDeptSearchDept.Checked) {
                depts = depts.Where(deptName => deptName != null && deptName.Equals(tbxDeptSearchDept.Text)).ToList<String>();
            }
            else {
                depts = depts.Where(deptName => deptName != null && deptName.Contains(tbxDeptSearchDept.Text)).ToList<String>();
            }
        }
        return depts;
    }
    
    /// <summary>
    /// Triggered when a department is selected from the grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gdvDepts_SelectedIndexChanged(object sender, EventArgs e) {
        String deptName = gdvDepts.SelectedRow.Cells[1].Text;
        selectDepartment(deptName);
    }

    private void selectDepartment(String deptName) {
        collapseAllPanels(false);
        cpeStats.Collapsed = true;
        cpeStats.ClientState = "true";
        cpeDept.Collapsed = true;
        cpeDept.ClientState = "true";
        tbxEmpSearchDept.Text = deptName;
        cbxEmpSearchDept.Checked = true;
        populateEmployees();
        tbxTrainingSearchDept.Text = deptName;
        cbxTrainingSearchDept.Checked = true;
        populateTraining();
        tbxIncSearchDept.Text = deptName;
        cbxIncSearchDept.Checked = true;
        populateIncidents();
        tbxLabInspDept.Text = deptName;
        cbxLabInspDept.Checked = true;
        populateLabInspections();
        tbxOffInspDept.Text = deptName;
        cbxOffInspDept.Checked = true;
        populateOfficeInspections();
    }

    /// <summary>
    /// Re-populates the grid view so it reflects any modified search filters.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnDeptSearch_Click(object sender, EventArgs e) {
        populateDepartments();
    }
    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnDeptSearchReset_Click(object sender, EventArgs e) {
        resetDeptartmentSearch();
    }

    private void resetDeptartmentSearch() {
        tbxDeptSearchDept.Text = String.Empty;
        cbxDeptSearchDept.Checked = false;
        populateDepartments();
    }

    #region gdvDepts - Sorting and Paging
    private DataView gdvDepts_DataView = new DataView();

    private string gdvDepts_SortExpression {
        get { return ViewState["gdvDepts_SortExpression"] as string ?? String.Empty; }
        set { ViewState["gdvDepts_SortExpression"] = value; }
    }

    private string gdvDepts_SortDirection {
        get { return ViewState["gdvDepts_SortDirection"] as string ?? "ASC"; }
        set { ViewState["gdvDepts_SortDirection"] = value; }
    }

    protected void gdvDepts_Sorting(object sender, GridViewSortEventArgs e) {
        gdvDepts_SortDirection = getSortDirection(gdvDepts_SortDirection);
        gdvDepts_SortExpression = e.SortExpression + " " + gdvDepts_SortDirection;
        gdvDepts_Sort(gdvDepts.PageIndex);
    }

    protected void gdvDepts_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        gdvDepts.PageIndex = e.NewPageIndex;
        gdvDepts_Sort(gdvDepts.PageIndex);
    }
    
    private void gdvDepts_Sort(int gdvPageIndex) {
        gdvDepts_DataView.Sort = gdvDepts_SortExpression;
        bindDepts();
        gdvDepts.PageIndex = gdvPageIndex;
    }
    #endregion gdvDepts - Sorting and Paging
    #endregion Departments

    #region Employees
    private void populateEmployees() {
        DataTable dt = new DataTable();
        dt.Columns.Add("empNo", typeof(int));
        dt.Columns.Add("empDept", typeof(String)); 
        dt.Columns.Add("empName", typeof(String));
        dt.Columns.Add("employer", typeof(String));
        dt.Columns.Add("incidents", typeof(int));
        dt.Columns.Add("totalCourses", typeof(int));
        dt.Columns.Add("validCourses", typeof(int));
        dt.Columns.Add("expiredCourses", typeof(int));
        
        List<Employee> emps = applyEmployeeFilters();
        emps.OrderBy(e => e.deptName).ThenBy(e => (e.fname + " " + e.lname));

        int totalValid = 0;
        int totalExpired = 0;
        int totalCourses = 0;

        foreach (Employee emp in emps) {
            var training = ctx.TrainingTakens
                         .Where(tt => tt.empNo.Equals(emp.empNo))
                         .Where(tt => (tt.active == null || tt.active.Equals("1")))
                         .Where(tt => tt.trainingTakenNo.Equals(
                                     ctx.TrainingTakens
                                     .Where(ttRecent => ttRecent.TrainingCours.trainingName.Equals(tt.TrainingCours.trainingName))
                                     .Select(ttRecent => ttRecent)
                                     .OrderByDescending(ttRecent => ttRecent.startDate).FirstOrDefault().trainingTakenNo))
                         .Select(tt => tt);

            int valid = training.Where(tt => (tt.endDate == null) || (DateTime.Now < tt.endDate)).Count();
            int expired = training.Where(tt => (tt.endDate != null) && (DateTime.Now >= tt.endDate)).Count();
            int courses = training.Count();
                        
            DataRow dr = dt.NewRow();
            dr["empNo"] = emp.empNo;
            dr["empDept"] = emp.deptName;
            dr["empName"] = emp.fname + " " + emp.lname;
            dr["employer"] = emp.employer;
            dr["incidents"] = 0;
            dr["totalCourses"] = courses;
            dr["validCourses"] = valid;
            dr["expiredCourses"] = expired;
            

            totalValid += valid;
            totalExpired += expired;
            totalCourses += courses;

            dt.Rows.Add(dr);
        }

        drEmpTotal = dt.NewRow();
        drEmpTotal["empNo"] = 0;
        drEmpTotal["empDept"] = "Total: ";
        drEmpTotal["empName"] = String.Empty;
        drEmpTotal["employer"] = String.Empty;
        drEmpTotal["incidents"] = 0;
        drEmpTotal["totalCourses"] = totalCourses;
        drEmpTotal["validCourses"] = totalValid;
        drEmpTotal["expiredCourses"] = totalExpired;
        
        gdvEmployees_DataView = new DataView(dt);

        bindEmps();
    }

    private DataRow drEmpTotal = null;

    private void bindEmps() {
        gdvEmployees.DataSource = gdvEmployees_DataView;
        gdvEmployees.DataBind();
    }

    protected void gdvEmployees_RowDataBound(Object sender, GridViewRowEventArgs e) {
        if (e.Row.RowType == DataControlRowType.Footer) {
            GridViewRow footer = e.Row;
            for (int i = 1; i < footer.Cells.Count - 1; i++) {
                footer.Cells[i].Text = drEmpTotal[i].ToString();
            }

            footer.Cells[0].Visible = false;
            footer.Cells[2].Visible = false;
            footer.Cells[3].Visible = false;
            footer.Cells[1].ColumnSpan = 4;
            footer.Cells[footer.Cells.Count - 1].Text = String.Empty;
        }
    }

    private List<Employee> applyEmployeeFilters() {
        setPageSize(gdvEmployees, tbxEmpSearchPages, DefaultGridViewPageSize);

        var qry = ctx.Employees.Select(emp => emp);

        if (tbxEmpSearchDept.Text != null && !(tbxEmpSearchDept.Text.Equals(String.Empty))) {
            if (cbxEmpSearchDept.Checked) {
                qry = qry.Where(emp => emp.deptName.Equals(tbxEmpSearchDept.Text));
            }
            else {
                qry = qry.Where(emp => emp.deptName.Contains(tbxEmpSearchDept.Text));
            }
        }

        if (tbxEmpSearchName.Text != null && !(tbxEmpSearchName.Text.Equals(String.Empty))) {
            if (cbxEmpSearchName.Checked) {
                qry = qry.Where(emp => (emp.fname + " " + emp.lname).Equals(tbxEmpSearchName.Text));
            }
            else {
                qry = qry.Where(emp => (emp.fname + " " + emp.lname).Contains(tbxEmpSearchName.Text));
            }
        }

        if (tbxEmpSearchEmployer.Text != null && !(tbxEmpSearchEmployer.Text.Equals(String.Empty))) {
            if (cbxEmpSearchEmployer.Checked) {
                qry = qry.Where(emp => emp.employer.Equals(tbxEmpSearchEmployer.Text));
            }
            else {
                qry = qry.Where(emp => emp.employer.Contains(tbxEmpSearchEmployer.Text));
            }
        }

        if (cbxEmpSearchCurrent.Checked && cbxEmpSearchFormer.Checked) {
            // if both current and former are checked, do nothing to query
        }
        else if (cbxEmpSearchFormer.Checked) {
            qry = qry.Where(emp => (emp.endDate != null) && (DateTime.Now > emp.endDate));
        }
        else if (cbxEmpSearchCurrent.Checked) {
            qry = qry.Where(emp => (emp.endDate == null) || (DateTime.Now <= emp.endDate));
        }
        else {
            return new List<Employee>(); // no results if neither is checked
        }

        return qry.ToList<Employee>();
    }

    /// <summary>
    /// Triggered when an employee is selected from the grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gdvEmployees_SelectedIndexChanged(object sender, EventArgs e) {
        String strId = gdvEmployees.SelectedRow.Cells[0].Text;
        selectEmployee(strId);
    }

    private void selectEmployee(String id) {
        Response.Redirect("~/Training/Default.aspx?id=" + id);
    }
    
    /// <summary>
    /// Re-populates the grid view so it reflects any modified search filters.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnEmpSearch_Click(object sender, EventArgs e) {
        populateEmployees();
    }
    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnEmpSearchReset_Click(object sender, EventArgs e) {
        resetEmpSearch();
    }

    private void resetEmpSearch() {
        tbxEmpSearchDept.Text = String.Empty;
        cbxEmpSearchDept.Checked = false;
        tbxEmpSearchName.Text = String.Empty;
        cbxEmpSearchName.Checked = false;
        tbxEmpSearchEmployer.Text = String.Empty;
        cbxEmpSearchEmployer.Checked = false;
        cbxEmpSearchCurrent.Checked = true;
        cbxEmpSearchFormer.Checked = false;
        populateEmployees();
    }
    
    #region gdvEmployees - Sorting and Paging
    private DataView gdvEmployees_DataView = new DataView();

    private string gdvEmployees_SortExpression {
        get { return ViewState["gdvEmployees_SortExpression"] as string ?? String.Empty; }
        set { ViewState["gdvEmployees_SortExpression"] = value; }
    }

    private string gdvEmployees_SortDirection {
        get { return ViewState["gdvEmployees_SortDirection"] as string ?? "ASC"; }
        set { ViewState["gdvEmployees_SortDirection"] = value; }
    }

    protected void gdvEmployees_Sorting(object sender, GridViewSortEventArgs e) {
        gdvEmployees_SortDirection = getSortDirection(gdvEmployees_SortDirection);
        gdvEmployees_SortExpression = e.SortExpression + " " + gdvEmployees_SortDirection;
        gdvEmployees_Sort(gdvEmployees.PageIndex);
    }

    protected void gdvEmployees_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        gdvEmployees.PageIndex = e.NewPageIndex;
        gdvEmployees_Sort(gdvEmployees.PageIndex);
    }

    private void gdvEmployees_Sort(int gdvPageIndex) {
        gdvEmployees_DataView.Sort = gdvEmployees_SortExpression;
        bindEmps();
        gdvEmployees.PageIndex = gdvPageIndex;
    }
    #endregion gdvEmployees - Sorting and Paging
    #endregion Employees

    #region Training
    private void populateTraining() {
        List<TrainingTaken> training = applyTrainingFilters();
        var qry = training
                  .Select(tt => new {
                      ttNo = tt.trainingTakenNo,
                      empDept = tt.Employee.deptName,
                      empName = tt.Employee.fname + " " + tt.Employee.lname,
                      courseName = tt.TrainingCours.trainingName,
                      courseDate = tt.startDate,
                      expiryDate = tt.endDate,
                  });
        
        qry = qry.OrderBy(tt => tt.expiryDate);

        DataTable dt = new DataTable();
        dt.Columns.Add("ttNo", typeof(int));
        dt.Columns.Add("empDept", typeof(String));
        dt.Columns.Add("empName", typeof(String));
        dt.Columns.Add("courseName", typeof(String));
        dt.Columns.Add("courseDate", typeof(DateTime));
        dt.Columns.Add("expiryDate", typeof(DateTime));
        dt.Columns.Add("expired", typeof(String));
                
        foreach (var item in qry) {
            DataRow dr = dt.NewRow();
            dr["ttNo"] = item.ttNo;
            dr["empDept"] = item.empDept;
            dr["empName"] = item.empName;
            dr["courseName"] = item.courseName;
            dr["courseDate"] = item.courseDate;
            dr["expiryDate"] = item.expiryDate == null ? DateTime.MaxValue : item.expiryDate;
            dr["expired"] = item.expiryDate <= DateTime.Now ? "*" : String.Empty;
            dt.Rows.Add(dr);
        }

        gdvTraining_DataView = new DataView(dt);
        bindTraining();
    }

    private void bindTraining() {
        gdvTraining.DataSource = gdvTraining_DataView;
        gdvTraining.DataBind();
    }

    private List<TrainingTaken> applyTrainingFilters() {
        setPageSize(gdvTraining, tbxTrainingSearchPages, DefaultGridViewPageSize);
        var qry = ctx.TrainingTakens.Select(tt => tt);

        if (tbxTrainingSearchDept.Text != null && !(tbxTrainingSearchDept.Text.Equals(String.Empty))) {
            if (cbxTrainingSearchDept.Checked) {
                qry = qry.Where(tt => tt.Employee.deptName.Equals(tbxTrainingSearchDept.Text));
            }
            else {
                qry = qry.Where(tt => tt.Employee.deptName.Contains(tbxTrainingSearchDept.Text));
            }
        }

        if (tbxTrainingSearchEmp.Text != null && !(tbxTrainingSearchEmp.Text.Equals(String.Empty))) {
            if (cbxTrainingSearchEmp.Checked) {
                qry = qry.Where(tt => (tt.Employee.fname + " " + tt.Employee.lname).Equals(tbxTrainingSearchEmp.Text));
            }
            else {
                qry = qry.Where(tt => (tt.Employee.fname + " " + tt.Employee.lname).Contains(tbxTrainingSearchEmp.Text));
            }
        }

        if (tbxTrainingSearchCourse.Text != null && !(tbxTrainingSearchCourse.Text.Equals(String.Empty))) {
            if (cbxTrainingSearchCourse.Checked) {
                qry = qry.Where(tt => tt.TrainingCours.trainingName.Equals(tbxTrainingSearchCourse.Text));
            }
            else {
                qry = qry.Where(tt => tt.TrainingCours.trainingName.Contains(tbxTrainingSearchCourse.Text));
            }
        }

        DateTime earliestCourseDate = getDateTime(tbxEarliestCourseDate.Text);
        if (!(earliestCourseDate.Equals(DateTime.MinValue))) {
            qry = qry.Where(tt => tt.startDate >= earliestCourseDate);
        }

        DateTime latestCourseDate = getDateTime(tbxLatestCourseDate.Text);
        if (!(latestCourseDate.Equals(DateTime.MinValue))) {
            qry = qry.Where(tt => tt.startDate <= latestCourseDate);
        }

        DateTime earliestExpiryDate = getDateTime(tbxEarliestExpiryDate.Text);
        if (!(earliestExpiryDate.Equals(DateTime.MinValue))) {
            qry = qry.Where(tt => (tt.endDate == null || tt.endDate >= earliestExpiryDate));
        }

        DateTime latestExpiryDate = getDateTime(tbxLatestExpiryDate.Text);
        if (!(latestExpiryDate.Equals(DateTime.MinValue))) {
            qry = qry.Where(tt => tt.endDate <= latestExpiryDate);
        }

        if (rblMostRecent.SelectedValue.ToString().Equals("mostRecent")) {
            qry = qry.Where(tt => tt.trainingTakenNo.Equals(
                            ctx.TrainingTakens
                            .Where(ttRecent => ttRecent.TrainingCours.trainingName.Equals(tt.TrainingCours.trainingName))
                            .Select(ttRecent => ttRecent)
                            .OrderByDescending(ttRecent => ttRecent.startDate).FirstOrDefault().trainingTakenNo));
        }

        if (!cbxIncludeDeleted.Checked) {
            qry = qry.Where(tt => (tt.active == null || tt.active.Equals("1")));
        }

        if (cbxIncludeExpired.Checked && cbxIncludeValid.Checked) {
            // if both expired and valid are checked, do nothing to query
        }
        else if (cbxIncludeExpired.Checked) {
            qry = qry.Where(tt => (tt.endDate != null) && (DateTime.Now >= tt.endDate));
        }
        else if (cbxIncludeValid.Checked) {
            qry = qry.Where(tt => (tt.endDate == null) || (DateTime.Now < tt.endDate));
        }
        else {
            return new List<TrainingTaken>(); // no results if neither is checked
        }

        return qry.ToList<TrainingTaken>();
    }

    protected void gdvTraining_RowDataBound(Object sender, GridViewRowEventArgs e) {
        if (e.Row.RowType != DataControlRowType.DataRow) {
            return;
        }

        GridViewRow row = e.Row;
         // if the expiry date is null
        if (row.Cells[5].Text.Equals("12/31/9999")) {
            row.Cells[5].Text = String.Empty;
            return; // not expired, don't need to highlight
        }

        if (!cbxHighlightExpired.Checked) {
            return;
        }

        if (row.Cells[6].Text.Equals("*")) {
            e.Row.ForeColor = Color.Red;
        }
    }

    /// <summary>
    /// Triggered when a training record is selected from the grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gdvTraining_SelectedIndexChanged(object sender, EventArgs e) {
        String name = gdvTraining.SelectedRow.Cells[2].Text;
        int empNo = -1;
        Employee employee = ctx.Employees.Where(emp => (emp.fname + " " + emp.lname).Equals(name)).FirstOrDefault();
        if (employee != null) {
            empNo = employee.empNo;
        }
        selectTraining(empNo);
    }

    private void selectTraining(int id) {
        Response.Redirect("~/Training/Default.aspx?id=" + id);
    }

    /// <summary>
    /// Checkes latest date is in correct format and compares the earliest and latest dates in a range.
    /// Makes sure latest date is after earliest date.
    /// If the earliest date is invalid, ignores it (the other validator will catch it).
    /// If the latest date is in an invalid format, validates false, sets appropriate message.
    /// If the latest date is null or empty, validates true becuase there's nothing to compare.
    /// If both dates are specified and in the proper format, the dates are compared.
    /// If the latest date is before the earliest date, validates false.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The event properties.</param>
    protected void cmvLatestCourseDate_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;
        String strLatestDate = tbxLatestCourseDate.Text;
        DateTime earliestDate = getDateTime(tbxEarliestCourseDate.Text);
        DateTime latestDate = getDateTime(tbxLatestCourseDate.Text);

        // end date
        if (strLatestDate == null || strLatestDate.Equals(String.Empty)) {
            args.IsValid = true; // nothing to compare, so it's valid
            return;
        }

        if (latestDate.Equals(DateTime.MinValue)) {
            cmvLatestCourseDate.ErrorMessage = "Latest course date must be in the format 'MM/DD/YYYY'";
            return;
        }

        if (earliestDate.Equals(DateTime.MinValue)) {
            args.IsValid = true;
            return; // other server validator will catch the error
        }

        // comparison
        if (latestDate.CompareTo(earliestDate) > 0) {
            args.IsValid = true;
            return;
        }

        cmvLatestCourseDate.ErrorMessage = "Latest course date must be later than earliest course date.";
    }

    /// <summary>
    /// Checkes latest date is in correct format and compares the earliest and latest dates in a range.
    /// Makes sure latest date is after earliest date.
    /// If the earliest date is invalid, ignores it (the other validator will catch it).
    /// If the latest date is in an invalid format, validates false, sets appropriate message.
    /// If the latest date is null or empty, validates true becuase there's nothing to compare.
    /// If both dates are specified and in the proper format, the dates are compared.
    /// If the latest date is before the earliest date, validates false.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The event properties.</param>
    protected void cmvLatestExpiryDate_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;
        String strLatestDate = tbxLatestExpiryDate.Text;
        DateTime earliestDate = getDateTime(tbxEarliestExpiryDate.Text);
        DateTime latestDate = getDateTime(tbxLatestExpiryDate.Text);

        // end date
        if (strLatestDate == null || strLatestDate.Equals(String.Empty)) {
            args.IsValid = true; // nothing to compare, so it's valid
            return;
        }

        if (latestDate.Equals(DateTime.MinValue)) {
            cmvLatestExpiryDate.ErrorMessage = "Latest expiry date must be in the format 'MM/DD/YYYY'";
            return;
        }

        if (earliestDate.Equals(DateTime.MinValue)) {
            args.IsValid = true;
            return; // other server validator will catch the error
        }

        // comparison
        if (latestDate.CompareTo(earliestDate) > 0) {
            args.IsValid = true;
            return;
        }

        cmvLatestExpiryDate.ErrorMessage = "Latest expiry date must be later than earliest expiry date.";
    }

    /// <summary>
    /// Re-populates the grid view so it reflects any modified search filters.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnTrainingSearch_Click(object sender, EventArgs e) {
        populateTraining();
    }
    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnTrainingSearchReset_Click(object sender, EventArgs e) {
        resetTrainingSearch();
    }

    private void resetTrainingSearch() {
        tbxTrainingSearchDept.Text = String.Empty;
        cbxTrainingSearchDept.Checked = false;
        tbxTrainingSearchEmp.Text = String.Empty;
        cbxTrainingSearchEmp.Checked = false;
        tbxTrainingSearchCourse.Text = String.Empty;
        cbxTrainingSearchCourse.Checked = false;
        tbxEarliestCourseDate.Text = String.Empty;
        tbxLatestCourseDate.Text = String.Empty;
        tbxEarliestExpiryDate.Text = String.Empty;
        tbxLatestExpiryDate.Text = String.Empty;
        rblMostRecent.SelectedValue = "mostRecent";
        cbxIncludeDeleted.Checked = false;
        cbxIncludeValid.Checked = true;
        cbxIncludeExpired.Checked = true;
        cbxHighlightExpired.Checked = true;
        populateTraining();
    }
    
    #region gdvTraining - Sorting and Paging
    private DataView gdvTraining_DataView = new DataView();

    private string gdvTraining_SortExpression {
        get { return ViewState["gdvTraining_SortExpression"] as string ?? String.Empty; }
        set { ViewState["gdvTraining_SortExpression"] = value; }
    }

    private string gdvTraining_SortDirection {
        get { return ViewState["gdvTraining_SortDirection"] as string ?? "ASC"; }
        set { ViewState["gdvTraining_SortDirection"] = value; }
    }

    protected void gdvTraining_Sorting(object sender, GridViewSortEventArgs e) {
        gdvTraining_SortDirection = getSortDirection(gdvTraining_SortDirection);
        gdvTraining_SortExpression = e.SortExpression + " " + gdvTraining_SortDirection;
        gdvTraining_Sort(gdvTraining.PageIndex);
    }

    protected void gdvTraining_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        gdvTraining.PageIndex = e.NewPageIndex;
        gdvTraining_Sort(gdvTraining.PageIndex);
    }

    private void gdvTraining_Sort(int gdvPageIndex) {
        gdvTraining_DataView.Sort = gdvTraining_SortExpression;
        bindTraining();
        gdvTraining.PageIndex = gdvPageIndex;
    }
    #endregion gdvEmployees - Sorting and Paging
    #endregion Training

    #region Incidents
    private void populateIncidents() {
        List<Incident> incidents = applyIncidentFilters();

        var qry = incidents
                  .Select(inc => new {
                      incidentNo = inc.incidentNo,
                      employee = inc.Employee.fname + " " + inc.Employee.lname,
                      deptName = inc.Department == null ? "Other" : inc.Department.deptName,
                      incidentDate = inc.p1_dateOfIncident,
                      reportDate = inc.p1_dateReported,
                      submitter = inc.reportSubmitter
                  });

        qry = qry.OrderByDescending(inc => inc.incidentDate);

        DataTable dt = new DataTable();
        dt.Columns.Add("incidentNo", typeof(int));
        dt.Columns.Add("deptName", typeof(String));
        dt.Columns.Add("employee", typeof(String));
        dt.Columns.Add("incidentDate", typeof(DateTime));
        dt.Columns.Add("reportDate", typeof(DateTime));
        dt.Columns.Add("submitter", typeof(String));

        foreach (var incident in qry) {
            DataRow dr = dt.NewRow();
            dr["incidentNo"] = incident.incidentNo;
            dr["deptName"] = incident.deptName;
            dr["employee"] = incident.employee;
            dr["incidentDate"] = incident.incidentDate;
            dr["reportDate"] = incident.reportDate;
            dr["submitter"] = incident.submitter;
            dt.Rows.Add(dr);
        }

        gdvIncidents_DataView = new DataView(dt);
        bindIncidents();
    }

    private void bindIncidents() {
        gdvIncidents.DataSource = gdvIncidents_DataView;
        gdvIncidents.DataBind();
    }

    private List<Incident> applyIncidentFilters() {
        setPageSize(gdvIncidents, tbxIncidentSearchPages, DefaultGridViewPageSize);
        List<Incident> incidents = ctx.Incidents.ToList<Incident>();
        collapseAllFilterPanels();

        if (rblAdvancedSearch.SelectedValue.Equals("yes")) {  
            incidents = applyAdvancedIncidentFilters();
        }

        if (!tbxIncSearchDept.Text.Equals(String.Empty)) {
            String dept = tbxIncSearchDept.Text;
            if (!cbxIncSearchDept.Checked) {
                incidents = incidents.Where(i => ((i.Department == null) ? false : i.Department.deptName.Contains(dept))).ToList<Incident>();
            }
            else {
                incidents = incidents.Where(i => ((i.Department == null) ? false : i.Department.deptName.Equals(dept))).ToList<Incident>();
            }
        }

        if (!tbxIncSearchEmp.Text.Equals(String.Empty)) {
            String emp = tbxIncSearchEmp.Text;
            if (!cbxIncSearchEmp.Checked) {
                incidents = incidents.Where(i => (i.Employee.fname + " " + i.Employee.lname).Contains(emp)).ToList<Incident>();
            }
            else {
                incidents = incidents.Where(i => (i.Employee.fname + " " + i.Employee.lname).Equals(emp)).ToList<Incident>();
            }
        }

        if (!tbxIncSearchSubmitter.Text.Equals(String.Empty)) {
            String submitter = tbxIncSearchSubmitter.Text;
            if (!cbxIncSearchSubmitter.Checked) {
                incidents = incidents.Where(i => (i.reportSubmitter).Contains(submitter)).ToList<Incident>();
            }
            else {
                incidents = incidents.Where(i => (i.reportSubmitter).Equals(submitter)).ToList<Incident>();
            }
        }

        DateTime date = getDateTime(tbxEarliestIncidentDate.Text);
        if (!(date.Equals(DateTime.MinValue))) {
            incidents = incidents.Where(i => i.p1_dateOfIncident >= date).ToList<Incident>();
        }

        date = getDateTime(tbxLatestIncidentDate.Text);
        if (!(date.Equals(DateTime.MinValue))) {
            incidents = incidents.Where(i => i.p1_dateOfIncident <= date).ToList<Incident>();
        }

        date = getDateTime(tbxEarliestReportDate.Text);
        if (!(date.Equals(DateTime.MinValue))) {
            incidents = incidents.Where(i => i.p1_dateOfIncident >= date).ToList<Incident>();
        }

        date = getDateTime(tbxLatestReportDate.Text);
        if (!(date.Equals(DateTime.MinValue))) {
            incidents = incidents.Where(i => i.p1_dateOfIncident <= date).ToList<Incident>();
        }

        return incidents;
    }
    
    /// <summary>
    /// Triggered when an incident is selected from the grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gdvIncidents_SelectedIndexChanged(object sender, EventArgs e) {
        String strId = gdvIncidents.SelectedRow.Cells[0].Text;
        selectIncident(strId);
    }

    /// <summary>
    /// Redirects browser to a separate page for viewing the incident report.
    /// </summary>
    /// <param name="id"></param>
    private void selectIncident(String id) {
        Response.Redirect("~/View/IncidentReport.aspx?id=" + id);
    }

    /// <summary>
    /// Checkes latest date is in correct format and compares the earliest and latest dates in a range.
    /// Makes sure latest date is after earliest date.
    /// If the earliest date is invalid, ignores it (the other validator will catch it).
    /// If the latest date is in an invalid format, validates false, sets appropriate message.
    /// If the latest date is null or empty, validates true becuase there's nothing to compare.
    /// If both dates are specified and in the proper format, the dates are compared.
    /// If the latest date is before the earliest date, validates false.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The event properties.</param>
    protected void cmvLatestIncidentDate_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;
        String strLatestDate = tbxLatestIncidentDate.Text;
        DateTime earliestDate = getDateTime(tbxEarliestIncidentDate.Text);
        DateTime latestDate = getDateTime(tbxLatestIncidentDate.Text);

        // end date
        if (strLatestDate == null || strLatestDate.Equals(String.Empty)) {
            args.IsValid = true; // nothing to compare, so it's valid
            return;
        }

        if (latestDate.Equals(DateTime.MinValue)) {
            cmvLatestIncidentDate.ErrorMessage = "Latest incident date must be in the format 'MM/DD/YYYY'";
            return;
        }

        if (earliestDate.Equals(DateTime.MinValue)) {
            args.IsValid = true;
            return; // other server validator will catch the error
        }

        // comparison
        if (latestDate.CompareTo(earliestDate) > 0) {
            args.IsValid = true;
            return;
        }

        cmvLatestIncidentDate.ErrorMessage = "Latest incident date must be later than earliest incident date.";
    }

    /// <summary>
    /// Checkes latest date is in correct format and compares the earliest and latest dates in a range.
    /// Makes sure latest date is after earliest date.
    /// If the earliest date is invalid, ignores it (the other validator will catch it).
    /// If the latest date is in an invalid format, validates false, sets appropriate message.
    /// If the latest date is null or empty, validates true becuase there's nothing to compare.
    /// If both dates are specified and in the proper format, the dates are compared.
    /// If the latest date is before the earliest date, validates false.
    /// </summary>
    /// <param name="source">The validator control.</param>
    /// <param name="args">The event properties.</param>
    protected void cmvLatestReportDate_ServerValidate(object source, ServerValidateEventArgs args) {
        args.IsValid = false;
        String strLatestDate = tbxLatestReportDate.Text;
        DateTime earliestDate = getDateTime(tbxEarliestReportDate.Text);
        DateTime latestDate = getDateTime(tbxLatestReportDate.Text);

        // end date
        if (strLatestDate == null || strLatestDate.Equals(String.Empty)) {
            args.IsValid = true; // nothing to compare, so it's valid
            return;
        }
        if (latestDate.Equals(DateTime.MinValue)) {
            cmvLatestReportDate.ErrorMessage = "Latest report date must be in the format 'MM/DD/YYYY'";
            return;
        }
        if (earliestDate.Equals(DateTime.MinValue)) {
            args.IsValid = true;
            return; // other server validator will catch the error
        }
        // comparison
        if (latestDate.CompareTo(earliestDate) > 0) {
            args.IsValid = true;
            return;
        }
        cmvLatestReportDate.ErrorMessage = "Latest report date must be later than earliest report date.";
    }

    /// <summary>
    /// Re-populates the grid view so it reflects any modified search filters.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnIncidentSearch_Click(object sender, EventArgs e) {
        populateIncidents();
    }
    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnIncidentSearchReset_Click(object sender, EventArgs e) {
        resetIncidentSearch();
    }

    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    private void resetIncidentSearch() {
        tbxIncSearchDept.Text = String.Empty;
        cbxIncSearchDept.Checked = false;
        tbxIncSearchEmp.Text = String.Empty;
        cbxIncSearchEmp.Checked = false;
        tbxIncSearchSubmitter.Text = String.Empty;
        cbxIncSearchSubmitter.Checked = false;
        tbxEarliestIncidentDate.Text = String.Empty;
        tbxLatestIncidentDate.Text = String.Empty;
        tbxEarliestReportDate.Text = String.Empty;
        tbxLatestReportDate.Text = String.Empty;
        rblAdvancedSearch.SelectedValue = "no";
        lblAdvancedFilters.Visible = false;
        lblNoAdvancedFilters.Visible = true;
        lblAdvancedFiltersReminder.Visible = true;
        pnlFiltersSelected.Controls.Clear();
        populateIncidents();
    }
    #region Advanced Search Filters

    private void collapseAllFilterPanels() {
        cpeAdvancedIncidentSearch.Collapsed = true;
        cpeAdvancedIncidentSearch.ClientState = "true";
        cpeA.Collapsed = true;
        cpeA.ClientState = "true";
        cpeB.Collapsed = true;
        cpeB.ClientState = "true";
        cpeC.Collapsed = true;
        cpeC.ClientState = "true";
        cpeD.Collapsed = true;
        cpeD.ClientState = "true";
        cpeE.Collapsed = true;
        cpeE.ClientState = "true";
    }

    private void addToFilters(CheckBox cbx) {
        changeAdvancedFilterMsgs();
        
        CheckBox cbxClone = new CheckBox();
        cbxClone.Checked = cbx.Checked;
        cbxClone.Text = cbx.Text;
        cbxClone.Attributes.Add("onclick", "return false;");

        pnlFiltersSelected.Controls.Add(cbxClone);
        pnlFiltersSelected.Controls.Add(new LiteralControl("<br />"));
    }

    private void addToFilters(CheckBox cbx, String additionalInfo) {
        changeAdvancedFilterMsgs();
        
        CheckBox cbxClone = new CheckBox();
        cbxClone.Checked = cbx.Checked;
        cbxClone.Text = cbx.Text;
        cbxClone.Attributes.Add("onclick", "return false;");

        Label lblAdditionalInfo = new Label();
        lblAdditionalInfo.Text = additionalInfo;

        pnlFiltersSelected.Controls.Add(cbxClone);
        pnlFiltersSelected.Controls.Add(lblAdditionalInfo);
        pnlFiltersSelected.Controls.Add(new LiteralControl("<br />"));
    }

    private void addToFilters(RadioButtonList rbl, String text) {
        changeAdvancedFilterMsgs();
        
        RadioButtonList rblClone = new RadioButtonList();
        foreach (ListItem li in rbl.Items) {
            rblClone.Items.Add(li);
        }
        rblClone.SelectedValue = rbl.SelectedValue;
        rblClone.RepeatDirection = rbl.RepeatDirection;
        rblClone.Enabled = false;

        Label lblAdditionalInfo = new Label();
        lblAdditionalInfo.Text = text;

        pnlFiltersSelected.Controls.Add(lblAdditionalInfo);
        pnlFiltersSelected.Controls.Add(rblClone);
        pnlFiltersSelected.Controls.Add(new LiteralControl("<br />"));
    }

    private void changeAdvancedFilterMsgs() {
        lblAdvancedFilters.Visible = true;
        lblNoAdvancedFilters.Visible = false;
        lblAdvancedFiltersReminder.Visible = false;
    }
    
    /// <summary>
    /// Gets a list of incident reports that match ONLY the data entered into the form.
    /// Only considers the non-text input in sections A, B, C, D, and E of the form.
    /// Returns a list of Incident objects.
    /// </summary>
    private List<Incident> applyAdvancedIncidentFilters() {
        pnlFiltersSelected.Controls.Clear();
        
        var reports = ctx.Incidents.Select(r => r);

        #region A_IncidentInfo
        if (cbx_p1_action_report.Checked) { reports = reports.Where(r => r.p1_action_report.Equals("1")); addToFilters(cbx_p1_action_report); }
        if (cbx_p1_action_firstAid.Checked) { reports = reports.Where(r => r.p1_action_firstAid.Equals("1")); addToFilters(cbx_p1_action_firstAid); }
        if (cbx_p1_action_medicalGP.Checked) { reports = reports.Where(r => r.p1_action_medicalGP.Equals("1")); addToFilters(cbx_p1_action_medicalGP); }
        if (cbx_p1_action_lostTime.Checked) { reports = reports.Where(r => r.p1_action_lostTime.Equals("1")); addToFilters(cbx_p1_action_lostTime); }
        if (cbx_p1_action_medicalER.Checked) { reports = reports.Where(r => r.p1_action_medicalER.Equals("1")); addToFilters(cbx_p1_action_medicalER); }
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        if (cbx_p1_nature_no.Checked) { reports = reports.Where(r => r.p1_nature_no.Equals("1")); addToFilters(cbx_p1_nature_no); }
        if (cbx_p1_nature_musculoskeletal.Checked) { reports = reports.Where(r => r.p1_nature_musculoskeletal.Equals("1")); addToFilters(cbx_p1_nature_musculoskeletal); }
        if (cbx_p1_nature_bruise.Checked) { reports = reports.Where(r => r.p1_nature_bruise.Equals("1")); addToFilters(cbx_p1_nature_bruise); }
        if (cbx_p1_nature_burn.Checked) { reports = reports.Where(r => r.p1_nature_burn.Equals("1")); addToFilters(cbx_p1_nature_burn); }
        if (cbx_p1_nature_cut.Checked) { reports = reports.Where(r => r.p1_nature_cut.Equals("1")); addToFilters(cbx_p1_nature_cut); }
        if (cbx_p1_nature_puncture.Checked) { reports = reports.Where(r => r.p1_nature_puncture.Equals("1")); addToFilters(cbx_p1_nature_puncture); }
        if (cbx_p1_nature_skinIrritation.Checked) { reports = reports.Where(r => r.p1_nature_skinIrritation.Equals("1")); addToFilters(cbx_p1_nature_skinIrritation); }
        if (cbx_p1_nature_skinMucous.Checked) { reports = reports.Where(r => r.p1_nature_skinMucous.Equals("1")); addToFilters(cbx_p1_nature_skinMucous); }
        if (cbx_p1_nature_eye.Checked) { reports = reports.Where(r => r.p1_nature_eye.Equals("1")); addToFilters(cbx_p1_nature_eye); }
        if (cbx_p1_nature_allergic.Checked) { reports = reports.Where(r => r.p1_nature_allergic.Equals("1")); addToFilters(cbx_p1_nature_allergic); }
        if (cbx_p1_nature_psychological.Checked) { reports = reports.Where(r => r.p1_nature_psychological.Equals("1")); addToFilters(cbx_p1_nature_psychological); }
        if (cbx_p1_nature_respiratory.Checked) { reports = reports.Where(r => r.p1_nature_respiratory.Equals("1")); addToFilters(cbx_p1_nature_respiratory); }
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        if (cbx_p2_activity_no.Checked) { reports = reports.Where(r => r.p2_activity_no.Equals("1")); addToFilters(cbx_p2_activity_no); }
        if (cbx_p2_activity_repositioning.Checked) { reports = reports.Where(r => r.p2_activity_repositioning.Equals("1")); addToFilters(cbx_p2_activity_repositioning); }
        if (cbx_p2_activity_transferring.Checked) { reports = reports.Where(r => r.p2_activity_transferring.Equals("1")); addToFilters(cbx_p2_activity_transferring); }
        if (cbx_p2_activity_assistedWalking.Checked) { reports = reports.Where(r => r.p2_activity_assistedWalking.Equals("1")); addToFilters(cbx_p2_activity_assistedWalking); }
        if (cbx_p2_activity_assistedFloor.Checked) { reports = reports.Where(r => r.p2_activity_assistedFloor.Equals("1")); addToFilters(cbx_p2_activity_assistedFloor); }
        if (cbx_p2_activity_fall.Checked) { reports = reports.Where(r => r.p2_activity_fall.Equals("1")); addToFilters(cbx_p2_activity_fall); }
        if (cbx_p2_activity_holding.Checked) { reports = reports.Where(r => r.p2_activity_holding.Equals("1")); addToFilters(cbx_p2_activity_holding); }
        if (cbx_p2_activity_toileting.Checked) { reports = reports.Where(r => r.p2_activity_toileting.Equals("1")); addToFilters(cbx_p2_activity_toileting); }

        if (cbx_p2_patient_ceilingLift.Checked) { reports = reports.Where(r => r.p2_patient_ceilingLift.Equals("1")); addToFilters(cbx_p2_patient_ceilingLift); }
        if (cbx_p2_patient_sitStandLift.Checked) { reports = reports.Where(r => r.p2_patient_sitStandLift.Equals("1")); addToFilters(cbx_p2_patient_sitStandLift); }
        if (cbx_p2_patient_floorLift.Checked) { reports = reports.Where(r => r.p2_patient_floorLift.Equals("1")); addToFilters(cbx_p2_patient_floorLift); }
        if (cbx_p2_patient_manualLift.Checked) { reports = reports.Where(r => r.p2_patient_manualLift.Equals("1")); addToFilters(cbx_p2_patient_manualLift); }
        if (cbx_p2_patient_other.Checked) { reports = reports.Where(r => !(r.p2_patient_otherSpecify.Equals(null))); addToFilters(cbx_p2_patient_other, " (Incident/Accident Information, Patient Handling Details)"); }
        if (!rbl_p2_patient_adequateAssist.SelectedValue.Equals(String.Empty)) {
            reports = reports.Where(r => r.p2_patient_adequateAssist.Equals(rbl_p2_patient_adequateAssist.SelectedValue));
            addToFilters(rbl_p2_patient_adequateAssist, "Was adaquate assistance available?");
        }

        if (cbx_p2_activity_washing.Checked) { reports = reports.Where(r => r.p2_activity_washing.Equals("1")); addToFilters(cbx_p2_activity_washing); }
        if (cbx_p2_activity_dressing.Checked) { reports = reports.Where(r => r.p2_activity_dressing.Equals("1")); addToFilters(cbx_p2_activity_dressing); }
        if (cbx_p2_activity_changing.Checked) { reports = reports.Where(r => r.p2_activity_changing.Equals("1")); addToFilters(cbx_p2_activity_changing); }
        if (cbx_p2_activity_feeding.Checked) { reports = reports.Where(r => r.p2_activity_feeding.Equals("1")); addToFilters(cbx_p2_activity_feeding); }
        if (cbx_p2_activity_prep.Checked) { reports = reports.Where(r => r.p2_activity_prep.Equals("1")); addToFilters(cbx_p2_activity_prep); }
        if (cbx_p2_activity_dressingChanges.Checked) { reports = reports.Where(r => r.p2_activity_dressingChanges.Equals("1")); addToFilters(cbx_p2_activity_dressingChanges); }
        if (cbx_p2_activity_otherPatientCare.Checked) { reports = reports.Where(r => r.p2_activity_otherPatientCare.Equals("1")); addToFilters(cbx_p2_activity_otherPatientCare, " (Incident/Accident Information, Patient Care)"); }

        if (cbx_p2_activity_recapping.Checked) { reports = reports.Where(r => r.p2_activity_recapping.Equals("1")); addToFilters(cbx_p2_activity_recapping); }
        if (cbx_p2_activity_puncture.Checked) { reports = reports.Where(r => r.p2_activity_puncture.Equals("1")); addToFilters(cbx_p2_activity_puncture); }
        if (cbx_p2_activity_sharpsDisposal.Checked) { reports = reports.Where(r => r.p2_activity_sharpsDisposal.Equals("1")); addToFilters(cbx_p2_activity_sharpsDisposal); }
        if (cbx_p2_activity_otherSharps.Checked) { reports = reports.Where(r => r.p2_activity_otherSharps.Equals("1")); addToFilters(cbx_p2_activity_otherSharps); }

        //if (tbx_p2_acitvity_material.Checked) { reports = reports.Where(r => r.p2_activity_material.Equals("1")); addFilter(CBX_HERE_NOW); }
        if (cbx_p2_activity_lift.Checked) { reports = reports.Where(r => r.p2_activity_lift.Equals("1")); addToFilters(cbx_p2_activity_lift); }
        if (cbx_p2_activity_push.Checked) { reports = reports.Where(r => r.p2_activity_push.Equals("1")); addToFilters(cbx_p2_activity_push); }
        if (cbx_p2_activity_carry.Checked) { reports = reports.Where(r => r.p2_activity_carry.Equals("1")); addToFilters(cbx_p2_activity_carry); }
        if (cbx_p2_activity_otherMat.Checked) { reports = reports.Where(r => r.p2_activity_otherMat != null); addToFilters(cbx_p2_activity_otherMat); }
        if (cbx_p2_activity_driving.Checked) { reports = reports.Where(r => r.p2_activity_driving.Equals("1")); addToFilters(cbx_p2_activity_driving); }
        if (cbx_p2_activity_otherEquip.Checked) { reports = reports.Where(r => r.p2_activity_otherEquip != null); addToFilters(cbx_p2_activity_otherEquip); }
        if (cbx_p2_activity_otherEquipDesc.Checked) { reports = reports.Where(r => r.p2_activity_otherEquipDesc != null); addToFilters(cbx_p2_activity_otherEquipDesc); }
        if (cbx_p2_activity_equipMain.Checked) { reports = reports.Where(r => r.p2_activity_equipMain.Equals("1")); addToFilters(cbx_p2_activity_equipMain); }
        if (cbx_p2_activity_comp.Checked) { reports = reports.Where(r => r.p2_activity_comp.Equals("1")); addToFilters(cbx_p2_activity_comp); }
        if (cbx_p2_activity_nonComp.Checked) { reports = reports.Where(r => r.p2_activity_nonComp.Equals("1")); addToFilters(cbx_p2_activity_nonComp); }

        if (cbx_p2_activity_walking.Checked) { reports = reports.Where(r => r.p2_activity_walking.Equals("1")); addToFilters(cbx_p2_activity_walking); }
        if (cbx_p2_activity_bending.Checked) { reports = reports.Where(r => r.p2_activity_bending.Equals("1")); addToFilters(cbx_p2_activity_bending); }
        if (cbx_p2_activity_reading.Checked) { reports = reports.Where(r => r.p2_activity_reading.Equals("1")); addToFilters(cbx_p2_activity_reading); }
        if (cbx_p2_activity_spill.Checked) { reports = reports.Where(r => r.p2_activity_spill.Equals("1")); addToFilters(cbx_p2_activity_spill); }
        if (cbx_p2_activity_cleaning.Checked) { reports = reports.Where(r => r.p2_activity_cleaning.Equals("1")); addToFilters(cbx_p2_activity_cleaning); }
        if (cbx_p2_activity_other.Checked) { reports = reports.Where(r => r.p2_activity_other != null); addToFilters(cbx_p2_activity_other, "(Incident/Accident Information, Other)"); }
        #endregion C_AccidentInvestigation

        #region D_Cause
        if (cbx_p2_cause_human.Checked) { reports = reports.Where(r => r.p2_cause_human.Equals("1")); addToFilters(cbx_p2_cause_human); }
        if (cbx_p2_cause_animal.Checked) { reports = reports.Where(r => r.p2_cause_animal.Equals("1")); addToFilters(cbx_p2_cause_animal); }

        if (cbx_p2_cause_needle.Checked) { reports = reports.Where(r => r.p2_cause_needle.Equals("1")); addToFilters(cbx_p2_cause_needle); }
        if (cbx_p2_cause_otherSharps.Checked) { reports = reports.Where(r => r.p2_cause_otherSharps.Equals("1")); addToFilters(cbx_p2_cause_otherSharps); }
        if (cbx_p2_cause_skin.Checked) { reports = reports.Where(r => r.p2_cause_skin.Equals("1")); addToFilters(cbx_p2_cause_skin); }

        if (cbx_p2_cause_awkwardPosture.Checked) { reports = reports.Where(r => r.p2_cause_awkwardPosture.Equals("1")); addToFilters(cbx_p2_cause_awkwardPosture); }
        if (cbx_p2_cause_staticPosture.Checked) { reports = reports.Where(r => r.p2_cause_staticPosture.Equals("1")); addToFilters(cbx_p2_cause_staticPosture); }
        if (cbx_p2_cause_contactStress.Checked) { reports = reports.Where(r => r.p2_cause_contactStress.Equals("1")); addToFilters(cbx_p2_cause_contactStress); }
        if (cbx_p2_cause_force.Checked) { reports = reports.Where(r => r.p2_cause_force.Equals("1")); addToFilters(cbx_p2_cause_force); }
        if (cbx_p2_cause_rep.Checked) { reports = reports.Where(r => r.p2_cause_rep.Equals("1")); addToFilters(cbx_p2_cause_rep); }

        if (cbx_p2_cause_motor.Checked) { reports = reports.Where(r => r.p2_cause_motor.Equals("1")); addToFilters(cbx_p2_cause_motor); }
        if (cbx_p2_cause_slip.Checked) { reports = reports.Where(r => r.p2_cause_slip.Equals("1")); addToFilters(cbx_p2_cause_slip); }
        if (cbx_p2_cause_aggression.Checked) { reports = reports.Where(r => r.p2_cause_aggression.Equals("1")); addToFilters(cbx_p2_cause_aggression); }
        if (cbx_p2_cause_undetermined.Checked) { reports = reports.Where(r => r.p2_cause_undetermined.Equals("1")); addToFilters(cbx_p2_cause_undetermined); }
        if (cbx_p2_cause_event.Checked) { reports = reports.Where(r => r.p2_cause_event.Equals("1")); addToFilters(cbx_p2_cause_event); }
        if (cbx_p2_cause_underEquip.Checked) { reports = reports.Where(r => r.p2_cause_underEquip.Equals("1")); addToFilters(cbx_p2_cause_underEquip); }
        if (cbx_p2_cause_hit.Checked) { reports = reports.Where(r => r.p2_cause_hit.Equals("1")); addToFilters(cbx_p2_cause_hit); }
        if (cbx_p2_cause_other.Checked) { reports = reports.Where(r => r.p2_cause_other != null); addToFilters(cbx_p2_cause_other, "(Cause, Other)"); }

        if (cbx_p2_cause_aggression_verbal.Checked) { reports = reports.Where(r => r.p2_aggression_verbal.Equals("1")); addToFilters(cbx_p2_cause_aggression_verbal); }
        if (cbx_p2_cause_aggression_biting.Checked) { reports = reports.Where(r => r.p2_aggression_biting.Equals("1")); addToFilters(cbx_p2_cause_aggression_biting); }
        if (cbx_p2_cause_aggression_hitting.Checked) { reports = reports.Where(r => r.p2_aggression_hitting.Equals("1")); addToFilters(cbx_p2_cause_aggression_hitting); }
        if (cbx_p2_cause_aggression_squeezing.Checked) { reports = reports.Where(r => r.p2_aggression_squeezing.Equals("1")); addToFilters(cbx_p2_cause_aggression_squeezing); }
        if (cbx_p2_cause_aggression_assault.Checked) { reports = reports.Where(r => r.p2_aggression_assault.Equals("1")); addToFilters(cbx_p2_cause_aggression_assault); }
        if (cbx_p2_cause_aggression_patient.Checked) { reports = reports.Where(r => r.p2_aggression_patient.Equals("1")); addToFilters(cbx_p2_cause_aggression_patient); }
        if (cbx_p2_cause_aggression_family.Checked) { reports = reports.Where(r => r.p2_aggression_family.Equals("1")); addToFilters(cbx_p2_cause_aggression_family); }
        if (cbx_p2_cause_aggression_public.Checked) { reports = reports.Where(r => r.p2_aggression_public.Equals("1")); addToFilters(cbx_p2_cause_aggression_public); }
        if (cbx_p2_cause_aggression_worker.Checked) { reports = reports.Where(r => r.p2_aggression_worker.Equals("1")); addToFilters(cbx_p2_cause_aggression_worker); }
        if (cbx_p2_cause_aggression_other.Checked) { reports = reports.Where(r => r.p2_aggression_other != null); addToFilters(cbx_p2_cause_other, "(Cause, Workplace Aggression Details)"); }

        //if (tbx_p2_cause_exposure_chemName.Checked) { reports = reports.Where(r => r.p2_cause_exposure_chemName.Equals("1")); addFilter(CBX_HERE_NOW); }
        if (cbx_p2_cause_chemInhalation.Checked) { reports = reports.Where(r => r.p2_cause_chemInhalation.Equals("1")); addToFilters(cbx_p2_cause_chemInhalation); }
        if (cbx_p2_cause_chemIngest.Checked) { reports = reports.Where(r => r.p2_cause_chemIngest.Equals("1")); addToFilters(cbx_p2_cause_chemIngest); }
        if (cbx_p2_cause_chemContact.Checked) { reports = reports.Where(r => r.p2_cause_chemContact.Equals("1")); addToFilters(cbx_p2_cause_chemContact); }
        if (cbx_p2_cause_latex.Checked) { reports = reports.Where(r => r.p2_cause_latex.Equals("1")); addToFilters(cbx_p2_cause_latex); }
        if (cbx_p2_cause_dust.Checked) { reports = reports.Where(r => r.p2_cause_dust.Equals("1")); addToFilters(cbx_p2_cause_dust); }
        if (cbx_p2_cause_disease.Checked) { reports = reports.Where(r => r.p2_cause_disease.Equals("1")); addToFilters(cbx_p2_cause_disease); }
        if (cbx_p2_cause_temp.Checked) { reports = reports.Where(r => r.p2_cause_temp.Equals("1")); addToFilters(cbx_p2_cause_temp); }
        if (cbx_p2_cause_noise.Checked) { reports = reports.Where(r => r.p2_cause_noise.Equals("1")); addToFilters(cbx_p2_cause_noise); }
        if (cbx_p2_cause_radiation.Checked) { reports = reports.Where(r => r.p2_cause_radiation.Equals("1")); addToFilters(cbx_p2_cause_radiation); }
        if (cbx_p2_cause_elec.Checked) { reports = reports.Where(r => r.p2_cause_elec.Equals("1")); addToFilters(cbx_p2_cause_elec); }
        if (cbx_p2_cause_air.Checked) { reports = reports.Where(r => r.p2_cause_air.Equals("1")); addToFilters(cbx_p2_cause_air); }
        #endregion D_Cause

        #region E_ContributingFactors
        if (cbx_p2_factors_malfunction.Checked) { reports = reports.Where(r => r.p2_factors_malfunction.Equals("1")); addToFilters(cbx_p2_factors_malfunction); }
        if (cbx_p2_factors_improperUse.Checked) { reports = reports.Where(r => r.p2_factors_improperUse.Equals("1")); addToFilters(cbx_p2_factors_improperUse); }
        if (cbx_p2_factors_signage.Checked) { reports = reports.Where(r => r.p2_factors_signage.Equals("1")); addToFilters(cbx_p2_factors_signage); }
        if (cbx_p2_factors_notAvailable.Checked) { reports = reports.Where(r => r.p2_factors_notAvailable.Equals("1")); addToFilters(cbx_p2_factors_notAvailable); }
        if (cbx_p2_factors_poorDesign.Checked) { reports = reports.Where(r => r.p2_factors_poorDesign.Equals("1")); addToFilters(cbx_p2_factors_poorDesign); }
        if (cbx_p2_factors_otherEquip.Checked) { reports = reports.Where(r => r.p2_factors_otherEquip != null); addToFilters(cbx_p2_factors_otherEquip, "(Equipment/Device, Other)"); }

        if (cbx_p2_factors_temp.Checked) { reports = reports.Where(r => r.p2_factors_temp.Equals("1")); addToFilters(cbx_p2_factors_temp); }
        if (cbx_p2_factors_workplace.Checked) { reports = reports.Where(r => r.p2_factors_workplace.Equals("1")); addToFilters(cbx_p2_factors_workplace); }
        if (cbx_p2_factors_layout.Checked) { reports = reports.Where(r => r.p2_factors_layout.Equals("1")); addToFilters(cbx_p2_factors_layout); }
        if (cbx_p2_factors_limitedWorkspace.Checked) { reports = reports.Where(r => r.p2_factors_limitedWorkspace.Equals("1")); addToFilters(cbx_p2_factors_limitedWorkspace); }
        if (cbx_p2_factors_slippery.Checked) { reports = reports.Where(r => r.p2_factors_slippery.Equals("1")); addToFilters(cbx_p2_factors_slippery); }
        if (cbx_p2_factors_lighting.Checked) { reports = reports.Where(r => r.p2_factors_lighting.Equals("1")); addToFilters(cbx_p2_factors_lighting); }
        if (cbx_p2_factors_noise.Checked) { reports = reports.Where(r => r.p2_factors_noise.Equals("1")); addToFilters(cbx_p2_factors_noise); }
        if (cbx_p2_factors_vent.Checked) { reports = reports.Where(r => r.p2_factors_vent.Equals("1")); addToFilters(cbx_p2_factors_vent); }
        if (cbx_p2_factors_storage.Checked) { reports = reports.Where(r => r.p2_factors_storage.Equals("1")); addToFilters(cbx_p2_factors_storage); }
        if (cbx_p2_factors_otherEnv.Checked) { reports = reports.Where(r => r.p2_factors_otherEnv != null); addToFilters(cbx_p2_factors_otherEnv, "(Environment, Other)"); }

        if (cbx_p2_factors_assessment.Checked) { reports = reports.Where(r => r.p2_factors_assessment.Equals("1")); addToFilters(cbx_p2_factors_assessment); }
        if (cbx_p2_factors_procedure.Checked) { reports = reports.Where(r => r.p2_factors_procedure.Equals("1")); addToFilters(cbx_p2_factors_procedure); }
        if (cbx_p2_factors_appropriateEquip.Checked) { reports = reports.Where(r => r.p2_factors_appropriateEquip.Equals("1")); addToFilters(cbx_p2_factors_appropriateEquip); }
        if (cbx_p2_factors_conduct.Checked) { reports = reports.Where(r => r.p2_factors_conduct.Equals("1")); addToFilters(cbx_p2_factors_conduct); }
        if (cbx_p2_factors_extended.Checked) { reports = reports.Where(r => r.p2_factors_extended.Equals("1")); addToFilters(cbx_p2_factors_extended); }
        if (cbx_p2_factors_comm.Checked) { reports = reports.Where(r => r.p2_factors_comm.Equals("1")); addToFilters(cbx_p2_factors_comm); }
        if (cbx_p2_factors_unaccustomed.Checked) { reports = reports.Where(r => r.p2_factors_unaccustomed.Equals("1")); addToFilters(cbx_p2_factors_unaccustomed); }
        if (cbx_p2_factors_otherWorkPractice.Checked) { reports = reports.Where(r => r.p2_factors_otherWorkPractice != null); addToFilters(cbx_p2_factors_otherWorkPractice, "(Work Practice, Other)"); }

        if (cbx_p2_factors_directions.Checked) { reports = reports.Where(r => r.p2_factors_directions.Equals("1")); addToFilters(cbx_p2_factors_directions); }
        if (cbx_p2_factors_weight.Checked) { reports = reports.Where(r => r.p2_factors_weight.Equals("1")); addToFilters(cbx_p2_factors_weight); }
        if (cbx_p2_factors_aggressive.Checked) { reports = reports.Where(r => r.p2_factors_aggressive.Equals("1")); addToFilters(cbx_p2_factors_aggressive); }
        if (cbx_p2_factors_patientResistive.Checked) { reports = reports.Where(r => r.p2_factors_patientResistive.Equals("1")); addToFilters(cbx_p2_factors_patientResistive); }
        if (cbx_p2_factors_movement.Checked) { reports = reports.Where(r => r.p2_factors_movement.Equals("1")); addToFilters(cbx_p2_factors_movement); }
        if (cbx_p2_factors_confused.Checked) { reports = reports.Where(r => r.p2_factors_confused.Equals("1")); addToFilters(cbx_p2_factors_confused); }
        if (cbx_p2_factors_influence.Checked) { reports = reports.Where(r => r.p2_factors_influence.Equals("1")); addToFilters(cbx_p2_factors_influence); }
        if (cbx_p2_factors_lang.Checked) { reports = reports.Where(r => r.p2_factors_lang.Equals("1")); addToFilters(cbx_p2_factors_lang); }
        if (cbx_p2_factors_otherPatient.Checked) { reports = reports.Where(r => r.p2_factors_otherPatient != null); addToFilters(cbx_p2_factors_otherPatient, "(Patient Related Factors, Other)"); }

        if (cbx_p2_factors_alone.Checked) { reports = reports.Where(r => r.p2_factors_alone.Equals("1")); addToFilters(cbx_p2_factors_alone); }
        if (cbx_p2_factors_info.Checked) { reports = reports.Where(r => r.p2_factors_info.Equals("1")); addToFilters(cbx_p2_factors_info); }
        if (cbx_p2_factors_scheduling.Checked) { reports = reports.Where(r => r.p2_factors_scheduling.Equals("1")); addToFilters(cbx_p2_factors_scheduling); }
        if (cbx_p2_factors_training.Checked) { reports = reports.Where(r => r.p2_factors_training.Equals("1")); addToFilters(cbx_p2_factors_training); }
        if (cbx_p2_factors_equip.Checked) { reports = reports.Where(r => r.p2_factors_equip.Equals("1")); addToFilters(cbx_p2_factors_equip); }
        if (cbx_p2_factors_personal.Checked) { reports = reports.Where(r => r.p2_factors_personal.Equals("1")); addToFilters(cbx_p2_factors_personal); }
        if (cbx_p2_factors_safe.Checked) { reports = reports.Where(r => r.p2_factors_safe.Equals("1")); addToFilters(cbx_p2_factors_safe); }
        if (cbx_p2_factors_perceived.Checked) { reports = reports.Where(r => r.p2_factors_perceived.Equals("1")); addToFilters(cbx_p2_factors_perceived); }
        if (cbx_p2_factors_otherOrganizational.Checked) { reports = reports.Where(r => r.p2_factors_otherOrganizational != null); addToFilters(cbx_p2_factors_otherOrganizational, "(Organizational/Administrative, Other)"); }

        if (cbx_p2_factors_inexperienced.Checked) { reports = reports.Where(r => r.p2_factors_inexperienced.Equals("1")); addToFilters(cbx_p2_factors_inexperienced); }
        if (cbx_p2_factors_communication.Checked) { reports = reports.Where(r => r.p2_factors_communication.Equals("1")); addToFilters(cbx_p2_factors_communication); }
        if (cbx_p2_factors_fatigued.Checked) { reports = reports.Where(r => r.p2_factors_fatigued.Equals("1")); addToFilters(cbx_p2_factors_fatigued); }
        if (cbx_p2_factors_distracted.Checked) { reports = reports.Where(r => r.p2_factors_distracted.Equals("1")); addToFilters(cbx_p2_factors_distracted); }
        if (cbx_p2_factors_preexisting.Checked) { reports = reports.Where(r => r.p2_factors_preexisting.Equals("1")); addToFilters(cbx_p2_factors_preexisting); }
        if (cbx_p2_factors_sick.Checked) { reports = reports.Where(r => r.p2_factors_sick.Equals("1")); addToFilters(cbx_p2_factors_sick); }
        if (cbx_p2_factors_otherWorker.Checked) { reports = reports.Where(r => r.p2_factors_otherWorker != null); addToFilters(cbx_p2_factors_otherOrganizational, "(Worker, Other)"); }
        #endregion E_ContributingFactors

        return reports.ToList<Incident>();
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

    #region Disable Form
    /// <summary>
    /// Disabled the parameter TextBox control.
    /// Changes the control's background color to the disabled color.
    /// </summary>
    /// <param name="cbx">The TextBox to disable.</param>
    private void disableTextBox(TextBox tbx) {
        tbx.Enabled = false;
        tbx.BackColor = DisabledColor;
        tbx.Visible = false;
    }
    /// <summary>
    /// Disabled the parameter RadioButtonList control.
    /// </summary>
    /// <param name="cbx">The RadioButtonList to disable.</param>
    private void disableRadioButtonList(RadioButtonList rbl) {
        rbl.Enabled = false;
    }
    /// <summary>
    /// Disabled the parameter TextBoxWatermarkExtender control.
    /// </summary>
    /// <param name="cbx">The TextBoxWatermarkExtender to disable.</param>
    private void disableWatermark(TextBoxWatermarkExtender twe) {
        twe.Enabled = false;
    }

    /// <summary>
    /// Calls the disableTextBox method on each textbox in the form.
    /// Disables all the watermarks as well.
    /// </summary>
    private void disableAllTextBoxes() {
        #region A_IncidentInfo
        disableTextBox(tbx_p1_action_medicalGP_date);
        disableTextBox(tbx_p1_action_medicalER_date);
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        disableTextBox(tbx_p1_numEmployeesInvolved);
        disableTextBox(tbx_p2_patient_otherSpecify);
        disableTextBox(tbx_p2_activity_otherPatientCare);
        disableTextBox(tbx_p2_activity_otherMat);
        disableTextBox(tbx_p2_activity_otherEquip);
        disableTextBox(tbx_p2_activity_otherEquipDesc);
        disableTextBox(tbx_p2_activity_other);
        #endregion C_AccidentInvestigation

        #region D_Cause
        disableTextBox(tbx_p2_cause_other);
        disableTextBox(tbx_p2_cause_aggression_other);

        disableTextBox(tbx_p2_cause_exposure_chemName);
        #endregion D_Cause

        #region E_ContributingFactors
        disableTextBox(tbx_p2_factors_otherEquip);
        disableTextBox(tbx_p2_factors_otherEnv);
        disableTextBox(tbx_p2_factors_otherWorkPractice);
        disableTextBox(tbx_p2_factors_otherPatient);
        disableTextBox(tbx_p2_factors_otherOrganizational);
        disableTextBox(tbx_p2_factors_otherWorker);
        #endregion E_ContributingFactors

        #region watermarks
        disableWatermark(tweMedicalGpDate);
        disableWatermark(tweMedicalErDate);
        #endregion watermarks
    }
    #endregion Disable Form
    #endregion Advanced Search Filters
        
    #region gdvIncidents - Sorting and Paging
    private DataView gdvIncidents_DataView = new DataView();

    private string gdvIncidents_SortExpression {
        get { return ViewState["gdvIncidents_SortExpression"] as string ?? String.Empty; }
        set { ViewState["gdvIncidents_SortExpression"] = value; }
    }

    private string gdvIncidents_SortDirection {
        get { return ViewState["gdvIncidents_SortDirection"] as string ?? "ASC"; }
        set { ViewState["gdvIncidents_SortDirection"] = value; }
    }

    protected void gdvIncidents_Sorting(object sender, GridViewSortEventArgs e) {
        gdvIncidents_SortDirection = getSortDirection(gdvIncidents_SortDirection);
        gdvIncidents_SortExpression = e.SortExpression + " " + gdvIncidents_SortDirection;
        gdvIncidents_Sort(gdvIncidents.PageIndex);
    }

    protected void gdvIncidents_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        gdvIncidents.PageIndex = e.NewPageIndex;
        gdvIncidents_Sort(gdvIncidents.PageIndex);
    }

    private void gdvIncidents_Sort(int gdvPageIndex) {
        gdvIncidents_DataView.Sort = gdvIncidents_SortExpression;
        bindIncidents();
        gdvIncidents.PageIndex = gdvPageIndex;
    }
    #endregion gdvIncidents - Sorting and Paging
    #endregion Incidents

    #region Lab Inspections
    private void populateLabInspections() {
        List<LabInspection> labInsp = applyLabInspFilters();
        var qry = labInsp
                  .Select(li => new {
                      labInspectionNo = li.labInsNo,
                      deptName = li.deptName,
                      inspectionDate = li.date,
                      followup = li.followUpStatus.Equals("1") ? "Yes" : "No",
                      inspector = li.inspector,
                      room = li.room,
                      labMgr = li.labMgr
                  });

        qry = qry.OrderByDescending(li => li.inspectionDate);

        DataTable dt = new DataTable();
        dt.Columns.Add("labInspectionNo", typeof(int));
        dt.Columns.Add("deptName", typeof(String));
        dt.Columns.Add("inspectionDate", typeof(DateTime));
        dt.Columns.Add("followup", typeof(String));
        dt.Columns.Add("inspector", typeof(String));
        dt.Columns.Add("room", typeof(String));
        dt.Columns.Add("labMgr", typeof(String));

        foreach (var item in qry) {
            DataRow dr = dt.NewRow();
            dr["labInspectionNo"] = item.labInspectionNo;
            dr["deptName"] = item.deptName;
            dr["inspectionDate"] = item.inspectionDate;
            dr["followup"] = item.followup;
            dr["inspector"] = item.inspector;
            dr["room"] = item.room;
            dr["labMgr"] = item.labMgr;
            dt.Rows.Add(dr);
        }

        gdvLabInspections_DataView = new DataView(dt);
        bindLabInsps();
    }

    private void bindLabInsps() {
        gdvLabInspections.DataSource = gdvLabInspections_DataView;
        gdvLabInspections.DataBind();
    }

    private List<LabInspection> applyLabInspFilters() {
        setPageSize(gdvLabInspections, tbxLabInspPages, DefaultGridViewPageSize);
        var qry = ctx.LabInspections.Select(li => li);

        if (tbxLabInspDept.Text != null && !(tbxLabInspDept.Text.Equals(String.Empty))) {
            if (cbxLabInspDept.Checked) {
                qry = qry.Where(li => li.deptName != null && li.deptName.Equals(tbxLabInspDept.Text));
            }
            else {
                qry = qry.Where(li => li.deptName != null && li.deptName.Contains(tbxLabInspDept.Text));
            }
        }

        if (tbxLabInspInspector.Text != null && !(tbxLabInspInspector.Text.Equals(String.Empty))) {
            if (cbxLabInspInspector.Checked) {
                qry = qry.Where(li => li.inspector != null && li.inspector.Equals(tbxLabInspInspector.Text));
            }
            else {
                qry = qry.Where(li => li.inspector != null && li.inspector.Contains(tbxLabInspInspector.Text));
            }
        }

        if (tbxLabInspRoom.Text != null && !(tbxLabInspRoom.Text.Equals(String.Empty))) {
            if (cbxLabInspRoom.Checked) {
                qry = qry.Where(li => li.room != null && li.room.Equals(tbxLabInspRoom.Text));
            }
            else {
                qry = qry.Where(li => li.room != null && li.room.Contains(tbxLabInspRoom.Text));
            }
        }

        if (tbxLabInspLabMgr.Text != null && !(tbxLabInspLabMgr.Text.Equals(String.Empty))) {
            if (cbxLabInspLabMgr.Checked) {
                qry = qry.Where(li => li.labMgr != null && li.labMgr.Equals(tbxLabInspLabMgr.Text));
            }
            else {
                qry = qry.Where(li => li.labMgr != null && li.labMgr.Contains(tbxLabInspLabMgr.Text));
            }
        }

        DateTime date = getDateTime(tbxLabInspDate.Text);
        if (!(date.Equals(DateTime.MinValue))) {
            qry = qry.Where(li => li.date >= date);
        }

        if (rblLabInspFollowup.SelectedValue.ToString().Equals("yes")) {
            qry = qry.Where(li => li.followUpStatus.Equals("1"));
        }
        else if (rblLabInspFollowup.SelectedValue.ToString().Equals("no")) {
            qry = qry.Where(li => !(li.followUpStatus.Equals("1")));
        }

        return qry.ToList<LabInspection>();
    }

    /// <summary>
    /// Re-populates the grid view so it reflects any modified search filters.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnLabInspSearch_Click(object sender, EventArgs e) {
        populateLabInspections();
    }
    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnLabInspSearchReset_Click(object sender, EventArgs e) {
        resetLabInspSearch();
    }

    private void resetLabInspSearch() {
        tbxLabInspDept.Text = String.Empty;
        cbxLabInspDept.Checked = false;
        tbxLabInspInspector.Text = String.Empty;
        cbxLabInspInspector.Checked = false;
        tbxLabInspRoom.Text = String.Empty;
        cbxLabInspRoom.Checked = false;
        tbxLabInspLabMgr.Text = String.Empty;
        cbxLabInspLabMgr.Checked = false;
        rblLabInspFollowup.SelectedValue = null;
        tbxLabInspDate.Text = String.Empty;
        populateLabInspections();
    }

    /// <summary>
    /// Triggered when a lab inspection is selected from the grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gdvLabInspections_SelectedIndexChanged(object sender, EventArgs e) {
        String strId = gdvLabInspections.SelectedRow.Cells[0].Text;
        selectLabInspection(strId);
    }

    private void selectLabInspection(String id) {
        Response.Redirect("~/View/LabInspection.aspx?id=" + id);
    }

    #region gdvLabInspections - Sorting and Paging
    private DataView gdvLabInspections_DataView = new DataView();

    private string gdvLabInspections_SortExpression {
        get { return ViewState["gdvLabInspections_SortExpression"] as string ?? String.Empty; }
        set { ViewState["gdvLabInspections_SortExpression"] = value; }
    }

    private string gdvLabInspections_SortDirection {
        get { return ViewState["gdvLabInspections_SortDirection"] as string ?? "ASC"; }
        set { ViewState["gdvLabInspections_SortDirection"] = value; }
    }

    protected void gdvLabInspections_Sorting(object sender, GridViewSortEventArgs e) {
        gdvLabInspections_SortDirection = getSortDirection(gdvLabInspections_SortDirection);
        gdvLabInspections_SortExpression = e.SortExpression + " " + gdvLabInspections_SortDirection;
        gdvLabInspections_Sort(gdvLabInspections.PageIndex);
    }

    protected void gdvLabInspections_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        gdvLabInspections.PageIndex = e.NewPageIndex;
        gdvLabInspections_Sort(gdvLabInspections.PageIndex);
    }

    private void gdvLabInspections_Sort(int gdvPageIndex) {
        gdvLabInspections_DataView.Sort = gdvLabInspections_SortExpression;
        bindLabInsps();
        gdvLabInspections.PageIndex = gdvPageIndex;
    }
    #endregion gdvLabInspections - Sorting and Paging
    #endregion Lab Inspections

    #region Office Inspections
    private void populateOfficeInspections() {
        List<OfficeInspection> offInsp = applyOffInspFilters();
        var qry = offInsp
                 .Select(oi => new {
                     officeInspectionNo = oi.officeInsNo,
                     deptName = oi.deptName,
                     inspectionDate = oi.insDate,
                     followup = oi.followUpStatus.Equals("1") ? "Yes" : "No",
                     inspector = oi.inspector,
                     area = oi.area
                 });

        qry = qry.OrderByDescending(oi => oi.inspectionDate);

        DataTable dt = new DataTable();
        dt.Columns.Add("officeInspectionNo", typeof(int));
        dt.Columns.Add("deptName", typeof(String));
        dt.Columns.Add("inspectionDate", typeof(DateTime));
        dt.Columns.Add("followup", typeof(String));
        dt.Columns.Add("inspector", typeof(String));
        dt.Columns.Add("area", typeof(String));

        foreach (var item in qry) {
            DataRow dr = dt.NewRow();
            dr["officeInspectionNo"] = item.officeInspectionNo;
            dr["deptName"] = item.deptName;
            dr["inspectionDate"] = item.inspectionDate;
            dr["followup"] = item.followup;
            dr["inspector"] = item.inspector;
            dr["area"] = item.area;
            dt.Rows.Add(dr);
        }

        gdvOfficeInspections_DataView = new DataView(dt);
        bindOffInsps();
    }

    private void bindOffInsps() {
        gdvOfficeInspections.DataSource = gdvOfficeInspections_DataView;
        gdvOfficeInspections.DataBind();
    }

    private List<OfficeInspection> applyOffInspFilters() {
        setPageSize(gdvOfficeInspections, tbxOffInspPages, DefaultGridViewPageSize);
        var qry = ctx.OfficeInspections.Select(oi => oi);

        if (tbxOffInspDept.Text != null && !(tbxOffInspDept.Text.Equals(String.Empty))) {
            if (cbxOffInspDept.Checked) {
                qry = qry.Where(oi => oi.deptName != null && oi.deptName.Equals(tbxOffInspDept.Text));
            }
            else {
                qry = qry.Where(oi => oi.deptName != null && oi.deptName.Contains(tbxOffInspDept.Text));
            }
        }

        if (tbxOffInspInspector.Text != null && !(tbxOffInspInspector.Text.Equals(String.Empty))) {
            if (cbxOffInspInspector.Checked) {
                qry = qry.Where(oi => oi.inspector != null && oi.inspector.Equals(tbxOffInspInspector.Text));
            }
            else {
                qry = qry.Where(oi => oi.inspector != null && oi.inspector.Contains(tbxOffInspInspector.Text));
            }
        }

        if (tbxOffInspArea.Text != null && !(tbxOffInspArea.Text.Equals(String.Empty))) {
            if (cbxOffInspArea.Checked) {
                qry = qry.Where(oi => oi.area != null && oi.area.Equals(tbxOffInspArea.Text));
            }
            else {
                qry = qry.Where(oi => oi.area != null && oi.area.Contains(tbxOffInspArea.Text));
            }
        }

        DateTime date = getDateTime(tbxOffInspDate.Text);
        if (!(date.Equals(DateTime.MinValue))) {
            qry = qry.Where(oi => oi.insDate >= date);
        }

        if (rblOffInspFollowup.SelectedValue.ToString().Equals("yes")) {
            qry = qry.Where(oi => oi.followUpStatus.Equals("1"));
        }
        else if (rblOffInspFollowup.SelectedValue.ToString().Equals("no")) {
            qry = qry.Where(oi => !(oi.followUpStatus.Equals("1")));
        }
        
        return qry.ToList<OfficeInspection>();
    }
    
    /// <summary>
    /// Triggered when an office inspection is selected from the grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gdvOfficeInspections_SelectedIndexChanged(object sender, EventArgs e) {
        String strId = gdvOfficeInspections.SelectedRow.Cells[0].Text;
        selectOfficeInspection(strId);
    }

    private void selectOfficeInspection(String id) {
        Response.Redirect("~/View/OfficeInspection.aspx?id=" + id);
    }

    /// <summary>
    /// Re-populates the grid view so it reflects any modified search filters.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnOffInspSearch_Click(object sender, EventArgs e) {
        populateOfficeInspections();
    }
    /// <summary>
    /// Resets the search filters and re-populates the grid view so the default filters and results are showing.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The click event properties.</param>
    protected void btnOffInspSearchReset_Click(object sender, EventArgs e) {
        resetOffInspSearch();
    }

    private void resetOffInspSearch() {
        tbxOffInspDept.Text = String.Empty;
        cbxOffInspDept.Checked = false;
        tbxOffInspInspector.Text = String.Empty;
        cbxOffInspInspector.Checked = false;
        tbxOffInspArea.Text = String.Empty;
        cbxOffInspArea.Checked = false;
        rblOffInspFollowup.SelectedValue = null;
        tbxOffInspDate.Text = String.Empty;
        populateOfficeInspections();
    }
    
    #region gdvOfficeInspections - Sorting and Paging
    private DataView gdvOfficeInspections_DataView = new DataView();

    private string gdvOfficeInspections_SortExpression {
        get { return ViewState["gdvOfficeInspections_SortExpression"] as string ?? String.Empty; }
        set { ViewState["gdvOfficeInspections_SortExpression"] = value; }
    }

    private string gdvOfficeInspections_SortDirection {
        get { return ViewState["gdvOfficeInspections_SortDirection"] as string ?? "ASC"; }
        set { ViewState["gdvOfficeInspections_SortDirection"] = value; }
    }

    protected void gdvOfficeInspections_Sorting(object sender, GridViewSortEventArgs e) {
        gdvOfficeInspections_SortDirection = getSortDirection(gdvOfficeInspections_SortDirection);
        gdvOfficeInspections_SortExpression = e.SortExpression + " " + gdvOfficeInspections_SortDirection;
        gdvOfficeInspections_Sort(gdvOfficeInspections.PageIndex);
    }

    protected void gdvOfficeInspections_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        gdvOfficeInspections.PageIndex = e.NewPageIndex;
        gdvOfficeInspections_Sort(gdvOfficeInspections.PageIndex);
    }

    private void gdvOfficeInspections_Sort(int gdvPageIndex) {
        gdvOfficeInspections_DataView.Sort = gdvOfficeInspections_SortExpression;
        bindOffInsps();
        gdvOfficeInspections.PageIndex = gdvPageIndex;
    }
    #endregion gdvOfficeInspections - Sorting and Paging
    #endregion Office Inspections

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
    #endregion Page Popup

    protected void rblAdvancedSearch_SelectedIndexChanged(object sender, EventArgs e) {
        if (rblAdvancedSearch.SelectedValue.Equals("yes")) {
            pnlAdvancedIncidentSearchContainer.Visible = true;
        }
        else {
            pnlAdvancedIncidentSearchContainer.Visible = false;
        }
    }
}
