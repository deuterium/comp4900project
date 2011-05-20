using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Tracking_ViewOfficeInspection : System.Web.UI.Page {
    #region Class Variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // The pink colour of the header text.
    public Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    #endregion class variables

    /// <summary>
    /// Loads an office inspection if the page request contains a valid inspection number.
    /// Otherwise, shows a "no data found" message.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;

        String reqInspectionNo = Request.QueryString["OfficeInspectionNo"];
        int inspectionNo = -1;
        try {
            if (reqInspectionNo != null) {
                inspectionNo = Convert.ToInt32(reqInspectionNo);
            }
        }
        catch (FormatException ex) {
            return;
        }
        displayOfficeInspection(inspectionNo);
    }

    ///// <summary>
    ///// Adjusts the height of a text area so all the content is visible.
    ///// </summary>
    ///// <param name="tbx">The TextBox to adjust.</param>
    //private void adjustTextBoxHeight(TextBox tbx) {
    //    int i = tbx.Text.Length;
    //    // 30 is the max characters a 250px wide textbox can fit across
    //    // 2 is the number of extra lines to add for allowance
    //    // because some words may get moved to the next line
    //    int rowsize = (i / 30) + 2;
    //    tbx.Rows = rowsize;
    //}

    private String convertFollowUpStatus(String statusNo) {
        String status = "Unknown";
        switch (status) {
            case "1" :
                status = "Not Started";
                break;
            case "2" :
                status = "In Progress";
                break;
            case "3" :
                status = "Complete";
                break;
            default :
                status = "Unknown";
                break;
        }
        return status;
    }

    /// <summary>
    /// Gets the office inspection out of the database.
    /// Inserts subheader rows into the office inspection data.
    /// Binds the office inspection to the grid view.
    /// Formats the grid view so it displays nicely.
    /// </summary>
    /// <param name="insNo">The id of the Office Inspection to display.</param>
    protected void displayOfficeInspection(int selectedOfficeInsNo) {
        if (selectedOfficeInsNo == -1) {
            return;
        }

        // Get the office inspection from the database
        var qry = ctx.OfficeInspectionItems
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
                            new {
                                officeInsItemNo = temp3.temp2.temp1.temp0.OII.officeInsItemNo,
                                officeInsItemName = temp3.temp2.temp1.temp0.OII.officeInsName, 
                                checkbox = temp3.temp2.temp1.temp0.OID.checkbox, 
                                itemComment = temp3.temp2.temp1.temp0.OID.comments,
                                itemFollowUpComment = temp3.OFU.comment,
                            }
                    );

                    //    temp1 =>
                    //    new {
                    //        officeInsItemNo = temp1.OII.officeInsItemNo,
                    //        officeInsItem = temp1.OII.officeInsName,
                    //        checkbox = temp1.temp0.OID.checkbox,
                    //        comments = temp1.temp0.OID.comments,
                            
                    //        department = temp1.temp0.OI.deptName,
                    //        area = temp1.temp0.OI.area,
                    //        inspector = temp1.temp0.OI.inspector,
                    //        inspectionDate = temp1.temp0.OI.insDate,
                    //        inspectionComment = temp1.temp0.OI.comments,
                    //        followUpDate = temp1.temp0.OI.followupDate,
                    //        followUpSubmitter = temp1.temp0.OI.followupSubmitter,
                    //        followUpStatus = temp1.temp0.OI.followUpStatus,
                    //        followUpcomment = temp1.temp0.OI.followupComment,
                    //    }
                    //);

        var inspection = ctx.OfficeInspections
                        .Where(oi => oi.officeInsNo.Equals(selectedOfficeInsNo))
                        .Select(oi => oi).FirstOrDefault();

        // Populate Header Info and Comment Boxes
        lblDepartment.Text = inspection.deptName;
        lblOfficeArea.Text = inspection.area;
        lblInspector.Text = inspection.inspector;
        if (inspection.insDate != null) {
            lblInspectionDate.Text = Convert.ToDateTime(inspection.insDate).ToString("M/d/yyyy");
        }
        if (inspection.followupDate != null) {
            lblFollowUpDate.Text = Convert.ToDateTime(inspection.followupDate).ToString("M/d/yyyy");
        }
        lblFollowUpStatus.Text = convertFollowUpStatus(inspection.followUpStatus);
        if (!inspection.followupSubmitter.Equals(String.Empty)) {
            lblFollowUpSubmitter.Text = inspection.followupSubmitter;
        }
        if (!inspection.comments.Equals(String.Empty)) {
            lblInspectionComment.Text = inspection.comments;
        }
        if (!inspection.followupComment.Equals(String.Empty)) {
            lblFollowUpComment.Text = inspection.followupComment;
        }

        pnlHeader.Visible = true;
        lblTitle.Text += inspection.officeInsNo;
        lblTitle.Visible = true;

        // Format the data for the Grid View
        // Setup the Data Table
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("officeInsItemNo", typeof(System.String)));
        dt.Columns.Add(new DataColumn("officeInsItemName", typeof(System.String)));
        dt.Columns.Add(new DataColumn("checkbox", typeof(System.String)));
        dt.Columns.Add(new DataColumn("inspectionComment", typeof(System.String)));
        dt.Columns.Add(new DataColumn("followUpComment", typeof(System.String)));
        
        // Put the data in rows, inserting rows for subheaders
        foreach (var result in qry) {
            String subheader = checkForSubheaderStart(result.officeInsItemNo);
            if (!subheader.Equals(String.Empty)) {
                DataRow drSubheader = dt.NewRow();
                drSubheader["officeInsItemNo"] = subheader;
                dt.Rows.Add(drSubheader);
            }
            DataRow dr = dt.NewRow();
            dr["officeInsItemNo"] = result.officeInsItemNo;
            dr["officeInsItemName"] = result.officeInsItemName;
            dr["checkbox"] = convertRadioButtonListValue(result.checkbox);
            dr["inspectionComment"] = result.itemComment;
            dr["followUpComment"] = result.itemFollowUpComment;
            dt.Rows.Add(dr);
        }

        // Bind the data to the Grid View
        gdvOfficeInspection.DataSource = dt;
        gdvOfficeInspection.DataBind();

        // Set the Grid View column widths
        gdvOfficeInspection.Columns[0].ItemStyle.Width = 15;
        gdvOfficeInspection.Columns[1].ItemStyle.Width = 360;
        gdvOfficeInspection.Columns[2].ItemStyle.Width = 50;
        gdvOfficeInspection.Columns[3].ItemStyle.Width = 175;
        gdvOfficeInspection.Columns[4].ItemStyle.Width = 175;

        // Find and format the subheader rows
        foreach (GridViewRow row in gdvOfficeInspection.Rows) {
            String strChecked = ((Label)row.FindControl("lblChecked")).Text;
            if ((strChecked == null) || (strChecked.Equals(String.Empty))) {
                row.Cells[0].ColumnSpan = gdvOfficeInspection.Columns.Count;
                row.Cells[1].Visible = false;
                row.Cells[2].Visible = false;
                row.Cells[3].Visible = false;
                row.Cells[4].Visible = false;
                row.ForeColor = HeaderForeColor;
            }
            //adjustTextBoxHeight((TextBox)row.FindControl("tbxComments"));
        }
    }

    /// <summary>
    /// Checks if the office inspection number is the first one after a subheader
    /// and if it is, returns the subheader, otherwise returns an empty string.
    /// </summary>
    /// <param name="labInsItem">The id of the lab inspection item.</param>
    /// <returns>A subheader or an empty string.</returns>
    private String checkForSubheaderStart(int labInsItem) {
        String subheader = String.Empty;
        switch (labInsItem) {
            case 1: // Are worker incident/injury forms available / do staff know when to use them
                subheader = "General Safety";
                break;
            case 10: // Is adequate space provided to work safely
                subheader = "Work Areas";
                break;
            case 16: // Are surfaces level and even
                subheader = "Support and Structure";
                break;
            case 20: // Are switch panels free of clutter and accessible
                subheader = "Electrical";
                break;
            case 24: // Does there appear to be adequate ventilation (may have to ask staff to find out about complaints)
                subheader = "Ventilation, Illumination, Noise";
                break;
            case 27: // Are safety procedures in place and known to staff
                subheader = "Work Practices Section";
                break;
            case 30: // Is personal protective equipment required for any specific work
                subheader = "Personal Protective Equipment";
                break;
            case 33: // Are staff trained in proper lift techniques
                subheader = "Strain, Sprain, Overexertion";
                break;
            case 37: // Are Material Safety Data Sheets (MSDS) accessible for staff (via a binder or on-line link to OHSAH)
                subheader = "WHMIS / Hazardous Materials";
                break;
            case 42: // Do staff know what to do in the event of an evacuation alarm
                subheader = "Fire Safety and Emergency Response";
                break;            
            default:
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
            case 2:
                returnValue = "No";
                break;
            case 3:
                returnValue = "N/A";
                break;
            default:
                // default should not be reached
                returnValue = String.Empty;
                break;
        }
        return returnValue;
    }


}