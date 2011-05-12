using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;

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
    private int department;
    private string labManager;

    /// <summary>
    /// Populates drop down list for Lab Managers
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BCCAEntities ctx = new BCCAEntities();
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr });
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField  = "text";
            ddlLabLabManager.DataBind();
        }

    }

    #region Inspection Look Up
    /// <summary>
    /// When clicked it does a lookup for any lab inspections.
    /// And returns a grid view of the results.
    /// </summary>
    protected void btnInspectionLookUp_Click(object sender, EventArgs e)
    {
        if (!(tbxLabDepartment.Text.Length == 0))
        {
            department = Convert.ToInt32(tbxLabDepartment.Text);
        }

        labManager  = Convert.ToString(ddlLabLabManager.SelectedValue);

        grvLabInspections.DataSource = ctx.LabInspections.Select(LI => LI).Where(LI => ((LI.deptNo == department))
                                                                                || (LI.labMgr == labManager));
        grvLabInspections.DataBind();

    }
    #endregion

    protected void grvLabInspections_SelectedIndexChanged(Object sender, EventArgs e)
    {

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

                if (e.Row.RowIndex == i)
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
}