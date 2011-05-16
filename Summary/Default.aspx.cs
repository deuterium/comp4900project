using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;
using System.Globalization;

/// <summary>
///Summary/Default.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Kalen Wessel - kalen.wessel@gmail.com
/// </summary>
public partial class Summary_Default : System.Web.UI.Page
{
    static BCCAEntities ctx = new BCCAEntities();
    private string department;
    private string labManager;

    /// <summary>
    /// Populates drop down list for Lab Managers
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Authentication Check
        ASP.global_asax.Session_Authentication();
        //Session["RoleNo"].ToString();
        //Session["DeptNo"].ToString();    THESE GET Stuff

        grvLabInspections.Visible = false;
        grvLabInspectionResults.Visible = false;

        grvOfficeInspections.Visible = false;
        grvOfficeInspectionResults.Visible = false;

        if (!IsPostBack)
        {
            BCCAEntities ctx = new BCCAEntities();
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr }).Distinct();
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField  = "text";
            ddlLabLabManager.DataBind();

            ddlLabDepartment.DataSource = ctx.Departments.Select(D => new { text = D.deptName, value = D.deptName });
            ddlLabDepartment.DataValueField = "value";
            ddlLabDepartment.DataTextField = "text";
            ddlLabDepartment.DataBind();

            ddlOfficeDepartment.DataSource = ctx.Departments.Select(D => new { text = D.deptName, value = D.deptName });
            ddlOfficeDepartment.DataValueField = "value";
            ddlOfficeDepartment.DataTextField = "text";
            ddlOfficeDepartment.DataBind();
        }

    }

    #region Lab Inspection Look Up
    /// <summary>
    /// When clicked it does a lookup for any lab inspections.
    /// And returns a grid view of the results.
    /// </summary>
    protected void btnLabInspectionLookUp_Click(object sender, EventArgs e)
    {
        // Session Value of logged in users Deptartment Number
        int userDeptNo = (int)Session["DeptNo"];

        // Sets the gridview visibile on lookup of an inspection
        grvLabInspections.Visible = true;

        department = Convert.ToString(ddlLabDepartment.SelectedValue);
        
        labManager = Convert.ToString(ddlLabLabManager.SelectedValue);
        //String labInspectionDate = tbxLabInspectionDate.Text;
        //String.Format("{0:Mm/dd/yyyy}", labInspectionDate);

        string labInspectionDate = Convert.ToString(tbxLabInspectionDate.Text);

        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "MM/dd/yyyy";
        DateTime validDate;
        if (tbxLabInspectionDate.Text.Length == 0)
        {
            validDate = Convert.ToDateTime("01/01/0001");
        }
        else
        {
            validDate = Convert.ToDateTime(labInspectionDate, dateInfo);
        }
        
        grvLabInspections.DataSource = ctx.LabInspections
                                               .Join(
                                                  ctx.Departments,
                                                  LI => LI.deptNo,
                                                  D => (Int32?)(D.deptNo),
                                                  (LI, D) =>
                                                     new
                                                     {
                                                         LI = LI,
                                                         D = D
                                                     }
                                               )
                                               .Where(temp0 => ((temp0.D.deptName == department) || (temp0.LI.labMgr == labManager)
                                                 || (temp0.LI.date == validDate)) && (temp0.LI.deptNo == userDeptNo))
                                               .Select(
                                                  temp0 =>
                                                     new
                                                     {
                                                         labInsNo = temp0.LI.labInsNo,
                                                         deptName = temp0.D.deptName,
                                                         date = temp0.LI.date,
                                                         followupDate = temp0.LI.followupDate,
                                                         inspector = temp0.LI.inspector,
                                                         labMgr = temp0.LI.labMgr,
                                                         supervisor = temp0.LI.supervisor,
                                                         room = temp0.LI.room
                                                     }
                                               );


        grvLabInspections.DataBind();

    }
    #endregion

    protected void grvLabInspections_SelectedIndexChanged(Object sender, EventArgs e)
    {
        grvLabInspectionResults.Visible = true;
        grvLabInspections.Visible = true;
        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = grvLabInspections.SelectedRow;
        row.Cells[1].Text.ToString();
        int selectedLabInsNo = Convert.ToInt32(row.Cells[1].Text);

        grvLabInspectionResults.DataSource = ctx.LabInspections
                                  .Join(
                                     ctx.LabInspectionDetails,
                                     LI => LI.labInsNo,
                                     LID => LID.labInsNo,
                                     (LI, LID) =>
                                        new
                                        {
                                            LI = LI,
                                            LID = LID
                                        }
                                  )
                                  .Join(
                                     ctx.LabInspectionItems,
                                     temp0 => temp0.LID.labItemNo,
                                     LII => (Int32?)(LII.labInsItemNo),
                                     (temp0, LII) =>
                                        new
                                        {
                                            temp0 = temp0,
                                            LII = LII
                                        }
                                  )
                                  .Where(temp1 => (temp1.temp0.LI.labInsNo == selectedLabInsNo))
                                  .Select(
                                     temp1 =>
                                        new
                                        {
                                            labInsItem = temp1.LII.labInsItem,
                                            checkbox = temp1.temp0.LID.checkbox,
                                            comments = temp1.temp0.LID.comments
                                        }
                                  );

        grvLabInspectionResults.DataBind();

    }


    protected void grvLabInspectionResults_DataBinding(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = -1; i < grvLabInspectionResults.Rows.Count; i++)
            {

                    if (e.Row.Cells[1].Text == "1")
                        e.Row.Cells[1].Text = "Yes";

                    if (e.Row.Cells[1].Text == "2")
                        e.Row.Cells[1].Text = "No";

                    if (e.Row.Cells[1].Text == "3")
                        e.Row.Cells[1].Text = "N/A";

            }
        }

    }


    #region Office Inspection Look Up
    /// <summary>
    /// When clicked it does a lookup for any office inspections.
    /// And returns a grid view of the results.
    /// </summary>
    protected void btnOfficeInspectionLookUp_Click(object sender, EventArgs e)
    {
        grvOfficeInspections.Visible = true;
        // Session Value of logged in users Deptartment Number
        int userDeptNo = (int)Session["DeptNo"];
        department = Convert.ToString(ddlOfficeDepartment.SelectedValue);

        string officeInspectionDate = Convert.ToString(tbxOfficeInspectionDate.Text);

        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "MM/dd/yyyy";
        DateTime validDate;
        if (tbxOfficeInspectionDate.Text.Length == 0)
        {
            validDate = Convert.ToDateTime("01/01/0001");
        }
        else
        {
            validDate = Convert.ToDateTime(officeInspectionDate, dateInfo);
        }

        grvOfficeInspections.DataSource = ctx.OfficeInspections
                                                   .Join(
                                                      ctx.Departments,
                                                      OI => OI.deptNo,
                                                      D => (Int32?)(D.deptNo),
                                                      (OI, D) =>
                                                         new
                                                         {
                                                             OI = OI,
                                                             D = D
                                                         }
                                                   )
                                                   .Where(temp0 => ((temp0.D.deptName == department) || (temp0.OI.insDate == validDate)) && (temp0.OI.deptNo == userDeptNo))
                                                   .Select(
                                                      temp0 =>
                                                         new
                                                         {
                                                             officeInsNo = temp0.OI.officeInsNo,
                                                             deptName = temp0.D.deptName,
                                                             insDate = temp0.OI.insDate,
                                                             inspector = temp0.OI.inspector,
                                                             area = temp0.OI.area,
                                                         }
                                                   );



        grvOfficeInspections.DataBind();

    }
    #endregion

    protected void grvOfficeInspections_SelectedIndexChanged(Object sender, EventArgs e)
    {
        grvOfficeInspectionResults.Visible = true;
        grvOfficeInspections.Visible = true;

        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = grvOfficeInspections.SelectedRow;
        row.Cells[1].Text.ToString();
        int selectedOfficeInsNo = Convert.ToInt32(row.Cells[1].Text);

        grvOfficeInspectionResults.DataSource = ctx.OfficeInspections
                                                       .Join(
                                                          ctx.OfficeInspectionDetails,
                                                          OI => (Int32?)(OI.officeInsNo),
                                                          OID => OID.officeInsNo,
                                                          (OI, OID) =>
                                                             new
                                                             {
                                                                 OI = OI,
                                                                 OID = OID
                                                             }
                                                       )
                                                       .Join(
                                                          ctx.OfficeInspectionItems,
                                                          temp0 => temp0.OID.officeInsItemNo,
                                                          OII => (Int32?)(OII.officeInsItemNo),
                                                          (temp0, OII) =>
                                                             new
                                                             {
                                                                 temp0 = temp0,
                                                                 OII = OII
                                                             }
                                                       )
                                                       .Where(temp1 => (temp1.temp0.OI.officeInsNo == selectedOfficeInsNo))
                                                       .Select(
                                                          temp1 =>
                                                             new
                                                             {
                                                                 officeInsName = temp1.OII.officeInsName,
                                                                 checkbox = temp1.temp0.OID.checkbox,
                                                                 comments = temp1.temp0.OID.comments
                                                             }
                                                       );

        grvOfficeInspectionResults.DataBind();

    }


    protected void grvOfficeInspectionResults_DataBinding(object sender, GridViewRowEventArgs e)
    {


        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = -1; i < grvOfficeInspectionResults.Rows.Count; i++)
            {

                if (e.Row.Cells[1].Text == "1")
                    e.Row.Cells[1].Text = "Yes";

                if (e.Row.Cells[1].Text == "2")
                    e.Row.Cells[1].Text = "No";

                if (e.Row.Cells[1].Text == "3")
                    e.Row.Cells[1].Text = "N/A";

            }
        }

    }

    #region Valid Course Look Up
    /// <summary>
    /// When clicked it does a lookup for all valid courses.
    /// And returns a grid view of the results.
    /// </summary>
    protected void btnCourseLookUp_Click(object sender, EventArgs e)
    {
        var q = from x in ctx.TrainingCourses
                select x;
        var total = q.Count();

        List<String> courseArray = ctx.TrainingCourses.Select(c => c.trainingName).ToList();


        for (int i = 0; i < total; i++)
        {
            GridView grvCourseLookUp = new GridView();
            String temp = courseArray[i];
            grvCourseLookUp.DataSource = ctx.Employees
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
                               .Where(temp1 => (temp1.TC.trainingName == temp))
                               .Select(
                                  temp1 =>
                                     new
                                     {
                                         lastname = temp1.temp0.emp.lname,
                                         firstname = temp1.temp0.emp.fname,
                                         startdate = temp1.temp0.TT.startDate,
                                         enddate = temp1.temp0.TT.endDate
                                     }
                               );
            grvPanelValidCourses.Controls.Add(grvCourseLookUp);

            grvCourseLookUp.Caption = "<table width=\"100%\" class=\"gvCaption\"><tr><td>" + temp + "</td></tr></table>";
            grvCourseLookUp.DataBind();
        }
               
    }
    #endregion


    #region Inspection Look Up
    /// <summary>
    /// When clicked it does a lookup for any expired course.
    /// coming up with in X amount of months.
    /// And returns a grid view of the results.
    /// </summary>
    protected void btnExpiringCourses_Click(object sender, EventArgs e)
    {
        int month = Convert.ToInt32(tbxMonthsRange.Text);
        DateTime currentDate = DateTime.Now.AddMonths(month);
        //var q = from x in ctx.TrainingCourses
        //        select x;
        //var total = q.Count();

        //List<String> courseArray = ctx.TrainingCourses.Select(c => c.trainingName).ToList();

        GridView grvExpiringCourseLookUp = new GridView();
        grvExpiringCourseLookUp.DataSource = ctx.Employees
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
        grvPanelExpiringCourses.Controls.Add(grvExpiringCourseLookUp);
        grvExpiringCourseLookUp.Caption = "<table width=\"100%\" class=\"gvCaption\"><tr><td>Expiring Courses</td></tr></table>";
        grvExpiringCourseLookUp.DataBind();
    }
    #endregion
    protected void btnStatistics_Click(object sender, EventArgs e)
    {
        Response.Redirect("Statistics.aspx");
    }
}