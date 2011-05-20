using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Globalization;

public partial class Tracking_ViewLabInspection : System.Web.UI.Page {  
    #region Class Variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // The date format to use for displaying and converting dates
    public static String dateFormat = "M/d/yyyy";
    // The locale to use when displaying and converting dates/times
    public static CultureInfo locale = new CultureInfo("en-CA");
    // Text colour for failure messages
    public static Color FailColour = Color.Red;
    // Text colour for success messages
    public static Color SuccessColour = Color.Green;
    // The pink colour of the header text.
    public Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    #endregion class variables

    /// <summary>
    /// Loads a lab inspection if the page request contains a valid inspection number.
    /// Otherwise, shows a "no data found" message.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;
        
        if (!IsPostBack) {
            hideAllPanels();
        }

        String reqIncidentNo = Request.QueryString["LabInspectionNo"];
        int incidentNo = -1;
        try {
            if (reqIncidentNo != null) {
                incidentNo = Convert.ToInt32(reqIncidentNo);
            }
        }
        catch (FormatException ex) {
            setUserMsg("Invalid inspection number given.");
            return;
        }
        displayLabInspection(incidentNo);
    }

    /// <summary>
    /// Shows a message for the user on the page.
    /// This is intended to be used for errors.
    /// If a null message parameter is given, the message is hidden.
    /// </summary>
    /// <param name="msg"></param>
    private void setUserMsg(String msg) {
        if (msg == null) {
            lblUserMsg.Visible = false;
            return;
        }
        lblUserMsg.Visible = true;
        lblUserMsg.Text = msg;
    }

    /// <summary>
    /// Hides all the panels on the page.
    /// Shows the user message.
    /// </summary>
    private void hideAllPanels() {
        pnlHeader.Visible = false;
        pnlChecklist.Visible = false;
        pnlComments.Visible = false;
        lblUserMsg.Visible = true;
    }

    /// <summary>
    /// Shows all the panels on the page.
    /// Hides the user message.
    /// </summary>
    private void showAllPanels() {
        pnlHeader.Visible = true;
        pnlChecklist.Visible = true;
        pnlComments.Visible = true;
        lblUserMsg.Visible = false;
    }
    
    /// <summary>
    /// Converts the follow up status code into a string for display.
    /// </summary>
    /// <param name="statusNo">A string that holds a number representing the follow up status (1, 2, or 3).</param>
    /// <returns>1 as "Not Started", 2 as "In Progress", 3 as "Complete", and "Unknown" for errors</returns>
    private String convertFollowUpStatus(String statusNo) {
        String status = "Unknown";
        if (statusNo == null) {
            return status;
        }
        switch (statusNo) {
            case "1":
                status = "Not Started";
                break;
            case "2":
                status = "In Progress";
                break;
            case "3":
                status = "Complete";
                break;
            default:
                status = "Unknown";
                break;
        }
        return status;
    }

    /// <summary>
    /// Gets the lab inspection out of the database.
    /// Inserts subheader rows into the lab inspection data.
    /// Binds the lab inspection to the grid view.
    /// Formats the grid view so it displays nicely.
    /// </summary>
    /// <param name="insNo">The id of the Lab Inspection to display.</param>
    protected void displayLabInspection(int selectedLabInsNo) {
        if (selectedLabInsNo == -1) {
            setUserMsg("No inspection number given.");
            return;
        }

        var inspection = ctx.LabInspections
                        .Where(li => li.labInsNo.Equals(selectedLabInsNo))
                        .Select(li => li).FirstOrDefault();

        if (inspection == null) {
            setUserMsg("No inspection with that inspection number found.");
            return;
        }

        if (Session["RoleNo"].Equals(4)) {
            if (!Session["DeptNo"].Equals(inspection.deptName)) {
                setUserMsg("Only safety officers and administrators can view inspections from other departments.");
                return;
            }
        }

        #region Giant Query
        // Get the lab inspection from the database
        var qry = ctx.LabInspectionItems
                    .Join(
                        ctx.LabInspectionDetails,
                        LII =>
                            new {
                                labInsItemNo = LII.labInsItemNo
                            },
                        LID =>
                            new {
                                labInsItemNo = (Int32)(LID.labItemNo)
                            },
                        (LII, LID) =>
                            new {
                                LII = LII,
                                LID = LID
                            }
                    )
                    .Join(
                        ctx.LabInspections,
                        temp0 => temp0.LID.labInsNo,
                        LI => LI.labInsNo,
                        (temp0, LI) =>
                            new {
                                temp0 = temp0,
                                LI = LI
                            }
                    )
                    .GroupJoin(
                        ctx.LabFollowUps,
                        temp1 =>
                            new {
                                labInsItemNo = temp1.temp0.LII.labInsItemNo,
                                labInsNo = temp1.LI.labInsNo
                            },
                        LFU =>
                            new {
                                labInsItemNo = (Int32)(LFU.labInsItemNo),
                                labInsNo = LFU.labInsNo
                            },
                        (temp1, labfollowup_join) =>
                            new {
                                temp1 = temp1,
                                labfollowup_join = labfollowup_join
                            }
                    )
                    .SelectMany(
                        temp2 => temp2.labfollowup_join.DefaultIfEmpty(),
                        (temp2, LFU) =>
                            new {
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
                            new {
                                labInsItemNo = temp3.temp2.temp1.temp0.LII.labInsItemNo,
                                labInsItemName = temp3.temp2.temp1.temp0.LII.labInsItem,
                                checkbox = temp3.temp2.temp1.temp0.LID.checkbox,
                                itemComment = temp3.temp2.temp1.temp0.LID.comments,
                                itemFollowUpComment = temp3.LFU.comment,
                            }
                    );
        #endregion Giant Query

        // Populate Header Info
        lblDepartment.Text = inspection.deptName;
        lblSupervisor.Text = inspection.supervisor;
        lblRoom.Text = inspection.room;
        lblInspector.Text = inspection.inspector;
        lblManager.Text = inspection.labMgr;
        if (inspection.date != null) {
            lblInspectionDate.Text = Convert.ToDateTime(inspection.date).ToString(dateFormat, locale);
        }
        lblFollowUpStatus.Text = convertFollowUpStatus(inspection.followUpStatus);
        if (inspection.followupSubmitter != null) {
            lblFollowUpSubmitter.Text = inspection.followupSubmitter;
        }
        lblInspectionComment.Text = "No comment.";        
        if (inspection.comments != null) {
            lblInspectionComment.Text = inspection.comments;
        }
        lblFollowUpComment.Text = "No comment.";
        if (inspection.followupComment != null) {
            lblFollowUpComment.Text = inspection.followupComment;
        }

        pnlHeader.Visible = true;
        lblTitle.Text += inspection.labInsNo;
        lblTitle.Visible = true;

        // Format the data for the Grid View
        // Setup the Data Table
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("labInsItemNo", typeof(System.String)));
        dt.Columns.Add(new DataColumn("labInsItemName", typeof(System.String)));
        dt.Columns.Add(new DataColumn("checkbox", typeof(System.String)));
        dt.Columns.Add(new DataColumn("inspectionComment", typeof(System.String)));
        dt.Columns.Add(new DataColumn("followUpComment", typeof(System.String)));

        // Put the data in rows, inserting rows for subheaders
        foreach (var result in qry) {
            String subheader = checkForSubheaderStart(result.labInsItemNo);
            if (!subheader.Equals(String.Empty)) {
                DataRow drSubheader = dt.NewRow();
                drSubheader["labInsItemNo"] = subheader;
                dt.Rows.Add(drSubheader);
            }
            DataRow dr = dt.NewRow();
            dr["labInsItemNo"] = result.labInsItemNo;
            dr["labInsItemName"] = result.labInsItemName;
            dr["checkbox"] = convertRadioButtonListValue(result.checkbox);
            dr["inspectionComment"] = result.itemComment;
            dr["followUpComment"] = result.itemFollowUpComment;
            dt.Rows.Add(dr);
        }

        // Bind the data to the Grid View
        gdvLabInspection.DataSource = dt;
        gdvLabInspection.DataBind();

        // Set the Grid View column widths
        gdvLabInspection.Columns[0].ItemStyle.Width = 15;
        gdvLabInspection.Columns[1].ItemStyle.Width = 360;
        gdvLabInspection.Columns[2].ItemStyle.Width = 50;
        gdvLabInspection.Columns[3].ItemStyle.Width = 175;
        gdvLabInspection.Columns[4].ItemStyle.Width = 175;
        
        // Find and format the subheader rows
        foreach (GridViewRow row in gdvLabInspection.Rows) {
            String strChecked = ((Label)row.FindControl("lblChecked")).Text;
            if ((strChecked == null) || (strChecked.Equals(String.Empty))) {
                row.Cells[0].ColumnSpan = gdvLabInspection.Columns.Count;
                row.Cells[1].Visible = false;
                row.Cells[2].Visible = false;
                row.Cells[3].Visible = false;
                row.Cells[4].Visible = false;
                row.ForeColor = HeaderForeColor;
            }
        }

        showAllPanels();
    }
    
    /// <summary>
    /// Checks if the lab inspection number is the first one after a subheader
    /// and if it is, returns the subheader, otherwise returns an empty string.
    /// </summary>
    /// <param name="labInsItem">The id of the lab inspection item.</param>
    /// <returns>A subheader or an empty string.</returns>
    private String checkForSubheaderStart(int labInsItem) {
        String subheader = String.Empty;
        switch (labInsItem) {
            case 1 : // Fire evacuation route posted on exits in each section/floor
                subheader = "Emergency & Information Material";
                break;
            case 13 : // Safety Glasses/Facial shield available and in good condition
                subheader = "Personal Protection";
                break;
            case 20 : // Bench tops and sink areas tidy
                subheader = "Housekeeping";
                break;
            case 27 : // Separate collection containers for sharps available
                subheader = "Waste Management";
                break;
            case 35 : // Appropriate disinfectant(s) in correct concentration available
                subheader = "Biohazards";
                break;
            case 37 : // Sash at recommended height and air flow on
                subheader = "Fume Hoods/Biological Safety Cabinets";
                break;
            case 41 : // Vacuum pumps stored safely and belts guarded
                subheader = "Electrical Apparatus";
                break;
            case 46 : // Flammables stored in appropriate refrigerator/cabinet
                subheader = "Chemicals and Reagents";
                break;
            case 54 : // Biosafety, chemical and cytotoxics safety training provided and documented
                subheader = "Training";
                break;
            case 58 : // Equipment/storage shelves seismically restrained
                subheader = "Miscellaneous";
                break;
            default : 
                // do nothing
                break;
        }
        return subheader;
    }

    /// <summary>
    /// Converts a radio button list value (from the database) to display string.
    /// </summary>
    /// <param name="value">The radio button value to convert to a display String.</param>
    /// <returns>A string: Yes for 1, No for 2, N/A or Unknown for 3.</returns>
    private String convertRadioButtonListValue(int value) {
        String returnValue = String.Empty;
        switch (value) {
            case 1:
                 returnValue = "Yes";
                break;
            case 2 :
                returnValue =  "No";
                break;
            case 3 :
                returnValue =  "N/A";
                break;
            default : 
                // default should not be reached
                returnValue = String.Empty;
                break;
        }
        return returnValue;
    }
}