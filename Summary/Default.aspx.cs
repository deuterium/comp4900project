﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
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

    // The date format to use for displaying and converting dates
    public static String dateFormat = "M/d/yyyy";
    // The locale to use when displaying and converting dates/times
    public static CultureInfo locale = new CultureInfo("en-CA");

    // Static level entity context
    static BCCAEntities ctx = new BCCAEntities();

    // Departments var for drop down lists.
    private string department;

    // Lab Manager var for drop down lists.
    private string labManager;

    // Holds the user role for switch cases to see if a user is admin, lab manager, etc.
    private int userRole;

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

    /// <summary>
    /// Populates drop down list for Lab Managers
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;

        //Session["RoleNo"].ToString();
        //Session["DeptNo"].ToString();    THESE GET Stuff
        BCCAEntities ctx = new BCCAEntities();

        int? userRoleNo = (int?)Session["RoleNo"];
        switch (ctx.Roles.Where(r => r.roleNo == userRoleNo).Select(r => r.role1).First())
        {
            case "Administrator":
                userRole = 0;
                break;
            case "Safety Officer":
                userRole = 0;
                break;
            case "Lab Manager":
                departmentRowLab.Visible = false;
                departmentRowOffice.Visible = false;
                divStats.Visible = false;
                divCourseLookUp.Visible = false;
                userRole = 1;
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }

        grvLabInspections.Visible = false;
        grvLabInspectionResults.Visible = false;

        grvOfficeInspections.Visible = false;
        grvOfficeInspectionResults.Visible = false;
        followupRow.Visible = false;
        officefollowUpRow.Visible = false;
        tbOfficeInspectionComment.Visible = false;
        tbLabInspectionComment.Visible = false;

        if (!IsPostBack)
        {
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr }).OrderBy(l => l).Distinct();
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField  = "text";
            ddlLabLabManager.DataBind();

            ddlLabDepartment.DataSource = ctx.Departments.Select(D => new { text = D.deptName, value = D.deptName }).OrderBy(D => D);
            ddlLabDepartment.DataValueField = "value";
            ddlLabDepartment.DataTextField = "text";
            ddlLabDepartment.DataBind();

            ddlOfficeDepartment.DataSource = ctx.Departments.Select(D => new { text = D.deptName, value = D.deptName }).OrderBy(D => D);
            ddlOfficeDepartment.DataValueField = "value";
            ddlOfficeDepartment.DataTextField = "text";
            ddlOfficeDepartment.DataBind();

            PopulateEmployersDdl();
            PopulatePositionsDdl();
            PopulateDepartmentsDdl();
            populateTrackerGridView();
            // pnlPop.Style.Value = "display:none;";
            lblResults.Visible = true;
            
            tsmScriptManager.SetFocus(tbxLastName.ClientID);
        }

    }

    #region Lab Inspection Look Up
    /// <summary>
    /// When clicked it does a lookup for any lab inspections.
    /// And returns a grid view of the results.
    /// </summary>
    protected void btnLabInspectionLookUp_Click(object sender, EventArgs e)
    {
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
        switch (userRole)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                     grvLabInspections.DataSource = ctx.LabInspections
                                                  .Join(
                                                    ctx.Departments,
                                                    LI => LI.deptName,
                                                    D => D.deptName,
                                                    (LI, D) =>
                                                        new
                                                        {
                                                            LI = LI,
                                                            D = D
                                                        }
                                                )
                                               .Where(temp0 => ((temp0.D.deptName == department) || (temp0.LI.labMgr == labManager)
                                                 || (temp0.LI.date == validDate)))
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
                break;

            case 1:
                        // Session Value of logged in users Deptartment Number
                        int userDeptNo = (int)Session["DeptNo"];
                        grvLabInspections.DataSource = ctx.LabInspections
                                                  .Join(
                                                    ctx.Departments,
                                                    LI => LI.deptName,
                                                    D => D.deptName,
                                                    (LI, D) =>
                                                        new
                                                        {
                                                            LI = LI,
                                                            D = D
                                                        }
                                                )
                                               .Where(temp0 => ((temp0.D.deptName == department) || (temp0.LI.labMgr == labManager)
                                                 || (temp0.LI.date == validDate) && (temp0.D.deptNo == userDeptNo)))
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
                break;

            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }

    }
    #endregion

    /// <summary>
    /// Handles the search of ALL Lab Inspections.
    /// </summary>
    /// <param name="sender">Not used</param>
    /// <param name="e">Not used</param>
    protected void btnLabInspectionLookUpAll_Click(object sender, EventArgs e)
    {
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
        switch (userRole)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                grvLabInspections.DataSource = ctx.LabInspections
                                             .Join(
                                               ctx.Departments,
                                               LI => LI.deptName,
                                               D => D.deptName,
                                               (LI, D) =>
                                                   new
                                                   {
                                                       LI = LI,
                                                       D = D
                                                   }
                                           )
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
                break;

            case 1:
                // Session Value of logged in users Deptartment Number
                int userDeptNo = (int)Session["DeptNo"];
                grvLabInspections.DataSource = ctx.LabInspections
                                          .Join(
                                            ctx.Departments,
                                            LI => LI.deptName,
                                            D => D.deptName,
                                            (LI, D) =>
                                                new
                                                {
                                                    LI = LI,
                                                    D = D
                                                }
                                        )
                                       .Where(temp0 => (temp0.D.deptNo == userDeptNo))
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
                break;

            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    /// <summary>
    /// Keeps track of which Lab Inspection is selected for bring up
    /// more information in the Lab Inspection Results Grid view.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvLabInspections_SelectedIndexChanged(Object sender, EventArgs e)
    {
        lblLabFollowUpSubmitter.Text = "";
        lblLabFollowUpDate.Text = "";
        lblLabFollowUpStatus.Text = "";
        tbLabFollowupComments.Text = "";
        tbLabFollowupComments.Text = "";
        followupRow.Visible = true;
        tbLabInspectionComment.Visible = true;

        grvLabInspectionResults.Visible = true;
        grvLabInspections.Visible = true;
        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = grvLabInspections.SelectedRow;
        row.Cells[1].Text.ToString();
        int selectedLabInsNo = Convert.ToInt32(row.Cells[1].Text);

        grvLabInspectionResults.DataSource = ctx.LabInspectionItems
                                                   .Join(
                                                      ctx.LabInspectionDetails,
                                                      LII =>
                                                         new
                                                         {
                                                             labInsItemNo = LII.labInsItemNo
                                                         },
                                                      LID =>
                                                         new
                                                         {
                                                             labInsItemNo = (Int32)(LID.labItemNo)
                                                         },
                                                      (LII, LID) =>
                                                         new
                                                         {
                                                             LII = LII,
                                                             LID = LID
                                                         }
                                                   )
                                                   .Join(
                                                      ctx.LabInspections,
                                                      temp0 => temp0.LID.labInsNo,
                                                      LI => LI.labInsNo,
                                                      (temp0, LI) =>
                                                         new
                                                         {
                                                             temp0 = temp0,
                                                             LI = LI
                                                         }
                                                   )
                                                   .GroupJoin(
                                                      ctx.LabFollowUps,
                                                      temp1 =>
                                                         new
                                                         {
                                                             labInsItemNo = temp1.temp0.LII.labInsItemNo,
                                                             labInsNo = temp1.LI.labInsNo
                                                         },
                                                      LFU =>
                                                         new
                                                         {
                                                             labInsItemNo = (Int32)(LFU.labInsItemNo),
                                                             labInsNo = LFU.labInsNo
                                                         },
                                                      (temp1, labfollowup_join) =>
                                                         new
                                                         {
                                                             temp1 = temp1,
                                                             labfollowup_join = labfollowup_join
                                                         }
                                                   )
                                                   .SelectMany(
                                                      temp2 => temp2.labfollowup_join.DefaultIfEmpty(),
                                                      (temp2, LFU) =>
                                                         new
                                                         {
                                                             temp2 = temp2,
                                                             LFU = LFU
                                                         }
                                                   )
                                                   .Where(
                                                      temp3 =>
                                                            (((temp3.LFU.labInsNo == selectedLabInsNo) && (temp3.temp2.temp1.LI.labInsNo == selectedLabInsNo)) ||
                                                               (((Int32?)(temp3.LFU.labInsNo) == null) && (temp3.temp2.temp1.LI.labInsNo == selectedLabInsNo))
                                                            )
                                                   )
                                                   .Select(
                                                      temp3 =>
                                                         new
                                                         {
                                                             labInsItem = temp3.temp2.temp1.temp0.LII.labInsItem,
                                                             checkbox = temp3.temp2.temp1.temp0.LID.checkbox,
                                                             comments = temp3.temp2.temp1.temp0.LID.comments,
                                                             comment = temp3.LFU.comment
                                                         }
                                                   );

        grvLabInspectionResults.DataBind();

        tbLabInspectionComment.Text = Convert.ToString(ctx.LabInspections.Where(LI => (LI.labInsNo == selectedLabInsNo)).Select(LI => LI.comments).FirstOrDefault());

        
        var qryFollowUpSubmitter = ctx.LabInspections.Where(LI => (LI.labInsNo == selectedLabInsNo)).Select(LI => LI.followupSubmitter).FirstOrDefault();
        
        // Check for null values.
        if (qryFollowUpSubmitter != null)
        {
            lblLabFollowUpSubmitter.Text = Convert.ToString(qryFollowUpSubmitter);
        }

        var qryFollowUpDate = ctx.LabInspections.Where(LI => (LI.labInsNo == selectedLabInsNo)).Select(LI => LI.followupDate).FirstOrDefault();
        // Checks for null values.
        if (qryFollowUpDate != null)
        {
            DateTime temp = Convert.ToDateTime(qryFollowUpDate);
            lblLabFollowUpDate.Text = temp.ToString("MM/dd/yyyy");
        }

        // Converts the int value in the DB to a string. Used for checking if a follow up is complete or not.
        var qryFollowUpStatus = ctx.LabInspections.Where(LI => (LI.labInsNo == selectedLabInsNo)).Select(LI => LI.followUpStatus).FirstOrDefault();
        if (qryFollowUpStatus != null)
        {
            if (qryFollowUpStatus == "1")
            {
                lblLabFollowUpStatus.Text = "No Follow Up";
            }
            else if (qryFollowUpStatus == "0")
            {
                lblLabFollowUpStatus.Text = "No Follow Up";
            }
            else
            {
                lblLabFollowUpStatus.Text = "Follow Up Complete";
            }
        }

        var qryFollowUpComment = ctx.LabInspections.Where(LI => (LI.labInsNo == selectedLabInsNo)).Select(LI => LI.followupComment).FirstOrDefault();
        if (qryFollowUpComment != null)
        {
            tbLabFollowupComments.Text = qryFollowUpComment.ToString();
        }
    }

    /// <summary>
    /// This method populates one of the column fields on the fly.
    /// It changes any 1, 2, 3 to their appropriate values.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
        switch (userRole)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                        grvOfficeInspections.DataSource = ctx.OfficeInspections
                                                   .Join(
                                                      ctx.Departments,
                                                      OI => OI.deptName,
                                                      D => D.deptName,
                                                      (OI, D) =>
                                                         new
                                                         {
                                                             OI = OI,
                                                             D = D
                                                         }
                                                   )
                                                   .Where(temp0 => ((temp0.D.deptName == department) || (temp0.OI.insDate == validDate)))
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
                break;
            // Role: Lab Manager; See reports in their lab.
            case 1:
                        // Session Value of logged in users Deptartment Number
                        int userDeptNo = (int)Session["DeptNo"];
                        grvOfficeInspections.DataSource = ctx.OfficeInspections
                                                   .Join(
                                                      ctx.Departments,
                                                      OI => OI.deptName,
                                                      D => D.deptName,
                                                      (OI, D) =>
                                                         new
                                                         {
                                                             OI = OI,
                                                             D = D
                                                         }
                                                   )
                                                   .Where(temp0 => ((temp0.D.deptName == department) || (temp0.OI.insDate == validDate)) && (temp0.D.deptNo == userDeptNo))
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
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }


    }
    #endregion

    /// <summary>
    /// Handles the look up of ALL Office Inspections.
    /// </summary>
    /// <param name="sender">Not used</param>
    /// <param name="e">Not used.</param>
    protected void btnOfficeInspectionLookUpAll_Click(object sender, EventArgs e)
    {
        grvOfficeInspections.Visible = true;

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
        switch (userRole)
        {
            //Role: Admin/Safety Officer; Sees all reports
            case 0:
                grvOfficeInspections.DataSource = ctx.OfficeInspections
                                           .Join(
                                              ctx.Departments,
                                              OI => OI.deptName,
                                              D => D.deptName,
                                              (OI, D) =>
                                                 new
                                                 {
                                                     OI = OI,
                                                     D = D
                                                 }
                                           )
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
                break;
            // Role: Lab manager; See all reports in their Department.
            case 1:
                // Session Value of logged in users Deptartment Number
                int userDeptNo = (int)Session["DeptNo"];
                grvOfficeInspections.DataSource = ctx.OfficeInspections
                                           .Join(
                                              ctx.Departments,
                                              OI => OI.deptName,
                                              D => D.deptName,
                                              (OI, D) =>
                                                 new
                                                 {
                                                     OI = OI,
                                                     D = D
                                                 }
                                           )
                                           .Where(temp0 => (temp0.D.deptNo == userDeptNo))
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
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }


    /// <summary>
    /// Builds the gridview of the selected Office Inspection with more details
    /// as well as a follow up at the end. 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvOfficeInspections_SelectedIndexChanged(Object sender, EventArgs e)
    {
        grvOfficeInspectionResults.Visible = true;
        grvOfficeInspections.Visible = true;
        officefollowUpRow.Visible = true;
        tbOfficeInspectionComment.Visible = true;

        lblOfficeFollowUpDate.Text = "";
        lblOfficeFollowUpStatus.Text = "";
        lblOfficeFollowUpSubmitter.Text = "";
        tbOfficeFollowUpComment.Text = "";

        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = grvOfficeInspections.SelectedRow;
        row.Cells[1].Text.ToString();
        int selectedOfficeInsNo = Convert.ToInt32(row.Cells[1].Text);

        grvOfficeInspectionResults.DataSource = ctx.OfficeInspectionItems
                                                           .Join (
                                                              ctx.OfficeInspectionDetails, 
                                                              OII => 
                                                                 new  
                                                                 {
                                                                    officeInsItemNo = OII.officeInsItemNo
                                                                 }, 
                                                              OID => 
                                                                 new  
                                                                 {
                                                                    officeInsItemNo = (Int32)(OID.officeInsItemNo)
                                                                 }, 
                                                              (OII, OID) => 
                                                                 new  
                                                                 {
                                                                    OII = OII, 
                                                                    OID = OID
                                                                 }
                                                           )
                                                           .Join (
                                                              ctx.OfficeInspections, 
                                                              temp0 => temp0.OID.officeInsNo, 
                                                              OI => (Int32?)(OI.officeInsNo), 
                                                              (temp0, OI) => 
                                                                 new  
                                                                 {
                                                                    temp0 = temp0, 
                                                                    OI = OI
                                                                 }
                                                           )
                                                           .GroupJoin (
                                                              ctx.OfficeFollowUps, 
                                                              temp1 => 
                                                                 new  
                                                                 {
                                                                    officeInsItemNo = temp1.temp0.OII.officeInsItemNo, 
                                                                    officeInsNo = temp1.OI.officeInsNo
                                                                 }, 
                                                              OFU => 
                                                                 new  
                                                                 {
                                                                    officeInsItemNo = (Int32)(OFU.officeInsItemNo), 
                                                                    officeInsNo = OFU.officeInsNo
                                                                 }, 
                                                              (temp1, officefollowup_join) => 
                                                                 new  
                                                                 {
                                                                    temp1 = temp1, 
                                                                    officefollowup_join = officefollowup_join
                                                                 }
                                                           )
                                                           .SelectMany (
                                                              temp2 => temp2.officefollowup_join.DefaultIfEmpty (), 
                                                              (temp2, OFU) => 
                                                                 new  
                                                                 {
                                                                    temp2 = temp2, 
                                                                    OFU = OFU
                                                                 }
                                                           )
                                                           .Where (
                                                              temp3 =>
                                                                    (((temp3.OFU.officeInsNo == selectedOfficeInsNo) && (temp3.temp2.temp1.OI.officeInsNo == selectedOfficeInsNo)) ||
                                                                       (((Int32?)(temp3.OFU.officeInsNo) == null) && (temp3.temp2.temp1.OI.officeInsNo == selectedOfficeInsNo))
                                                                    )
                                                           )
                                                           .Select (
                                                              temp3 => 
                                                                 new  
                                                                 {
                                                                    officeInsName = temp3.temp2.temp1.temp0.OII.officeInsName, 
                                                                    checkbox = temp3.temp2.temp1.temp0.OID.checkbox, 
                                                                    comments = temp3.temp2.temp1.temp0.OID.comments, 
                                                                    comment = temp3.OFU.comment
                                                                 }
                                                           );


        grvOfficeInspectionResults.DataBind();

        tbOfficeInspectionComment.Text = Convert.ToString(ctx.OfficeInspections.Where(OI => (OI.officeInsNo == selectedOfficeInsNo)).Select(OI => OI.comments).FirstOrDefault());


        var qryFollowUpSubmitter = ctx.OfficeInspections.Where(OI => (OI.officeInsNo == selectedOfficeInsNo)).Select(OI => OI.followupSubmitter).FirstOrDefault();
        if (qryFollowUpSubmitter != null)
        {
            lblOfficeFollowUpSubmitter.Text = Convert.ToString(qryFollowUpSubmitter);
        }

        var qryFollowUpDate = ctx.OfficeInspections.Where(OI => (OI.officeInsNo == selectedOfficeInsNo)).Select(OI => OI.followupDate).FirstOrDefault();
        if (qryFollowUpDate != null)
        {
            DateTime temp = Convert.ToDateTime(qryFollowUpDate);
            lblOfficeFollowUpDate.Text = temp.ToString("MM/dd/yyyy");
        }

        var qryFollowUpStatus = ctx.OfficeInspections.Where(OI => (OI.officeInsNo == selectedOfficeInsNo)).Select(OI => OI.followUpStatus).FirstOrDefault();
        if (qryFollowUpStatus != null)
        {
            if (qryFollowUpStatus == "1")
            {
                lblOfficeFollowUpStatus.Text = "No Follow Up";
            }
            else if (qryFollowUpStatus == "0")
            {
                lblOfficeFollowUpStatus.Text = "No Follow Up";
            }
            else
            {
                lblOfficeFollowUpStatus.Text = "Follow Up Complete";
            }
        }

        var qryFollowUpComment = ctx.OfficeInspections.Where(OI => (OI.officeInsNo == selectedOfficeInsNo)).Select(OI => OI.followupComment).FirstOrDefault();
        if (qryFollowUpComment != null)
        {
            tbOfficeFollowUpComment.Text = qryFollowUpComment.ToString();
        }
    }

    /// <summary>
    /// This method populates one of the column fields on the fly.
    /// It changes any 1, 2, 3 to their appropriate values.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
        DateTime currentDate = DateTime.Now;
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
                               .Where(temp1 => (temp1.TC.trainingName == temp) && (temp1.temp0.emp.endDate > (currentDate)))
                               .Select(
                                  temp1 =>
                                     new
                                     {
                                         lastname = temp1.temp0.emp.lname,
                                         firstname = temp1.temp0.emp.fname,
                                         startdate = temp1.temp0.TT.startDate,
                                         expirydate = temp1.temp0.TT.endDate
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
        DateTime currentDate = DateTime.Now;
        DateTime currentDateMonths = DateTime.Now.AddMonths(month);
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
                                        .Where(temp1 => (((currentDateMonths) > temp1.temp0.TT.endDate) && (temp1.temp0.emp.endDate > (currentDate))))
                                        .Select(
                                            temp1 =>
                                                new
                                                {
                                                    trainingName = temp1.TC.trainingName,
                                                    lastname = temp1.temp0.emp.lname,
                                                    firstname = temp1.temp0.emp.fname,
                                                    expirydate = temp1.temp0.TT.endDate
                                                }
                                        );
        grvPanelExpiringCourses.Controls.Add(grvExpiringCourseLookUp);
        grvExpiringCourseLookUp.Caption = "<table width=\"100%\" class=\"gvCaption\"><tr><td>Expiring Courses</td></tr></table>";
        grvExpiringCourseLookUp.DataBind();
    }
    #endregion

    /// <summary>
    /// Redirects users to a new page that shows
    /// statistics of the website such as total employees.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnStatistics_Click(object sender, EventArgs e)
    {
        Response.Redirect("Statistics.aspx");
    }

    #region Incident Code

        private void populateTrackerGridView() {
            gdvTracker.DataSource = ctx.Incidents;
            gdvTracker.DataBind();
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
    /// Populates the departments drop down list.
    /// Loads departments from the database.
    /// Adds the "no selection" option to the front of the list.
    /// Adds the "other" option to the end of the list.
    /// </summary>
    private void PopulateDepartmentsDdl() {
        ddlDepartments.DataSource = ctx.Departments.OrderBy(d => d.deptName);
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
                tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy");
            }

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
    /// Calls the create report method, which creates an Incident report using the form.
    /// This method then saves that report in the database.
    /// Displays a pop-up window with a success or fail message.
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
            Incident report = createReport();
            try {
                ctx.AddToIncidents(report);
                ctx.SaveChanges();
                Popup_Overlay("Report successfully created.", SuccessColour);
            }
            catch (Exception ex) {
                Popup_Overlay("An error has occured while creating your report. Please try again." + ex.StackTrace.ToString(), FailColour);
                return;
            }
        }
    }

    /// <summary>
    /// Creates a new Incident report object (using the form fields) and returns that report.
    /// Does not save the report into the database.
    /// Returns the new Incident report on success, null on failure.
    /// </summary>
    /// <returns>the newly created Incident report</returns>
    private Incident createReport() {
        getEmployeeData();
        int empId = Convert.ToInt32(tbxId.Text);

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

    #region Load Incident Report
    /// <summary>
    /// Calls the getReport method, which load an Incident report from the database into the form.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnLoadReport_Click(object sender, EventArgs e) {
        getReport(2);
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
        tbx_p1_dateOfIncident.Text = convertDateTimeToString(report.p1_dateOfIncident);
        tbx_p1_timeOfIncident.Text = convertTimeToString(report.p1_dateOfIncident);
        tbx_p1_dateReported.Text = convertDateTimeToString(report.p1_dateReported);
        tbx_p1_timeReported.Text = convertTimeToString(report.p1_dateReported);
        tbx_p1_incidentDesc.Text = convertToTextBoxValue(report.p1_incidentDesc);
        tbx_p1_witnessName1.Text = convertToTextBoxValue(report.p1_witnessName1);
        tbx_p1_witnessPhone1.Text = convertToTextBoxValue(report.p1_witnessPhone1);
        tbx_p1_witnessName2.Text = convertToTextBoxValue(report.p1_witnessName2);
        tbx_p1_witnessPhone2.Text = convertToTextBoxValue(report.p1_witnessPhone2);
        cbx_p1_action_report.Checked = convertToCheckBoxValue(report.p1_action_report);
        cbx_p1_action_firstAid.Checked = convertToCheckBoxValue(report.p1_action_firstAid);
        cbx_p1_action_medicalGP.Checked = convertToCheckBoxValue(report.p1_action_medicalGP);
        tbx_p1_action_medicalGP_date.Text = convertDateTimeToString(report.p1_action_medicalGP_date);
        cbx_p1_action_medicalER.Checked = convertToCheckBoxValue(report.p1_action_medicalER);
        tbx_p1_action_medicalER_date.Text = convertDateTimeToString(report.p1_action_medicalER_date);
        cbx_p1_action_lostTime.Checked = convertToCheckBoxValue(report.p1_action_lostTime);
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        cbx_p1_nature_no.Checked = convertToCheckBoxValue(report.p1_nature_no);
        cbx_p1_nature_musculoskeletal.Checked = convertToCheckBoxValue(report.p1_nature_musculoskeletal);
        cbx_p1_nature_bruise.Checked = convertToCheckBoxValue(report.p1_nature_bruise);
        cbx_p1_nature_burn.Checked = convertToCheckBoxValue(report.p1_nature_burn);
        cbx_p1_nature_cut.Checked = convertToCheckBoxValue(report.p1_nature_cut);
        cbx_p1_nature_puncture.Checked = convertToCheckBoxValue(report.p1_nature_puncture);
        cbx_p1_nature_skinIrritation.Checked = convertToCheckBoxValue(report.p1_nature_skinIrritation);
        cbx_p1_nature_skinMucous.Checked = convertToCheckBoxValue(report.p1_nature_skinMucous);
        cbx_p1_nature_eye.Checked = convertToCheckBoxValue(report.p1_nature_eye);
        cbx_p1_nature_allergic.Checked = convertToCheckBoxValue(report.p1_nature_allergic);
        cbx_p1_nature_psychological.Checked = convertToCheckBoxValue(report.p1_nature_psychological);
        cbx_p1_nature_respiratory.Checked = convertToCheckBoxValue(report.p1_nature_respiratory);
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        cbx_p2_activity_no.Checked = convertToCheckBoxValue(report.p2_activity_no);
        cbx_p2_activity_repositioning.Checked = convertToCheckBoxValue(report.p2_activity_repositioning);
        cbx_p2_activity_transferring.Checked = convertToCheckBoxValue(report.p2_activity_transferring);
        cbx_p2_activity_assistedWalking.Checked = convertToCheckBoxValue(report.p2_activity_assistedWalking);
        cbx_p2_activity_assistedFloor.Checked = convertToCheckBoxValue(report.p2_activity_assistedFloor);
        cbx_p2_activity_fall.Checked = convertToCheckBoxValue(report.p2_activity_fall);
        cbx_p2_activity_holding.Checked = convertToCheckBoxValue(report.p2_activity_holding);
        cbx_p2_activity_toileting.Checked = convertToCheckBoxValue(report.p2_activity_toileting);

        cbx_p2_patient_ceilingLift.Checked = convertToCheckBoxValue(report.p2_patient_ceilingLift);
        cbx_p2_patient_sitStandLift.Checked = convertToCheckBoxValue(report.p2_patient_sitStandLift);
        cbx_p2_patient_floorLift.Checked = convertToCheckBoxValue(report.p2_patient_floorLift);
        cbx_p2_patient_manualLift.Checked = convertToCheckBoxValue(report.p2_patient_manualLift);
        cbx_p2_patient_other.Checked = convertToCheckBoxValue(report.p2_patient_otherSpecify);
        tbx_p2_patient_otherSpecify.Text = convertToTextBoxValue(report.p2_patient_otherSpecify);
        tbx_p1_numEmployeesInvolved.Text = (report.p1_numEmployeesInvolved == null) ? String.Empty : report.p1_numEmployeesInvolved.ToString();

        tbx_p2_patient_otherSpecify.Text = convertToTextBoxValue(report.p2_patient_otherSpecify);
        rbl_p2_patient_adequateAssist.SelectedValue = convertToTextBoxValue(report.p2_patient_adequateAssist);

        cbx_p2_activity_washing.Checked = convertToCheckBoxValue(report.p2_activity_washing);
        cbx_p2_activity_dressing.Checked = convertToCheckBoxValue(report.p2_activity_dressing);
        cbx_p2_activity_changing.Checked = convertToCheckBoxValue(report.p2_activity_changing);
        cbx_p2_activity_feeding.Checked = convertToCheckBoxValue(report.p2_activity_feeding);
        cbx_p2_activity_prep.Checked = convertToCheckBoxValue(report.p2_activity_prep);
        cbx_p2_activity_dressingChanges.Checked = convertToCheckBoxValue(report.p2_activity_dressingChanges);
        tbx_p2_activity_otherPatientCare.Text = convertToTextBoxValue(report.p2_activity_otherPatientCare);

        cbx_p2_activity_recapping.Checked = convertToCheckBoxValue(report.p2_activity_recapping);
        cbx_p2_activity_puncture.Checked = convertToCheckBoxValue(report.p2_activity_puncture);
        cbx_p2_activity_sharpsDisposal.Checked = convertToCheckBoxValue(report.p2_activity_sharpsDisposal);
        cbx_p2_activity_otherSharps.Checked = convertToCheckBoxValue(report.p2_activity_otherSharps);

        tbx_p2_activity_material.Text = convertToTextBoxValue(report.p2_activity_material);
        cbx_p2_activity_lift.Checked = convertToCheckBoxValue(report.p2_activity_lift);
        cbx_p2_activity_push.Checked = convertToCheckBoxValue(report.p2_activity_push);
        cbx_p2_activity_carry.Checked = convertToCheckBoxValue(report.p2_activity_carry);
        tbx_p2_activity_otherMat.Text = convertToTextBoxValue(report.p2_activity_otherMat);
        cbx_p2_activity_driving.Checked = convertToCheckBoxValue(report.p2_activity_driving);
        tbx_p2_activity_otherEquip.Text = convertToTextBoxValue(report.p2_activity_otherEquip);
        cbx_p2_activity_otherEquipDesc.Checked = convertToCheckBoxValue(report.p2_activity_otherEquipDesc);
        tbx_p2_activity_otherEquipDesc.Text = convertToTextBoxValue(report.p2_activity_otherEquipDesc);

        cbx_p2_activity_equipMain.Checked = convertToCheckBoxValue(report.p2_activity_equipMain);
        cbx_p2_activity_comp.Checked = convertToCheckBoxValue(report.p2_activity_comp);
        cbx_p2_activity_nonComp.Checked = convertToCheckBoxValue(report.p2_activity_nonComp);

        cbx_p2_activity_walking.Checked = convertToCheckBoxValue(report.p2_activity_walking);
        cbx_p2_activity_bending.Checked = convertToCheckBoxValue(report.p2_activity_bending);
        cbx_p2_activity_reading.Checked = convertToCheckBoxValue(report.p2_activity_reading);
        cbx_p2_activity_spill.Checked = convertToCheckBoxValue(report.p2_activity_spill);
        cbx_p2_activity_cleaning.Checked = convertToCheckBoxValue(report.p2_activity_cleaning);
        tbx_p2_activity_other.Text = convertToTextBoxValue(report.p2_activity_other);
        #endregion C_AccidentInvestigation

        #region D_Cause
        cbx_p2_cause_human.Checked = convertToCheckBoxValue(report.p2_cause_human);
        cbx_p2_cause_animal.Checked = convertToCheckBoxValue(report.p2_cause_animal);

        cbx_p2_cause_needle.Checked = convertToCheckBoxValue(report.p2_cause_needle);
        cbx_p2_cause_otherSharps.Checked = convertToCheckBoxValue(report.p2_cause_otherSharps);
        cbx_p2_cause_skin.Checked = convertToCheckBoxValue(report.p2_cause_skin);

        cbx_p2_cause_awkwardPosture.Checked = convertToCheckBoxValue(report.p2_cause_awkwardPosture);
        cbx_p2_cause_staticPosture.Checked = convertToCheckBoxValue(report.p2_cause_staticPosture);
        cbx_p2_cause_contactStress.Checked = convertToCheckBoxValue(report.p2_cause_contactStress);
        cbx_p2_cause_force.Checked = convertToCheckBoxValue(report.p2_cause_force);
        cbx_p2_cause_rep.Checked = convertToCheckBoxValue(report.p2_cause_rep);

        cbx_p2_cause_motor.Checked = convertToCheckBoxValue(report.p2_cause_motor);
        cbx_p2_cause_slip.Checked = convertToCheckBoxValue(report.p2_cause_slip);
        cbx_p2_cause_aggression.Checked = convertToCheckBoxValue(report.p2_cause_aggression);
        cbx_p2_cause_undetermined.Checked = convertToCheckBoxValue(report.p2_cause_undetermined);
        cbx_p2_cause_event.Checked = convertToCheckBoxValue(report.p2_cause_event);
        cbx_p2_cause_underEquip.Checked = convertToCheckBoxValue(report.p2_cause_underEquip);
        cbx_p2_cause_hit.Checked = convertToCheckBoxValue(report.p2_cause_hit);
        tbx_p2_cause_other.Text = convertToTextBoxValue(report.p2_cause_other);

        cbx_p2_cause_aggression_verbal.Checked = convertToCheckBoxValue(report.p2_aggression_verbal);
        cbx_p2_cause_aggression_biting.Checked = convertToCheckBoxValue(report.p2_aggression_biting);
        cbx_p2_cause_aggression_hitting.Checked = convertToCheckBoxValue(report.p2_aggression_hitting);
        cbx_p2_cause_aggression_squeezing.Checked = convertToCheckBoxValue(report.p2_aggression_squeezing);
        cbx_p2_cause_aggression_assault.Checked = convertToCheckBoxValue(report.p2_aggression_assault);
        cbx_p2_cause_aggression_patient.Checked = convertToCheckBoxValue(report.p2_aggression_patient);
        cbx_p2_cause_aggression_family.Checked = convertToCheckBoxValue(report.p2_aggression_family);
        cbx_p2_cause_aggression_public.Checked = convertToCheckBoxValue(report.p2_aggression_public);
        cbx_p2_cause_aggression_worker.Checked = convertToCheckBoxValue(report.p2_aggression_worker);
        tbx_p2_cause_aggression_other.Text = convertToTextBoxValue(report.p2_aggression_other);

        tbx_p2_cause_exposure_chemName.Text = convertToTextBoxValue(report.p2_cause_exposure_chemName);
        cbx_p2_cause_chemInhalation.Checked = convertToCheckBoxValue(report.p2_cause_chemInhalation);
        cbx_p2_cause_chemIngest.Checked = convertToCheckBoxValue(report.p2_cause_chemIngest);
        cbx_p2_cause_chemContact.Checked = convertToCheckBoxValue(report.p2_cause_chemContact);
        cbx_p2_cause_latex.Checked = convertToCheckBoxValue(report.p2_cause_latex);
        cbx_p2_cause_dust.Checked = convertToCheckBoxValue(report.p2_cause_dust);
        cbx_p2_cause_disease.Checked = convertToCheckBoxValue(report.p2_cause_disease);
        cbx_p2_cause_temp.Checked = convertToCheckBoxValue(report.p2_cause_temp);
        cbx_p2_cause_noise.Checked = convertToCheckBoxValue(report.p2_cause_noise);
        cbx_p2_cause_radiation.Checked = convertToCheckBoxValue(report.p2_cause_radiation);
        cbx_p2_cause_elec.Checked = convertToCheckBoxValue(report.p2_cause_elec);
        cbx_p2_cause_air.Checked = convertToCheckBoxValue(report.p2_cause_air);
        #endregion D_Cause

        #region E_ContributingFactors
        cbx_p2_factors_malfunction.Checked = convertToCheckBoxValue(report.p2_factors_malfunction);
        cbx_p2_factors_improperUse.Checked = convertToCheckBoxValue(report.p2_factors_improperUse);
        cbx_p2_factors_signage.Checked = convertToCheckBoxValue(report.p2_factors_signage);
        cbx_p2_factors_notAvailable.Checked = convertToCheckBoxValue(report.p2_factors_notAvailable);
        cbx_p2_factors_poorDesign.Checked = convertToCheckBoxValue(report.p2_factors_poorDesign);
        tbx_p2_factors_otherEquip.Text = convertToTextBoxValue(report.p2_factors_otherEquip);

        cbx_p2_factors_temp.Checked = convertToCheckBoxValue(report.p2_factors_temp);
        cbx_p2_factors_workplace.Checked = convertToCheckBoxValue(report.p2_factors_workplace);
        cbx_p2_factors_layout.Checked = convertToCheckBoxValue(report.p2_factors_layout);
        cbx_p2_factors_limitedWorkspace.Checked = convertToCheckBoxValue(report.p2_factors_limitedWorkspace);
        cbx_p2_factors_slippery.Checked = convertToCheckBoxValue(report.p2_factors_slippery);
        cbx_p2_factors_lighting.Checked = convertToCheckBoxValue(report.p2_factors_lighting);
        cbx_p2_factors_noise.Checked = convertToCheckBoxValue(report.p2_factors_noise);
        cbx_p2_factors_vent.Checked = convertToCheckBoxValue(report.p2_factors_vent);
        cbx_p2_factors_storage.Checked = convertToCheckBoxValue(report.p2_factors_storage);
        tbx_p2_factors_otherEnv.Text = convertToTextBoxValue(report.p2_factors_otherEnv);

        cbx_p2_factors_assessment.Checked = convertToCheckBoxValue(report.p2_factors_assessment);
        cbx_p2_factors_procedure.Checked = convertToCheckBoxValue(report.p2_factors_procedure);
        cbx_p2_factors_appropriateEquip.Checked = convertToCheckBoxValue(report.p2_factors_appropriateEquip);
        cbx_p2_factors_conduct.Checked = convertToCheckBoxValue(report.p2_factors_conduct);
        cbx_p2_factors_extended.Checked = convertToCheckBoxValue(report.p2_factors_extended);
        cbx_p2_factors_comm.Checked = convertToCheckBoxValue(report.p2_factors_comm);
        cbx_p2_factors_unaccustomed.Checked = convertToCheckBoxValue(report.p2_factors_unaccustomed);
        tbx_p2_factors_otherWorkPractice.Text = convertToTextBoxValue(report.p2_factors_otherWorkPractice);

        cbx_p2_factors_directions.Checked = convertToCheckBoxValue(report.p2_factors_directions);
        cbx_p2_factors_weight.Checked = convertToCheckBoxValue(report.p2_factors_weight);
        cbx_p2_factors_aggressive.Checked = convertToCheckBoxValue(report.p2_factors_aggressive);
        cbx_p2_factors_patientResistive.Checked = convertToCheckBoxValue(report.p2_factors_patientResistive);
        cbx_p2_factors_movement.Checked = convertToCheckBoxValue(report.p2_factors_movement);
        cbx_p2_factors_confused.Checked = convertToCheckBoxValue(report.p2_factors_confused);
        cbx_p2_factors_influence.Checked = convertToCheckBoxValue(report.p2_factors_influence);
        cbx_p2_factors_lang.Checked = convertToCheckBoxValue(report.p2_factors_lang);
        tbx_p2_factors_otherPatient.Text = convertToTextBoxValue(report.p2_factors_otherPatient);

        cbx_p2_factors_alone.Checked = convertToCheckBoxValue(report.p2_factors_alone);
        cbx_p2_factors_info.Checked = convertToCheckBoxValue(report.p2_factors_info);
        cbx_p2_factors_scheduling.Checked = convertToCheckBoxValue(report.p2_factors_scheduling);
        cbx_p2_factors_training.Checked = convertToCheckBoxValue(report.p2_factors_training);
        cbx_p2_factors_equip.Checked = convertToCheckBoxValue(report.p2_factors_equip);
        cbx_p2_factors_personal.Checked = convertToCheckBoxValue(report.p2_factors_personal);
        cbx_p2_factors_safe.Checked = convertToCheckBoxValue(report.p2_factors_safe);
        cbx_p2_factors_perceived.Checked = convertToCheckBoxValue(report.p2_factors_perceived);
        tbx_p2_factors_otherOrganizational.Text = convertToTextBoxValue(report.p2_factors_otherOrganizational);

        cbx_p2_factors_inexperienced.Checked = convertToCheckBoxValue(report.p2_factors_inexperienced);
        cbx_p2_factors_communication.Checked = convertToCheckBoxValue(report.p2_factors_communication);
        cbx_p2_factors_fatigued.Checked = convertToCheckBoxValue(report.p2_factors_fatigued);
        cbx_p2_factors_distracted.Checked = convertToCheckBoxValue(report.p2_factors_distracted);
        cbx_p2_factors_preexisting.Checked = convertToCheckBoxValue(report.p2_factors_preexisting);
        cbx_p2_factors_sick.Checked = convertToCheckBoxValue(report.p2_factors_sick);
        tbx_p2_factors_otherWorker.Text = convertToTextBoxValue(report.p2_factors_otherWorker);
        #endregion E_ContributingFactors

        #region F_CorrectiveAction
        tbx_p2_corrective_person.Text = convertToTextBoxValue(report.p2_corrective_person);
        tbx_p2_corrective_personDate.Text = convertDateTimeToString(report.p2_corrective_personDate);
        rbl_p2_corrective_maintenance.SelectedValue = convertToTextBoxValue(report.p2_corrective_maintenance);
        tbx_p2_corrective_maintenanceDate.Text = convertDateTimeToString(report.p2_corrective_maintenanceDate);
        rbl_p2_corrective_communicated.SelectedValue = convertToTextBoxValue(report.p2_corrective_communicated);
        tbx_p2_corrective_communicatedDate.Text = convertDateTimeToString(report.p2_corrective_communicatedDate);
        rbl_p2_corrective_time.SelectedValue = convertToTextBoxValue(report.p2_corrective_time);
        tbx_p2_corrective_timeDate.Text = convertDateTimeToString(report.p2_corrective_timeDate);
        #endregion F_CorrectiveAction

        #region G_FollowUp
        tbx_p2_corrective_written.Text = convertToTextBoxValue(report.p2_corrective_written);
        tbx_p2_corrective_writtenTargetDate.Text = convertDateTimeToString(report.p2_corrective_writtenTargetDate);
        tbx_p2_corrective_writtenCompletedDate.Text = convertDateTimeToString(report.p2_corrective_writtenCompletedDate);
        tbx_p2_corrective_education.Text = convertToTextBoxValue(report.p2_corrective_education);
        tbx_p2_corrective_educationTargetDate.Text = convertDateTimeToString(report.p2_corrective_educationTargetDate);
        tbx_p2_corrective_educationCompletedDate.Text = convertDateTimeToString(report.p2_corrective_educationCompletedDate);
        tbx_p2_corrective_equipment.Text = convertToTextBoxValue(report.p2_corrective_equipment);
        tbx_p2_corrective_equipmentTargetDate.Text = convertDateTimeToString(report.p2_corrective_equipmentTargetDate);
        tbx_p2_corrective_equipmentCompletedDate.Text = convertDateTimeToString(report.p2_corrective_equipmentCompletedDate);
        tbx_p2_corrective_environment.Text = convertToTextBoxValue(report.p2_corrective_environment);
        tbx_p2_corrective_environmentTargetDate.Text = convertDateTimeToString(report.p2_corrective_environmentTargetDate);
        tbx_p2_corrective_environmentCompletedDate.Text = convertDateTimeToString(report.p2_corrective_environmentCompletedDate);
        tbx_p2_corrective_patient.Text = convertToTextBoxValue(report.p2_corrective_patient);
        tbx_p2_corrective_patientTargetDate.Text = convertDateTimeToString(report.p2_corrective_patientTargetDate);
        tbx_p2_corrective_patientCompletedDate.Text = convertDateTimeToString(report.p2_corrective_patientCompletedDate);
        #endregion G_FollowUp

        #region G_ManagersReport
        tbx_p2_manager_previous.Text = convertToTextBoxValue(report.p2_manager_previous);
        tbx_p2_manager_objections.Text = convertToTextBoxValue(report.p2_manager_objections);
        tbx_p2_manager_alternative.Text = convertToTextBoxValue(report.p2_manager_alternative);
        #endregion G_ManagersReport

        #region H_FixedShiftRotation

        #region H_FixedShiftRotation_Week1
        tbx_p2_manager_week1_sun.Text = report.p2_manager_week1_sun == null ? String.Empty : report.p2_manager_week1_sun.ToString();
        tbx_p2_manager_week1_mon.Text = report.p2_manager_week1_mon == null ? String.Empty : report.p2_manager_week1_mon.ToString();
        tbx_p2_manager_week1_tue.Text = report.p2_manager_week1_tue == null ? String.Empty : report.p2_manager_week1_tue.ToString();
        tbx_p2_manager_week1_wed.Text = report.p2_manager_week1_wed == null ? String.Empty : report.p2_manager_week1_wed.ToString();
        tbx_p2_manager_week1_thu.Text = report.p2_manager_week1_thu == null ? String.Empty : report.p2_manager_week1_thu.ToString();
        tbx_p2_manager_week1_fri.Text = report.p2_manager_week1_fri == null ? String.Empty : report.p2_manager_week1_fri.ToString();
        tbx_p2_manager_week1_sat.Text = report.p2_manager_week1_sat == null ? String.Empty : report.p2_manager_week1_sat.ToString();
        #endregion H_FixedShiftRotation_Week1

        #region H_FixedShiftRotation_Week2
        tbx_p2_manager_week2_sun.Text = report.p2_manager_week2_sun == null ? String.Empty : report.p2_manager_week2_sun.ToString();
        tbx_p2_manager_week2_mon.Text = report.p2_manager_week2_mon == null ? String.Empty : report.p2_manager_week2_mon.ToString();
        tbx_p2_manager_week2_tue.Text = report.p2_manager_week2_tue == null ? String.Empty : report.p2_manager_week2_tue.ToString();
        tbx_p2_manager_week2_wed.Text = report.p2_manager_week2_wed == null ? String.Empty : report.p2_manager_week2_wed.ToString();
        tbx_p2_manager_week2_thu.Text = report.p2_manager_week2_thu == null ? String.Empty : report.p2_manager_week2_thu.ToString();
        tbx_p2_manager_week2_fri.Text = report.p2_manager_week2_fri == null ? String.Empty : report.p2_manager_week2_fri.ToString();
        tbx_p2_manager_week2_sat.Text = report.p2_manager_week2_sat == null ? String.Empty : report.p2_manager_week2_sat.ToString();
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
    private Boolean convertToCheckBoxValue(String value) {
        if ((value == null) || value.Equals("2")) {
            return false;
        }
        return true;
    }

    /// <summary>
    /// If a string is NULL, returns an empty string.
    /// Otherwise, returns the value.
    /// This is so textboxes display an empty string instead of NULL.
    /// </summary>
    /// <param name="value">The String to convert.</param>
    /// <returns>Empty string if null, otherwise returns the value.</returns>
    private String convertToTextBoxValue(String value) {
        if (value == null) {
            return String.Empty;}
        return value;
    }

    /// <summary>
    /// Converts a DateTime into a formatted string.
    /// Returns the date in the format "M/d/yyyy" (e.g. 11/1/2010).
    /// Returns an empty string if the value is null.
    /// </summary>
    /// <param name="value">The Date to convert.</param>
    /// <returns>The date in the format "M/d/yyyy" or an empty string if the value is null.</returns>
    private String convertDateTimeToString(Object value) {
        if (value == null) {
            return String.Empty;
        }
        return Convert.ToDateTime(value).ToString("M/d/yyyy");
    }

    /// <summary>
    /// Converts a DateTime into a formatted string.
    /// Returns the date in the format "h:mm tt" (e.g. 5:37 PM).
    /// Returns an empty string if the value is null.
    /// </summary>
    /// <param name="value">The Date to convert.</param>
    /// <returns>The time in the format "h:mm tt" or an empty string if the value is null.</returns>
    private String convertTimeToString(Object value) {
        if (value == null) {
            return String.Empty;
        }
        return Convert.ToDateTime(value).ToString("h:mm tt");
    }
    #endregion Load Incident Report

    #region Filter Report
    /// <summary>
    /// Calls the filter report method, which gets a list of incident reports that match ONLY the data entered
    /// into the form. Only considers the checkboxes (Section B, C, D, and E).
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnFilterReport_Click(object sender, EventArgs e) {
        filterReport(gdvTracker);
    }

    /// <summary>
    /// Gets a list of incident reports that match ONLY the data entered into the form.
    /// Only considers the checkboxes in sections B, C, D, and E of the form.
    /// Populates the GridView parameter with the resulting reports.
    /// </summary>
    private void filterReport(GridView gdv) {
        var reports = ctx.Incidents
                      .Select(r => r);
        
        if (!tbxFirstName.Text.Equals(String.Empty)) {
            reports = reports.Where(r => r.Employee.fname.Equals(tbxFirstName.Text));
        }

        #region B_NatureOfInjury
        if (cbx_p1_nature_no.Checked) { reports = reports.Where(r => r.p1_nature_no.Equals("1")); }
        if (cbx_p1_nature_musculoskeletal.Checked) { reports = reports.Where(r => r.p1_nature_musculoskeletal.Equals("1")); }
        if (cbx_p1_nature_bruise.Checked) { reports = reports.Where(r => r.p1_nature_bruise.Equals("1")); }
        if (cbx_p1_nature_burn.Checked) { reports = reports.Where(r => r.p1_nature_burn.Equals("1")); }
        if (cbx_p1_nature_cut.Checked) { reports = reports.Where(r => r.p1_nature_cut.Equals("1")); }
        if (cbx_p1_nature_puncture.Checked) { reports = reports.Where(r => r.p1_nature_puncture.Equals("1")); }
        if (cbx_p1_nature_skinIrritation.Checked) { reports = reports.Where(r => r.p1_nature_skinIrritation.Equals("1")); }
        if (cbx_p1_nature_skinMucous.Checked) { reports = reports.Where(r => r.p1_nature_skinMucous.Equals("1")); }
        if (cbx_p1_nature_eye.Checked) { reports = reports.Where(r => r.p1_nature_eye.Equals("1")); }
        if (cbx_p1_nature_allergic.Checked) { reports = reports.Where(r => r.p1_nature_allergic.Equals("1")); }
        if (cbx_p1_nature_psychological.Checked) { reports = reports.Where(r => r.p1_nature_psychological.Equals("1")); }
        if (cbx_p1_nature_respiratory.Checked) { reports = reports.Where(r => r.p1_nature_respiratory.Equals("1")); }
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        if (cbx_p2_activity_no.Checked) { reports = reports.Where(r => r.p2_activity_no.Equals("1")); }
        if (cbx_p2_activity_repositioning.Checked) { reports = reports.Where(r => r.p2_activity_repositioning.Equals("1")); }
        if (cbx_p2_activity_transferring.Checked) { reports = reports.Where(r => r.p2_activity_transferring.Equals("1")); }
        if (cbx_p2_activity_assistedWalking.Checked) { reports = reports.Where(r => r.p2_activity_assistedWalking.Equals("1")); }
        if (cbx_p2_activity_assistedFloor.Checked) { reports = reports.Where(r => r.p2_activity_assistedFloor.Equals("1")); }
        if (cbx_p2_activity_fall.Checked) { reports = reports.Where(r => r.p2_activity_fall.Equals("1")); }
        if (cbx_p2_activity_holding.Checked) { reports = reports.Where(r => r.p2_activity_holding.Equals("1")); }
        if (cbx_p2_activity_toileting.Checked) { reports = reports.Where(r => r.p2_activity_toileting.Equals("1")); }
        
        if (cbx_p2_patient_ceilingLift.Checked) { reports = reports.Where(r => r.p2_patient_ceilingLift.Equals("1")); }
        if (cbx_p2_patient_sitStandLift.Checked) { reports = reports.Where(r => r.p2_patient_sitStandLift.Equals("1")); }
        if (cbx_p2_patient_floorLift.Checked) { reports = reports.Where(r => r.p2_patient_floorLift.Equals("1")); }
        if (cbx_p2_patient_manualLift.Checked) { reports = reports.Where(r => r.p2_patient_manualLift.Equals("1")); }
        if (cbx_p2_patient_other.Checked) { reports = reports.Where(r => !(r.p2_patient_otherSpecify.Equals(null))); }
        if (!rbl_p2_patient_adequateAssist.SelectedValue.Equals(String.Empty)) {
            reports = reports.Where(r => r.p2_patient_adequateAssist.Equals(rbl_p2_patient_adequateAssist.SelectedValue));
        }
        
        if (cbx_p2_activity_washing.Checked) { reports = reports.Where(r => r.p2_activity_washing.Equals("1")); }
        if (cbx_p2_activity_dressing.Checked) { reports = reports.Where(r => r.p2_activity_dressing.Equals("1")); }
        if (cbx_p2_activity_changing.Checked) { reports = reports.Where(r => r.p2_activity_changing.Equals("1")); }
        if (cbx_p2_activity_feeding.Checked) { reports = reports.Where(r => r.p2_activity_feeding.Equals("1")); }
        if (cbx_p2_activity_prep.Checked) { reports = reports.Where(r => r.p2_activity_prep.Equals("1")); }
        if (cbx_p2_activity_dressingChanges.Checked) { reports = reports.Where(r => r.p2_activity_dressingChanges.Equals("1")); }
        if (cbx_p2_activity_otherPatientCare.Checked) { reports = reports.Where(r => r.p2_activity_otherPatientCare.Equals("1")); }
        
        if (cbx_p2_activity_recapping.Checked) { reports = reports.Where(r => r.p2_activity_recapping.Equals("1")); }
        if (cbx_p2_activity_puncture.Checked) { reports = reports.Where(r => r.p2_activity_puncture.Equals("1")); }
        if (cbx_p2_activity_sharpsDisposal.Checked) { reports = reports.Where(r => r.p2_activity_sharpsDisposal.Equals("1")); }
        if (cbx_p2_activity_otherSharps.Checked) { reports = reports.Where(r => r.p2_activity_otherSharps.Equals("1")); }

        //if (tbx_p2_acitvity_material.Checked) { reports = reports.Where(r => r.p2_activity_material.Equals("1")); }
        if (cbx_p2_activity_lift.Checked) { reports = reports.Where(r => r.p2_activity_lift.Equals("1")); }
        if (cbx_p2_activity_push.Checked) { reports = reports.Where(r => r.p2_activity_push.Equals("1")); }
        if (cbx_p2_activity_carry.Checked) { reports = reports.Where(r => r.p2_activity_carry.Equals("1")); }
        if (cbx_p2_activity_otherMat.Checked) { reports = reports.Where(r => r.p2_activity_otherMat != null); }
        if (cbx_p2_activity_driving.Checked) { reports = reports.Where(r => r.p2_activity_driving.Equals("1")); }
        if (cbx_p2_activity_otherEquip.Checked) { reports = reports.Where(r => r.p2_activity_otherEquip  != null); }
        if (cbx_p2_activity_otherEquipDesc.Checked) { reports = reports.Where(r => r.p2_activity_otherEquipDesc != null);  }
        if (cbx_p2_activity_equipMain.Checked) { reports = reports.Where(r => r.p2_activity_equipMain.Equals("1")); }
        if (cbx_p2_activity_comp.Checked) { reports = reports.Where(r => r.p2_activity_comp.Equals("1")); }
        if (cbx_p2_activity_nonComp.Checked) { reports = reports.Where(r => r.p2_activity_nonComp.Equals("1")); }
                
        if (cbx_p2_activity_walking.Checked) { reports = reports.Where(r => r.p2_activity_walking.Equals("1")); }
        if (cbx_p2_activity_bending.Checked) { reports = reports.Where(r => r.p2_activity_bending.Equals("1")); }
        if (cbx_p2_activity_reading.Checked) { reports = reports.Where(r => r.p2_activity_reading.Equals("1")); }
        if (cbx_p2_activity_spill.Checked) { reports = reports.Where(r => r.p2_activity_spill.Equals("1")); }
        if (cbx_p2_activity_cleaning.Checked) { reports = reports.Where(r => r.p2_activity_cleaning.Equals("1")); }
        if (cbx_p2_activity_other.Checked) { reports = reports.Where(r => r.p2_activity_other != null);  }
        #endregion C_AccidentInvestigation

        #region D_Cause
        if (cbx_p2_cause_human.Checked) { reports = reports.Where(r => r.p2_cause_human.Equals("1")); }
        if (cbx_p2_cause_animal.Checked) { reports = reports.Where(r => r.p2_cause_animal.Equals("1")); }
        
        if (cbx_p2_cause_needle.Checked) { reports = reports.Where(r => r.p2_cause_needle.Equals("1")); }
        if (cbx_p2_cause_otherSharps.Checked) { reports = reports.Where(r => r.p2_cause_otherSharps.Equals("1")); }
        if (cbx_p2_cause_skin.Checked) { reports = reports.Where(r => r.p2_cause_skin.Equals("1")); }

        if (cbx_p2_cause_awkwardPosture.Checked) { reports = reports.Where(r => r.p2_cause_awkwardPosture.Equals("1")); }
        if (cbx_p2_cause_staticPosture.Checked) { reports = reports.Where(r => r.p2_cause_staticPosture.Equals("1")); }
        if (cbx_p2_cause_contactStress.Checked) { reports = reports.Where(r => r.p2_cause_contactStress.Equals("1")); }
        if (cbx_p2_cause_force.Checked) { reports = reports.Where(r => r.p2_cause_force.Equals("1")); }
        if (cbx_p2_cause_rep.Checked) { reports = reports.Where(r => r.p2_cause_rep.Equals("1")); }

        if (cbx_p2_cause_motor.Checked) { reports = reports.Where(r => r.p2_cause_motor.Equals("1")); }
        if (cbx_p2_cause_slip.Checked) { reports = reports.Where(r => r.p2_cause_slip.Equals("1")); }
        if (cbx_p2_cause_aggression.Checked) { reports = reports.Where(r => r.p2_cause_aggression.Equals("1")); }
        if (cbx_p2_cause_undetermined.Checked) { reports = reports.Where(r => r.p2_cause_undetermined.Equals("1")); }
        if (cbx_p2_cause_event.Checked) { reports = reports.Where(r => r.p2_cause_event.Equals("1")); }
        if (cbx_p2_cause_underEquip.Checked) { reports = reports.Where(r => r.p2_cause_underEquip.Equals("1")); }
        if (cbx_p2_cause_hit.Checked) { reports = reports.Where(r => r.p2_cause_hit.Equals("1")); }
        if (cbx_p2_cause_other.Checked) { reports = reports.Where(r => r.p2_cause_other != null); }

        if (cbx_p2_cause_aggression_verbal.Checked) { reports = reports.Where(r => r.p2_aggression_verbal.Equals("1")); }
        if (cbx_p2_cause_aggression_biting.Checked) { reports = reports.Where(r => r.p2_aggression_biting.Equals("1")); }
        if (cbx_p2_cause_aggression_hitting.Checked) { reports = reports.Where(r => r.p2_aggression_hitting.Equals("1")); }
        if (cbx_p2_cause_aggression_squeezing.Checked) { reports = reports.Where(r => r.p2_aggression_squeezing.Equals("1")); }
        if (cbx_p2_cause_aggression_assault.Checked) { reports = reports.Where(r => r.p2_aggression_assault.Equals("1")); }
        if (cbx_p2_cause_aggression_patient.Checked) { reports = reports.Where(r => r.p2_aggression_patient.Equals("1")); }
        if (cbx_p2_cause_aggression_family.Checked) { reports = reports.Where(r => r.p2_aggression_family.Equals("1")); }
        if (cbx_p2_cause_aggression_public.Checked) { reports = reports.Where(r => r.p2_aggression_public.Equals("1")); }
        if (cbx_p2_cause_aggression_worker.Checked) { reports = reports.Where(r => r.p2_aggression_worker.Equals("1")); }
        if (cbx_p2_cause_aggression_other.Checked) { reports = reports.Where(r => r.p2_aggression_other != null); }

        //if (tbx_p2_cause_exposure_chemName.Checked) { reports = reports.Where(r => r.p2_cause_exposure_chemName.Equals("1")); }
        if (cbx_p2_cause_chemInhalation.Checked) { reports = reports.Where(r => r.p2_cause_chemInhalation.Equals("1")); }
        if (cbx_p2_cause_chemIngest.Checked) { reports = reports.Where(r => r.p2_cause_chemIngest.Equals("1")); }
        if (cbx_p2_cause_chemContact.Checked) { reports = reports.Where(r => r.p2_cause_chemContact.Equals("1")); }
        if (cbx_p2_cause_latex.Checked) { reports = reports.Where(r => r.p2_cause_latex.Equals("1")); }
        if (cbx_p2_cause_dust.Checked) { reports = reports.Where(r => r.p2_cause_dust.Equals("1")); }
        if (cbx_p2_cause_disease.Checked) { reports = reports.Where(r => r.p2_cause_disease.Equals("1")); }
        if (cbx_p2_cause_temp.Checked) { reports = reports.Where(r => r.p2_cause_temp.Equals("1")); }
        if (cbx_p2_cause_noise.Checked) { reports = reports.Where(r => r.p2_cause_noise.Equals("1")); }
        if (cbx_p2_cause_radiation.Checked) { reports = reports.Where(r => r.p2_cause_radiation.Equals("1")); }
        if (cbx_p2_cause_elec.Checked) { reports = reports.Where(r => r.p2_cause_elec.Equals("1")); }
        if (cbx_p2_cause_air.Checked) { reports = reports.Where(r => r.p2_cause_air.Equals("1")); }
        #endregion D_Cause
        
        #region E_ContributingFactors
        if (cbx_p2_factors_malfunction.Checked) { reports = reports.Where(r => r.p2_factors_malfunction.Equals("1")); }
        if (cbx_p2_factors_improperUse.Checked) { reports = reports.Where(r => r.p2_factors_improperUse.Equals("1")); }
        if (cbx_p2_factors_signage.Checked) { reports = reports.Where(r => r.p2_factors_signage.Equals("1")); }
        if (cbx_p2_factors_notAvailable.Checked) { reports = reports.Where(r => r.p2_factors_notAvailable.Equals("1")); }
        if (cbx_p2_factors_poorDesign.Checked) { reports = reports.Where(r => r.p2_factors_poorDesign.Equals("1")); }
        if (cbx_p2_factors_otherEquip.Checked) { reports = reports.Where(r => r.p2_factors_otherEquip != null); }
                
        if (cbx_p2_factors_temp.Checked) { reports = reports.Where(r => r.p2_factors_temp.Equals("1")); }
        if (cbx_p2_factors_workplace.Checked) { reports = reports.Where(r => r.p2_factors_workplace.Equals("1")); }
        if (cbx_p2_factors_layout.Checked) { reports = reports.Where(r => r.p2_factors_layout.Equals("1")); }
        if (cbx_p2_factors_limitedWorkspace.Checked) { reports = reports.Where(r => r.p2_factors_limitedWorkspace.Equals("1")); }
        if (cbx_p2_factors_slippery.Checked) { reports = reports.Where(r => r.p2_factors_slippery.Equals("1")); }
        if (cbx_p2_factors_lighting.Checked) { reports = reports.Where(r => r.p2_factors_lighting.Equals("1")); }
        if (cbx_p2_factors_noise.Checked) { reports = reports.Where(r => r.p2_factors_noise.Equals("1")); }
        if (cbx_p2_factors_vent.Checked) { reports = reports.Where(r => r.p2_factors_vent.Equals("1")); }
        if (cbx_p2_factors_storage.Checked) { reports = reports.Where(r => r.p2_factors_storage.Equals("1")); }
        if (cbx_p2_factors_otherEnv.Checked) { reports = reports.Where(r => r.p2_factors_otherEnv != null); }

        if (cbx_p2_factors_assessment.Checked) { reports = reports.Where(r => r.p2_factors_assessment.Equals("1")); }
        if (cbx_p2_factors_procedure.Checked) { reports = reports.Where(r => r.p2_factors_procedure.Equals("1")); }
        if (cbx_p2_factors_appropriateEquip.Checked) { reports = reports.Where(r => r.p2_factors_appropriateEquip.Equals("1")); }
        if (cbx_p2_factors_conduct.Checked) { reports = reports.Where(r => r.p2_factors_conduct.Equals("1")); }
        if (cbx_p2_factors_extended.Checked) { reports = reports.Where(r => r.p2_factors_extended.Equals("1")); }
        if (cbx_p2_factors_comm.Checked) { reports = reports.Where(r => r.p2_factors_comm.Equals("1")); }
        if (cbx_p2_factors_unaccustomed.Checked) { reports = reports.Where(r => r.p2_factors_unaccustomed.Equals("1")); }
        if (cbx_p2_factors_otherWorkPractice.Checked) { reports = reports.Where(r => r.p2_factors_otherWorkPractice != null); }
        
        if (cbx_p2_factors_directions.Checked) { reports = reports.Where(r => r.p2_factors_directions.Equals("1")); }
        if (cbx_p2_factors_weight.Checked) { reports = reports.Where(r => r.p2_factors_weight.Equals("1")); }
        if (cbx_p2_factors_aggressive.Checked) { reports = reports.Where(r => r.p2_factors_aggressive.Equals("1")); }
        if (cbx_p2_factors_patientResistive.Checked) { reports = reports.Where(r => r.p2_factors_patientResistive.Equals("1")); }
        if (cbx_p2_factors_movement.Checked) { reports = reports.Where(r => r.p2_factors_movement.Equals("1")); }
        if (cbx_p2_factors_confused.Checked) { reports = reports.Where(r => r.p2_factors_confused.Equals("1")); }
        if (cbx_p2_factors_influence.Checked) { reports = reports.Where(r => r.p2_factors_influence.Equals("1")); }
        if (cbx_p2_factors_lang.Checked) { reports = reports.Where(r => r.p2_factors_lang.Equals("1")); }
        if (cbx_p2_factors_otherPatient.Checked) { reports = reports.Where(r => r.p2_factors_otherPatient != null); }

        if (cbx_p2_factors_alone.Checked) { reports = reports.Where(r => r.p2_factors_alone.Equals("1")); }
        if (cbx_p2_factors_info.Checked) { reports = reports.Where(r => r.p2_factors_info.Equals("1")); }
        if (cbx_p2_factors_scheduling.Checked) { reports = reports.Where(r => r.p2_factors_scheduling.Equals("1")); }
        if (cbx_p2_factors_training.Checked) { reports = reports.Where(r => r.p2_factors_training.Equals("1")); }
        if (cbx_p2_factors_equip.Checked) { reports = reports.Where(r => r.p2_factors_equip.Equals("1")); }
        if (cbx_p2_factors_personal.Checked) { reports = reports.Where(r => r.p2_factors_personal.Equals("1")); }
        if (cbx_p2_factors_safe.Checked) { reports = reports.Where(r => r.p2_factors_safe.Equals("1")); }
        if (cbx_p2_factors_perceived.Checked) { reports = reports.Where(r => r.p2_factors_perceived.Equals("1")); }
        if (cbx_p2_factors_otherOrganizational.Checked) { reports = reports.Where(r => r.p2_factors_otherOrganizational != null); }
        
        if (cbx_p2_factors_inexperienced.Checked) { reports = reports.Where(r => r.p2_factors_inexperienced.Equals("1")); }
        if (cbx_p2_factors_communication.Checked) { reports = reports.Where(r => r.p2_factors_communication.Equals("1")); }
        if (cbx_p2_factors_fatigued.Checked) { reports = reports.Where(r => r.p2_factors_fatigued.Equals("1")); }
        if (cbx_p2_factors_distracted.Checked) { reports = reports.Where(r => r.p2_factors_distracted.Equals("1")); }
        if (cbx_p2_factors_preexisting.Checked) { reports = reports.Where(r => r.p2_factors_preexisting.Equals("1")); }
        if (cbx_p2_factors_sick.Checked) { reports = reports.Where(r => r.p2_factors_sick.Equals("1")); }
        if (cbx_p2_factors_otherWorker.Checked) { reports = reports.Where(r => r.p2_factors_otherWorker != null); }
        #endregion E_ContributingFactors

        gdv.DataSource = reports;
        gdv.DataBind();
    }
    #endregion Filter Report

    String selection = "";

    protected void gdvTracker_SelectedIndexChanged(object sender, EventArgs e)
    {
        //incidentReportId = gdvTracker.SelectedRow.Cells[1].Text;
        selection = "Incident";
    }

    protected void gdvTracker_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "RowViewReport":
                // Get the row that called the event
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gdvTracker.Rows[index];
                // Get the text of the label holding the Incident No
                String incidentNo = ((Label)row.FindControl("lblIncidentNo")).Text;
                Response.Redirect("~/Reporting/ViewIncidentReport.aspx?IncidentNo=" + incidentNo);
                break;
            case "RowViewEmployees":
                // code here
                break;
            case "RowViewCourses":
                // code here
                break;
            case "RowViewLabInspections":
                // code here
                break;
            case "RowViewOfficeInspections":
                // code here
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }

        if (e.CommandName.Equals("ViewReport"))
        {
            Popup_Overlay("View Report Code.", SuccessColour);
        }

    }
    #endregion
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
